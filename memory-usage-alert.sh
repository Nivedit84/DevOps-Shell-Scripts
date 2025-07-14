#!/bin/bash

# Default threshold
Trigger=80

# Get current memory usage percentage (excluding buffers/cache)
USAGE=$(free | awk '/Mem:/ {printf("%.0f"), ($3/$2)*100}')

echo "Current memory usage: $USAGE%"

if [ "$USAGE" -ge "$Trigger" ]; then
    echo "Warning: Memory usage is above ${THRESHOLD}%!"
else
    echo "Memory usage is within safe limits."
fi
