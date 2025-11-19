#!/bin/bash
# Purpose: Log CPU and memory usage to a file at regular intervals
# Author: Anveshna
# Date: 18 November 2025
# Usage: ./monitor_cpu_mem.sh interval_in_seconds output_file

interval=$1
output_file=$2

echo "Timestamps, CPU_Usage(%), Memory_Usage(%)" > "$output_file"

while true; do
    timestamp=$(date +%Y-%m-%d\ %H:%M:%S)
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "$timestamp, $cpu_usage, $mem_usage" >> "$output_file"
    sleep "$interval"
done
