#!/bin/bash
os=$(uname -o)
hostname=$(hostname)
ip=$(ifconfig | awk '/inet .*broadcast/{print $2}')
public_ip=$(curl -s icanhazip.com)
ram=$(free -h | awk '/Mem:/ {print $2}')
storage=$(df -h | awk '/\/$/ {print $2}')
used=$(df -h | awk '/\/$/ {print $3}')
available=$(df -h | awk '/\/$/ {print $4}')

echo "<html>
<head>
<title>System Resources</title>
</head>
<body>
<h1>Operating System: $os</h1>
<h1>Hostname: $hostname</h1>
<h1>Local IP: $ip</h1>
<h1>Public IP: $public_ip</h1>
<h1>RAM: $ram</h1>
<h1>Storage: $storage</h1>
<h1>Used Space: $used</h1>
<h1>Available Space: $available</h1>
</body>
</html>"

