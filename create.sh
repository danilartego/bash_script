#!/bin/bash

source ./var.sh

users="./_users.txt"
groups="./_groups.txt"
folders="./_folders.txt"

pass=$(echo "pass" | openssl passwd -1 -stdin)

# Создать пользователей из списка
for user in $(cat $users)
  do
  sudo useradd -m $user -p $pass -s /bin/bash
  echo "Добавить пользователя с именем: $user"

  # Создать группы из списка
  for group in $(cat $groups)
    do
    sudo useradd $group
    echo "Добавить группу с именем: $group"
    sudo usermod -a -G $group $user
    echo "Добавить группу к пользователю: $user"
    sudo usermod -a -G $group $USER
      
    # Создать папки из списка
    for folder in $(cat $folders)
      do
      sudo mkdir /home/$folder
      echo "Создание папки с именем: $folder"
      sudo chown -R $group:$group /home/$folder
      echo "Изменение владельца папки: $folder на $group"
      sudo chmod 775 -R /home/$folder
      echo "Изменения доступа на 775 для папки: $folder"
    done
  done
done

for user in $(cat $users)
  do
  cat /etc/group | grep -E "$user"
  cat /etc/passwd | grep -E "$user"
  groups $user
done