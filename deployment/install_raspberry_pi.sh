#!/bin/bash
# install_raspberry_pi.sh

cd ../
sudo apt-get update
sudo apt-get install -y ffmpeg \
    libsm6 \
    libxext6 \
    python3-pip
python3 -m pip install virtualenv
python3 -m virtualenv -p python3 env
source env/bin/activate
pip install -r src/requirements.txt
