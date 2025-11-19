CREATE DATABASE db_name;

CREATE USER 'db_user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON db_name.* TO 'db_user'@'%';
FLUSH PRIVILEGES;
