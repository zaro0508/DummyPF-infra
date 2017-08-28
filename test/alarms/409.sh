#!/usr/bin/env bash

# login with consented user
curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -c cookie_mytestuser.txt -d '{ "study": "api", "email": "mytestuser@sagebase.org", "password": "password", "type": "Study" }' 'https://webservices-staging.sagebridge.org/v3/auth/signIn'
echo ""

# force 409 response
for i in `seq 1 10`;
do
curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -b cookie_mytestuser.txt -d '{"name": "mytestuser", "birthdate": "1973-08-01", "imageData": "bin", "imageMimeType": "png", "scope": "no_sharing", "type": "Study"}' 'https://webservices-staging.sagebridge.org/v3/subpopulations/api/consents/signature'
echo ""
done
