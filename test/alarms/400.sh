#!/usr/bin/env bash

for i in `seq 1 30`;
do
curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{"foostudy": "api", "email": "mytestuser@sagebase.org", "password": "mypassword", "type": "Study" }' 'https://webservices-staging.sagebridge.org/v3/auth/signIn'
echo ""
done

