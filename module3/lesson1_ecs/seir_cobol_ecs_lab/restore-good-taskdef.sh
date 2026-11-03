#!/usr/bin/env bash
set -euo pipefail
# Register a new seir-cobol-batch revision pointing at the known-good :lab1 image.
export MSYS_NO_PATHCONV=1
export AWS_REGION="${AWS_REGION:-us-east-1}"

ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
GOOD_IMAGE="${ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/seir-cobol-finance:lab1"

# Fail early if the good tag is missing from ECR
if ! aws ecr describe-images \
  --repository-name seir-cobol-finance \
  --image-ids imageTag=lab1 \
  --region "$AWS_REGION" >/dev/null 2>&1; then
  echo "ERROR: ECR image tag 'lab1' not found in seir-cobol-finance." >&2
  echo "Rebuild/push first, e.g. ./deploy.sh" >&2
  exit 1
fi

cat > task-definition.json <<JSON
{"family":"seir-cobol-batch","requiresCompatibilities":["FARGATE"],"networkMode":"awsvpc","cpu":"256","memory":"512","executionRoleArn":"arn:aws:iam::${ACCOUNT}:role/seir-ecs-task-execution-lab","runtimePlatform":{"cpuArchitecture":"X86_64","operatingSystemFamily":"LINUX"},"containerDefinitions":[{"name":"cobol","image":"${GOOD_IMAGE}","essential":true,"readonlyRootFilesystem":true,"logConfiguration":{"logDriver":"awslogs","options":{"awslogs-group":"/ecs/seir-cobol-batch","awslogs-region":"${AWS_REGION}","awslogs-stream-prefix":"ecs"}}}]}
JSON

echo "Registering good task definition with image: $GOOD_IMAGE"
aws ecs register-task-definition \
  --cli-input-json file://task-definition.json \
  --region "$AWS_REGION" \
  --query 'taskDefinition.{arn:taskDefinitionArn,rev:revision,image:containerDefinitions[0].image}' \
  --output table

echo ""
echo "Latest seir-cobol-batch revision:"
aws ecs describe-task-definition \
  --task-definition seir-cobol-batch \
  --region "$AWS_REGION" \
  --query 'taskDefinition.{rev:revision,image:containerDefinitions[0].image,status:status}' \
  --output table
