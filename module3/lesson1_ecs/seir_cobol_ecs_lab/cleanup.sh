#!/usr/bin/env bash
set -euo pipefail
# Cleanup for Module 3 Lab 01 when it was deployed with deploy.sh (script path).
# If you deployed with Terraform, do NOT use this script: use the targeted
# `terraform destroy` in SEIR-Foundations-2 docs/RUNBOOK-design.md step 5.
# This script refuses to run while the Terraform state still holds resources.
# NEVER deletes the ECR repository or its images. Does NOT delete the IAM
# execution role or the default VPC (matches lab readme).
# Idempotent: missing resources are skipped.
export MSYS_NO_PATHCONV=1
export AWS_REGION="${AWS_REGION:-us-east-1}"

TF_DIR="$(cd "$(dirname "$0")" && pwd)/terraform"
if [[ -d "$TF_DIR/.terraform" ]]; then
  # Fail closed: if the state cannot be read (no terraform, wrong AWS_PROFILE), stop too.
  if ! command -v terraform >/dev/null || ! TF_STATE=$(terraform -chdir="$TF_DIR" state list 2>/dev/null); then
    echo "Cannot read the Terraform state in $TF_DIR (set AWS_PROFILE=sebekai?). Stopping." >&2
    exit 1
  fi
  if [[ -n "$TF_STATE" ]]; then
    echo "Terraform manages this lab (state is not empty). Stopping." >&2
    echo "Use the targeted terraform destroy (keeps ECR) from docs/RUNBOOK-design.md step 5." >&2
    exit 1
  fi
fi

CLUSTER=seir-module3
REPO=seir-cobol-finance
LOGGROUP=/ecs/seir-cobol-batch
SG_NAME=seir-cobol-no-ingress
FAMILY=seir-cobol-batch

ok()   { printf '  OK  %s\n' "$*"; }
skip() { printf '  --  %s\n' "$*"; }
warn() { printf '  !!  %s\n' "$*" >&2; }

echo "Cleaning SEIR COBOL ECS lab resources in ${AWS_REGION}..."

# --- Stop any remaining tasks ---
RUNNING=$(aws ecs list-tasks --cluster "$CLUSTER" --desired-status RUNNING --region "$AWS_REGION" --query 'taskArns' --output text 2>/dev/null || true)
if [[ -n "${RUNNING:-}" && "$RUNNING" != None ]]; then
  echo "Stopping running tasks..."
  aws ecs stop-task --cluster "$CLUSTER" --task $(echo "$RUNNING" | awk '{print $1}') --region "$AWS_REGION" >/dev/null || true
  aws ecs wait tasks-stopped --cluster "$CLUSTER" --tasks $RUNNING --region "$AWS_REGION" 2>/dev/null || true
fi

# --- ECS cluster (ACTIVE or INACTIVE) ---
STATUS=$(aws ecs describe-clusters --clusters "$CLUSTER" --region "$AWS_REGION" --query 'clusters[0].status' --output text 2>/dev/null || echo None)
if [[ "$STATUS" == ACTIVE || "$STATUS" == INACTIVE ]]; then
  if aws ecs delete-cluster --cluster "$CLUSTER" --region "$AWS_REGION" >/dev/null 2>&1; then
    ok "Deleted ECS cluster $CLUSTER (was $STATUS)"
  else
    warn "Could not delete cluster $CLUSTER (status=$STATUS)"
  fi
else
  skip "ECS cluster $CLUSTER not found"
fi

# --- ECR repository: NEVER deleted (project rule, SEIR-Foundations-2 CLAUDE.md "ECR: never delete") ---
if aws ecr describe-repositories --repository-names "$REPO" --region "$AWS_REGION" >/dev/null 2>&1; then
  ok "Kept ECR repository $REPO and its images (never deleted)"
else
  skip "ECR repository $REPO not found"
fi

# --- CloudWatch log group ---
if aws logs describe-log-groups --log-group-name-prefix "$LOGGROUP" --region "$AWS_REGION" \
  --query "logGroups[?logGroupName=='${LOGGROUP}'].logGroupName" --output text 2>/dev/null | grep -qx "$LOGGROUP"; then
  aws logs delete-log-group --log-group-name "$LOGGROUP" --region "$AWS_REGION"
  ok "Deleted log group $LOGGROUP"
else
  skip "Log group $LOGGROUP not found"
fi

# --- Security group (script-created; terraform destroy may already have removed it) ---
SG=$(aws ec2 describe-security-groups --filters Name=group-name,Values="$SG_NAME" \
  --query 'SecurityGroups[0].GroupId' --output text --region "$AWS_REGION" 2>/dev/null || echo None)
if [[ -n "$SG" && "$SG" != None ]]; then
  if aws ec2 delete-security-group --group-id "$SG" --region "$AWS_REGION" 2>/dev/null; then
    ok "Deleted security group $SG_NAME ($SG)"
  else
    warn "Could not delete SG $SG_NAME ($SG) — may still be attached to ENIs; retry later"
  fi
else
  skip "Security group $SG_NAME not found"
fi

# --- Deregister task definition revisions (harmless leftovers after destroy) ---
TDS=$(aws ecs list-task-definitions --family-prefix "$FAMILY" --status ACTIVE --region "$AWS_REGION" --query 'taskDefinitionArns[]' --output text 2>/dev/null || true)
if [[ -n "${TDS:-}" && "$TDS" != None ]]; then
  echo "Deregistering task definition revisions..."
  for td in $TDS; do
    aws ecs deregister-task-definition --task-definition "$td" --region "$AWS_REGION" >/dev/null
    ok "Deregistered $td"
  done
else
  skip "No active task definitions for family $FAMILY"
fi

echo ""
echo "Done. IAM role seir-ecs-task-execution-lab is left alone (per lab readme)."
echo "If it still exists and is lab-only, delete manually:"
echo "  aws iam detach-role-policy --role-name seir-ecs-task-execution-lab --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
echo "  aws iam delete-role --role-name seir-ecs-task-execution-lab"
