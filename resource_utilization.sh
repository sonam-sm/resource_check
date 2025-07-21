# Check CPU utilization
echo "CPU utilization"
mpstat 1 1 | awk 'NR==4 {print "Average CPU Usage: " 100-$NF "%"}'

# Check Memory utilization
echo "=================================="
echo "Memory utilization"
free -m | awk 'NR==2 {printf "Used Memory: %s MB (%.2f%%)\n", $3, ($3/$2)*100}'

# Check Disk utilization
echo "=================================="
echo "Disk utilization"
df -h | awk 'NR>1 {printf "%s\t%s\t%s\t%s\t%s\t%s\n", $1, $2, $3, $4, $5, $6}'
# Check Top 5 processes by CPU usage
echo "==================================" >> system_status.txt
echo "Top 5 Processes bt CPU Usage:" >> system_status.txt
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6
echo "=================================="
