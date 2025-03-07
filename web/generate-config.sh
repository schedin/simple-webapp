#!/bin/sh
set -e

# Default API URL if not provided in environment
API_BASE_URL=${API_BASE_URL:-"http://localhost:8081"}

echo "Generating configuration with API_BASE_URL=$API_BASE_URL"

# Generate config.js from template
sed "s|\${API_BASE_URL}|$API_BASE_URL|g" /tmp/config-template.js > /usr/share/nginx/html/js/config.js

echo "Configuration generated successfully!"
