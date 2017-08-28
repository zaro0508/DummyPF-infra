#!/usr/bin/env bash
curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{"study": "fish", "email": "mytestuser.sagebase.org", "password": "password", "type": "Study" }' 'https://webservices-staging.sagebridge.org/v3/auth/signIn'
echo ""
