# sandbox-infra
Infra for sandbox application


## Creating a new stack
1. Bootstrap the stack with required resources. Important, the stack name is $STACK_NAME-$ENVIRONMENT-boostrap (example: foo-develop-boostrap)

```
aws --profile aws-admin-user --region us-east-1 cloudformation create-stack \
--stack-name foo-develop-bootstrap --capabilities CAPABILITY_NAMED_IAM --on-failure DELETE \
--template-body file://cf_templates/eb_bridgepf_bootstrap.yml \
--parameters ParameterKey=AppDeployBucket,ParameterValue=org-sagebridge-bridgepf-deployment-foo-develop
```

2. Deploy the application and resources.  This time the stack name is $STACK_NAME-$ENVIRONMENT (example: foo-develop).  This time you can pass in the user that was created by the boostrap stack.

```
aws --profile foo-bootstapper-User --region us-east-1 cloudformation create-stack \
--stack-name foo-develop \
--capabilities CAPABILITY_NAMED_IAM \
--template-url https://s3.amazonaws.com/org-sagebridge-bridgepf-artifacts-sandbox-infra-develop/cf_templates/eb_bridgepf.yml \
--parameters \
ParameterKey=SSLCertArn,ParameterValue=$SSLCertArn \
..
..
.. Rest of the parameters from update_cf_stack.sh

```

2. Deploy your app file to the stack.  This can be done by using either the AWS console[1] or using the AWS CLI[2][3].



[1] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.deploy-existing-version.html
[2] https://docs.aws.amazon.com/cli/latest/reference/elasticbeanstalk/create-application-version.html
[3] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb3-deploy.html

