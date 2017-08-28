#!/usr/bin/env bash

for i in `seq 1 10`;
do
curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -c cookie_mytestuser.txt -d '{ "study": "api", "email": "mytestuser@sagebase.org", "password": "password", "type": "Study" }' 'https://webservices-staging.sagebridge.org/v3/auth/signIn'
echo ""
curl -i -X DELETE --header 'Accept: application/json' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v3/studies/fish?physical=false'
echo ""
done
