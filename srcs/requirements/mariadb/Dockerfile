FROM debian:11

RUN apt update && apt install -y mariadb-server

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld /root

COPY mariadb.conf /root/.my.cnf
COPY init_db.sql /root/init.sql

#RUN sed -i -e "s/password/$DB_PASSWORD/g" /root/init.sql |\
#    sed -i -e "s/db_name/$DB_NAME/g" /root/init.sql |\
#    sed -i -e "s/username/$DB_USERNAME/g" /root/init.sql

EXPOSE 3306

ENTRYPOINT ["mariadbd"]
