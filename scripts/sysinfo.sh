#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
RAM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
RAM_USED=$(free -m | awk '/Mem:/ {print $3}')
RAM_FREE=$(free -m | awk '/Mem:/ {print $4}')

# ----------------------------
# ASCII TABLE (для Jenkins log)
# ----------------------------
echo "========================"
echo "   SYSTEM INFO REPORT"
echo "========================"
printf "| %-10s | %-10s |\n" "CPU" "$CPU%"
printf "| %-10s | %-10s |\n" "RAM USED" "${RAM_USED}MB"
printf "| %-10s | %-10s |\n" "RAM FREE" "${RAM_FREE}MB"
printf "| %-10s | %-10s |\n" "RAM TOTAL" "${RAM_TOTAL}MB"
echo "========================"

# ----------------------------
# HTML REPORT
# ----------------------------
REPORT="/var/lib/jenkins/workspace/pipeline/report.html"

cat <<EOF > $REPORT
<html>
<head>
    <title>System Report</title>
</head>
<body>
    <h2>System Report</h2>
    <table border="1" cellpadding="8">
        <tr><th>Metric</th><th>Value</th></tr>
        <tr><td>CPU</td><td>${CPU}%</td></tr>
        <tr><td>RAM Used</td><td>${RAM_USED} MB</td></tr>
        <tr><td>RAM Free</td><td>${RAM_FREE} MB</td></tr>
        <tr><td>RAM Total</td><td>${RAM_TOTAL} MB</td></tr>
    </table>
</body>
</html>
EOF

echo "Report generated: $REPORT"
