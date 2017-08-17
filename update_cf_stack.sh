#!/usr/bin/env bash

# double interpolate vars from travis
eval export "AppDeployBucket=\$AppDeployBucket_$TRAVIS_BRANCH"
eval export "AwsAutoScalingMaxSize=\$AwsAutoScalingMaxSize_$TRAVIS_BRANCH"
eval export "AwsAutoScalingMinSize=\$AwsAutoScalingMinSize_$TRAVIS_BRANCH"
eval export "AwsKeyUpload=\$AwsKeyUpload_$TRAVIS_BRANCH"
eval export "AwsKeyUploadCms=\$AwsKeyUploadCms_$TRAVIS_BRANCH"
eval export "AwsSecretKeyConsents=\$AwsSecretKeyConsents_$TRAVIS_BRANCH"
eval export "AwsSecretKeyUpload=\$AwsSecretKeyUpload_$TRAVIS_BRANCH"
eval export "AwsSecretKeyUploadCms=\$AwsSecretKeyUploadCms_$TRAVIS_BRANCH"
eval export "BridgeEnv=\$BridgeEnv_$TRAVIS_BRANCH"
eval export "BridgeHealthcodeKey=\$BridgeHealthcodeKey_$TRAVIS_BRANCH"
eval export "BridgeHealthcodeRedisKey=\$BridgeHealthcodeRedisKey_$TRAVIS_BRANCH"
eval export "ElastiCacheUrl=\$ElastiCacheUrl_$TRAVIS_BRANCH"
eval export "EmailUnsubscribeToken=\$EmailUnsubscribeToken_$TRAVIS_BRANCH"
eval export "HibernateConnectionPassword=\$HibernateConnectionPassword_$TRAVIS_BRANCH"
eval export "HibernateConnectionUrl=\$HibernateConnectionUrl_$TRAVIS_BRANCH"
eval export "HibernateConnectionUsername=\$HibernateConnectionUsername_$TRAVIS_BRANCH"
eval export "RedisCloudUrl=\$RedisCloudUrl_$TRAVIS_BRANCH"
eval export "SnsKey=\$SnsKey_$TRAVIS_BRANCH"
eval export "SnsSecretKey=\$SnsSecretKey_$TRAVIS_BRANCH"
eval export "SSLCertArn=\$SSLCertArn_$TRAVIS_BRANCH"
eval export "SynapseApiKey=\$SynapseApiKey_$TRAVIS_BRANCH"
eval export "SynapseUser=\$SynapseUser_$TRAVIS_BRANCH"
eval export "SysopsEmail=\$SysopsEmail_$TRAVIS_BRANCH"

# eploy with evaluated vars
aws cloudformation update-stack \
--stack-name $STACK_NAME \
--capabilities CAPABILITY_NAMED_IAM \
--template-body file://cf_templates/eb_bridgepf.yml \
--parameters \
ParameterKey=AppDeployBucket,ParameterValue=$AppDeployBucket \
ParameterKey=AppHealthcheckUrl,ParameterValue='HTTP:80/?study=api' \
ParameterKey=AuthCreateMysqlAccounts,ParameterValue=true \
ParameterKey=AuthProvider,ParameterValue=mysql \
ParameterKey=AwsAutoScalingMaxSize,ParameterValue=$AwsAutoScalingMaxSize \
ParameterKey=AwsAutoScalingMinSize,ParameterValue=$AwsAutoScalingMinSize \
ParameterKey=AwsEbNotificationEndpoint,ParameterValue=$AwsEbNotificationEndpoint \
ParameterKey=AwsKey,ParameterValue=$AwsKey \
ParameterKey=AwsKeyUpload,ParameterValue=$AwsKeyUpload \
ParameterKey=AwsKeyUploadCms,ParameterValue=$AwsKeyUploadCms \
ParameterKey=AwsSecretKey,ParameterValue=$AwsSecretKey \
ParameterKey=AwsSecretKeyConsents,ParameterValue=$AwsSecretKeyConsents \
ParameterKey=AwsSecretKeyUpload,ParameterValue=$AwsSecretKeyUpload \
ParameterKey=AwsSecretKeyUploadCms,ParameterValue=$AwsSecretKeyUploadCms \
ParameterKey=BridgeEnv,ParameterValue=$BridgeEnv \
ParameterKey=BridgeHealthcodeKey,ParameterValue=$BridgeHealthcodeKey \
ParameterKey=BridgeHealthcodeRedisKey,ParameterValue=$BridgeHealthcodeRedisKey \
ParameterKey=BridgeUser,ParameterValue=heroku \
ParameterKey=DNSHostname,ParameterValue=$DNS_HOSTNAME \
ParameterKey=DNSDomain,ParameterValue=$DNS_DOMAIN \
ParameterKey=EC2InstanceType,ParameterValue=t2.micro \
ParameterKey=ElastiCacheUrl,ParameterValue=$ElastiCacheUrl \
ParameterKey=ElastiCacheInstanceType,ParameterValue=cache.t2.micro \
ParameterKey=EmailUnsubscribeToken,ParameterValue=$EmailUnsubscribeToken \
ParameterKey=HibernateConnectionPassword,ParameterValue=$HibernateConnectionPassword \
ParameterKey=HibernateConnectionUrl,ParameterValue=$HibernateConnectionUrl \
ParameterKey=HibernateConnectionUsername,ParameterValue=$HibernateConnectionUsername \
ParameterKey=HibernateConnectionUsessl,ParameterValue=true \
ParameterKey=HostPostfix,ParameterValue=-$DNS_HOSTNAME.$DNS_DOMAIN \
ParameterKey=JavaOpts,ParameterValue='-Dnewrelic.config.file=/var/app/current/newrelic/newrelic.yml -javaagent:/var/app/current/lib/com.newrelic.agent.java.newrelic-agent-3.32.0.jar' \
ParameterKey=NewRelicAppName,ParameterValue=$DNS_HOSTNAME \
ParameterKey=NewRelicLicenseKey,ParameterValue=$NewRelicLicenseKey \
ParameterKey=NewRelicLog,ParameterValue=stdout \
ParameterKey=RedisCloudUrl,ParameterValue=$RedisCloudUrl \
ParameterKey=SnsKey,ParameterValue=$SnsKey \
ParameterKey=SnsSecretKey,ParameterValue=$SnsSecretKey \
ParameterKey=SSLCertArn,ParameterValue=$SSLCertArn \
ParameterKey=SynapseApiKey,ParameterValue=$SynapseApiKey \
ParameterKey=SynapseUser,ParameterValue=$SynapseUser \
ParameterKey=SysopsEmail,ParameterValue="$SysopsEmail" \
ParameterKey=WebservicesUrl,ParameterValue=https://$DNS_HOSTNAME.$DNS_DOMAIN
