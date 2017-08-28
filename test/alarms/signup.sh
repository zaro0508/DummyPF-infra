#!/usr/bin/env bash
curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d @signup.json 'https://webservices-staging.sagebridge.org/v3/auth/signUp'
echo ""


