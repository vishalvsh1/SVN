#!/bin/bash
SVNLOOK=/etc/subversion/bin/svnlook
REPO=$1
TXN=$2
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

for files in `$SVNLOOK changed $REPO -t $TXN | grep puppet | awk '{ print $2 }' | grep .pp$`
  do
	$SVNLOOK cat $REPO $files -t $TXN > /tmp/precommit.pp
	if [ `/usr/bin/puppet parser validate /tmp/precommit.pp | wc -l` -ne 0 ]
      then
         echo "Parser Issue: Run </usr/bin/puppet parser validate $files> to find the issue\n" >&2
         echo "Please fix it and recommit" >&2
         exit 1
    fi
 done
exit 0
