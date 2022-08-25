#!/bin/bash
#
#  Script to run Unity with default flags
#
# Usage: 
#./openUnity.sh $unity_editors_path $unity_version $platform $project_path

unity_editors_path="$1"
unity_version="$2"
platform="$3"
project_path="$4"
shift 4

Unity="$unity_editors_path/$unity_version/Unity.app/Contents/MacOS/Unity"  # Unity executable on Macos
Unity_Win="$unity_editors_path/$unity_version/Editor/Unity"                # Unity executable on Windows

if [ "$(uname -s)" == "Darwin" ]; then                                     # Checks platform, then
    _unity_args=(                                                          # runs with given flags and treats additional as args to add
        -projectPath "$project_path"                                       # if needed in Teamcity UI
        -buildtarget "$platform"
        -nographics
        -batchmode
        -upmNoDefaultPackages
        -disable-assembly-updater
        "$@"
    )
    "$Unity" "${_unity_args[@]}"
else
    _unity_args=(
        -projectPath "$project_path"
        -buildtarget "$platform"
        -nographics
        -batchmode
        -upmNoDefaultPackages
        -disable-assembly-updater
        "$@"
    )
    "$Unity_Win" "${_unity_args[@]}"
fi