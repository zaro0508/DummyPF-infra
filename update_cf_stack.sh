#!/usr/bin/env bash

# double interpolate vars from travis
eval export "AppDeployBucket=\$AppDeployBucket_$TRAVIS_BRANCH"
eval export "AttachmentBucket=\$AttachmentBucket_$TRAVIS_BRANCH"
eval export "AwsAutoScalingGroupName=\$AwsAutoScalingGroupName_$TRAVIS_BRANCH"
eval export "AwsAutoScalingMaxSize=\$AwsAutoScalingMaxSize_$TRAVIS_BRANCH"
eval export "AwsAutoScalingMinSize=\$AwsAutoScalingMinSize_$TRAVIS_BRANCH"
eval export "AwsLoadBalancerName=\$AwsLoadBalancerName_$TRAVIS_BRANCH"
eval export "AwsSnsNotificationEndpoint=\$AwsSnsNotificationEndpoint_$TRAVIS_BRANCH"
eval export "BridgeEnv=\$BridgeEnv_$TRAVIS_BRANCH"
eval export "BridgeHealthcodeRedisKey=\$BridgeHealthcodeRedisKey_$TRAVIS_BRANCH"
eval export "ConsentsBucket=\$ConsentsBucket_$TRAVIS_BRANCH"
eval export "EmailUnsubscribeToken=\$EmailUnsubscribeToken_$TRAVIS_BRANCH"
eval export "HibernateConnectionPassword=\$HibernateConnectionPassword_$TRAVIS_BRANCH"
eval export "HibernateConnectionUrl=\$HibernateConnectionUrl_$TRAVIS_BRANCH"
eval export "HibernateConnectionUsername=\$HibernateConnectionUsername_$TRAVIS_BRANCH"
eval export "HostPostfix=\$HostPostfix_$TRAVIS_BRANCH"
eval export "RedisCloudUrl=\$RedisCloudUrl_$TRAVIS_BRANCH"
eval export "SSLCertArn=\$SSLCertArn_$TRAVIS_BRANCH"
eval export "SynapseApiKey=\$SynapseApiKey_$TRAVIS_BRANCH"
eval export "SynapseUser=\$SynapseUser_$TRAVIS_BRANCH"
eval export "SysopsEmail=\$SysopsEmail_$TRAVIS_BRANCH"
eval export "UploadBucket=\$UploadBucket_$TRAVIS_BRANCH"
eval export "UploadCmsCertBucket=\$UploadCmsCertBucket_$TRAVIS_BRANCH"
eval export "UploadCmsPrivBucket=\$UploadCmsPrivBucket_$TRAVIS_BRANCH"
eval export "WebservicesUrl=\$WebservicesUrl_$TRAVIS_BRANCH"

# deploy with evaluated vars
aws --profile cloudformation update-stack \
--stack-name $STACK_NAME \
--capabilities CAPABILITY_NAMED_IAM \
--template-body file://cf_templates/eb_dummypf.yml \
--parameters \
ParameterKey=AppDeployBucket,ParameterValue=$AppDeployBucket \
ParameterKey=AppHealthcheckUrl,ParameterValue='HTTP:80/?study=api' \
ParameterKey=AttachmentBucket,ParameterValue=$AttachmentBucket \
ParameterKey=AuthCreateMysqlAccounts,ParameterValue=true \
ParameterKey=AuthProvider,ParameterValue=mysql \
ParameterKey=AwsAutoScalingGroupName,ParameterValue=$AwsAutoScalingGroupName \
ParameterKey=AwsAutoScalingMaxSize,ParameterValue=$AwsAutoScalingMaxSize \
ParameterKey=AwsAutoScalingMinSize,ParameterValue=$AwsAutoScalingMinSize \
ParameterKey=AwsDefaultVpcId,ParameterValue=$AwsDefaultVpcId \
ParameterKey=AwsEbHealthReportingSystem,ParameterValue=enhanced \
ParameterKey=AwsLoadBalancerName,ParameterValue=$AwsLoadBalancerName \
ParameterKey=AwsSnsNotificationEndpoint,ParameterValue=$AwsSnsNotificationEndpoint \
ParameterKey=BridgeEnv,ParameterValue=$BridgeEnv \
ParameterKey=BridgeHealthcodeRedisKey,ParameterValue=$BridgeHealthcodeRedisKey \
ParameterKey=BridgeUser,ParameterValue=heroku \
ParameterKey=ConsentsBucket,ParameterValue=$ConsentsBucket \
ParameterKey=DNSHostname,ParameterValue=$DNS_HOSTNAME \
ParameterKey=DNSDomain,ParameterValue=$DNS_DOMAIN \
ParameterKey=EC2InstanceType,ParameterValue=t2.small \
ParameterKey=ElastiCacheInstanceType,ParameterValue=cache.t2.micro \
ParameterKey=EmailUnsubscribeToken,ParameterValue=$EmailUnsubscribeToken \
ParameterKey=HibernateConnectionPassword,ParameterValue=$HibernateConnectionPassword \
ParameterKey=HibernateConnectionUrl,ParameterValue=$HibernateConnectionUrl \
ParameterKey=HibernateConnectionUsername,ParameterValue=$HibernateConnectionUsername \
ParameterKey=HibernateConnectionUsessl,ParameterValue=true \
ParameterKey=HostPostfix,ParameterValue=$HostPostfix \
ParameterKey=JavaOpts,ParameterValue='-Dnewrelic.config.file=/var/app/current/newrelic/newrelic.yml -javaagent:/usr/local/lib/newrelic/com.newrelic.agent.java.newrelic-agent.jar' \
ParameterKey=NewRelicAppName,ParameterValue=$DNS_HOSTNAME \
ParameterKey=NewRelicLicenseKey,ParameterValue=$NewRelicLicenseKey \
ParameterKey=RedisCloudUrl,ParameterValue=$RedisCloudUrl \
ParameterKey=SSLCertArn,ParameterValue=$SSLCertArn \
ParameterKey=SynapseApiKey,ParameterValue=$SynapseApiKey \
ParameterKey=SynapseUser,ParameterValue=$SynapseUser \
ParameterKey=SysopsEmail,ParameterValue="$SysopsEmail" \
ParameterKey=UploadBucket,ParameterValue=$UploadBucket \
ParameterKey=UploadCmsCertBucket,ParameterValue=$UploadCmsCertBucket \
ParameterKey=UploadCmsPrivBucket,ParameterValue=$UploadCmsPrivBucket \
ParameterKey=WebservicesUrl,ParameterValue=$WebservicesUrl
