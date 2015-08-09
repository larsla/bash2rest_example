#!/bin/bash

mkdir -p /tmp/users

# we have the env variable named RAW_JSON containing the object that was sent

# first we add a timestamp
TIMESTAMP=`date +%s`
USER=`echo $RAW_JSON |jq --arg TIMESTAMP "$TIMESTAMP" '.created = $TIMESTAMP'`

# we create an ID using the md5 hash of the object
ID=`echo $USER |md5sum |cut -d' ' -f 1`
USER=`echo $USER |jq --arg ID "$ID" '.id = $ID'`

echo $USER >/tmp/users/${ID}

ln -s ${PWD}/`dirname $0`/GET_.sh `dirname $0`/GET_${ID}.sh
ln -s ${PWD}/`dirname $0`/PUT_.sh `dirname $0`/PUT_${ID}.sh
ln -s ${PWD}/`dirname $0`/DELETE_.sh `dirname $0`/DELETE_${ID}.sh

echo $USER |jq .
