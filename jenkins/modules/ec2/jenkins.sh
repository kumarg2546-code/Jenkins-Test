#!/bin/bash

# install nginx
sudo apt update
sudo apt install nginx -y



# Exit immediately if a command exits with a non-zero status
set -e

echo "=== Updating System Package Index ==="
sudo apt update -y

echo "=== Installing Java Prerequisites ==="
# Jenkins LTS requires Java 17 or Java 21; installing OpenJDK 21
sudo apt install -y openjdk-21-jdk fontconfig

echo "=== Verifying Java Installation ==="
java -version

echo "=== Adding Jenkins GPG Key Ring ==="
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key | sudo tee /etc/apt/keyrings/jenkins-keyring.asc > /dev/null

echo "=== Adding Jenkins Debian-Stable Repository ==="
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "=== Updating Packages for Jenkins ==="
sudo apt update -y

echo "=== Installing Jenkins ==="
sudo apt install -y jenkins

echo "=== Starting and Enabling Jenkins Service ==="
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "=== Configuring UFW Firewall for Port 8080 ==="
if sudo ufw status | grep -q "Status: active"; then
    sudo ufw allow 8080/tcp
    sudo ufw reload
    echo "Firewall port 8080 opened successfully."
else
    echo "UFW Firewall is not active. Skipping port configuration."
fi

echo "===================================================="
echo " Jenkins Installation Complete Successfully!"
echo " Access dashboard at: http://$(curl -s ifconfig.me):8080"
echo "===================================================="
echo "Your Initial Admin Unlock Password is:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "===================================================="



