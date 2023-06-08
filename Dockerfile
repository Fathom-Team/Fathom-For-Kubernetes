FROM node:18.15.0

ENV DATABASE_URL=file:./db.sqlite
ENV NEXTAUTH_SECRET=+gg4HpC9LSCPhrR4Eq7d6IUNE7/h0+Z4286f36n/Aws=
ENV NEXTAUTH_URL=http://localhost:3000
ENV GITHUB_CLIENT_ID=github_client_id
ENV GITHUB_CLIENT_SECRET=github_client_secret
ENV GOOGLE_CLIENT_ID=google_client_id
ENV GOOGLE_CLIENT_SECRET=google_client_secret

WORKDIR /usr/src/app

COPY prisma ./prisma/
COPY package*.json ./

RUN npm install
RUN npm install -g pnpm 

COPY . ./

RUN pnpm next build

RUN npx prisma migrate dev --name init

RUN npx prisma generate --schema ./prisma/schema.prisma

EXPOSE 3000

CMD pnpm start
