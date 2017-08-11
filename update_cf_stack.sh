#!/usr/bin/env bash

# evaluate vars
eval export "AppDeployBucket=\$AppDeployBucket_$TRAVIS_BRANCH"
eval export "AwsKeyUpload=\$AwsKeyUpload_$TRAVIS_BRANCH"
eval export "AwsKeyUploadCms=\$AwsKeyUploadCms_$TRAVIS_BRANCH"
eval export "AwsSecretKeyConsents=\$AwsSecretKeyConsents_$TRAVIS_BRANCH"
eval export "AwsSecretKeyUpload=\$AwsSecretKeyUpload_$TRAVIS_BRANCH"
eval export "AwsSecretKeyUploadCms=\$AwsSecretKeyUploadCms_$TRAVIS_BRANCH"
eval export "AwsSnsKey=\$AwsSnsKey_$TRAVIS_BRANCH"
eval export "AwsSnsSecretKey=\$AwsSnsSecretKey_$TRAVIS_BRANCH"
eval export "BridgeEnv=\$BridgeEnv_$TRAVIS_BRANCH"
eval export "BridgeHealthcodeKey=\$BridgeHealthcodeKey_$TRAVIS_BRANCH"
eval export "EmailUnsubscribeToken=\$EmailUnsubscribeToken_$TRAVIS_BRANCH"
eval export "EnterpriseStormpathHref=\$EnterpriseStormpathHref_$TRAVIS_BRANCH"
eval export "EnterpriseStormpathId=\$EnterpriseStormpathId_$TRAVIS_BRANCH"
eval export "EnterpriseStormpathSecret=\$EnterpriseStormpathSecret_$TRAVIS_BRANCH"
eval export "HibernateConnectionPassword=\$HibernateConnectionPassword_$TRAVIS_BRANCH"
eval export "HibernateConnectionUrl=\$HibernateConnectionUrl_$TRAVIS_BRANCH"
eval export "HibernateConnectionUsername=\$HibernateConnectionUsername_$TRAVIS_BRANCH"
eval export "RedisUrl=\$RedisUrl_$TRAVIS_BRANCH"
eval export "SSLCertArn=\$SSLCertArn_$TRAVIS_BRANCH"
eval export "SynapseApiKey=\$SynapseApiKey_$TRAVIS_BRANCH"
eval export "SynapseUser=\$SynapseUser_$TRAVIS_BRANCH"
eval export "SysopsEmail=\$SysopsEmail_$TRAVIS_BRANCH"

echo $STACK_NAME
echo $DNS_HOSTNAME
echo $DNS_DOMAIN
echo $TRAVIS_BRANCH
echo $SysopsEmail
echo $AppDeployBucket

# deploy
aws cloudformation update-stack \
--stack-name $STACK_NAME \
--capabilities CAPABILITY_NAMED_IAM \
--template-body file://cf_templates/eb_bridgepf.yml \
--parameters \
ParameterKey=AppDeployBucket,ParameterValue=$AppDeployBucket \
ParameterKey=AppHealthcheckUrl,ParameterValue='HTTP:80/?study=api' \
ParameterKey=AuthCreateMysqlAccounts,ParameterValue=true \
ParameterKey=AuthProvider,ParameterValue=mysql \
ParameterKey=AwsEbNotificationEndpoint,ParameterValue=khai.do@sagebase.org \
ParameterKey=AwsKey,ParameterValue=$AwsKey \
ParameterKey=AwsKeyUpload,ParameterValue=$AwsKeyUpload \
ParameterKey=AwsKeyUploadCms,ParameterValue=$AwsKeyUploadCms \
ParameterKey=AwsSecretKey,ParameterValue=$AwsSecretKey \
ParameterKey=AwsSecretKeyConsents,ParameterValue=$AwsSecretKeyConsents \
ParameterKey=AwsSecretKeyUpload,ParameterValue=$AwsSecretKeyUpload \
ParameterKey=AwsSecretKeyUploadCms,ParameterValue=$AwsSecretKeyUploadCms \
ParameterKey=AwsSnsKey,ParameterValue=$AwsSnsKey \
ParameterKey=AwsSnsSecretKey,ParameterValue=$AwsSnsSecretKey \
ParameterKey=BridgeEnv,ParameterValue=$BridgeEnv \
ParameterKey=BridgeHealthcodeKey,ParameterValue=$BridgeHealthcodeKey \
ParameterKey=BridgeUser,ParameterValue=heroku \
ParameterKey=DNSHostname,ParameterValue=$DNS_HOSTNAME \
ParameterKey=DNSDomain,ParameterValue=$DNS_DOMAIN \
ParameterKey=EC2InstanceType,ParameterValue=t2.micro \
ParameterKey=ElastiCacheInstanceType,ParameterValue=cache.t2.micro \
ParameterKey=EmailUnsubscribeToken,ParameterValue=$EmailUnsubscribeToken \
ParameterKey=EnterpriseStormpathHref,ParameterValue=$EnterpriseStormpathHref \
ParameterKey=EnterpriseStormpathId,ParameterValue=$EnterpriseStormpathId \
ParameterKey=EnterpriseStormpathSecret,ParameterValue=$EnterpriseStormpathSecret \
ParameterKey=HibernateConnectionPassword,ParameterValue=$HibernateConnectionPassword \
ParameterKey=HibernateConnectionUrl,ParameterValue=$HibernateConnectionUrl \
ParameterKey=HibernateConnectionUsername,ParameterValue=$HibernateConnectionUsername \
ParameterKey=HibernateConnectionUsessl,ParameterValue=true \
ParameterKey=HostPostfix,ParameterValue=-$DNS_HOSTNAME.$DNS_DOMAIN \
ParameterKey=JavaOpts,ParameterValue='-Dnewrelic.config.file=/var/app/current/newrelic/newrelic.yml -javaagent:/var/app/current/lib/com.newrelic.agent.java.newrelic-agent-3.32.0.jar' \
ParameterKey=NewRelicAppName,ParameterValue=$DNS_HOSTNAME \
ParameterKey=NewRelicLicenseKey,ParameterValue=$NewRelicLicenseKey \
ParameterKey=NewRelicLog,ParameterValue=stdout \
ParameterKey=RedisUrl,ParameterValue=$RedisUrl \
ParameterKey=SSLCertArn,ParameterValue=$SSLCertArn \
ParameterKey=SynapseApiKey,ParameterValue=$SynapseApiKey \
ParameterKey=SynapseUser,ParameterValue=$SynapseUser \
ParameterKey=SysopsEmail,ParameterValue='Bridge IT <bridge-testing+sysops@sagebase.org>' \
ParameterKey=WebservicesUrl,ParameterValue=https://$DNS_HOSTNAME.$DNS_DOMAIN
