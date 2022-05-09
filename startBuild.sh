#!/bin/bash
#
# Script to start build on Teamcity and chek if build is in queue.
# 
# You need to add TC's server url, you user's api token and build name set in referred project.
# 
#

URL=
TOKEN=
BUILD_NAME=

# Start build
curl -s --output /dev/null -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"buildType": {"id": "'$BUILD_NAME'"}}' $URL/buildQueue

# Wait for build to load in queue
sleep 4

# Check if build is in queue
curl -s -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" $URL/buildQueue | jq


