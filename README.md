# DummyPF-infra
Infra for DummyPF application


## Creating a new stack
1. Deploy the application and resources.  The stack name is $STACK_NAME-$ENVIRONMENT (example: foo-develop).

```
aws --profile foo-bootstapper-User --region us-east-1 cloudformation create-stack \
--stack-name foo-develop \
--capabilities CAPABILITY_NAMED_IAM \
--template-url https://s3.amazonaws.com/org-sagebridge-bridgepf-artifacts-dummypf-infra-develop/cf_templates/eb_bridgepf.yml \
--parameters \
ParameterKey=InstanceType,ParameterValue=t2.micro \
ParameterKey=SSLCertArn,ParameterValue=$SSLCertArn \
..
.. Rest of the parameters from update_cf_stack.sh

```

2. Deploy your app file to the stack.  This can be done by using either the AWS console[1] or using the AWS CLI[2][3].



# References
[1] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.deploy-existing-version.html
[2] https://docs.aws.amazon.com/cli/latest/reference/elasticbeanstalk/create-application-version.html
[3] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb3-deploy.html

