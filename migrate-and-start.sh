#!/bin/sh
sleep 10
npx prisma db push
npx prisma migrate deploy
pnpm start
