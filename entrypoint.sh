#!/bin/bash
set -e

echo "Starting gunicorn server..."
exec gunicorn --bind 0.0.0.0:${PORT:-8000} --workers 1 --threads 2 --timeout 120 horilla.wsgi:application
