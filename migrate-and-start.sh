#!/bin/sh
set -e

host="$1"
shift
cmd="$@"

echo "Waiting for postgres..."

until PGPASSWORD=$POSTGRES_PASSWORD psql -h "$host" -U "postgres" -c '\q'; do
  sleep 1
done

echo "Postgres is up."

echo "Running migrations..."
npx prisma migrate dev
npx prisma migrate deploy

echo "Starting the app..."
next start
