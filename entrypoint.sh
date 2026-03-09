#!/bin/bash
set -e

echo "Starting gunicorn server..."
export DISABLE_SCHEDULERS=True
exec gunicorn --bind 0.0.0.0:${PORT:-8000} --workers 1 --threads 2 --worker-class gthread --max-requests 50 --max-requests-jitter 10 --timeout 120 horilla.wsgi:application
