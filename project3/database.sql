DROP DATABASE IF EXISTS mydatabase;

CREATE DATABASE mydatabase;

USE mydatabase;

CREATE TABLE employee (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  phonenumber VARCHAR(10),
  dob DATE,
  PRIMARY KEY (id)
);

CREATE TABLE nurse (
  id INT NOT NULL REFERENCES employee (id),
  PRIMARY KEY (id)
);

CREATE TABLE doctor (
  id INT NOT NULL REFERENCES employee (id),
  specialtyid INT NOT NULL REFERENCES specialty (id),
  PRIMARY KEY (id)
);

CREATE TABLE specialty (
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(50),
  PRIMARY KEY (id)
);

SHOW TABLES;
