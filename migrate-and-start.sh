#!/bin/bash
sleep 10
npx prisma migrate deploy
pnpm start