#!/bin/bash
hostnamectl >> script.log
sudo apt update

# installing Java
echo "Installing Java" >> script.log
sudo apt install fontconfig openjdk-21-jre
java --version >> script.log

# installing Java
echo "Installing Jenkins" >> script.log
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins

# installing Git
echo "Installing Git" >> script.log
sudo apt install -y git-all
git -v >> script.log

# installing Node and npm
curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
echo "Installing nodejs" >> script.log
sudo apt-get install -y nodejs
echo "node version" >> script.log
node -v >> script.log
echo "npm version" >> script.log
npm -v >> script.log