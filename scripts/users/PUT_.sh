#!/bin/bash

mkdir -p /tmp/users

# check if we are called as part of fetching a user object
CALLED_NAME=`basename $0`
ID=`echo $CALLED_NAME |sed 's|PUT_||' |sed 's|\.sh||'`
if [ -n "$ID" ]; then
  if [ -f /tmp/users/${ID} ]; then
    # add updated field
    UPDATED=`date +%s`
    USER=`echo $RAW_JSON |jq --arg UPDATED "$UPDATED" '.updated = $UPDATED'`

    # make sure the input we get in the JSON isn't incorrect
    CREATED=`cat /tmp/users/${ID} |jq .created |tr -d '"'`
    USER=`echo $USER |jq --arg CREATED "$CREATED" '.created = $CREATED'`
    USER=`echo $USER |jq --arg ID "$ID" '.id = $ID'`

    echo $USER >/tmp/users/${ID}
    echo $USER | jq .
  else
    echo '{"result": "error", "reason": "no such user"}' |jq .
    exit 1
  fi
fi
