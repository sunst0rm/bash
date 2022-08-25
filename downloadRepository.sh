#!/bin/bash
#
# Script to download project repository with given path, bare repository location, branch.
# You can optionally add commit as $6 argument if you want to work on that version of repository
#
# Usage:
# ./downloadRepository.sh $project_repository $project_path $project_branch $bare_repo_path $project_bare_repo_name $commmit
#
# 

$project_repository="$1"
$project_path="$2" 
$project_branch="$3" 
$bare_repo_path="$4" 
$project_bare_repo_name="$5"
$commit="$6"

# If project directory does not exist and number of arguments equals 6 and commit equals HEAD or has alfanumeric value then
# clone repo using specific and single branch from bare repositories location and bare repo name
# then proceed to that directory and verify last commit and checkout that commmit

# If project directory does not exist and number of arguments is less than 6 then
# clone repo as above but checkout on branch

# If project directory exists, then reset git reset aand fetch all changes

if [[ ! -d "$project_path" ]] && [[ "$#" -eq "6" ]] && [[ "$commit" == "HEAD" || "$commit" =~ ^[a-zA-Z0-9]{1,7}$ ]] ; 
then
    git clone -b $project_branch --progress --reference $bare_repo_path/"$project_bare_repo_name" --single-branch $project_repository $project_branch
    cd $project_path && git rev-parse --verify "$commit" && git checkout --force "$commit"

elif [[ ! -d "$project_path" ]] && [[ "$#" -lt "6" ]] ;
then
    git clone -b $project_branch --progress --reference $4/"$5" --single-branch $1 $project_path
    cd $project_path && git checkout --force --detach origin/$project_branch
else 
    cd $project_path && git reset --hard HEAD && git fetch --all --progress
fi