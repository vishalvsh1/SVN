#!/bin/bash

user=$1

#for i in `cat /opt/svnroot/hook-scripts/access_list_ifd.txt`
#do
#	if [ "x${i}" == "x${user}" ]; then
#	exit 0
#	fi
#done
auth=`grep -i $user /opt/svnroot/hook-scripts/access_list_metadata.txt`
if test -z $auth 
then
	echo "svn commit: ERROR you dont have access to commit to metadata repository"
	echo "svn [server aborted]: please contact the SCM or owner of the repository"
	exit 1;
else
	exit 0;
fi

