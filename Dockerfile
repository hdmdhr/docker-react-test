# SECTION 1: npm run build
FROM node:alpine AS builder

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# SECTION 2: nginx
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html