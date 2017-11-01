#!/usr/bin/env bash

# double interpolate vars from travis
eval export "AppDeployBucket=\$AppDeployBucket_$TRAVIS_BRANCH"
eval export "AttachmentBucket=\$AttachmentBucket_$TRAVIS_BRANCH"
eval export "AwsAutoScalingGroupName=\$AwsAutoScalingGroupName_$TRAVIS_BRANCH"
eval export "AwsAutoScalingMaxSize=\$AwsAutoScalingMaxSize_$TRAVIS_BRANCH"
eval export "AwsAutoScalingMinSize=\$AwsAutoScalingMinSize_$TRAVIS_BRANCH"
eval export "AwsKeyUpload=\$AwsKeyUpload_$TRAVIS_BRANCH"
eval export "AwsKeyConsents=\$AwsKeyConsents_$TRAVIS_BRANCH"
eval export "AwsKeyUploadCms=\$AwsKeyUploadCms_$TRAVIS_BRANCH"
eval export "AwsLoadBalancerName=\$AwsLoadBalancerName_$TRAVIS_BRANCH"
eval export "AwsSecretKeyConsents=\$AwsSecretKeyConsents_$TRAVIS_BRANCH"
eval export "AwsSecretKeyUpload=\$AwsSecretKeyUpload_$TRAVIS_BRANCH"
eval export "AwsSecretKeyUploadCms=\$AwsSecretKeyUploadCms_$TRAVIS_BRANCH"
eval export "AwsSnsNotificationEndpoint=\$AwsSnsNotificationEndpoint_$TRAVIS_BRANCH"
eval export "BridgeEnv=\$BridgeEnv_$TRAVIS_BRANCH"
eval export "BridgeHealthcodeRedisKey=\$BridgeHealthcodeRedisKey_$TRAVIS_BRANCH"
eval export "ConsentsBucket=\$ConsentsBucket_$TRAVIS_BRANCH"
eval export "EmailUnsubscribeToken=\$EmailUnsubscribeToken_$TRAVIS_BRANCH"
eval export "HibernateConnectionPassword=\$HibernateConnectionPassword_$TRAVIS_BRANCH"
eval export "HibernateConnectionUrl=\$HibernateConnectionUrl_$TRAVIS_BRANCH"
eval export "HibernateConnectionUsername=\$HibernateConnectionUsername_$TRAVIS_BRANCH"
eval export "SnsKey=\$SnsKey_$TRAVIS_BRANCH"
eval export "SnsSecretKey=\$SnsSecretKey_$TRAVIS_BRANCH"
eval export "SSLCertArn=\$SSLCertArn_$TRAVIS_BRANCH"
eval export "SynapseApiKey=\$SynapseApiKey_$TRAVIS_BRANCH"
eval export "SynapseUser=\$SynapseUser_$TRAVIS_BRANCH"
eval export "SysopsEmail=\$SysopsEmail_$TRAVIS_BRANCH"
eval export "UploadBucket=\$UploadBucket_$TRAVIS_BRANCH"
eval export "UploadCmsCertBucket=\$UploadCmsCertBucket_$TRAVIS_BRANCH"
eval export "UploadCmsPrivBucket=\$UploadCmsPrivBucket_$TRAVIS_BRANCH"

# deploy with evaluated vars
aws cloudformation update-stack \
--stack-name $STACK_NAME \
--capabilities CAPABILITY_NAMED_IAM \
--template-body file://cf_templates/eb_bridgepf.yml \
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
ParameterKey=AwsKey,ParameterValue=$AwsKey \
ParameterKey=AwsKeyConsents,ParameterValue=$AwsKeyConsents \
ParameterKey=AwsKeyUpload,ParameterValue=$AwsKeyUpload \
ParameterKey=AwsKeyUploadCms,ParameterValue=$AwsKeyUploadCms \
ParameterKey=AwsLoadBalancerName,ParameterValue=$AwsLoadBalancerName \
ParameterKey=AwsSecretKey,ParameterValue=$AwsSecretKey \
ParameterKey=AwsSecretKeyConsents,ParameterValue=$AwsSecretKeyConsents \
ParameterKey=AwsSecretKeyUpload,ParameterValue=$AwsSecretKeyUpload \
ParameterKey=AwsSecretKeyUploadCms,ParameterValue=$AwsSecretKeyUploadCms \
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
ParameterKey=JavaOpts,ParameterValue='-Dnewrelic.config.file=/var/app/current/newrelic/newrelic.yml -javaagent:/usr/local/lib/newrelic/com.newrelic.agent.java.newrelic-agent.jar' \
ParameterKey=NewRelicAppName,ParameterValue=$DNS_HOSTNAME \
ParameterKey=NewRelicLicenseKey,ParameterValue=$NewRelicLicenseKey \
ParameterKey=SnsKey,ParameterValue=$SnsKey \
ParameterKey=SnsSecretKey,ParameterValue=$SnsSecretKey \
ParameterKey=SSLCertArn,ParameterValue=$SSLCertArn \
ParameterKey=SynapseApiKey,ParameterValue=$SynapseApiKey \
ParameterKey=SynapseUser,ParameterValue=$SynapseUser \
ParameterKey=SysopsEmail,ParameterValue="$SysopsEmail" \
ParameterKey=UploadBucket,ParameterValue=$UploadBucket \
ParameterKey=UploadCmsCertBucket,ParameterValue=$UploadCmsCertBucket \
ParameterKey=UploadCmsPrivBucket,ParameterValue=$UploadCmsPrivBucket \
ParameterKey=WebservicesUrl,ParameterValue=https://$DNS_HOSTNAME.$DNS_DOMAIN
