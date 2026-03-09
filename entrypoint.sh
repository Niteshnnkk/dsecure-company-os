#!/bin/bash
set -e

echo "Starting gunicorn server..."
export DISABLE_SCHEDULERS=True
exec gunicorn --bind 0.0.0.0:${PORT:-8000} --workers 1 --threads 10 --worker-class gthread --max-requests 500 --max-requests-jitter 50 --timeout 180 horilla.wsgi:application
