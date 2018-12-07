#!/system/bin/sh

#
# BlackenedMod by xFirefly93 @ XDA
# Various strictly selected, carefully optimized & adjusted       # tweaks for better day to day performance and battery life,
# specially tuned for the Wahoo line-up and its kernel;
#

# Mounting tweak for better overall partition performance;
busybox mount -o remount,nosuid,nodev,noatime,nodiratime -t auto /;
busybox mount -o remount,nosuid,nodev,noatime,nodiratime -t auto /proc;
busybox mount -o remount,nosuid,nodev,noatime,nodiratime -t auto /sys;
busybox mount -o remount,nosuid,nodev,noatime,nodiratime,barrier=0,noauto_da_alloc,discard -t auto /data;
busybox mount -o remount,nodev,noatime,nodiratime,barrier=0,noauto_da_alloc,discard -t auto /system;

# Disable a couple of useless system daemons at boot;
stop debuggerd
stop healthd
stop logcat
stop statsd
stop tombstoned
stop incidentd
stop folio_daemon

# Turn off some pretty much useless debugging and gain back a few percent of critical needed performance that in fact was earlier lost and used on nothing than thin & empty air;
for i in $(find /sys/ -name debug_mask); do
echo "0" > $i;
done

# Use & enable xFirefly93's own, fully customized and overall enhanced CPUSet configuration for gaining a massively improvement in performance as well as battery life without any real world notable tradeoffs or regressions;
echo "6-7" > /dev/cpuset/background/cpus
echo "0-3" > /dev/cpuset/foreground/cpus
echo "4-5" > /dev/cpuset/kernel/cpus
echo "4-7" > /dev/cpuset/restricted/cpus
echo "4-7" > /dev/cpuset/system-background/cpus
echo "0-7" > /dev/cpuset/top-app/cpus

# Enable stune foreground boost and gain a well deserved responsivness boost with one extra snap on top of it;
echo "8" > /dev/stune/foreground/schedtune.boost

# FileSystem (FS) optimized tweaks & enhancements for a improved userspace experience;
echo "0" > /proc/sys/fs/dir-notify-enable
echo "20" > /proc/sys/fs/lease-break-time

# A couple of minor kernel entropy tweaks & enhancements for a slight UI responsivness boost;
echo "128" > /proc/sys/kernel/random/read_wakeup_threshold
echo "96" > /proc/sys/kernel/random/urandom_min_reseed_secs
echo "2560" > /proc/sys/kernel/random/write_wakeup_threshold

# Kernel based tweaks that reduces the amount of wasted CPU cycles to maximum and gives back a huge amount of needed performance to both the system and the user;
echo "0" > /proc/sys/kernel/compat-log
echo "0" > /proc/sys/kernel/panic
echo "0" > /proc/sys/kernel/panic_on_oops
echo "0" > /proc/sys/kernel/perf_cpu_time_max_percent

# Increase how much CPU bandwidth (CPU time) realtime scheduling processes are given for slightly improved system stability and minimized chance of system freezes & lockups;
echo "980000" > /proc/sys/kernel/sched_rt_runtime_us

# Network tweaks for slightly reduced battery consumption when being "actively" connected to a network connection;
echo "128" > /proc/sys/net/core/netdev_max_backlog
echo "0" > /proc/sys/net/core/netdev_tstamp_prequeue
echo "0" > /proc/sys/net/ipv4/cipso_cache_bucket_size #1
echo "0" > /proc/sys/net/ipv4/cipso_cache_enable #2
echo "0" > /proc/sys/net/ipv4/cipso_rbm_strictvalid #3
echo "0" > /proc/sys/net/ipv4/igmp_link_local_mcast_reports #4
echo "24" > /proc/sys/net/ipv4/ipfrag_time #5
echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control
echo "2" > /proc/sys/net/ipv4/tcp_ecn
echo "320" > /proc/sys/net/ipv4/tcp_keepalive_intvl
echo "21600" > /proc/sys/net/ipv4/tcp_keepalive_time
echo "1" > /proc/sys/net/ipv4/tcp_no_metrics_save #6
echo "1500" > /proc/sys/net/ipv4/tcp_probe_interval
echo "48" > /proc/sys/net/ipv6/ip6frag_time #7

# Virtual Memory tweaks & enhancements for a massively improved balance between performance and battery life;
echo "0" > /proc/sys/vm/compact_unevictable_allowed
echo "3" > /proc/sys/vm/dirty_background_ratio
echo "60000" > /proc/sys/vm/dirty_expire_centisecs
echo "30" > /proc/sys/vm/dirty_ratio
echo "30000" > /proc/sys/vm/dirty_writeback_centisecs
echo "0" > /proc/sys/vm/oom_dump_tasks
echo "0" > /proc/sys/vm/oom_kill_allocating_task
echo "1200" > /proc/sys/vm/stat_interval
echo "0" > /proc/sys/vm/swap_ratio
echo "20" > /proc/sys/vm/swappiness
echo "60" > /proc/sys/vm/vfs_cache_pressure

# Disable gesture based vibration because it is honestly not even worth having enabled at all;
echo "0" > /sys/android_touch/vib_strength

# Block based tuning for reduced lag and less possible amount of general overhead;
echo "0" > /sys/block/dm-0/queue/add_random
echo "0" > /sys/block/dm-0/queue/iostats
echo "1" > /sys/block/dm-0/queue/rq_affinity
echo "0" > /sys/block/loop0/queue/add_random
echo "0" > /sys/block/loop0/queue/iostats
echo "0" > /sys/block/loop0/queue/nomerges
echo "128" > /sys/block/loop0/queue/read_ahead_kb
echo "0" > /sys/block/loop0/queue/rotational
echo "0" > /sys/block/loop1/queue/add_random
echo "0" > /sys/block/loop1/queue/iostats
echo "0" > /sys/block/loop1/queue/nomerges
echo "128" > /sys/block/loop1/queue/read_ahead_kb
echo "0" > /sys/block/loop0/queue/rotational
echo "0" > /sys/block/loop2/queue/add_random
echo "0" > /sys/block/loop2/queue/iostats
echo "0" > /sys/block/loop2/queue/nomerges
echo "128" > /sys/block/loop2/queue/read_ahead_kb
echo "0" > /sys/block/loop2/queue/rotational
echo "0" > /sys/block/loop3/queue/add_random
echo "0" > /sys/block/loop3/queue/iostats
echo "0" > /sys/block/loop3/queue/nomerges
echo "128" > /sys/block/loop3/queue/read_ahead_kb
echo "0" > /sys/block/loop0/queue/rotational
echo "0" > /sys/block/loop4/queue/add_random
echo "0" > /sys/block/loop4/queue/iostats
echo "0" > /sys/block/loop4/queue/nomerges
echo "128" > /sys/block/loop4/queue/read_ahead_kb
echo "0" > /sys/block/loop0/queue/rotational
echo "0" > /sys/block/loop5/queue/add_random
echo "0" > /sys/block/loop5/queue/iostats
echo "0" > /sys/block/loop5/queue/nomerges
echo "128" > /sys/block/loop5/queue/read_ahead_kb
echo "0" > /sys/block/loop0/queue/rotational
echo "0" > /sys/block/loop6/queue/add_random
echo "0" > /sys/block/loop6/queue/iostats
echo "0" > /sys/block/loop6/queue/nomerges
echo "128" > /sys/block/loop6/queue/read_ahead_kb
echo "0" > /sys/block/loop6/queue/rotational
echo "0" > /sys/block/loop7/queue/add_random
echo "0" > /sys/block/loop7/queue/iostats
echo "0" > /sys/block/loop7/queue/nomerges
echo "128" > /sys/block/loop7/queue/read_ahead_kb
echo "0" > /sys/block/loop7/queue/rotational
echo "0" > /sys/block/loop8/queue/add_random
echo "0" > /sys/block/loop8/queue/iostats
echo "0" > /sys/block/loop8/queue/nomerges
echo "128" > /sys/block/loop8/queue/read_ahead_kb
echo "0" > /sys/block/loop8/queue/rotational
echo "0" > /sys/block/ram0/queue/add_random
echo "0" > /sys/block/ram0/queue/iostats
echo "128" > /sys/block/ram0/queue/read_ahead_kb
echo "0" > /sys/block/ram0/queue/rotational
echo "1" > /sys/block/ram0/queue/rq_affinity
echo "0" > /sys/block/ram1/queue/add_random
echo "0" > /sys/block/ram1/queue/iostats
echo "128" > /sys/block/ram1/queue/read_ahead_kb
echo "0" > /sys/block/ram1/queue/rotational
echo "1" > /sys/block/ram1/queue/rq_affinity
echo "0" > /sys/block/ram2/queue/add_random
echo "0" > /sys/block/ram2/queue/iostats
echo "128" > /sys/block/ram2/queue/read_ahead_kb
echo "0" > /sys/block/ram2/queue/rotational
echo "1" > /sys/block/ram2/queue/rq_affinity
echo "0" > /sys/block/ram3/queue/add_random
echo "0" > /sys/block/ram3/queue/iostats
echo "128" > /sys/block/ram3/queue/read_ahead_kb
echo "0" > /sys/block/ram3/queue/rotational
echo "1" > /sys/block/ram3/queue/rq_affinity
echo "0" > /sys/block/ram4/queue/add_random
echo "0" > /sys/block/ram4/queue/iostats
echo "128" > /sys/block/ram4/queue/read_ahead_kb
echo "0" > /sys/block/ram4/queue/rotational
echo "1" > /sys/block/ram4/queue/rq_affinity
echo "0" > /sys/block/ram5/queue/add_random
echo "0" > /sys/block/ram5/queue/iostats
echo "128" > /sys/block/ram5/queue/read_ahead_kb
echo "0" > /sys/block/ram5/queue/rotational
echo "1" > /sys/block/ram5/queue/rq_affinity
echo "0" > /sys/block/ram6/queue/add_random
echo "0" > /sys/block/ram6/queue/iostats
echo "128" > /sys/block/ram6/queue/read_ahead_kb
echo "0" > /sys/block/ram6/queue/rotational
echo "1" > /sys/block/ram6/queue/rq_affinity
echo "0" > /sys/block/ram7/queue/add_random
echo "0" > /sys/block/ram7/queue/iostats
echo "128" > /sys/block/ram7/queue/read_ahead_kb
echo "0" > /sys/block/ram7/queue/rotational
echo "1" > /sys/block/ram7/queue/rq_affinity
echo "0" > /sys/block/ram8/queue/add_random
echo "0" > /sys/block/ram8/queue/iostats
echo "128" > /sys/block/ram8/queue/read_ahead_kb
echo "0" > /sys/block/ram8/queue/rotational
echo "1" > /sys/block/ram8/queue/rq_affinity
echo "0" > /sys/block/ram9/queue/add_random
echo "0" > /sys/block/ram9/queue/iostats
echo "128" > /sys/block/ram9/queue/read_ahead_kb
echo "0" > /sys/block/ram9/queue/rotational
echo "1" > /sys/block/ram9/queue/rq_affinity
echo "0" > /sys/block/ram10/queue/add_random
echo "0" > /sys/block/ram10/queue/iostats
echo "128" > /sys/block/ram10/queue/read_ahead_kb
echo "0" > /sys/block/ram10/queue/rotational
echo "1" > /sys/block/ram10/queue/rq_affinity
echo "0" > /sys/block/ram11/queue/add_random
echo "0" > /sys/block/ram11/queue/iostats
echo "128" > /sys/block/ram11/queue/read_ahead_kb
echo "0" > /sys/block/ram11/queue/rotational
echo "1" > /sys/block/ram11/queue/rq_affinity
echo "0" > /sys/block/ram12/queue/add_random
echo "0" > /sys/block/ram12/queue/iostats
echo "128" > /sys/block/ram12/queue/read_ahead_kb
echo "0" > /sys/block/ram12/queue/rotational
echo "1" > /sys/block/ram12/queue/rq_affinity
echo "0" > /sys/block/ram13/queue/add_random
echo "0" > /sys/block/ram13/queue/iostats
echo "128" > /sys/block/ram13/queue/read_ahead_kb
echo "0" > /sys/block/ram13/queue/rotational
echo "1" > /sys/block/ram13/queue/rq_affinity
echo "0" > /sys/block/ram14/queue/add_random
echo "0" > /sys/block/ram14/queue/iostats
echo "128" > /sys/block/ram14/queue/read_ahead_kb
echo "0" > /sys/block/ram14/queue/rotational
echo "1" > /sys/block/ram14/queue/rq_affinity
echo "0" > /sys/block/ram15/queue/add_random
echo "0" > /sys/block/ram15/queue/iostats
echo "128" > /sys/block/ram15/queue/read_ahead_kb
echo "0" > /sys/block/ram15/queue/rotational
echo "1" > /sys/block/ram15/queue/rq_affinity
echo "0" > /sys/block/sda/queue/add_random
echo "0" > /sys/block/sda/queue/iostats
echo "fiops" > /sys/block/sda/queue/scheduler
echo "0" > /sys/block/sdb/queue/add_random
echo "0" > /sys/block/sdb/queue/iostats
echo "128" > /sys/block/sdb/queue/read_ahead_kb
echo "fiops" > /sys/block/sdb/queue/scheduler
echo "0" > /sys/block/sdc/queue/add_random
echo "0" > /sys/block/sdc/queue/iostats
echo "128" > /sys/block/sdc/queue/read_ahead_kb
echo "fiops" > /sys/block/sdc/queue/scheduler
echo "0" > /sys/block/sdd/queue/add_random
echo "0" > /sys/block/sdd/queue/iostats
echo "128" > /sys/block/sdd/queue/read_ahead_kb
echo "fiops" > /sys/block/sdd/queue/scheduler
echo "0" > /sys/block/sde/queue/add_random
echo "0" > /sys/block/sde/queue/iostats
echo "128" > /sys/block/sde/queue/read_ahead_kb
echo "fiops" > /sys/block/sde/queue/scheduler
echo "0" > /sys/block/sdf/queue/add_random
echo "0" > /sys/block/sdf/queue/iostats
echo "128" > /sys/block/sdf/queue/read_ahead_kb
echo "fiops" > /sys/block/sdf/queue/scheduler
echo "0" > /sys/block/zram0/queue/add_random
echo "0" > /sys/block/zram0/queue/iostats
echo "128" > /sys/block/zram0/queue/read_ahead_kb
echo "1" > /sys/block/zram0/queue/rq_affinity

# Set the minimum GPU frequency to 257Mhz and let the Adreno GPU decide the most ideal GPU frequency to use;
echo "257000000" > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq

# Disable GPU frequency based throttling because it is actually not even needed anymore after all the GPU related enhancements and minor changes that I've done so far;
echo "0" > /sys/class/kgsl/kgsl-3d0/throttling

# Enable a tuned Boeffla wakelock blocker at boot for both better active & idle battery life;
echo "wlan_pno_wl;wlan_ipa;wcnss_filter_lock;[timerfd];hal_bluetooth_lock;IPA_WS;sensor_ind;wlan;netmgr_wl;qcom_rx_wakelock;wlan_wow_wl;wlan_extscan_wl;" > /sys/class/misc/boeffla_wakelock_blocker/wakelock_blocker

# Tweak and decrease tx_queue_len default stock value(s) for less amount of generated bufferbloat and for gaining slightly faster critically needed network speed and performance;
echo "128" > /sys/class/net/bond0/tx_queue_len
echo "128" > /sys/class/net/dummy0/tx_queue_len
echo "128" > /sys/class/net/ip6_vti0/tx_queue_len
echo "128" > /sys/class/net/ip6tnl0/tx_queue_len
echo "128" > /sys/class/net/ip_vti0/tx_queue_len
echo "128" > /sys/class/net/lo/tx_queue_len
echo "128" > /sys/class/net/p2p0/tx_queue_len
echo "128" > /sys/class/net/r_rmnet_data0/tx_queue_len
echo "128" > /sys/class/net/r_rmnet_data1/tx_queue_len
echo "128" > /sys/class/net/r_rmnet_data2/tx_queue_len
echo "128" > /sys/class/net/r_rmnet_data3/tx_queue_len
echo "128" > /sys/class/net/r_rmnet_data4/tx_queue_len
echo "128" > /sys/class/net/r_rmnet_data5/tx_queue_len
echo "128" > /sys/class/net/r_rmnet_data6/tx_queue_len
echo "128" > /sys/class/net/r_rmnet_data7/tx_queue_len
echo "128" > /sys/class/net/r_rmnet_data8/tx_queue_len
echo "128" > /sys/class/net/rmnet_data0/tx_queue_len
echo "128" > /sys/class/net/rmnet_data1/tx_queue_len
echo "128" > /sys/class/net/rmnet_data2/tx_queue_len
echo "128" > /sys/class/net/rmnet_data3/tx_queue_len
echo "128" > /sys/class/net/rmnet_data4/tx_queue_len
echo "128" > /sys/class/net/rmnet_data5/tx_queue_len
echo "128" > /sys/class/net/rmnet_data6/tx_queue_len
echo "128" > /sys/class/net/rmnet_data7/tx_queue_len
echo "128" > /sys/class/net/rmnet_ipa0/tx_queue_len
echo "128" > /sys/class/net/sit0/tx_queue_len
echo "128" > /sys/class/net/wlan0/tx_queue_len

# Display Calibration that will be close to D65 (6500K) (Boosted). Thanks to Juzman @ XDA for this contribution;
echo "256 249 226" > /sys/devices/platform/kcal_ctrl.0/kcal
echo "5" > /sys/devices/platform/kcal_ctrl.0/kcal_min
echo "257" > /sys/devices/platform/kcal_ctrl.0/kcal_val

# Optimize and lower both the battery drain and overall power consumption that is caused by the Schedutil governor by biasing it to use slightly lower frequency steps, but do this without sacrificing performance or overall UI fluidity. See this as a balanced in-kernel power save mode, but without any notable traces of the "semi-typical" smoothness regressions;

# Little Cluster;
echo "18500" > /sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us
echo "1" > /sys/devices/system/cpu/cpufreq/policy0/schedutil/iowait_boost_enable
echo "775" > /sys/devices/system/cpu/cpufreq/policy0/schedutil/up_rate_limit_us

# BIG Cluster;
echo "18500" > /sys/devices/system/cpu/cpufreq/policy4/schedutil/down_rate_limit_us
echo "1" > /sys/devices/system/cpu/cpufreq/policy4/schedutil/iowait_boost_enable
echo "775" > /sys/devices/system/cpu/cpufreq/policy4/schedutil/up_rate_limit_us

# Fully disable a very few CPU based & useless EDAC loggers;
echo "0" > /sys/devices/system/edac/cpu/log_ce
echo "0" > /sys/devices/system/edac/cpu/log_ue

# Disable Gentle Fair Sleepers for a smoother UI;
echo "NO_GENTLE_FAIR_SLEEPERS" > /sys/kernel/debug/sched_features

# This sysfs file actually mirrors the 'target_freq' tunable that can be found at the '/sys/class/kgsl/kgsl-3d0/devfreq' path. Set this to lowest possible frequency for lowest possible amount of power consumption from the Adreno 540 GPU;
echo "257" > /sys/kernel/gpu/gpu_min_clock

# A miscellaneous pm_async tweak that increases the amount of time (in milliseconds) before user processes & kernel threads are being frozen & "put to sleep";
echo "25000" > /sys/power/pm_freeze_timeout

# Trim selected partitions at boot;
fstrim /data;
fstrim /cache;
fstrim /system;

# Push a semi-needed log to the internal storage with a "report" if the script could be executed or not;

# Script log file location
LOG_FILE=/storage/emulated/0/logs

export TZ=$(getprop persist.sys.timezone);
echo $(date) > /storage/emulated/0/logs/01blackened_log
if [ $? -eq 0 ]
then
  echo "init.blackened_late.sh have been executed and is now fully up and running, so enjoy!" >> /storage/emulated/0/logs/blackened_log
  exit 0
else
  echo "init.blackened_late.sh did not execute, so please try again and do it right this time, honey!." >> /storage/emulated/0/logs/blackened_log
  exit 1
fi

# Wait..
# Done!
#
