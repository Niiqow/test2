FROM nginx:latest
RUN apt-get update && apt-get install -y nodejs npm
WORKDIR /usr/share/nginx/html

RUN npm install
RUN npm run build

COPY ./build .
COPY ./nginx.conf /etc/nginx/conf.d/default.conf


EXPOSE 90
