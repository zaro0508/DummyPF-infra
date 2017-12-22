#!/usr/bin/env bash

# CF does not support SecureString, update with AWS CLI instead.
# !!Important!! - this only adds, it does not cleanup.  Make sure to cleanup using the AWS console or CLI (delete-parameter command)
export KMS_KEY_ID="alias/$STACK_NAME/KmsKey"
aws ssm put-parameter --name "/$STACK_NAME/BRIDGE_HEALTHCODE_REDIS_KEY" --value "$BridgeHealthcodeRedisKey" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/$STACK_NAME/EMAIL_UNSUBSCRIBE_TOKEN" --value "$EmailUnsubscribeToken" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/$STACK_NAME/HIBERNATE_CONNECTION_PASSWORD" --value "$HibernateConnectionPassword" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/$STACK_NAME/HIBERNATE_CONNECTION_URL" --value "$HibernateConnectionUrl" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/$STACK_NAME/HIBERNATE_CONNECTION_USERNAME" --value "$HibernateConnectionUsername" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/$STACK_NAME/SYNAPSE_API_KEY" --value "$SynapseApiKey" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/$STACK_NAME/SYNAPSE_USER" --value "$SynapseUser" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
