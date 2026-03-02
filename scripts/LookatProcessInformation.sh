#!/bin/bash
#
# LookatProcessInformation.sh - Resource Usage Monitor for VR Applications
#
# This script monitors CPU and memory usage of a specified VR application
# running on a connected Meta Quest device. Data is logged to a CSV file
# for performance analysis and overhead measurement.
#
# Purpose:
#   Measure the performance impact of Frida instrumentation by comparing
#   resource usage before (ORIGINAL) and after (INJECTED) injection.
#
# Output Format (CSV):
#   Timestamp, DeviceID, PackageName, CPU_Usage(%), Memory_Usage_PSS(KB)
#
# Prerequisites:
#   - ADB (Android Debug Bridge) installed and in PATH
#   - Meta Quest device connected via USB with developer mode enabled
#   - Target application must be running on the device
#
# Usage:
#   1. Edit the configuration variables below
#   2. Run: ./LookatProcessInformation.sh
#   3. Press Ctrl+C to stop logging early
#
# Author: AYBU VR Security Research Team
#

# ============================================================================
# CONFIGURATION - Edit these variables before running
# ============================================================================

# Seconds between each log entry (sampling interval)
LOG_INTERVAL=2

# Output CSV filename - use naming convention:
#   USAGE_ORIGINAL_<appname>.csv  - for baseline measurements
#   USAGE_INJECTED_<appname>.csv  - for instrumented measurements
OUTPUT_FILE="USAGE_ORIGINAL_vandettaForever.csv"

# Package name of the VR application to monitor
# Find with: adb shell pm list packages | grep <appname>
APP_PACKAGE="com.MeatSpace.Nakatomi"

# Device serial number (from 'adb devices' output)
SELECTED_DEVICE="1WMHHA4CHY2136"

# Total duration for logging in seconds (0 = continuous until Ctrl+C)
LOG_DURATION_SECONDS=10

# ============================================================================
# HELPER FUNCTIONS
# ============================================================================

# Returns current timestamp in YYYY-MM-DD HH:MM:SS format
get_timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

# ============================================================================
# MAIN SCRIPT
# ============================================================================

echo "🔍 Searching for connected Android devices..."
DEVICES=$(adb devices | grep -w "device" | awk '{print $1}')

if [ -z "$DEVICES" ]; then
  echo "❌ No Android devices found. Please connect a device and enable USB debugging."
  exit 1
fi


if [ -z "$APP_PACKAGE" ]; then
  echo "❌ Application package name cannot be empty."
  exit 1
fi

# Validate LOG_DURATION_SECONDS
if ! [[ "$LOG_DURATION_SECONDS" =~ ^[0-9]+$ ]]; then
  echo "❌ Invalid duration. Please enter a non-negative integer."
  exit 1
fi

echo ""
echo "🚀 Starting logging for '$APP_PACKAGE' on device '$SELECTED_DEVICE'..."
echo "🕒 Logging interval: $LOG_INTERVAL seconds"
if [ "$LOG_DURATION_SECONDS" -ne 0 ]; then
  echo "⏱️ Logging duration: $LOG_DURATION_SECONDS seconds"
else
  echo "⏱️ Logging duration: Continuous (until Ctrl+C)"
fi
echo "💾 Output file: $OUTPUT_FILE"
echo "Press Ctrl+C to stop logging manually."
echo ""

# --- Initialize Log File ---
echo "Timestamp,DeviceID,PackageName,CPU_Usage (%),Memory_Usage_PSS (KB)" > "$OUTPUT_FILE"

log_count=0
start_time=$(date +%s) # Get current time in seconds since epoch

# --- Logging Loop ---
while true; do
  current_time=$(date +%s)
  elapsed_time=$((current_time - start_time))

  if [ "$LOG_DURATION_SECONDS" -ne 0 ] && [ "$elapsed_time" -ge "$LOG_DURATION_SECONDS" ]; then
    echo ""
    echo "🏁 Logging duration ($LOG_DURATION_SECONDS seconds) reached."
    break
  fi

  TIMESTAMP=$(get_timestamp)

  # Get CPU Usage
  CPU_USAGE_RAW=$(adb -s "$SELECTED_DEVICE" shell top -n 1 -b | grep "$APP_PACKAGE")
  CPU_USAGE=$(echo "$CPU_USAGE_RAW" | awk '{s=0; for(i=1;i<=NF;i++) if ($i ~ /%/) {split($i,a,"%"); s+=a[1];}} END {if (s>0) print s; else print "N/A"}')
  # Fallback for older top versions (often 9th column if a single process line)
  if [[ "$CPU_USAGE" == "N/A" && -n "$CPU_USAGE_RAW" ]]; then
      CPU_USAGE=$(echo "$CPU_USAGE_RAW" | head -n 1 | awk '{print $9}') # Try 9th column of the first matching line
      if ! [[ "$CPU_USAGE" =~ ^[0-9]+([.][0-9]+)?$ ]]; then # Validate if it's a number
          CPU_USAGE="N/A"
      fi
  fi
  if [ -z "$CPU_USAGE_RAW" ]; then # If grep returns nothing
    CPU_USAGE="N/A (App not running or no CPU data)"
  elif [[ "$CPU_USAGE" == "N/A" ]]; then
     CPU_USAGE="N/A (Could not parse CPU%)"
  fi


  # Get Memory Usage (PSS - Proportional Set Size)
  MEM_INFO=$(adb -s "$SELECTED_DEVICE" shell dumpsys meminfo "$APP_PACKAGE")
  MEM_PSS=$(echo "$MEM_INFO" | grep -E "^\s*TOTAL\s+[0-9]+" | awk '{print $2}') # PSS is usually the second field for TOTAL

  if [ -z "$MEM_PSS" ]; then
      # Fallback if TOTAL PSS is not found or app is not running
      # Try to sum Native and Dalvik/ART Heap PSS values.
      NATIVE_PSS=$(echo "$MEM_INFO" | grep "Native Heap " | awk '{print $3}')
      DALVIK_PSS=$(echo "$MEM_INFO" | grep -E "(Dalvik|ART) Heap " | awk '{print $3}')

      if [[ "$NATIVE_PSS" =~ ^[0-9]+$ ]] && [[ "$DALVIK_PSS" =~ ^[0-9]+$ ]]; then
          MEM_PSS=$((NATIVE_PSS + DALVIK_PSS))
      elif [[ "$NATIVE_PSS" =~ ^[0-9]+$ ]]; then
          MEM_PSS=$NATIVE_PSS
      elif [[ "$DALVIK_PSS" =~ ^[0-9]+$ ]]; then
          MEM_PSS=$DALVIK_PSS
      else
          MEM_PSS="N/A (App not running or no mem data)"
      fi
  fi


  # Log to console
  echo "[$TIMESTAMP] CPU: $CPU_USAGE%, Memory (PSS): $MEM_PSS KB (Elapsed: ${elapsed_time}s)"

  # Log to file
  echo "$TIMESTAMP,$SELECTED_DEVICE,$APP_PACKAGE,$CPU_USAGE,$MEM_PSS" >> "$OUTPUT_FILE"

  log_count=$((log_count + 1))

  # Check if it's the last iteration before sleep to avoid overshooting duration
  if [ "$LOG_DURATION_SECONDS" -ne 0 ]; then
    next_log_time=$((elapsed_time + LOG_INTERVAL))
    if [ "$next_log_time" -gt "$LOG_DURATION_SECONDS" ]; then
        # If the next log would exceed duration, sleep only for the remaining time
        remaining_sleep=$((LOG_DURATION_SECONDS - elapsed_time))
        if [ "$remaining_sleep" -gt 0 ]; then
            sleep "$remaining_sleep"
        fi
        continue # Re-check duration condition at the start of the loop
    fi
  fi

  sleep "$LOG_INTERVAL"
done

echo "✅ Logging stopped. Data saved to $OUTPUT_FILE"
exit 0