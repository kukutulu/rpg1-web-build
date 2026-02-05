#!/bin/bash

# Pull latest changes from main branch
echo "Pulling latest changes from main branch..."
git pull origin main

# Stop and remove existing container
echo "Stopping existing container..."
docker stop hunger-game-unity

echo "Removing existing container..."
docker rm hunger-game-unity

# Remove old image
echo "Removing old image..."
docker rmi hunger-game-unity:latest

# Build new image
echo "Building new image..."
docker build -t hunger-game-unity .

# Run new container
echo "Starting new container..."
docker run -d -p 4000:80 --name hunger-game-unity hunger-game-unity

echo "Deployment complete!"
