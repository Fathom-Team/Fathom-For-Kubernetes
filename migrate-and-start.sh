#!/bin/sh
echo "Waiting for postgres..."

while ! nc -z postgres-db 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

npx prisma db push
npx prisma migrate deploy
pnpm start
