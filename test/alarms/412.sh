#!/usr/bin/env bash

# login with consented user
curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -c cookie_mytestuser.txt -d '{ "study": "api", "email": "mytestuser@sagebase.org", "password": "mypassword", "type": "Study" }' 'https://webservices-staging.sagebridge.org/v3/auth/signIn'
echo ""
# withdraw consent from study
curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -b cookie_mytestuser.txt -d '{"reason": "testing", "type": "Study"}' 'https://webservices-staging.sagebridge.org/v3/consents/withdraw'
echo ""

# force 412 response
for i in `seq 1 30`;
do
curl -X GET --header 'Accept: application/json' -I -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v3/notifications'
echo ""
done

# re-consent to study
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -b cookie_mytestuser.txt -d '{"name": "mytestuser", "birthdate": "1973-08-01", "imageData": "bin", "imageMimeType": "png", "scope": "no_sharing", "type": "Study"}' 'https://webservices-staging.sagebridge.org/v3/subpopulations/api/consents/signature'
echo ""
