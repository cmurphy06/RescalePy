#!/bin/bash

set -e

PYTHON_VERSION="3.11.9"
PYTHON_SRC_DIR="/usr/src/Python-${PYTHON_VERSION}"

echo "[+] Installing build dependencies..."
sudo apt update
sudo apt install -y build-essential zlib1g-dev libncurses5-dev \
libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev \
wget libsqlite3-dev libbz2-dev

echo "[+] Downloading Python $PYTHON_VERSION..."
cd /usr/src
sudo wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
sudo tar -xf Python-${PYTHON_VERSION}.tgz

echo "[+] Building Python $PYTHON_VERSION (this might take a few minutes)..."
cd $PYTHON_SRC_DIR
sudo ./configure --enable-optimizations
sudo make -j$(nproc)
sudo make altinstall

echo "[✔] Python $PYTHON_VERSION installed as 'python3.11'"

# Optional: Check version
python3.11 --version
