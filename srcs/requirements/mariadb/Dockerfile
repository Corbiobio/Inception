FROM debian:11

ARG DB_NAME
ARG DB_USER
ARG DB_PASS

RUN apt update && apt install -y mariadb-server

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld /root

COPY mariadb.conf /root/.my.cnf
COPY init_db.sql /tmp/init.sql

#RUN echo ${DB_USER} ${DB_NAME} ${DB_PASS} && 1
RUN sed -i "s/db_name/${DB_NAME}/g" /tmp/init.sql && \
    sed -i "s/db_user/${DB_USER}/g" /tmp/init.sql && \
    sed  "s/db_pass/${DB_PASS}/g" /tmp/init.sql > /root/init.sql

EXPOSE 3306

ENTRYPOINT ["mariadbd"]
