#!/bin/bash

# Stop and remove containers, networks, images, and volumes
docker-compose down

# Check if the Jenkins image exists
if ! docker images | grep -q "jenkins/jenkins"; then
  echo "Jenkins image not found. Pulling the image..."
  docker pull jenkins/jenkins:lts
else
  echo "Jenkins image found."
fi

# Start the containers in detached mode
docker-compose up -d

# Wait for Jenkins to start
echo "Waiting for Jenkins to start..."
sleep 30

# Get the Jenkins logs and look for the initial setup message
docker logs jenkins | awk '/Jenkins initial setup is required/{flag=1;count=8} flag{print;count--;if(count==0)exit}'