#!/usr/bin/env bash

STACK_NAME=bridgepf-$TRAVIS_BRANCH
DNS_HOSTNAME=$STACK_NAME
DNS_DOMAIN=sagebridge.org

aws cloudformation update-stack \
--stack-name $STACK_NAME \
--capabilities CAPABILITY_NAMED_IAM \
--template-body file://cf_templates/eb_bridgepf.yml \
--parameters \
ParameterKey=AppDeployBucket,ParameterValue=$AppDeployBucket_develop \
ParameterKey=AppHealthcheckUrl,ParameterValue='HTTP:80/?study=api'
ParameterKey=AuthCreateMysqlAccounts,ParameterValue=true \
ParameterKey=AuthProvider,ParameterValue=mysql \
ParameterKey=AwsEbNotificationEndpoint,ParameterValue=khai.do@sagebase.org \
ParameterKey=AwsKey,ParameterValue=$AwsKey \
ParameterKey=AwsKeyUpload,ParameterValue=$AwsKeyUpload_develop \
ParameterKey=AwsKeyUploadCms,ParameterValue=$AwsKeyUploadCms_develop \
ParameterKey=AwsSecretKey,ParameterValue=$AwsSecretKey \
ParameterKey=AwsSecretKeyConsents,ParameterValue=$AwsSecretKeyConsents_develop \
ParameterKey=AwsSecretKeyUpload,ParameterValue=$AwsSecretKeyUpload_develop \
ParameterKey=AwsSecretKeyUploadCms,ParameterValue=$AwsSecretKeyUploadCms \
ParameterKey=AwsSnsKey,ParameterValue=$AwsSnsKey_develop \
ParameterKey=AwsSnsSecretKey,ParameterValue=$AwsSnsSecretKey_develop \
ParameterKey=BridgeEnv,ParameterValue=$BridgeEnv_develop \
ParameterKey=BridgeHealthcodeKey,ParameterValue=$BridgeHealthcodeKey_develop \
ParameterKey=BridgeUser,ParameterValue=heroku \
ParameterKey=DNSHostname,ParameterValue=$DNS_HOSTNAME \
ParameterKey=DNSDomain,ParameterValue=$DNS_DOMAIN \
ParameterKey=EC2InstanceType,ParameterValue=t2.micro \
ParameterKey=ElastiCacheInstanceType,ParameterValue=cache.t2.micro \
ParameterKey=EmailUnsubscribeToken,ParameterValue=$EmailUnsubscribeToken_develop \
ParameterKey=EnterpriseStormpathHref,ParameterValue=$EnterpriseStormpathHref_develop \
ParameterKey=EnterpriseStormpathId,ParameterValue=$EnterpriseStormpathId_develop \
ParameterKey=EnterpriseStormpathSecret,ParameterValue=$EnterpriseStormpathSecret_develop \
ParameterKey=HibernateConnectionPassword,ParameterValue=$HibernateConnectionPassword_develop \
ParameterKey=HibernateConnectionUrl,ParameterValue=$HibernateConnectionUrl_develop \
ParameterKey=HibernateConnectionUsername,ParameterValue=$HibernateConnectionUsername_develop \
ParameterKey=HibernateConnectionUsessl,ParameterValue=true \
ParameterKey=HostPostfix,ParameterValue=-$DNS_HOSTNAME.$DNS_DOMAIN \
ParameterKey=JavaOpts,ParameterValue='-Dnewrelic.config.file=/var/app/current/newrelic/newrelic.yml -javaagent:/var/app/current/lib/com.newrelic.agent.java.newrelic-agent-3.32.0.jar' \
ParameterKey=NewRelicAppName,ParameterValue=$DNS_HOSTNAME.$DNS_DOMAIN \
ParameterKey=NewRelicLicenseKey,ParameterValue=$NewRelicLicenseKey_develop \
ParameterKey=NewRelicLog,ParameterValue=stdout \
ParameterKey=RedisUrl,ParameterValue=$RedisUrl_develop \
ParameterKey=SSLCertArn,ParameterValue=$SSLCertArn_develop \
ParameterKey=SynapseApiKey,ParameterValue=$SynapseApiKey_develop \
ParameterKey=SynapseUser,ParameterValue=$SynapseUser_develop \
ParameterKey=SysopsEmail,ParameterValue=$SysopsEmail_develop \
ParameterKey=WebservicesUrl,ParameterValue=https://$DNS_HOSTNAME.$DNS_DOMAIN \
