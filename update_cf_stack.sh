#!/usr/bin/env bash
aws cloudformation update-stack \
--stack-name $STACK_NAME \
--capabilities CAPABILITY_NAMED_IAM \
--template-body file://cf_templates/eb_bridgepf.yml \
--parameters \
ParameterKey=SSLCertArn,ParameterValue=$SSLCertArn \
ParameterKey=BridgeEnv,ParameterValue=dev \
ParameterKey=BridgeUser,ParameterValue=heroku \
ParameterKey=InstanceType,ParameterValue=t2.micro \
ParameterKey=AppDeployBucket,ParameterValue=org-sagebridge-bridgepf-deployment-dummypf-develop \
ParameterKey=DNSHostname,ParameterValue=$DNS_HOSTNAME \
ParameterKey=DNSDomain,ParameterValue=$DNS_DOMAIN \
ParameterKey=AwsKey,ParameterValue=$AwsKey \
ParameterKey=AwsSecretKey,ParameterValue=$AwsSecretKey \
ParameterKey=AwsSecretKeyConsents,ParameterValue=$AwsSecretKeyConsents \
ParameterKey=AwsKeyUpload,ParameterValue=$AwsKeyUpload \
ParameterKey=AwsSecretKeyUpload,ParameterValue=$AwsSecretKeyUpload \
ParameterKey=AwsKeyUploadCms,ParameterValue=$AwsKeyUploadCms \
ParameterKey=AwsSecretKeyUploadCms,ParameterValue=$AwsSecretKeyUploadCms \
ParameterKey=EnterpriseStormpathHref,ParameterValue=$EnterpriseStormpathHref \
ParameterKey=EnterpriseStormpathId,ParameterValue=$EnterpriseStormpathId \
ParameterKey=EnterpriseStormpathSecret,ParameterValue=$EnterpriseStormpathSecret \
ParameterKey=HibernateConnectionPassword,ParameterValue=$HibernateConnectionPassword \
ParameterKey=HibernateConnectionUrl,ParameterValue=$HibernateConnectionUrl \
ParameterKey=HibernateConnectionUsername,ParameterValue=$HibernateConnectionUsername \
ParameterKey=HibernateConnectionUsessl,ParameterValue=true \
ParameterKey=RedisUrl,ParameterValue=$RedisUrl \
ParameterKey=BridgeHealthcodeKey,ParameterValue=$BridgeHealthcodeKey \
ParameterKey=WebservicesUrl,ParameterValue=https://$DNS_HOSTNAME.$DNS_DOMAIN \
ParameterKey=HostPostfix,ParameterValue=-$DNS_HOSTNAME.$DNS_DOMAIN \
ParameterKey=JavaOpts,ParameterValue='-Dnewrelic.config.file=/var/app/current/newrelic/newrelic.yml -javaagent:/var/app/current/lib/com.newrelic.agent.java.newrelic-agent-3.32.0.jar' \
ParameterKey=NewRelicAppName,ParameterValue=$DNS_HOSTNAME.$DNS_DOMAIN \
ParameterKey=NewRelicLicenseKey,ParameterValue=$NewRelicLicenseKey \
ParameterKey=NewRelicLog,ParameterValue=stdout \
ParameterKey=EmailUnsubscribeToken,ParameterValue=$EmailUnsubscribeToken \
ParameterKey=AuthCreateMysqlAccounts,ParameterValue=true \
ParameterKey=AuthProvider,ParameterValue=mysql \
ParameterKey=AwsSnsKey,ParameterValue=$AwsSnsKey \
ParameterKey=AwsSnsSecretKey,ParameterValue=$AwsSnsSecretKey \
ParameterKey=SynapseApiKey,ParameterValue=$SynapseApiKey \
ParameterKey=SynapseUser,ParameterValue=$SynapseUser \
ParameterKey=SysopsEmail,ParameterValue='Bridge IT <bridge-testing+sysops@sagebase.org>' \
ParameterKey=AwsEbNotificationEndpoint,ParameterValue=$AwsEbNotificationEndpoint \
ParameterKey=AppHealthcheckUrl,ParameterValue='HTTP:80/?study=api'
