#!/bin/bash
#
#  Create tag on project's repo during bash step execution in Teamcity pipeline

# Usage: 
#./createTag.sh $project_path $app_version $build_number $platform
#

project_path="$1"
app_version="$2"
build_number="$3"
platform="$4"

tag="$platform"_"$app_version"_"$build_number"

# go to project path
cd $1

#check if tag exists
if [ $(git tag -l "$tag") ] ; 
then
    echo "$tag you are trying to create is already present in the repository."
else
    git tag $tag && git push --tags
fi