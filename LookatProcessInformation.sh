#!/bin/bash

# Replace with your app package or process name
PROCESS_NAME="com.aarpinnovation.alcoveonquest"

# Output log file
LOG_FILE="./process_cpu_mem_log.txt"

# Duration to monitor (seconds)
DURATION=10

echo "Logging CPU and Memory usage for process '$PROCESS_NAME' for $DURATION seconds..."

# Write the column headers
echo "Timestamp,CPU_Percentage,Memory_KB" > "$LOG_FILE"

START_TIME=$(date +%s)

while [ $(($(date +%s) - $START_TIME)) -lt $DURATION ]; do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

    # Get CPU % from top -n 1, filtering the process line
    CPU=$(adb shell top -b -n 1 | grep "$PROCESS_NAME" | awk '{print $9}')

    # Get memory usage in KB from dumpsys meminfo
    MEM=$(adb shell dumpsys meminfo "$PROCESS_NAME" | grep "TOTAL" | awk '{print $2}')

    # Fallback if not found, set to N/A
    CPU=${CPU:-N/A}
    MEM=${MEM:-N/A}

    echo "$TIMESTAMP,$CPU,$MEM" >> "$LOG_FILE"

    sleep 1
done

echo "Logging completed. Results saved to $LOG_FILE"