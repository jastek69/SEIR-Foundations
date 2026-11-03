#!/usr/bin/env bash
set -euo pipefail
# Restore SG egress after Exercise 4 networking break.
export MSYS_NO_PATHCONV=1
export AWS_REGION="${AWS_REGION:-us-east-1}"

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
cd "$SCRIPT_DIR"

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

# Skip if already present
EXISTING=$(aws ec2 describe-security-groups --group-ids "$SG" --region "$AWS_REGION" \
  --query 'SecurityGroups[0].IpPermissionsEgress[?IpProtocol==`-1`].IpRanges[0].CidrIp' --output text)
if [[ "$EXISTING" == *"0.0.0.0/0"* ]]; then
  echo "Egress 0.0.0.0/0 already present on $SG — nothing to do."
else
  echo "Restoring egress on $SG..."
  aws ec2 authorize-security-group-egress \
    --group-id "$SG" \
    --ip-permissions file://egress-all.json \
    --region "$AWS_REGION"
fi

aws ec2 describe-security-groups --group-ids "$SG" --region "$AWS_REGION" \
  --query 'SecurityGroups[0].{GroupId:GroupId,Inbound:IpPermissions,Outbound:IpPermissionsEgress}' \
  --output json

echo ""
echo "Egress restored. Optional sanity check: ./deploy.sh"
