#!/bin/bash
set -a
SVNLOOK=/etc/subversion/bin/svnlook
REPO=$1
TXN=$2
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

for files in `$SVNLOOK changed $REPO -t $TXN | grep puppet | awk '{ print $2 }' | grep .yaml$`
  do
    $SVNLOOK cat $REPO $files -t $TXN > /tmp/precommit.yaml
    file="/tmp/precommit.yaml"
    OUT=`/usr/bin/perl -MData::Dumper -MYAML -e '$h = YAML::LoadFile($ENV{file});' && echo OK || echo Failed`
      if [ $OUT != OK ]
        then
           echo "Parser Issue: $files has some syntax issue\n" >&2
           echo "Please fix it and recommit" >&2
           exit 1
        fi
  done
exit 0
