# CI/CD Deployment with Jenkins

This project uses Jenkins Freestyle Project to automate deployment of a full-stack web application.

## Technologies Used
- Frontend: Node.js (Express)
- Backend: Python (Flask)
- CI/CD: Jenkins

## Deployment Steps
1. Jenkins pulls the latest code from GitHub.
2. Installs frontend dependencies using `npm install`.
3. Installs backend dependencies using `pip3 install -r requirements.txt --break-system-packages`.
4. Launches backend and frontend services using `nohup`:
   ```bash
   nohup python3 backend/app.py > /dev/null 2>&1 &
   nohup node frontend/app.js > /dev/null 2>&1 &