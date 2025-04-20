#!/bin/bash
date >> script.log
hostnamectl >> script.log
sudo apt update -y

# installing Java
echo "- Installing Java" >> script.log
sudo apt install -y fontconfig openjdk-21-jre
java --version >> script.log

# installing Jenkins
echo "- Installing Jenkins" >> script.log
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y jenkins
jenkins --version >> script.log

# installing Git
echo "- Installing Git" >> script.log
sudo apt install -y git-all
git -v >> script.log

# installing Node and npm
echo "- Installing node JS / npm" >> script.log
curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
echo "Installing nodejs" >> script.log
sudo apt-get install -y nodejs
echo "node version" >> script.log
node -v >> script.log
echo "npm version" >> script.log
npm -v >> script.log

# installing aws cli
echo "- install aws cli" >> script.log
sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version >> script.log

echo "Completed" >> script.log
date >> script.log