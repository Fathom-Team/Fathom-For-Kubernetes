FROM node:18.15.0

ARG DB_HOST
ARG DB_USER
ARG DB_PASSWORD
ARG DB_NAME
ARG DB_PORT
# ARG DATABASE_URL
ARG NEXTAUTH_SECRET
ARG NEXTAUTH_URL
ARG GITHUB_CLIENT_ID
ARG GITHUB_CLIENT_SECRET
ARG GOOGLE_CLIENT_ID
ARG GOOGLE_CLIENT_SECRET

WORKDIR /usr/src/app
COPY prisma ./prisma/
COPY package*.json ./
RUN npm install
RUN npm install -g pnpm 
COPY . ./
RUN env $(cat /run/secrets/my_env) && pnpm next build
COPY migrate-and-start.sh .

# Set permissions for the script
RUN chmod +x migrate-and-start.sh

# Generate Prisma client
RUN npx prisma generate --schema ./prisma/schema.prisma

# Set environment variables
ENV PORT=3000

# Expose the application port
EXPOSE 3000

# Set the command to execute on container startup
CMD ["./migrate-and-start.sh"]
