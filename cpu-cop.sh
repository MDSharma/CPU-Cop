#!/bin/bash

# Define a threshold for high CPU usage (in percentage)
THRESHOLD=80

# Define a file to store the list of regular abusers
ABUSERS_FILE="abusers.txt"

# Loop through the output of the top command
top -b -n 1 | tail -n +8 | while read line; do
  # Extract the user, PID and CPU columns
  user=$(echo $line | awk '{print $2}')
  pid=$(echo $line | awk '{print $1}')
  cpu=$(echo $line | awk '{print $9}')

  # Check if the CPU usage is greater than the threshold
  if (( $(echo "$cpu > $THRESHOLD" | bc -l) )); then
    # Check if the user is already in the abusers list
    if grep -q "$user" "$ABUSERS_FILE"; then
      # Kill the process and log the action
      kill -9 $pid
      echo "Killed process $pid of user $user for high CPU usage ($cpu%)"
    else
      # Add the user to the abusers list and log the action
      echo "$user" >> "$ABUSERS_FILE"
      echo "Added user $user to the abusers list for high CPU usage ($cpu%)"
    fi
  fi
done
