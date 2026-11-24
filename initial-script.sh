#!/bin/bash

set -e

echo "=== 1. Cap nhat he thong ==="
sudo apt-get update && sudo apt-get upgrade -y

echo "=== 2. Cai dat cac goi phan mem bat buoc ==="
sudo apt-get install -y openjdk-17-jdk git curl

echo "=== 3. Kiem tra va tao nhom quickbite ==="
if getent group quickbite > /dev/null 2>&1; then
    echo "Nhom 'quickbite' da ton tai."
else
    echo "Nhom 'quickbite' chua ton tai. Dang tao nhom..."
    sudo groupadd quickbite
    echo "Da tao nhom 'quickbite' thanh cong."
fi

echo "=== 4. Kiem tra va tao tai khoan he thong quickbite ==="
if id -u quickbite > /dev/null 2>&1; then
    echo "Tai khoan 'quickbite' da ton tai."
else
    echo "Dang tao tai khoan he thong 'quickbite'..."
    sudo useradd -r -g quickbite -s /bin/false quickbite
    echo "Da tao tai khoan 'quickbite' thanh cong voi cac rang buoc bao mat."
fi

echo "=== Thiet lap moi truong ban dau hoan tat! ==="
