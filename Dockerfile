FROM alpine:latest

RUN apk --update add nginx

COPY src /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]