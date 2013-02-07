#!/bin/bash

REPOS=$1
MIRROR=$2
MIRROR2=$3

SVNSYNC=/usr/local/bin/svnsync
SYNC_USER=svn
SYNC_PASS=hackme
SOURCE_USER=svn
SOURCE_PASS=hackme

# Sync to Mirror
$SVNSYNC --non-interactive sync $MIRROR \
--sync-username $SYNC_USER --sync-password $SYNC_PASS \
--source-username $SOURCE_USER --source-password $SOURCE_PASS
if [ $? != 0 ]; then
mail -s "svn sync failed for $REPOS for $MIRROR" vishal.sahasrabuddhe@inmobi.com < /dev/null
fi

# Sync to EV1 Mirror
$SVNSYNC --non-interactive sync $MIRROR2 \
--sync-username $SYNC_USER --sync-password $SYNC_PASS \
--source-username $SOURCE_USER --source-password $SOURCE_PASS
if [ $? != 0 ]; then
mail -s "svn sync failed for $REPOS for $MIRROR2" vishal.sahasrabuddhe@inmobi.com < /dev/null
fi
