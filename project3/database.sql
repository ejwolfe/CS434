DROP DATABASE IF EXISTS mydatabase;
CREATE DATABASE mydatabase;
USE mydatabase;

CREATE TABLE `Employee` (
  `id`    INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`  VARCHAR(100),
  `phoneNumber` VARCHAR(10),
  `DateOfBirth` DATE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Nurse` (
  `Employee$id` INT UNSIGNED NOT NULL,
  PRIMARY KEY   (`Employee$id`),
  FOREIGN KEY   (`Employee$id`) REFERENCES  `Employee` (`id`)
);

CREATE TABLE `Specialty` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(50) NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `Doctor` (
  `Employee$id`   INT UNSIGNED NOT NULL,
  `Specialty$id`  INT UNSIGNED NOT NULL,
  PRIMARY KEY     (`Employee$id`),
  FOREIGN KEY     (`Employee$id`) REFERENCES  `Employee` (`id`),
  FOREIGN KEY     (`Specialty$id`) REFERENCES `Specialty` (`id`)
);

CREATE TABLE `City` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(50) NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `State` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(25) NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `Zipcode` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code`        INT UNSIGNED NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `County` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(50) NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `HospitalType` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(50) NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `HospitalOwnership` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(50) NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `HospitalOverallRating` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rating`      INT UNSIGNED NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `Hospital`(

);

SHOW TABLES;
