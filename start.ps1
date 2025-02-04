#!/usr/bin/env pwsh

# Stop and remove containers, networks, images, and volumes
docker-compose down

# Check if the Jenkins image exists
if (-not (docker images | Select-String -Pattern "jenkins/jenkins")) {
    Write-Output "Jenkins image not found. Pulling the image..."
    docker pull jenkins/jenkins:lts
} else {
    Write-Output "Jenkins image found."
}

# Start the containers in detached mode
docker-compose up -d

# Wait for Jenkins to start
Write-Output "Waiting for Jenkins to start..."
Start-Sleep -Seconds 30

# Get the Jenkins logs and look for the initial setup message
docker logs jenkins | Select-String -Pattern "Jenkins initial setup is required" -Context 0,8