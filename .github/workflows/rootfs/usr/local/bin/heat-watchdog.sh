#!/bin/bash
#
# heat-watchdog.sh
# Monitors Pi temperature and reboots if it exceeds 75°C.
#

# Log file
LOGFILE="/var/log/heat-watchdog.log"

# Temperature threshold (°C)
THRESHOLD=75

# Infinite loop
while true; do
  # Read the raw temp (in millidegrees)
  if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    RAW=$(cat /sys/class/thermal/thermal_zone0/temp)
    TEMP=$(( RAW / 1000 ))
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] Temp sensor not found." | tee -a "$LOGFILE"
    exit 1
  fi

  # Log current temp
  echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] Current temperature: ${TEMP}°C" | tee -a "$LOGFILE"

  # Check threshold
  if [ "$TEMP" -ge "$THRESHOLD" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') [WARN] Temperature ${TEMP}°C ≥ ${THRESHOLD}°C. Rebooting!" | tee -a "$LOGFILE"
    sync
    /sbin/reboot
    exit 0
  fi

  # Sleep before next check
  sleep 15
done
