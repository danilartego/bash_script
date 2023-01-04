#!/bin/bash

source ./var.sh

users="./_users.txt"
groups="./_groups.txt"
folders="./_folders.txt"

# Создать пользователей из списка
for user in $(cat $users)
  do
    sudo userdel -f -r $user
    echo "Удаление пользователя: $user"
done

# Создать группы из списка
for folder in $(cat $folders)
  do
    sudo rm -rf /home/$folder
    echo "Удаление папки: $folder"
done