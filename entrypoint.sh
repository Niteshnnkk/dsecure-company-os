#!/bin/bash
set -e

echo "Running database migrations..."
python3 manage.py makemigrations
python3 manage.py migrate

echo "Collecting static files..."
python3 manage.py collectstatic --noinput

echo "Starting gunicorn server..."
exec gunicorn --bind 0.0.0.0:8000 --workers 2 --timeout 120 horilla.wsgi:application
