#!/bin/bash

source ./var.sh

users="./_users.txt"
groups="./_groups.txt"
folders="./_folders.txt"

# Создать пользователей из списка
for user in $(cat $users)
  do
    sudo useradd -m $user
    echo "Добавить пользователя с именем: $user"
done

# Создать группы из списка
for group in $(cat $groups)
  do
    sudo useradd $group
    sudo usermod -a -G $group $USER
    echo "Добавить группу с именем: $group"
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

