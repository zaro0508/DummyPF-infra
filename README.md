# DummyPF-infra
Install and configure the AWS Infrastructure for the DummyPF application.


## Initialize a new stack
1. Deploy the infrastrture to AWS.  The stack-name parameter should be $STACK_NAME-$ENVIRONMENT (example: foo-develop).

```
aws --profile aws-admin --region us-east-1 cloudformation create-stack \
  --stack-name foo-develop \
  --capabilities CAPABILITY_NAMED_IAM \
  --template-body cf_templates/eb_DummyPF.yml \
  --parameters \
  ParameterKey=AppDeployBucket,ParameterValue=org-sagebridge-DummyPF-deployment-foo-develop \
  ParameterKey=AwsDefaultVpcId,ParameterValue=vpc-1d69caf3 \
  ParameterKey=EC2InstanceType,ParameterValue=t2.micro \
  ..
  .. [Rest of the parameters from update_cf_stack.sh]

```

The above should create the infrastructure required for DummyPF, it does not actually deploy the app it only installs
and configures the required AWS infrastructure for it.  The AWS appilcation health check is enabled therefore the EB
environment will start in an error state since the app has not been deployed.  The environment status should turn
green once the is successfully deployed.

2. Check for additional bootstrapping steps in DummyPF repo[1]

3. Once the infrastructure for DummyPF app has been setup you can deploy the app file to the stack.  This can be done
by using either the AWS console[2] or using the AWS CLI[3][4].


# Contributions

## Issues
* https://sagebionetworks.jira.com/projects/BRIDGE

## Builds
* https://travis-ci.org/Sage-Bionetworks/DummyPF-infra

## Secrets
* We use git-crypt[5] to hide secrets for DummyPF.  Access to secrets is tightly controlled.  You will be required to
have your own GPG key[6] and you must request access by a maintainer of this project.



# References

[1] https://github.com/Sage-Bionetworks/DummyPF/wiki

[2] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.deploy-existing-version.html

[3] https://docs.aws.amazon.com/cli/latest/reference/elasticbeanstalk/create-application-version.html

[4] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb3-deploy.html

[5] https://github.com/AGWA/git-crypt

[6] https://help.github.com/articles/generating-a-new-gpg-key
