#!/bin/bash
#
# Script to download bare project repository.
#
# Usage: 
#./downloadBareRepository.sh $project_repository $bare_repositories_path $project_bare_repo_name
#

project_repository="$1"                 # Project's repository address
bare_repositories_path="$2"             # Path where we store bare repositories on server
project_bare_repo_name="$3"             # Project's bare repository name

git ls-remote $project_repository       # check access to remote repository

# If project's bare repo does not exists in bare repos directory, then clone it from remote repo to that path
# If it exists proceed with git commands

if [[ ! -d "$bare_repositories_path/"$project_bare_repo_name"" ]] ;
then
    git clone --mirror $project_repository $bare_repositories_path/"$project_bare_repo_name"
else
    cd "$project_repository $bare_repositories_path/"$project_bare_repo_name"" \
    && git config core.commitGraph true && git config gc.writeCommitGraph true && git config fetch.writeCommitGraph true && git fetch --all --progress
fi
