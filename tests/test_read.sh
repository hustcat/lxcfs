#/bin/bash
red_c() {
     echo -e $2 "\e[31;1m${1}\e[0m"
}
DIR=/var/lib/lxcfs/vm1
PWD=`pwd`
COUNT=3

for i in test_read_1024 test_read_4096
do
	BIN=$PWD/$i

	red_c "$BIN test cpuinfo"
	$BIN $DIR/proc/cpuinfo $COUNT

	red_c "$BIN test stat"
	$BIN $DIR/proc/stat $COUNT
done
