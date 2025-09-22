#!/bin/bash
sudo apt update -y
sudo apt install -y nodejs npm git

# Clone repo
cd /home/ubuntu
git clone https://github.com/Satyam25403/github_tutedude
cd github_tutedude/frontend

# Install dependencies
npm install

# Export backend IP (Terraform will replace BACKEND_IP)
BACKEND_URL="http://${backend_ip}:5000/api"

# Start Node app with backend URL
nohup BACKEND_URL=$BACKEND_URL node app.js > frontend.log 2>&1 &
