#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
RAM=$(free -m | awk '/Mem:/ {print $3}')

echo "CPU: $CPU%"
echo "RAM: $RAM MB"
