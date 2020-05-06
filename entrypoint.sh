#!/bin/sh

echo ${ANYCONNECT_USERNAME} > /vpn.credentials
echo ${ANYCONNECT_PASSWORD} >> /vpn.credentials
echo "y" >> /vpn.credentials

# adapter error fix
cp /etc/resolv.conf /etc/resolv.conf.back
umount /etc/resolv.conf
cp /etc/resolv.conf.back /etc/resolv.conf

/opt/cisco/anyconnect/bin/vpnagentd
/opt/cisco/anyconnect/bin/vpn -s < /vpn.credentials connect ${ANYCONNECT_SERVER}

/usr/sbin/danted

# sleep 60

# while true; do
#     /opt/cisco/anyconnect/bin/vpn stats
#     sleep 3600
# done