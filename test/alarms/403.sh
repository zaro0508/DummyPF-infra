#!/usr/bin/env bash

curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -c cookie_mytestuser.txt -d '{ "study": "api", "email": "mytestuser@sagebase.org", "password": "mypassword", "type": "Study" }' 'https://webservices-staging.sagebridge.org/v3/auth/signIn'
echo ""

for i in `seq 1 10`;
do
curl -i -X DELETE --header 'Accept: application/json' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v3/studies/api?physical=false'
echo ""
done
