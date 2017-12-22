#!/usr/bin/env bash

TEMPLATE_URL=$1

aws \
cloudformation update-stack \
--stack-name $STACK_NAME \
--capabilities CAPABILITY_NAMED_IAM \
--template-body file://cf_templates/eb_dummypf.yml \
--parameters \
ParameterKey=AppDeployBucket,ParameterValue=$AppDeployBucket \
ParameterKey=AppHealthcheckUrl,ParameterValue='HTTP:80/?study=api' \
ParameterKey=AttachmentBucket,ParameterValue=$AttachmentBucket \
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
ParameterKey=HostPostfix,ParameterValue=$HostPostfix \
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
ParameterKey=WebservicesUrl,ParameterValue=$WebservicesUrl
