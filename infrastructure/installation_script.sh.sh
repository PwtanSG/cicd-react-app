#!/bin/bash

# This script install Java, Jenkins, Git, AWS CLI, nodes, npm

# SSH into the EC2 
# Open an SSH client.
# Locate your private key file. The key used to launch this instance is jenkins-server.pem
# Run this command, if necessary, to ensure your key is not publicly viewable.
# chmod 400 "jenkins-server.pem"
# Connect to your instance using its Public DNS:
# e.g ssh -i "jenkins-server.pem" ubuntu@ec2-3-83-177-80.compute-1.amazonaws.com

# SSH into the EC2 and execute the following
# - To download file from Git repo
# wget https://raw.github.com/PwtanSG/cicd-react-app/master/infrastructure/installation_script.sh
# - To Make the script executable
# chmod +x script.sh
# - To run the script
# ./script.sh
# - To view log file
# cat script.log


# log start time
echo date >> script.log
STARTTIME=$(date +%s)

# log system information
hostnamectl >> script.log

# update package list
sudo apt update -y

# installing Java 
# https://www.jenkins.io/doc/book/installing/linux/#installation-of-java
echo "- Installing Java" |tee script.log
sleep 1
sudo apt install -y fontconfig openjdk-21-jre
java --version >> script.log

# installing Jenkins LTS
# https://www.jenkins.io/doc/book/installing/linux/#debian-stable
echo "- Installing Jenkins" |tee script.log
sleep 1
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y jenkins
jenkins --version >> script.log

# installing Git
echo "- Installing Git" |tee script.log
sleep 1
sudo apt install -y git-all
git -v >> script.log

# installing Node and npm
echo "- Installing node JS / npm" |tee script.log
sleep 1
curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
echo "Installing nodejs" >> script.log
sudo apt-get install -y nodejs
echo "node version" >> script.log
node -v >> script.log
echo "npm version" >> script.log
npm -v >> script.log

# installing aws cli
# https://docs.aws.amazon.com/cli/v1/userguide/install-linux.html
echo "- install aws cli" |tee script.log
sleep 1
sudo apt install unzip -y
# latest copy
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version >> script.log

# log end time and time elasped
date >> script.log
ENDTIME=$(date +%s)
echo "Time Elapsed: $(($duration/3600)) hours $(($duration %3600 / 60)) minutes and $(($duration % 60)) seconds." |tee script.log
echo "Completed" >> script.log