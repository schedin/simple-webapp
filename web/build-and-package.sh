#!/bin/bash
set -e

npm install
npm run build
podman build -t counter-web:latest .
echo "Run with command"
echo "podman run -p 8080:80 -e API_BASE_URL=http://10.81.0.8:8081 counter-web:latest"
