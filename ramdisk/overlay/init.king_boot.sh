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

#change default gov to schedutil
#cpu0
echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#cpu1
echo "schedutil" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
#cpu2
echo "schedutil" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
#cpu3
echo "schedutil" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor

# Optimize and lower both the battery drain and overall power consumption that is caused by the Schedutil governor by biasing it to use slightly lower frequency steps, but do this without sacrificing performance or overall UI fluidity. See this as a balanced in-kernel power save mode, but without any notable traces of the "semi-typical" smoothness regressions;

# Cpu 0;
echo "18500" > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/down_rate_limit_us
echo "775" > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/up_rate_limit_us

# Cpu 1;
echo "18500" > /sys/devices/system/cpu/cpu1/cpufreq/schedutil/down_rate_limit_us
echo "775" > /sys/devices/system/cpu/cpu1/cpufreq/schedutil/up_rate_limit_us

# Cpu 2;
echo "18500" > /sys/devices/system/cpu/cpu2/cpufreq/schedutil/down_rate_limit_us
echo "775" > /sys/devices/system/cpu/cpu2/cpufreq/schedutil/up_rate_limit_us

# Cpu 3;
echo "18500" > /sys/devices/system/cpu/cpu3/cpufreq/schedutil/down_rate_limit_us
echo "775" > /sys/devices/system/cpu/cpu3/cpufreq/schedutil/up_rate_limit_us
