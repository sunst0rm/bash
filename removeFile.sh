#!/bin/bash

# Find and remove files of specific name and type from given directory

FILE_NAME=.git 
FILE_SEARCH_LOCATION=/Users/jaroslawkoziol/Projects/personal/bash
FILE_TYPE=d

# find  and file in location X
find $FILE_SEARCH_LOCATION -name $FILE_NAME -type $FILE_TYPE 2>/dev/null -exec rm -rf {} \;

