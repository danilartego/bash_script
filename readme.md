### Ubuntu Linux v1.2.1
Добавление пользователей и папок с указание прав доступа
`create.sh`

Удаление пользователей и папок
`destroy.sh`

Добавление хеша пароля
```
# Получите хеш пароля на экран
echo "password" | openssl passwd -1 -stdin

# Запись хеш пароля в переменную
password_hash=$(echo "pass" | openssl passwd -1 -stdin)

# Добавление пользователя с прописью пароля по умолчанию
useradd -d /home/usrname -g grpname -m -p $password_hash usrname
```