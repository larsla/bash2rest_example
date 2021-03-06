#!/bin/bash

mkdir -p /tmp/users

# check if we are called as part of fetching a user object
CALLED_NAME=`basename $0`
ID=`echo $CALLED_NAME |sed 's|GET_||' |sed 's|\.sh||'`
if [ -n "$ID" ]; then
  if [ -f /tmp/users/${ID} ]; then
    cat /tmp/users/${ID} |jq .
  else
    echo '{"result": "error", "reason": "no such user"}' |jq .
    exit 1
  fi
else
  echo '{"result": "error", "reason": "no user id provided"}' |jq .
  exit 1
fi
