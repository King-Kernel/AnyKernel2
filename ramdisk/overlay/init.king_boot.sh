#!/system/bin/sh
#(c)kingbri KingKernel on boot tweaks

# Trim selected partitions at boot for a more than well-deserved and nice speed boost;
fstrim /data;
fstrim /cache;
fstrim /system;

#sleep for a second because stupid rom tweaks can be executed
sleep 2;

#Force enable cpu3
echo "1" > /sys/devices/system/cpu/cpu3/online

#Enable core control & msm_thermal for lesser cpu usage
echo "1" > /sys/module/msm_thermal/core_control/enabled
echo "Y" > /sys/module/msm_thermal/parameters/enabled
