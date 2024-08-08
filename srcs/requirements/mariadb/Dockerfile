FROM debian:bookworm

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_ROOT

RUN apt update && apt install -y mariadb-server

COPY requirements/mariadb/conf/create_db.sh .

RUN mkdir -p /run/mysqld

CMD ["sh", "create_db.sh"]
