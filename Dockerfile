FROM node:18.15.0
WORKDIR /usr/src/app
COPY prisma ./prisma/
COPY package*.json ./
RUN npm install
RUN npm install -g pnpm 
COPY . ./
RUN pnpm next build
RUN npx prisma generate --schema ./prisma/schema.prisma
RUN chmod +x ./migrate-and-start.sh
ENV PORT=3000
EXPOSE 3000
CMD ["./migrate-and-start.sh"]