#!/bin/bash
set -e

./gradlew clean build
podman build -t counter-server:latest .
echo "Run with podman run -p 8081:8081 counter-server:latest"
