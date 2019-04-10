#!/bin/bash
USER_LIST="users-list.txt"
USER_LIST_COUNT=`cat $USER_LIST | wc -l`
PASSWD_LIST="password.txt"

for SEQ in `seq 1 $USER_LIST_COUNT`
do

#PASSWD=`cat password.txt`

#echo $SEQ

USERS=`sed -n "$SEQ"p $USER_LIST`
PASSWD=`sed -n "$SEQ"p $PASSWD_LIST`
#echo $USERS
#echo $PASSWD


useradd $USERS 2> /dev/null
echo $PASSWD | passwd $USERS --stdin

done
