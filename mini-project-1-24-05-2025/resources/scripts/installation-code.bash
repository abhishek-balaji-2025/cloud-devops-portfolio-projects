#!/bin/bash

# If any event fails, abort the execution of the script to prevent half installation
set -e

# Always update your EC2 instance
sudo apt update -y
echo "system updated successfully"

# Install java package
sudo apt install openjdk-17-jdk -y
echo "java version 17 is installed"

# Install jenkins package
# Add the GPG key (securely)
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add the Jenkins repository
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update system again
sudo apt update -y
echo "update completed"
echo "Installing jenkins now..."
sudo apt install jenkins -y

# By default, the service is inactive. Go ahead and enable it
echo "Starting jenkins service"
sudo systemctl start jenkins
echo "enabling jenkins during boot-up of system"
sudo systemctl enable jenkins

# Check whether java and jenkins packages have been installed or not
java --version

echo "installation is complete..."

# Installation of docker package
echo "Installing docker now..."
sudo apt install docker.io -y

# Start the docker service
echo "starting docker service"
sudo systemctl start docker

echo "enable docker service"
sudo systemctl enable docker

# check whether docker has been successfully installed or not
echo "docker version..."

docker --version

echo "Installation of docker is complete"
