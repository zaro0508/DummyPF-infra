# BridgePF-infra
AWS Infrastructure for the BridgePF application.


## Initialize a new stack
1. Deploy the infrastrture to AWS.  The stack-name parameter should be $STACK_NAME-$ENVIRONMENT (example: foo-develop).

```
aws --profile aws_admin --region us-east-1 cloudformation create-stack \
  --stack-name foo-develop \
  --capabilities CAPABILITY_NAMED_IAM \
  --template-body cf_templates/eb_bridgepf.yml \
  --parameters ParameterKey=AppDeployBucket,ParameterValue=org-sagebridge-bridgepf-deployment-dummypf-develop \
  ParameterKey=InstanceType,ParameterValue=t2.micro \
  ..
  .. [Rest of the parameters from update_cf_stack.sh]

```

The above should create the infrastructure required for your app, it does not actually deploy your app.
The health check is enabled but the app is not deployed therefore it may come up in an error state.

2. Now you can deploy the app file to the stack.  This can be done by using either the AWS console[1] or using the AWS CLI[2][3].


# References
[1] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.deploy-existing-version.html  
[2] https://docs.aws.amazon.com/cli/latest/reference/elasticbeanstalk/create-application-version.html  
[3] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb3-deploy.html  
