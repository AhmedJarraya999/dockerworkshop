# stage 1
FROM node:17-alpine3.14 as node
WORKDIR /app
COPY package*.json .
RUN npm install 
ENV NODE_OPTIONS=--openssl-legacy-provider 
COPY . .
RUN npm run build



# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/dockerworkshop /usr/share/nginx/html
