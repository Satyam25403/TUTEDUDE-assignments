#!/bin/bash
sudo apt update -y
sudo apt install -y python3-pip git

# Clone repo
cd /home/ubuntu
git clone https://github.com/Satyam25403/github_tutedude
cd github_tutedude/backend

# Install requirements
pip3 install -r requirements.txt --break-system-packages

# Start Flask app
nohup python3 app.py > backend.log 2>&1 &
