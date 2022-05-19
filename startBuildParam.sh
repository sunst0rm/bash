#!/bin/bash
#
# Script to start build on Teamcity with changed parameters and check if build is in queue.
# 
# You need to add TC's server url, you user's api token, build name set in referred project, desired parameters and values
# 
#

URL=
TOKEN=
BUILD_NAME=
PARAMETER1=
VALUE1=
PARAMETER2=
VALUE2=

# Start build
curl -s --output /dev/null -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -H "Accept: application/json" \
-X POST \
-d '{
  "buildType": {
  "id": "'$BUILD_NAME'"
},
  "properties": {
  "property": [
    {
     "name": "'$PARAMETER1'",
     "value": "'$VALUE1'"
    },
    {
     "name": "'$PARAMETER2'",
     "value": "'$VALUE2'"
    }
   ]
  }
}' \
$URL/buildQueue

# Wait for build to load in queue
sleep 4

# Check if build is in queue
curl -s -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" $URL/buildQueue | jq