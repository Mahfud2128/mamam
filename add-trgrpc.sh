NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
clear
domain=$(cat /etc/v2ray/domain)
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "                  ${WB}Add Trojan Account${NC}                "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -rp "User: " -e user
user_EXISTS=$(grep -w $user /etc/xray/trojangrpc.json | wc -l)
if [[ ${user_EXISTS} == '1' ]]; then
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "                  ${WB}Add Trojan Account${NC}                "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "${YB}A client with the specified name was already created, please choose another name.${NC}"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
add-trgrpc
fi
done
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xtrgrpc$/a\### '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/trojangrpc.json
trojanlink1="trojan://$user@$domain:443?path=/trojan-ws&security=tls&host=$domain&type=ws&sni=$domain#$user"
cat > /var/www/html/trojan/trojan-$user.txt << END
==========================
Trojan WS (CDN) TLS
==========================
- name: Trojan-$user
server: $domain
port: 443
type: trojan
password: $user
network: ws
sni: $domain
skip-cert-verify: true
udp: true
ws-opts:
path: /trojan-ws
headers:
Host: $domain
==========================
Link TLS  : trojan://$uuid@$domain:443?path=/trojan-ws&security=tls&host=$domain&type=ws&sni=$domain#$user
==========================
END
clear
echo -e "————————————————————————————————————————————————————" 
echo -e "Link TLS      : ${trojanlink1}" 
echo -e "————————————————————————————————————————————————————" 
read -n 1 -s -r -p "Press any key to back on menu"
clear
systemctl restart trgrpc
trojan

