#!/bin/bash

pass=$(echo "pass" | openssl passwd -1 -stdin)

echo $pass