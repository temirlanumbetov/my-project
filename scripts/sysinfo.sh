#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
RAM=$(free -m | awk '/Mem:/ {print $3}')

cat <<EOF > /var/www/html/report.html
CPU: $CPU%
RAM: $RAM MB
EOF
