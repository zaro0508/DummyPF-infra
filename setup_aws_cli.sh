#!/usr/bin/env bash

# double interpolate vars from travis
eval export "AwsTravisAccessKey=\$AwsTravisAccessKey_$TRAVIS_BRANCH"
eval export "AwsTravisSecretAccessKey=\$AwsTravisSecretAccessKey_$TRAVIS_BRANCH"

pip install --upgrade awscli
mkdir ~/.aws
echo -e "[default]\nregion=us-east-1" > ~/.aws/config
echo -e "[default]\naws_access_key_id=$AwsTravisAccessKey\naws_secret_access_key=$AwsTravisSecretAccessKey" > ~/.aws/credentials
