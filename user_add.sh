#!/bin/bash

# Чтение данных из других файлов
source ./var.sh

# Список пользователей
# sed 's/:.*//' /etc/passwd

# Вывод переменных из файлов
echo "$admin" 
echo "$user_1"
echo "$user_1"
echo "$group" 
echo "$plex"
echo "$shared"
echo "$sync"

sudo useradd $group

sudo mkdir /home/$shared
sudo mkdir /home/$plex
sudo mkdir /home/$sync

sudo chown -R $group:$group /home/$shared
sudo chown -R $group:$group /home/$plex
sudo chown -R $group:$group /home/$sync

sudo chmod 775 -R /home/$shared
sudo chmod 775 -R /home/$plex
sudo chmod 775 -R /home/$sync

sudo useradd -m $user_1
sudo usermod -a -G $group $user_1

sudo useradd -m $user_2
sudo usermod -a -G $group $user_2

sudo usermod -a -G $group code

# sudo usermod -G -a disk $user_1
# mount /dev/sda1 /mnt

# Изменим название группы managers на marketing
# sudo groupmod -n marketing managers

cat /etc/group | grep -E "$group|$user_1|$user_2"
cat /etc/passwd | grep -E "$group|$user_1|$user_2"