#!/usr/bin/env bash
set -euo pipefail
# Exercise 4 (networking): remove SG egress so the Fargate task cannot pull from ECR.
# Always run ./exercise4-network-restore.sh afterward.
export MSYS_NO_PATHCONV=1
export AWS_REGION="${AWS_REGION:-us-east-1}"

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
cd "$SCRIPT_DIR"

# Ensure latest task def points at a real image (not the bad-tag exercise)
./restore-good-taskdef.sh

SG=$(aws ec2 describe-security-groups \
  --filters Name=group-name,Values=seir-cobol-no-ingress \
  --query 'SecurityGroups[0].GroupId' --output text --region "$AWS_REGION")
if [[ -z "$SG" || "$SG" == None ]]; then
  echo "ERROR: security group seir-cobol-no-ingress not found" >&2
  exit 1
fi

cat > egress-all.json <<'JSON'
[{"IpProtocol":"-1","IpRanges":[{"CidrIp":"0.0.0.0/0","Description":"Outbound for ECR image pull and CloudWatch Logs"}]}]
JSON

echo "Revoking all egress on $SG (blocks ECR pull / CloudWatch)..."
aws ec2 revoke-security-group-egress \
  --group-id "$SG" \
  --ip-permissions file://egress-all.json \
  --region "$AWS_REGION" || true

echo "Current egress rules (expect empty / none):"
aws ec2 describe-security-groups --group-ids "$SG" --region "$AWS_REGION" \
  --query 'SecurityGroups[0].IpPermissionsEgress' --output json

VPC=$(aws ec2 describe-vpcs --filters Name=isDefault,Values=true --query 'Vpcs[0].VpcId' --output text --region "$AWS_REGION")
SUBNET=$(aws ec2 describe-subnets --filters "Name=vpc-id,Values=${VPC}" --query 'Subnets[0].SubnetId' --output text --region "$AWS_REGION")

echo "Running Fargate task with no outbound access..."
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
echo "Waiting for task to stop (may take a few minutes while pull retries)..."
aws ecs wait tasks-stopped --cluster seir-module3 --tasks "$TASK" --region "$AWS_REGION"

aws ecs describe-tasks \
  --cluster seir-module3 \
  --tasks "$TASK" \
  --region "$AWS_REGION" \
  --query 'tasks[0].{exit:containers[0].exitCode,reason:stoppedReason,stopCode:stopCode,image:containers[0].image}' \
  --output table

echo ""
echo "Expected: CannotPullContainerError / timeout or connection failure (not 'not found')."
echo "IMPORTANT: restore egress now:"
echo "  ./exercise4-network-restore.sh"
