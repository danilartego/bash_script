#!/bin/bash

source ./var.sh

users="./_users.txt"
groups="./_groups.txt"
folders="./_folders.txt"

# Удаление пользователя из списка
for user in $(cat $users)
  do
    sudo userdel -f -r $user
    echo "Удаление пользователя: $user"
done

# Удаление групп из списка
for group in $(cat $groups)
  do
    sudo userdel -f -r $group
    sudo delgroup $group
    echo "Удаление группы: $group"
done

# Удалить папки из списка
for folder in $(cat $folders)
  do
    sudo rm -rf /home/$folder
    echo "Удаление папки: $folder"
done

cat /etc/group
cat /etc/passwd