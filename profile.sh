# ~/.profile: executed by Bourne-compatible login shells.

if [ "/bin/bash" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
MYIP=$(curl -s ipv4.icanhazip.com)
exp=$(curl -s https://raw.githubusercontent.com/Mahfud2128/access/main/ipvps | grep $MYIP | awk '{print$3}')
limit=$(curl -s https://raw.githubusercontent.com/Mahfud2128/access/main/ipvps | grep $MYIP | awk '{print$5}')
dmon=$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')
name=$(curl -s https://raw.githubusercontent.com/Mahfud2128/access/main/ipvps | grep $MYIP | awk '{print$2}')
pesan=$(curl -s https://raw.githubusercontent.com/Mahfud2128/access/main/ipvps | grep $MYIP | awk '{ print $6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20 }' )
screen -r setup
clear
neofetch
echo -e "Welcome To Autscript \"GDStore\"\n► Name: $name""\n► Exp Script: $exp""\n► Batas Bandwidth: $limit""\n► Bandwitch Saat ini: $dmon""\n► Pesan: $pesan""\nKetik Menu Untuk Melihat Daftar Perintah" | boxes -d cat | lolcat
