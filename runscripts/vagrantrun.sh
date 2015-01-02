#!/bin/sh

echo "Running start scripts..."
celery.sh &
#celerybeat.sh &
# On dev machines, only pull data when triggered manually.
django-server.sh &
rabbitmq.sh &
static-server.sh &

echo "Provisioning database..."
init_scripts/1provision-db.sh &

echo "Adding pushpin user..."
init_scripts/make-user.sh &
