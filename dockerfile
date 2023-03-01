FROM nginx:latest
RUN apt-get update && apt-get install -y nodejs npm
WORKDIR /usr/share/nginx/html


COPY ./build .
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN npm install
RUN npm run build

EXPOSE 90
