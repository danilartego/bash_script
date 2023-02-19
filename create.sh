#!/bin/bash

source ./var.sh

users="./_users.txt"
groups="./_groups.txt"
folders="./_folders.txt"

# Создать пользователей из списка
for user in $(cat $users)
  do

  # Создание хеша пароля для пользователя
  echo "Создаем пароль для пользователя: $user"
  pass_hash=$(echo "$user" | openssl passwd -1 -stdin)

  sudo useradd -m $user -p $pass_hash -s /bin/bash
  echo "Добавить пользователя с именем: $user"

  echo "Добавить группу $user к данному пользователю: $USER"
  sudo usermod -a -G $user $USER

  echo "Изменения доступа на 775 для папки: $user"
  sudo chmod 775 -R /home/$user

  # Создать группы из списка
  for group in $(cat $groups)
    do
    echo "Добавить группу с именем: $group"
    sudo useradd $group

    echo "Добавить группу с именем: $group к пользователю $user"
    sudo usermod -a -G $group $user

    echo "Добавить группу к данному пользователю: $USER"
    sudo usermod -a -G $group $USER

    # Создать папки из списка  
    for folder in $(cat $folders)
      do
      echo "Создание папки с именем: $folder"
      sudo mkdir /home/$folder

      echo "Изменение владельца папки: $folder на $group"
      sudo chown -R $group:$group /home/$folder
      
      echo "Изменения доступа на 775 для папки: $folder"
      sudo chmod 775 -R /home/$folder
      
    done
  done
done

for user in $(cat $users)
  do
  cat /etc/group | grep -E "$user"
  cat /etc/passwd | grep -E "$user"
  groups $user
done