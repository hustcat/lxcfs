#/bin/bash
red_c() {
     echo -e $2 "\e[31;1m${1}\e[0m"
}

DIR=/var/lib/lxcfs
if ! mountpoint -q $DIR; then
    echo "lxcfs isn't mounted on /var/lib/lxcfs"
    exit 1
fi

red_c "test uptime"
cat $DIR/proc/uptime

red_c "test meminfo"
cat $DIR/proc/meminfo

red_c "test cpuinfo"
cat $DIR/proc/cpuinfo

red_c "test vmstat"
cat $DIR/proc/vmstat

red_c "test stat"
cat $DIR/proc/stat

red_c "test disks"
cat $DIR/proc/diskstats

exit 0
