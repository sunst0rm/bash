#!/bin/bash
#
# Imagine you have a gitlab instance e.g git@yourcompany.com
#
# This is a script to check if you can connect continously to that gitlab instance.
# Otherwise, it sends a desktop notification using notify-send (Linux)
# an saves output to error.txt
#
# It can be used to diagnose issues with company's loadbalancer e.g you replace yourcompany.com with IP
# and get a direct connection to that instance.
#
#

while true ; do
ssh -o ConnectTimeout=4  git@yourcompany.com
if [[ "$?" -ne 0 ]] ; then
  notify-send 'connection_error'
  echo $(date) connection_error >> error.txt
fi
sleep 3
done
