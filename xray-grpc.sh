#!/bin/bash
# XRay Installation
# SL Script
# ==================================
MYIP=$(wget -qO- ipinfo.io/ip);
clear
domain=$(cat /etc/xray/domain)
apt install iptables iptables-persistent -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y
ntpdate pool.ntp.org
apt -y install chrony
timedatectl set-ntp true
systemctl enable chronyd && systemctl restart chronyd
systemctl enable chrony && systemctl restart chrony
timedatectl set-timezone Asia/Jakarta
chronyc sourcestats -v
chronyc tracking -v
date

# / / Ambil Xray Core Version Terbaru
latest_version="$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"

# / / Installation Xray Core
xraycore_link="https://github.com/XTLS/Xray-core/releases/download/v$latest_version/xray-linux-64.zip"

# 
uuid=$(cat /proc/sys/kernel/random/uuid)

# / / Make Main Directory
mkdir -p /usr/bin/xray
mkdir -p /etc/xray

# / / Unzip Xray Linux 64
cd `mktemp -d`
curl -sL "$xraycore_link" -o xray.zip
unzip -q xray.zip && rm -rf xray.zip
mv xray /usr/local/bin/xray
chmod +x /usr/local/bin/xray

# Make Folder XRay
mkdir -p /var/log/xray/
#
wget -q -O /usr/local/bin/geosite.dat "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/grpc/geosite.dat"
wget -q -O /usr/local/bin/geoip.dat "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/grpc/geoip.dat"

#
cat > /etc/xray/trojangrpc.json << END
{
    "log": {
            "access": "/var/log/xray/access5.log",
        "error": "/var/log/xray/error.log",
        "loglevel": "info"
    },
    "inbounds": [
        {
            "port": 44,
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "password": "${uuid}"
#xtrgrpc
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "gun",
                "security": "tls",
                "tlsSettings": {
                    "serverName": "$domain",
                    "alpn": [
                        "h2"
                    ],
                    "certificates": [
                        {
                            "certificateFile": "/etc/v2ray/v2ray.crt",
                            "keyFile": "/etc/v2ray/v2ray.key"
                        }
                    ]
                },
                "grpcSettings": {
                    "serviceName": "GunService"
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom",
            "tag": "direct"
        }
    ]
}
END

cat > /etc/xray/akuntrgrpc.conf << EOF
#xray-trojangrpc user
EOF



cat > /etc/systemd/system/trgrpc.service << EOF
[Unit]
Description=XRay Trojan Grpc Service
Documentation=https://speedtest.net https://github.com/XTLS/Xray-core
After=network.target nss-lookup.target
[Service]
User=root
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray -config /etc/xray/trojangrpc.json
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000
Restart=on-failure
[Install]
WantedBy=multi-user.target
EOF

iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 3380 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 3380 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 4480 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 4480 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
systemctl daemon-reload
systemctl enable vmess-grpc
systemctl restart vmess-grpc
systemctl enable vless-grpc
systemctl restart vless-grpc
systemctl enable trgrpc.service
systemctl start trgrpc.service
systemctl restart xray.service
#
cd /usr/bin
wget -O addgrpc "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/grpc/addgrpc.sh"
wget -O delgrpc "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/grpc/delgrpc.sh"
wget -O renewgrpc "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/grpc/renewgrpc.sh"
wget -O cekgrpc "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/grpc/cekgrpc.sh"
#trojan
wget -O addtrgrpc "https://raw.githubusercontent.com/Denisuprapto/scriptws/main/grcp/addtrgrpc.sh"
wget -O deltrgrpc "https://raw.githubusercontent.com/Denisuprapto/scriptws/main/grcp/deltrgrpc.sh"
wget -O cektrgrpc "https://raw.githubusercontent.com/Denisuprapto/scriptws/main/grcp/cektrgrpc.sh"
wget -O renewtrgrpc "https://raw.githubusercontent.com/Denisuprapto/scriptws/main/grcp/renewtrgrpc.sh"


chmod +x addgrpc
chmod +x delgrpc
chmod +x renewgrpc
chmod +x cekgrpc

chmod +x addtrgrpc
chmod +x deltrgrpc
chmod +x cektrgrpc
chmod +x renewtrgrpc

rm -f xray-grpc.sh
