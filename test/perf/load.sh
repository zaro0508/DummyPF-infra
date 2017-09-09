#!/usr/bin/env bash
#set -x

# sign in
curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -c cookie_mytestuser.txt -d '{ "study": "api", "email": "mytestuser@sagebase.org", "password": "mypassword", "type": "Study" }' 'https://webservices-staging.sagebridge.org/v3/auth/signIn'
echo ""

for i in `seq 1 500`;
do

# get ~12 days of scheduled activity
curl -I -X GET --header 'Accept: text/plain' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v4/activities?startTime=2017-08-20T17%3A37%3A48.829Z&endTime=2017-09-01T17%3A37%3A48.829Z'
echo ""

# get surveys
curl -I -X GET --header 'Accept: application/json' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v3/surveys'
echo ""

# get published surveys
curl -I -X GET --header 'Accept: application/json' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v3/surveys/published'
echo ""

# get participants
curl -I -X GET --header 'Accept: application/json' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v3/participants?pageSize=100'
echo ""

# get schedule
curl -I -X GET --header 'Accept: application/json' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v4/schedules'
echo ""

# get studies
curl -I -X GET --header 'Accept: application/json' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v3/studies?summary=false'

# get reports
curl -I -X GET --header 'Accept: application/json' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v3/reports?type=api'
echo ""

# post an upload
curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -b cookie_mytestuser.txt -d '{
   "name": "myupload",
   "contentLength": 1024,
   "contentMd5": "3f16fb0ef812432ef172959bfc307322",
   "contentType": "png",
   "type": "api"
 }' 'https://webservices-staging.sagebridge.org/v3/uploads'
echo ""

# get self uploads
curl -I -X GET --header 'Accept: application/json' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v3/studies/self/uploads?startTime=2016-08-06T17%3A37%3A50.105Z&endTime=2017-09-09T17%3A37%3A50.105Z&pageSize=100'
echo ""


# get recent surveys
curl -I -X GET --header 'Accept: application/json' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v3/surveys/recent'
echo ""

# get schedule plan
curl -I -X GET --header 'Accept: application/json' -b cookie_mytestuser.txt 'https://webservices-staging.sagebridge.org/v3/scheduleplans'
echo ""

done
#set +x
