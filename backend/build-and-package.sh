#!/bin/bash
set -e

# Get the tag from the first argument, or use "latest" if no argument is provided
TAG=${1:-latest}
# Update the image name to use the provided tag
IMAGE_NAME="counter-server:$TAG"
echo "Building with tag: $TAG"

./gradlew clean build
podman build -t ${IMAGE_NAME} .
echo "Run with podman run -p 8081:8081 ${IMAGE_NAME}"
