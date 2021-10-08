#!/bin/bash

# This is a dummy script to use with cron, which copies Firefox profile to another location on Mac.
#
# My purpose is to avoid errors during backup using rsync, cause it does not see properly
# Firefox profile's path and gives error at 'Application\ Support/'
#

cd /Users/jarek/Library/Application\ Support/Firefox/Profiles || exit
cp -R /Users/jarek/Library/Application\ Support/Firefox/Profiles /Users/jarek/Documents/Profiles
