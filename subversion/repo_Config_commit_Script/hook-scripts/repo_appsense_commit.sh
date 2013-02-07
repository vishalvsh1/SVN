#!/bin/bash

user=$1

auth=`grep -i $user /opt/svnroot/hook-scripts/access_list_appsense.txt`
if test -z $auth
then
	echo "svn commit: ERROR" you dont have access to commit to appsense repository""
	echo "svn [server aborted]: please contact the SCM or owner of the repository"
	exit 1
else
        exit 0;
fi

