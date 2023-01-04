### Ubuntu Linux
Добавление и удаление пользователей и папок с указание прав доступа

Добавление хеша пароля
```
echo "password" | openssl passwd -1 -stdin # получите хеш пароля
useradd -d /home/usrname -g grpname -m -p password_hash usrname
```