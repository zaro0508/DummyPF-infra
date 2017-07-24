#!/usr/bin/env bash
set -ex

# validate cf templates (local)
aws cloudformation validate-template --template-body file://cf_templates/eb_bridgepf_bootstrap.yml
aws cloudformation validate-template --template-body file://cf_templates/eb_bridgepf.yml

# validate cf templates (from s3 bucket, required when template files are greater than 50K)
# https://docs.aws.amazon.com/cli/latest/reference/cloudformation/create-stack.html
#  - aws s3 cp cf_templates s3://org-sagebridge-bridgepf-artifacts-sandbox-infra-develop/cf_templates --recursive
#  - aws cloudformation validate-template --template-url https://s3.amazonaws.com/org-sagebridge-bridgepf-artifacts-sandbox-infra-develop/cf_templates/eb_bridgepf_bootstrap.yml
#  - aws cloudformation validate-template --template-url https://s3.amazonaws.com/org-sagebridge-bridgepf-artifacts-sandbox-infra-develop/cf_templates/eb_bridgepf.yml

# Handle message that shouldn't be an error, https://github.com/hashicorp/terraform/issues/5653 
message=$(./update_cf_stack.sh 2>&1 1>/dev/null)
error_code=$(echo $?)
if [[ $error_code -ne 0 && $message =~ .*"No updates are to be performed".* ]]; then
  echo "There are no changes that require a stack update."
  exit 0
fi
echo $message
exit $error_code
