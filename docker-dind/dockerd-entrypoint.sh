#!/bin/bash
set -e

# Print a startup message for debugging
echo "Starting dockerd-entrypoint.sh..."

# Ensure the required directory structure exists
if [ ! -d "/var/lib/docker" ]; then
    echo "Creating /var/lib/docker..."
    mkdir -p /var/lib/docker
fi

# Optional: Set up permissions (useful in some environments)
chown -R root:root /var/lib/docker

# Check if a specific flag is passed to override behavior
if [[ "$1" == "dockerd" ]]; then
    echo "Starting Docker daemon..."
    exec "$@" # Runs the Docker daemon with passed arguments
else
    # If the script is called with other commands, pass them along
    echo "Executing custom command: $@"
    exec "$@"
fi