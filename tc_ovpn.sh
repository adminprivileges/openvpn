#!/bin/bash
echo "Updating Your Machine"
apt update -y && apt upgrade -y &> /dev/null
echo "Finding your Public IP" 
PUB_IP=`curl -q ifconfig.me`
echo $PUB_IP > ./pub_ip.var
echo "Your Public IP is: $PUB_IP  Please take note of this."
curl https://git.io/vpn -o ./openvpn-install.sh &> /dev/null
chmod +x ./openvpn-install.sh
./openvpn-install.sh
#Starting and Enabling ovpn service 
sudo systemctl start openvpn-server@server
sudo systemctl enable openvpn-server@server

