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

sudo deluser $group
sudo deluser $user_1
sudo deluser $user_2
sudo delgroup $group

sudo rm -rf /home/$plex
sudo rm -rf /home/$shared
sudo rm -rf /home/$sync
sudo rm -rf /home/$user_1
sudo rm -rf /home/$user_2

# Изменим название группы managers на marketing
# sudo groupmod -n marketing managers

cat /etc/group
cat /etc/passwd