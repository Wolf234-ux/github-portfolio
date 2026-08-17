#!/bin/sh
set -e

# Default PORT to 80 if Render or local environment doesn't specify one
export PORT="${PORT:-80}"

echo "Starting Nginx on port: $PORT"

# Substitute $PORT into Nginx config
envsubst '${PORT}' < /etc/nginx/templates/nginx.conf.template > /etc/nginx/conf.d/default.conf

# Execute main process
exec "$@"
