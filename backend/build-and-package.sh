#!/bin/bash
set -e

echo "Building the Kotlin application..."
./gradlew clean prepareDockerImage

echo "Building Docker image..."
docker build -t counter-server:latest .

echo "Done! You can now run the container with:"
echo "docker run -p 8080:8080 counter-server:latest"
