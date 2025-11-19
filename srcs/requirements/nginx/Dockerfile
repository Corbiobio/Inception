FROM debian:11

RUN apt update && apt install -y nginx openssl

RUN mkdir -p /data/www /etc/nginx/conf.d/

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /data/www/index.html


RUN mkdir -p /etc/nginx/ssl/
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/certificate.crt \
        -keyout /etc/nginx/ssl/key.key \
        -subj "/C=FR/" 

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
