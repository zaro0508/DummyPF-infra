#!/usr/bin/env bash
echo $STACK_NAME
echo $DNS_HOSTNAME
echo $DNS_DOMAIN
echo $TRAVIS_BRANCH
aws cloudformation update-stack \
--stack-name $STACK_NAME \
--capabilities CAPABILITY_NAMED_IAM \
--template-body file://cf_templates/eb_bridgepf.yml \
--parameters \
ParameterKey=AppDeployBucket,ParameterValue=$AppDeployBucket_$TRAVIS_BRANCH \
ParameterKey=AppHealthcheckUrl,ParameterValue='HTTP:80/?study=api' \
ParameterKey=AuthCreateMysqlAccounts,ParameterValue=true \
ParameterKey=AuthProvider,ParameterValue=mysql \
ParameterKey=AwsEbNotificationEndpoint,ParameterValue=khai.do@sagebase.org \
ParameterKey=AwsKey,ParameterValue=$AwsKey \
ParameterKey=AwsKeyUpload,ParameterValue=$AwsKeyUpload_$TRAVIS_BRANCH \
ParameterKey=AwsKeyUploadCms,ParameterValue=$AwsKeyUploadCms_$TRAVIS_BRANCH \
ParameterKey=AwsSecretKey,ParameterValue=$AwsSecretKey \
ParameterKey=AwsSecretKeyConsents,ParameterValue=$AwsSecretKeyConsents_$TRAVIS_BRANCH \
ParameterKey=AwsSecretKeyUpload,ParameterValue=$AwsSecretKeyUpload_$TRAVIS_BRANCH \
ParameterKey=AwsSecretKeyUploadCms,ParameterValue=$AwsSecretKeyUploadCms \
ParameterKey=AwsSnsKey,ParameterValue=$AwsSnsKey_$TRAVIS_BRANCH \
ParameterKey=AwsSnsSecretKey,ParameterValue=$AwsSnsSecretKey_$TRAVIS_BRANCH \
ParameterKey=BridgeEnv,ParameterValue=$BridgeEnv_$TRAVIS_BRANCH \
ParameterKey=BridgeHealthcodeKey,ParameterValue=$BridgeHealthcodeKey_$TRAVIS_BRANCH \
ParameterKey=BridgeUser,ParameterValue=heroku \
ParameterKey=DNSHostname,ParameterValue=$DNS_HOSTNAME \
ParameterKey=DNSDomain,ParameterValue=$DNS_DOMAIN \
ParameterKey=EC2InstanceType,ParameterValue=t2.micro \
ParameterKey=ElastiCacheInstanceType,ParameterValue=cache.t2.micro \
ParameterKey=EmailUnsubscribeToken,ParameterValue=$EmailUnsubscribeToken_$TRAVIS_BRANCH \
ParameterKey=EnterpriseStormpathHref,ParameterValue=$EnterpriseStormpathHref_$TRAVIS_BRANCH \
ParameterKey=EnterpriseStormpathId,ParameterValue=$EnterpriseStormpathId_$TRAVIS_BRANCH \
ParameterKey=EnterpriseStormpathSecret,ParameterValue=$EnterpriseStormpathSecret_$TRAVIS_BRANCH \
ParameterKey=HibernateConnectionPassword,ParameterValue=$HibernateConnectionPassword_$TRAVIS_BRANCH \
ParameterKey=HibernateConnectionUrl,ParameterValue=$HibernateConnectionUrl_$TRAVIS_BRANCH \
ParameterKey=HibernateConnectionUsername,ParameterValue=$HibernateConnectionUsername_$TRAVIS_BRANCH \
ParameterKey=HibernateConnectionUsessl,ParameterValue=true \
ParameterKey=HostPostfix,ParameterValue=-$DNS_HOSTNAME.$DNS_DOMAIN \
ParameterKey=JavaOpts,ParameterValue='-Dnewrelic.config.file=/var/app/current/newrelic/newrelic.yml -javaagent:/var/app/current/lib/com.newrelic.agent.java.newrelic-agent-3.32.0.jar' \
ParameterKey=NewRelicAppName,ParameterValue=$DNS_HOSTNAME.$DNS_DOMAIN \
ParameterKey=NewRelicLicenseKey,ParameterValue=$NewRelicLicenseKey_$TRAVIS_BRANCH \
ParameterKey=NewRelicLog,ParameterValue=stdout \
ParameterKey=RedisUrl,ParameterValue=$RedisUrl_$TRAVIS_BRANCH \
ParameterKey=SSLCertArn,ParameterValue=$SSLCertArn_$TRAVIS_BRANCH \
ParameterKey=SynapseApiKey,ParameterValue=$SynapseApiKey_$TRAVIS_BRANCH \
ParameterKey=SynapseUser,ParameterValue=$SynapseUser_$TRAVIS_BRANCH \
ParameterKey=SysopsEmail,ParameterValue=$SysopsEmail_$TRAVIS_BRANCH \
ParameterKey=WebservicesUrl,ParameterValue=https://$DNS_HOSTNAME.$DNS_DOMAIN

