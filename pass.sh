#!/bin/bash

pass=$(echo "pass" | openssl passwd -1 -stdin)

echo "Вывод хеша пароля слова 'pass'"
echo $pass