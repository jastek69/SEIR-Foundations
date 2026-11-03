#!/usr/bin/env bash
set -euo pipefail
export MSYS_NO_PATHCONV=1
export AWS_REGION="${AWS_REGION:-us-east-1}"

ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
BAD_IMAGE="${ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/seir-cobol-finance:does-not-exist"

cat > task-definition-badtag.json <<JSON
{"family":"seir-cobol-batch","requiresCompatibilities":["FARGATE"],"networkMode":"awsvpc","cpu":"256","memory":"512","executionRoleArn":"arn:aws:iam::${ACCOUNT}:role/seir-ecs-task-execution-lab","runtimePlatform":{"cpuArchitecture":"X86_64","operatingSystemFamily":"LINUX"},"containerDefinitions":[{"name":"cobol","image":"${BAD_IMAGE}","essential":true,"readonlyRootFilesystem":true,"logConfiguration":{"logDriver":"awslogs","options":{"awslogs-group":"/ecs/seir-cobol-batch","awslogs-region":"${AWS_REGION}","awslogs-stream-prefix":"ecs"}}}]}
JSON

echo "Registering bad-tag task definition..."
aws ecs register-task-definition \
  --cli-input-json file://task-definition-badtag.json \
  --region "$AWS_REGION" \
  --query 'taskDefinition.{arn:taskDefinitionArn,image:containerDefinitions[0].image}' \
  --output table

VPC=$(aws ec2 describe-vpcs --filters Name=isDefault,Values=true --query 'Vpcs[0].VpcId' --output text --region "$AWS_REGION")
SUBNET=$(aws ec2 describe-subnets --filters "Name=vpc-id,Values=${VPC}" --query 'Subnets[0].SubnetId' --output text --region "$AWS_REGION")
SG=$(aws ec2 describe-security-groups --filters "Name=vpc-id,Values=${VPC}" Name=group-name,Values=seir-cobol-no-ingress --query 'SecurityGroups[0].GroupId' --output text --region "$AWS_REGION")

echo "VPC=$VPC SUBNET=$SUBNET SG=$SG"
echo "Running task with image: $BAD_IMAGE"

TASK=$(aws ecs run-task \
  --cluster seir-module3 \
  --launch-type FARGATE \
  --task-definition seir-cobol-batch \
  --count 1 \
  --network-configuration "awsvpcConfiguration={subnets=[${SUBNET}],securityGroups=[${SG}],assignPublicIp=ENABLED}" \
  --query 'tasks[0].taskArn' \
  --output text \
  --region "$AWS_REGION")

echo "Task: $TASK"
aws ecs wait tasks-stopped --cluster seir-module3 --tasks "$TASK" --region "$AWS_REGION"

aws ecs describe-tasks \
  --cluster seir-module3 \
  --tasks "$TASK" \
  --region "$AWS_REGION" \
  --query 'tasks[0].{exit:containers[0].exitCode,reason:stoppedReason,stopCode:stopCode,image:containers[0].image}' \
  --output table
