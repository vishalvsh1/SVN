#!/bin/sh

#This script is to lock the tags.
#Repos and trasaction must be pased to this script.
REPOS="$1"
TXN="$2"

SVNLOOK=/etc/subversion/bin/svnlook
########################
# Protect tags directory
########################
# Deny transaction if any line writes to tags directory that exists.
# tags dir match pattern 
TAGS_REGEX='tags/[^/]\+'
# Get list of transactions in the 'tag' directory 
TAGS_CHANGES=`"$SVNLOOK" changed -t "$TXN" "$REPOS" 2>/dev/null | \
                 awk '{ print $2; }' 2>/dev/null | \
                 grep tags/ 2>/dev/null | \
                 sed -e 's!^\($TAGS_REGEX\).*!\1!' | \
                 sort | \
                 uniq`
# Get head revision number
YOUNGEST=`svnlook youngest "$REPOS" 2>/dev/null`
echo $YOUNGEST  >> /tmp/tag.log
# For every line in transaction,
# check to see if directory in tags exists
for CHANGE in $TAGS_CHANGES; do
  # If directory in tags exists, deny transaction
  if svnlook proplist -r $YOUNGEST "$REPOS" "$CHANGE" >/dev/null 2>&1 ;
then
    echo "Cannot modify existing tag: ${tag}" >&2
    exit 1
  fi
done
#######################
# Allow transaction
#######################
exit 0

