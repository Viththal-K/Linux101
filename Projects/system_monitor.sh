#!/bin/bash

# Set threshold values
cpu_threshold=70
mem_threshold=80
disk_threshold=75
To="your_email@gmail.com"

while true
do
    # Get current resource usage
    cpu_usage=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    
    mem_usage=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')
    
    disk_usage=$(df -h | awk '$NF=="/"{printf "%s", $5}' | cut -d'%' -f1)
    
    echo $cpu_usage
    echo $mem_usage
    echo $disk_usage

    # Check if resource usage exceeds threshold
    if (( $(echo "$cpu_usage > $cpu_threshold" | bc -l) ))
    then
        echo "Your CPU usage is above $cpu_threshold%" | mail -s "Alert: CPU Usage" $To
    fi

    if (( $(echo "$mem_usage > $mem_threshold" | bc -l) ))
    then
        echo "Your Memory usage is above $mem_threshold%" | mail -s "Alert: Memory usage" $To
    fi

    if (( $disk_usage > $disk_threshold ))
    then
        echo "Your Disk usage is above $disk_threshold%" | mail -s "Alert: Disk usage" $To
    fi

    # Wait for 30 minutes before checking again
    sleep 30m
done
