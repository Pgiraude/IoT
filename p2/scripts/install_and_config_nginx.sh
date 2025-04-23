#!/bin/bash

sudo apt update
sudo apt-get install -y nginx
sudo systemctl enable nginx

# Configure nginx reverse proxy to Kubernetes NodePort
cat > /etc/nginx/sites-available/calculator <<EOF
server {
    listen 80;
    location / {
        proxy_pass http://192.168.56.110:30080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

# Enable the site
sudo ln -s /etc/nginx/sites-available/calculator /etc/nginx/sites-enabled/calculator
sudo rm -f /etc/nginx/sites-enabled/default

# Test and restart
sudo nginx -t && sudo systemctl restart nginx
