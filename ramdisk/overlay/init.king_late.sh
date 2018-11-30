#!/system/bin/sh

# (c) KingKernel kernel changes, some taken from xfirefly's flash kernel modification script since
# my kernel relies a lot on it

sleep 25;

#Default I/o sched cfq
echo "cfq" > /sys/block/sda/queue/scheduler
echo "cfq" > /sys/block/sdb/queue/scheduler
echo "cfq" > /sys/block/sdc/queue/scheduler
echo "cfq" > /sys/block/sdd/queue/scheduler
echo "cfq" > /sys/block/sde/queue/scheduler
echo "cfq" > /sys/block/sdf/queue/scheduler

# Disable a couple of useless system daemons at boot;
stop debuggerd
stop healthd
stop performanced
stop statsd
stop tombstoned
stop incidentd
stop folio_daemon

# Turn off some pretty much useless debugging and gain back a few percent of critical needed performance that in fact was earlier lost and used on nothing than thin & empty air;
for i in $(find /sys/ -name debug_mask); do
echo "0" > $i;
done

# Enable & run v1.0 of my custom cpuset configuration at each possible boot with bleeding perfection - for the sake of improved power efficiency and overall performance;
echo "3" > /dev/cpuset/background/cpus
echo "0-2" > /dev/cpuset/foreground/cpus
echo "2-3" > /dev/cpuset/kernel/cpus
echo "2" > /dev/cpuset/restricted/cpus
echo "1-2" > /dev/cpuset/system-background/cpus

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
echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control
echo "2" > /proc/sys/net/ipv4/tcp_ecn
echo "320" > /proc/sys/net/ipv4/tcp_keepalive_intvl
echo "21600" > /proc/sys/net/ipv4/tcp_keepalive_time
echo "1500" > /proc/sys/net/ipv4/tcp_probe_interval

# Virtual Memory tweaks & enhancements for a massively improved balance between performance and battery life;
sync; # Sync all caches (PageCache, dentries and inodes);
echo "3" > /proc/sys/vm/drop_caches
echo "3" > /proc/sys/vm/dirty_background_ratio
echo "500" > /proc/sys/vm/dirty_expire_centisecs
echo "30" > /proc/sys/vm/dirty_ratio
echo "3000" > /proc/sys/vm/dirty_writeback_centisecs
echo "5" > /proc/sys/vm/laptop_mode
echo "0" > /proc/sys/vm/oom_dump_tasks
echo "0" > /proc/sys/vm/oom_kill_allocating_task
echo "900" > /proc/sys/vm/stat_interval
echo "20" > /proc/sys/vm/swappiness
echo "60" > /proc/sys/vm/vfs_cache_pressure

# Block based tuning for reduced lag and less possible amount of general overhead;
echo "0" > /sys/block/dm-0/queue/add_random
echo "0" > /sys/block/dm-0/queue/iostats
echo "0" > /sys/block/loop0/queue/add_random
echo "0" > /sys/block/loop0/queue/iostats
echo "0" > /sys/block/loop1/queue/add_random
echo "0" > /sys/block/loop1/queue/iostats
echo "0" > /sys/block/loop2/queue/add_random
echo "0" > /sys/block/loop2/queue/iostats
echo "0" > /sys/block/loop3/queue/add_random
echo "0" > /sys/block/loop3/queue/iostats
echo "0" > /sys/block/loop4/queue/add_random
echo "0" > /sys/block/loop4/queue/iostats
echo "0" > /sys/block/loop5/queue/add_random
echo "0" > /sys/block/loop5/queue/iostats
echo "0" > /sys/block/loop6/queue/add_random
echo "0" > /sys/block/loop6/queue/iostats
echo "0" > /sys/block/loop7/queue/add_random
echo "0" > /sys/block/loop7/queue/iostats
echo "0" > /sys/block/loop8/queue/add_random
echo "0" > /sys/block/loop8/queue/iostats
echo "0" > /sys/block/ram0/queue/add_random
echo "0" > /sys/block/ram0/queue/iostats
echo "0" > /sys/block/ram1/queue/add_random
echo "0" > /sys/block/ram1/queue/iostats
echo "0" > /sys/block/ram2/queue/add_random
echo "0" > /sys/block/ram2/queue/iostats
echo "0" > /sys/block/ram3/queue/add_random
echo "0" > /sys/block/ram3/queue/iostats
echo "0" > /sys/block/ram4/queue/add_random
echo "0" > /sys/block/ram4/queue/iostats
echo "0" > /sys/block/ram5/queue/add_random
echo "0" > /sys/block/ram5/queue/iostats
echo "0" > /sys/block/ram6/queue/add_random
echo "0" > /sys/block/ram6/queue/iostats
echo "0" > /sys/block/ram7/queue/add_random
echo "0" > /sys/block/ram7/queue/iostats
echo "0" > /sys/block/ram8/queue/add_random
echo "0" > /sys/block/ram8/queue/iostats
echo "0" > /sys/block/ram9/queue/add_random
echo "0" > /sys/block/ram9/queue/iostats
echo "0" > /sys/block/ram10/queue/add_random
echo "0" > /sys/block/ram10/queue/iostats
echo "0" > /sys/block/ram11/queue/add_random
echo "0" > /sys/block/ram11/queue/iostats
echo "0" > /sys/block/ram12/queue/add_random
echo "0" > /sys/block/ram12/queue/iostats
echo "0" > /sys/block/ram13/queue/add_random
echo "0" > /sys/block/ram13/queue/iostats
echo "0" > /sys/block/ram14/queue/add_random
echo "0" > /sys/block/ram14/queue/iostats
echo "0" > /sys/block/ram15/queue/add_random
echo "0" > /sys/block/ram15/queue/iostats
echo "0" > /sys/block/sda/queue/add_random
echo "0" > /sys/block/sda/queue/iostats
echo "0" > /sys/block/sdb/queue/add_random
echo "0" > /sys/block/sdb/queue/iostats
echo "0" > /sys/block/sdc/queue/add_random
echo "0" > /sys/block/sdc/queue/iostats
echo "0" > /sys/block/sdd/queue/add_random
echo "0" > /sys/block/sdd/queue/iostats
echo "0" > /sys/block/sde/queue/add_random
echo "0" > /sys/block/sde/queue/iostats
echo "0" > /sys/block/sdf/queue/add_random
echo "0" > /sys/block/sdf/queue/iostats
echo "0" > /sys/block/zram0/queue/add_random
echo "0" > /sys/block/zram0/queue/iostats

# Disable GPU frequency based throttling because it is actually not even needed anymore after all the GPU related enhancements and minor changes that I've done so far;
echo "0" > /sys/class/kgsl/kgsl-3d0/throttling

# Enable a tuned Boeffla wakelock blocker at boot for both better active & idle battery life;
echo "wlan_pno_wl;wlan_ipa;wcnss_filter_lock;[timerfd];hal_bluetooth_lock;IPA_WS;sensor_ind;wlan;netmgr_wl;qcom_rx_wakelock;wlan_wow_wl;wlan_extscan_wl;"> /sys/class/misc/boeffla_wakelock_blocker/wakelock_blocker

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

# Fully disable a very few CPU based & useless EDAC loggers;
echo "0" > /sys/devices/system/edac/cpu/log_ce
echo "0" > /sys/devices/system/edac/cpu/log_ue

# A few more kernel module purges (and enhancements) for even further improved battery life & performance;
echo "0" > /sys/module/debug/parameters/enable_event_log
echo "0" > /sys/module/edac_core/parameters/edac_mc_log_ce
echo "0" > /sys/module/edac_core/parameters/edac_mc_log_ue
echo "0" > /sys/module/edac_core/parameters/edac_mc_poll_msec
echo "0" > /sys/module/glink/parameters/debug_mask
echo "N" > /sys/module/ip6_tunnel/parameters/log_ecn_error
echo "N" > /sys/module/mdss_fb/parameters/backlight_dimmer
echo "255" > /sys/module/mdss_fb/parameters/backlight_max
echo "0" > /sys/module/msm_show_resume_irq/parameters/debug_mask
echo "N" > /sys/module/otg_wakelock/parameters/enabled
echo "0" > /sys/module/service_locator/parameters/enable
echo "N" > /sys/module/sit/parameters/log_ecn_error
echo "0" > /sys/module/smp2p/parameters/debug_mask
echo "N" > /sys/module/sync/parameters/fsync_enabled
echo "0" > /sys/module/touch_core_base/parameters/debug_mask
echo "0" > /sys/module/usb_bam/parameters/enable_event_log

# Disable Gentle Fair Sleepers for a smoother UI;
echo "NO_GENTLE_FAIR_SLEEPERS" > /sys/kernel/debug/sched_features

# LMK Tweaks
echo "0" > /sys/module/lowmemorykiller/parameters/debug_level
echo "4608,10752,16896,23040,29184,35328" > /sys/module/lowmemorykiller/parameters/minfree

# Enable Fast Charge for slightly faster battery charging when being connected to a USB 3.1 port, which can be good for the people that is often on the run or have limited access to a wall socket;
echo "1" > /sys/kernel/fast_charge/force_fast_charge

# Purge a few kernel modules to absolute silence for improved battery life & performance;
echo "0" > /sys/module/binder/parameters/debug_mask
echo "Y" > /sys/module/bluetooth/parameters/disable_ertm
echo "Y" > /sys/module/bluetooth/parameters/disable_esco
echo "0" > /sys/module/debug/parameters/enable_event_log
echo "0" > /sys/module/dwc3/parameters/ep_addr_rxdbg_mask
echo "0" > /sys/module/dwc3/parameters/ep_addr_txdbg_mask
echo "0" > /sys/module/glink/parameters/debug_mask
echo "N" > /sys/module/hid_magicmouse/parameters/emulate_3button
echo "N" > /sys/module/hid_magicmouse/parameters/emulate_scroll_wheel
echo "N" > /sys/module/ip6_tunnel/parameters/log_ecn_error
echo "0" > /sys/module/kernel/parameters/panic
echo "0" > /sys/module/lowmemorykiller/parameters/debug_level
echo "Y" > /sys/module/mdss_fb/parameters/backlight_dimmer
echo "0" > /sys/module/mpm_of/parameters/debug_mask
echo "0" > /sys/module/msm_pm/parameters/debug_mask
echo "0" > /sys/module/msm_show_resume_irq/parameters/debug_mask
echo "1" > /sys/module/msm_thermal/core_control/enabled
echo "0" > /sys/module/qpnp_fg/parameters/debug_mask
echo "0" > /sys/module/qpnp_smbcharger/parameters/debug_mask
echo "N" > /sys/module/sit/parameters/log_ecn_error
echo "0" > /sys/module/smd/parameters/debug_mask
echo "0" > /sys/module/smem/parameters/debug_mask
echo "0" > /sys/module/smp2p/parameters/debug_mask
echo "N" > /sys/module/sync/parameters/fsync_enabled
echo "0" > /sys/module/usb_bam/parameters/enable_event_log

# A miscellaneous pm_async tweak that increases the amount of time (in milliseconds) before user processes & kernel threads are being frozen & "put to sleep";
echo "24000" > /sys/power/pm_freeze_timeout

#Enable audio high performance mode by default
echo "1" > /sys/module/snd_soc_wcd9330/parameters/high_perf_mode

#Default I/o sched cfq
chmod 0666 /sys/block/sda/queue/scheduler
chmod 0666 /sys/block/sdb/queue/scheduler
chmod 0666 /sys/block/sdc/queue/scheduler
chmod 0666 /sys/block/sdd/queue/scheduler
chmod 0666 /sys/block/sde/queue/scheduler
chmod 0666 /sys/block/sdf/queue/scheduler

echo "cfq" > /sys/block/sda/queue/scheduler
echo "cfq" > /sys/block/sdb/queue/scheduler
echo "cfq" > /sys/block/sdc/queue/scheduler
echo "cfq" > /sys/block/sdd/queue/scheduler
echo "cfq" > /sys/block/sde/queue/scheduler
echo "cfq" > /sys/block/sdf/queue/scheduler

# Script log file location
LOG_FILE=/storage/emulated/0/logs

export TZ=$(getprop persist.sys.timezone);
echo $(date) > /storage/emulated/0/logs/KingKernellog
if [ $? -eq 0 ]
then
  echo "Boot tweaks executed!" >> /storage/emulated/0/logs/KingKernellog
  exit 0
else
  echo "Boot tweaks failed." >> /storage/emulated/0/logs/KingKernellog
  exit 1
fi
  
# Wait..
# Done!
#
