FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx openssl vim curl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/majrou.42.fr.crt \
    -keyout /etc/nginx/ssl/majrou.42.fr.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=majrou.42.fr/UID=majrou"

COPY requirements/nginx/conf /etc/nginx/conf.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
