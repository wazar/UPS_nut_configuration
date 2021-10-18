#!/bin/bash
clear
while true; do
cpu=$(</sys/class/thermal/thermal_zone0/temp)
freq=$(sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq)
echo "$(date) @ $(hostname)"
echo "-------------------------------------------"
echo "CPU => $((cpu/1000))'C"
uptime  | grep -oP '(?<=average:).*'
echo "Freq => $((freq/1000))Mhz"
echo "GPU => $(vcgencmd measure_temp)"
upsc ups 2>&1 | grep -v '^Init SSL'
#upsc ups | grep "battery.charge:"
#upsc ups | grep "battery.charge.low"
#upsc ups | grep "battery.voltage"
#upsc ups | grep "input.voltage"
#upsc ups | grep "ups.beeper.status"
sleep 2
clear
done
