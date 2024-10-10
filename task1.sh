#!/bin/bash

# Check if the process name or PID is passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <process_name_or_PID>"
  exit 1
fi

# Try to get the process ID (PID) if a process name is provided
if [[ "$1" =~ ^[0-9]+$ ]]; then
  PID="$1"
else
  # Search for the process, considering both 'bash' and 'infinite.sh'
  PID=$(ps aux | grep "[b]ash $1" | awk '{print $2}')
fi

# Check if the process is running
if [ -z "$PID" ]; then
  echo "No matching process found."
  exit 1
fi

# Kill the process
kill -9 "$PID"

# Confirm if the process was killed
if [ $? -eq 0 ]; then
  echo "Process $PID killed successfully."
else
  echo "Failed to kill process $PID."
fi
