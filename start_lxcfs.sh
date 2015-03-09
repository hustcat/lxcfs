#!/bin/bash
if [ $# -ne 1 ];then
	echo "Usage: $0 <dockerid>"
	echo "Ex: $0 docker-123456"
	exit 1
fi

BIN=/usr/sbin/lxcfs
LOG_DIR=/var/log/lxcfs

DOCKER=$1

LOG="$LOG_DIR/${DOCKER}"
FS_PATH="/var/lib/dockerfs/${DOCKER}/"

if [ ! -d $FS_PATH ]; then
	mkdir -p $FS_PATH
fi 

if [ ! -d $LOG_DIR ]; then
	mkdir -p $LOG_DIR
fi

echo "RUN $BIN -s -o allow_other $FS_PATH > $LOG ..."
$BIN -s -o allow_other $FS_PATH > $LOG 2>&1 &
exit 0
