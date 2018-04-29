create database db;
USE db;
create table ticket (
  id int NOT NULL AUTO_INCREMENT,
  subject varchar(255),
  description varchar(255),
  email varchar(320),
  PRIMARY KEY (id)
);

