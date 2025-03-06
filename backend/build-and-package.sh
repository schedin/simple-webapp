#!/bin/bash
set -e

echo "Building the Kotlin application..."
./gradlew clean build

echo "Building Docker image..."
docker build -t counter-server:latest .
