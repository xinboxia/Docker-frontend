# This one is for production

# first base image
FROM node:alpine

WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# second base image
FROM nginx
# 暴露 container 内部port
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html