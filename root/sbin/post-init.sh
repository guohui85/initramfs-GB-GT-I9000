#!/sbin/sh

sleep 15

# Tweak cfq io scheduler
  for i in $(ls -1 /sys/block/stl*) $(ls -1 /sys/block/mmc*) $(ls -1 /sys/block/bml*) $(ls -1 /sys/block/tfsr*)
  do echo "0" > $i/queue/rotational
    echo "1" > $i/queue/iosched/low_latency
    echo "2" > $i/queue/iosched/slice_idle
    echo "1" > $i/queue/iosched/back_seek_penalty
    echo "1000000000" > $i/queue/iosched/back_seek_max
  done

# Miscellaneous tweaks
  echo "2000" > /proc/sys/vm/dirty_writeback_centisecs
  echo "1000" > /proc/sys/vm/dirty_expire_centisecs

if [ -e /sys/module/lowmemorykiller/parameters/minfree ]; then
	echo "2560,4096,6144,7680,11264,12288" > /sys/module/lowmemorykiller/parameters/minfree
fi;
