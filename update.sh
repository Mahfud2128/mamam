#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/Mahfud2128/access/main/ipvps > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Mahfud2128/access/main/ipvps | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/Mahfud2128/access/main/ipvps | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
clear
echo "Starting Update ..." | lolcat
echo ""
# update
apt install boxes
wget -O /root/.profile "https://raw.githubusercontent.com/Mahfud2128/mamam/main/profile.sh"
wget -O /root/.config/idtele "https://raw.githubusercontent.com/Mahfud2128/mamam/main/idtele.sh"
cd /usr/bin

wget -O port-grpc "https://raw.githubusercontent.com/Mahfud2128/mamam/main/port-grpc.sh"
wget -O cekgprc "https://raw.githubusercontent.com/Mahfud2128/mamam/main/cekgrpc.sh"
wget -O vgrpc "https://raw.githubusercontent.com/Mahfud2128/mamam/main/vgrpc.sh"
wget -O addgrpc "https://raw.githubusercontent.com/Mahfud2128/mamam/main/addgrpc.sh"
wget -O menu "https://raw.githubusercontent.com/Mahfud2128/mamam/main/menu.sh"
wget -O l2tp "https://raw.githubusercontent.com/Mahfud2128/mamam/main/l2tp.sh"
wget -O ssh "https://raw.githubusercontent.com/Mahfud2128/mamam/main/ssh.sh"
wget -O ssssr "https://raw.githubusercontent.com/Mahfud2128/mamam/main/ssssr.sh"
wget -O sstpp "https://raw.githubusercontent.com/Mahfud2128/mamam/main/sstpp.sh"
wget -O trojaan "https://raw.githubusercontent.com/Mahfud2128/mamam/main/trojaan.sh"
wget -O trojanGO "https://raw.githubusercontent.com/Mahfud2128/mamam/main/trojanGO.sh"
wget -O v2raay "https://raw.githubusercontent.com/Mahfud2128/mamam/main/v2raay.sh"
wget -O wgr "https://raw.githubusercontent.com/Mahfud2128/mamam/main/wgr.sh"
wget -O vleess "https://raw.githubusercontent.com/Mahfud2128/mamam/main/vleess.sh"
wget -O bbr "https://raw.githubusercontent.com/Mahfud2128/mamam/main/bbr.sh"
wget -O bannerku "https://raw.githubusercontent.com/Mahfud2128/mamam/main/bannerku"
wget -O add-host "https://raw.githubusercontent.com/Mahfud2128/mamam/main/add-host.sh"
wget -O about "https://raw.githubusercontent.com/Mahfud2128/mamam/main/about.sh"
wget -O usernew "https://raw.githubusercontent.com/Mahfud2128/mamam/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Mahfud2128/mamam/main/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/Mahfud2128/mamam/main/hapus.sh"
wget -O member "https://raw.githubusercontent.com/Mahfud2128/mamam/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/Mahfud2128/mamam/main/delete.sh"
wget -O cek "https://raw.githubusercontent.com/Mahfud2128/mamam/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/Mahfud2128/mamam/main/restart.sh"
wget -O speedtest "https://raw.githubusercontent.com/Mahfud2128/mamam/main/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/Mahfud2128/mamam/main/log.sh"
wget -O ram "https://raw.githubusercontent.com/Mahfud2128/mamam/main/ram.sh"
wget -O renew "https://raw.githubusercontent.com/Mahfud2128/mamam/main/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/Mahfud2128/mamam/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/Mahfud2128/mamam/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/Mahfud2128/mamam/main/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/Mahfud2128/mamam/main/clear-log.sh"
wget -O change-port "https://raw.githubusercontent.com/Mahfud2128/mamam/main/change-port.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/Mahfud2128/mamam/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/Mahfud2128/mamam/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/Mahfud2128/mamam/main/ipvps"
wget -O port-tr "https://raw.githubusercontent.com/Mahfud2128/mamam/main/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/Mahfud2128/mamam/main/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/Mahfud2128/mamam/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/Mahfud2128/mamam/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/Mahfud2128/mamam/main/port-vless.sh"
wget -O wbmn "https://raw.githubusercontent.com/Mahfud2128/mamam/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/Mahfud2128/mamam/main/xp.sh"
wget -O swap "https://raw.githubusercontent.com/Mahfud2128/mamam/main/swapkvm.sh"
wget -O user-limit "https://raw.githubusercontent.com/Mahfud2128/mamam/main/user-limit.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/Mahfud2128/mamam/main/auto-reboot.sh"
wget -O running "https://raw.githubusercontent.com/Mahfud2128/mamam/main/running.sh"
wget -O update "https://raw.githubusercontent.com/Mahfud2128/mamam/main/update.sh"
wget -O add-trgo "https://raw.githubusercontent.com/Mahfud2128/mamam/main/add-trgo.sh"
wget -O xp-trgo "https://raw.githubusercontent.com/Mahfud2128/mamam/main/xp-trgo.sh"
wget -O cek-trgo "https://raw.githubusercontent.com/Mahfud2128/mamam/main/cek-trgo.sh"
wget -O renew-trgo "https://raw.githubusercontent.com/Mahfud2128/mamam/main/renew-trgo.sh"
wget -O port-trgo "https://raw.githubusercontent.com/Mahfud2128/mamam/main/port-trgo.sh"
wget -O del-trgo "https://raw.githubusercontent.com/Mahfud2128/mamam/main/update/del-trgo"
wget -O add-ws "https://raw.githubusercontent.com/Mahfud2128/mamam/main/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/Mahfud2128/mamam/main/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/Mahfud2128/mamam/main/add-tr.sh"
wget -O del-ws "https://raw.githubusercontent.com/Mahfud2128/mamam/main/del-ws.sh"
wget -O del-vless "https://raw.githubusercontent.com/Mahfud2128/mamam/main/del-vless.sh"
wget -O del-tr "https://raw.githubusercontent.com/Mahfud2128/mamam/main/del-tr.sh"
wget -O cek-ws "https://raw.githubusercontent.com/Mahfud2128/mamam/main/cek-ws.sh"
wget -O cek-vless "https://raw.githubusercontent.com/Mahfud2128/mamam/main/cek-vless.sh"
wget -O cek-tr "https://raw.githubusercontent.com/Mahfud2128/mamam/main/cek-tr.sh"
wget -O renew-ws "https://raw.githubusercontent.com/Mahfud2128/mamam/main/renew-ws.sh"
wget -O renew-vless "https://raw.githubusercontent.com/Mahfud2128/mamam/main/renew-vless.sh"
wget -O renew-tr "https://raw.githubusercontent.com/Mahfud2128/mamam/main/renew-tr.sh"
wget -O add-l2tp "https://raw.githubusercontent.com/Mahfud2128/mamam/main/add-l2tp.sh"
wget -O del-l2tp "https://raw.githubusercontent.com/Mahfud2128/mamam/main/del-l2tp.sh"
wget -O add-pptp "https://raw.githubusercontent.com/Mahfud2128/mamam/main/add-pptp.sh"
wget -O del-pptp "https://raw.githubusercontent.com/Mahfud2128/mamam/main/del-pptp.sh"
wget -O cek-pptp "https://raw.githubusercontent.com/Mahfud2128/mamam/main/cek-pptp.sh"
wget -O renew-pptp "https://raw.githubusercontent.com/Mahfud2128/mamam/main/renew-pptp.sh"
wget -O renew-l2tp "https://raw.githubusercontent.com/Mahfud2128/mamam/main/renew-l2tp.sh"
wget -O add-ss "https://raw.githubusercontent.com/Mahfud2128/mamam/main/add-ss.sh"
wget -O del-ss "https://raw.githubusercontent.com/Mahfud2128/mamam/main/del-ss.sh"
wget -O cek-ss "https://raw.githubusercontent.com/Mahfud2128/mamam/main/cek-ss.sh"
wget -O renew-ss "https://raw.githubusercontent.com/Mahfud2128/mamam/main/renew-ss.sh"
wget -O add-ssr "https://raw.githubusercontent.com/Mahfud2128/mamam/main/add-ssr.sh"
wget -O del-ssr "https://raw.githubusercontent.com/Mahfud2128/mamam/main/del-ssr.sh"
wget -O renew-ssr "https://raw.githubusercontent.com/Mahfud2128/mamam/main/renew-ssr.sh"
wget -O add-wg "https://raw.githubusercontent.com/Mahfud2128/mamam/main/add-wg.sh"
wget -O del-wg "https://raw.githubusercontent.com/Mahfud2128/mamam/main/del-wg.sh"
wget -O cek-wg "https://raw.githubusercontent.com/Mahfud2128/mamam/main/cek-wg.sh"
wget -O renew-wg "https://raw.githubusercontent.com/Mahfud2128/mamam/main/renew-wg.sh"
wget -O bw "https://raw.githubusercontent.com/Mahfud2128/mamam/main/bw.sh"
wget -O panel-domain "https://raw.githubusercontent.com/Mahfud2128/mamam/main/panel-domain.sh"
wget -O resett "https://raw.githubusercontent.com/Mahfud2128/mamam/main/resett.sh"
wget -O backupbot "https://raw.githubusercontent.com/Mahfud2128/mamam/main/backupbot.sh"
wget -O set-backupbot "https://raw.githubusercontent.com/Mahfud2128/mamam/main/set-backupbot.sh"
wget -O del-trgo "https://raw.githubusercontent.com/Mahfud2128/mamam/main/del-trgo.sh"
wget -O log-ws "https://raw.githubusercontent.com/Mahfud2128/mamam/main/p-ws.sh"

chmod +x /root/.config/idtele
chmod +x /root/.profile
chmod +x log-ws
chmod +x backupbot
chmod +x set-backupbot
chmod +x menu
chmod +x l2tp
chmod +x ssh
chmod +x ssssr
chmod +x sstpp
chmod +x trojaan
chmod +x trojanGO
chmod +x v2raay
chmod +x wgr
chmod +x vleess
chmod +x bbr
chmod +x bannerku
chmod +x add-host
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x clear-log
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x swap
chmod +x auto-reboot
chmod +x running
chmod +x update
chmod +x cfd
chmod +x cff
chmod +x cfh
chmod +x add-trgo
chmod +x xp-trgo
chmod +x cek-trgo
chmod +x renew-trgo
chmod +x port-trgo
chmod +x del-trgo
chmod +x add-ws
chmod +x add-vless
chmod +x add-tr
chmod +x del-ws
chmod +x del-vless
chmod +x del-tr
chmod +x cek-ws
chmod +x cek-vless
chmod +x cek-tr
chmod +x renew-ws
chmod +x renew-vless
chmod +x renew-tr
chmod +x add-l2tp
chmod +x del-l2tp
chmod +x add-pptp
chmod +x del-pptp
chmod +x cek-pptp
chmod +x renew-pptp
chmod +x renew-l2tp
chmod +x add-ss
chmod +x del-ss
chmod +x cek-ss
chmod +x renew-ss
chmod +x add-ssr
chmod +x del-ssr
chmod +x renew-ssr
chmod +x add-wg
chmod +x del-wg
chmod +x cek-wg
chmod +x renew-wg
chmod +x bw
chmod +x panel-domain
chmod +x resett
chmod +x vgrpc
chmod +x addgrpc
chmod +x cekgrpc
chmod +x port-grpc
chmod +x del-trgo
sed -i -e 's/\r$//' add-l2tp
clear

echo " Successfully Update :" | lolcat
echo " - Fix minor Bugs" | lolcat
sleep 2
rm -f update.sh
rm -f /usr/bin/update
