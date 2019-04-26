FROM ubuntu:12.04ERROR

RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;"  >> /etc/nginx/nginx.conf

RUN curl -o /usr/share/nginx/www/master.zip -L https://codeload.github.com/kalleeh/2048/zip/master
RUN cd /usr/share/nginx/www/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
