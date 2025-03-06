#!/bin/bash
set -e

# Get the tag from the first argument, or use "latest" if no argument is provided
TAG=${1:-latest}

# Update the image name to use the provided tag
IMAGE_NAME="counter-web:$TAG"

echo "Building with tag: $TAG"

npm install
npm run build

podman build -t ${IMAGE_NAME} .
echo "Run with command"
echo "podman run -p 8080:80 -e API_BASE_URL=http://10.81.0.8:8081 ${IMAGE_NAME}"
