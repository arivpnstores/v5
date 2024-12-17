#!/bin/bash

# Path folder root yang diinginkan
root_folder="/root/backup"

# Membuat folder jika belum ada
if [ ! -d "$root_folder" ]; then
    mkdir -p "$root_folder"
else
    echo "Folder $root_folder Already available."
fi

# Mengekstrak file ZIP di dalam root folder
if [ -n "$(ls -A "$root_folder"/*.zip 2>/dev/null)" ]; then
    for zip_file in "$root_folder"/*.zip; do
        unzip "$zip_file" -d "$root_folder"
        echo "File ZIP $zip_file berhasil diekstrak."
    done
else
    echo " There Is No Zip File In The Folder $root_folder."
fi

# Menjalankan operasi restore
cd /root/backup

# Menyalin file ke lokasi tujuan mereka
cp -f passwd /etc/ >/dev/null 2>&1
cp -f group /etc/ >/dev/null 2>&1
cp -f shadow /etc/ >/dev/null 2>&1
cp -f gshadow /etc/ >/dev/null 2>&1
cp -f xray /etc/ >/dev/null 2>&1
cp -f crontab /etc/ >/dev/null 2>&1

# Membersihkan file backup dengan path yang benar
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[44;97;1m         RESTORE SUCCESS           \e[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
sleep 3
clear
# Opsional: Menghapus backup.zip dan direktori backup
rm -rf /root/backup >/dev/null 2>&1

# Menghapus folder 'backup' di dalam folder 'folder'
cd /root &>/dev/null
backup_folder="/root/backup"
if [ -d "$backup_folder" ]; then
    rm -rf "$backup_folder" >/dev/null 2>&1
    echo "Folder 'backup' di dalam 'folder' telah dihapus."
else
    echo "Folder 'backup' di dalam 'folder' tidak ditemukan."
fi


