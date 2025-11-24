FROM debian:11

RUN apt update  && apt install -y mariadb-server

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld /root

COPY mariadb.conf /root/.my.cnf
COPY init_db.sql /root/init.sql

EXPOSE 3306

RUN chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT ["mariadbd"]
