!/bin/bash

USER_LIST_COUNT=`cat users-list.txt | wc -l`

for SEQ in `seq 1 $USER_LIST_COUNT`;do
USERS=`sed -n "$SEQ"p users-list.txt`
_PASSWD=`sed -n "$SEQ"p password.txt`

useradd $USERS >> /dev/null
passwd $USERS << EOF
$_PASSWD
$_PASSWD
EOF
done
