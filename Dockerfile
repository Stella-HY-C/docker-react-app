# Builder Stage
FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY . .

ENV CHOKIDAR_USEPOLLING=true

RUN npm run build


# Run Stage
FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html
