DROP DATABASE IF EXISTS mydatabase;
CREATE DATABASE mydatabase;
USE mydatabase;

CREATE TABLE `Employee` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(100) NOT NULL,
  `phoneNumber` VARCHAR(10) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
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
  `id`                        INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`                      VARCHAR(100) NOT NULL,
  `phoneNumber`               VARCHAR(10) NOT NULL,
  `address`                   VARCHAR(50) NOT NULL,
  `xCoordinate`               DOUBLE NOT NULL,
  `yCoordinate`               DOUBLE NOT NULL,
  `ES`                        BOOL NOT NULL,
  `EHS`                       BOOL NOT NULL,
  `City$id`                   INT UNSIGNED NOT NULL,
  `State$id`                  INT UNSIGNED NOT NULL,
  `Zipcode$id`                INT UNSIGNED NOT NULL,
  `County$id`                 INT UNSIGNED NOT NULL,
  `HospitalType$id`           INT UNSIGNED NOT NULL,
  `HospitalOwnership$id`      INT UNSIGNED NOT NULL,
  `HospitalOverallRating$id`  INT UNSIGNED NOT NULL,
  PRIMARY KEY                 (`id`),
  FOREIGN KEY                 (`City$id`) REFERENCES `City` (`id`),
  FOREIGN KEY                 (`State$id`) REFERENCES `State` (`id`),
  FOREIGN KEY                 (`Zipcode$id`) REFERENCES `Zipcode` (`id`),
  FOREIGN KEY                 (`County$id`) REFERENCES `County` (`id`),
  FOREIGN KEY                 (`HospitalType$id`) REFERENCES `HospitalType` (`id`),
  FOREIGN KEY                 (`HospitalOwnership$id`) REFERENCES `HospitalOwnership` (`id`),
  FOREIGN KEY                 (`HospitalOverallRating$id`) REFERENCES `HospitalOverallRating` (`id`)
);

CREATE TABLE `Footnote`(
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `note`        VARCHAR(500) NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `NationalComparison`(
  `id`            INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description`   VARCHAR(100) NOT NULL,
  `Footnote$id`   INT UNSIGNED NULL,
  PRIMARY KEY     (`id`),
  FOREIGN KEY     (`Footnote$id`) REFERENCES `Footnote` (`id`)
);

CREATE TABLE `Mortality` (
  `NationalComparison$id` INT UNSIGNED NOT NULL,
  PRIMARY KEY   (`NationalComparison$id`),
  FOREIGN KEY   (`NationalComparison$id`) REFERENCES  `NationalComparison` (`id`)
);

CREATE TABLE `SafetyOfCare` (
  `NationalComparison$id` INT UNSIGNED NOT NULL,
  PRIMARY KEY   (`NationalComparison$id`),
  FOREIGN KEY   (`NationalComparison$id`) REFERENCES  `NationalComparison` (`id`)
);

CREATE TABLE `Readmission` (
  `NationalComparison$id` INT UNSIGNED NOT NULL,
  PRIMARY KEY   (`NationalComparison$id`),
  FOREIGN KEY   (`NationalComparison$id`) REFERENCES  `NationalComparison` (`id`)
);

CREATE TABLE `PatientExperience` (
  `NationalComparison$id` INT UNSIGNED NOT NULL,
  PRIMARY KEY   (`NationalComparison$id`),
  FOREIGN KEY   (`NationalComparison$id`) REFERENCES  `NationalComparison` (`id`)
);

CREATE TABLE `EffectivenessOfCare` (
  `NationalComparison$id` INT UNSIGNED NOT NULL,
  PRIMARY KEY   (`NationalComparison$id`),
  FOREIGN KEY   (`NationalComparison$id`) REFERENCES  `NationalComparison` (`id`)
);

CREATE TABLE `TimelinessOfCare` (
  `NationalComparison$id` INT UNSIGNED NOT NULL,
  PRIMARY KEY   (`NationalComparison$id`),
  FOREIGN KEY   (`NationalComparison$id`) REFERENCES  `NationalComparison` (`id`)
);

CREATE TABLE `EfficientUseOfMedicalImaging` (
  `NationalComparison$id` INT UNSIGNED NOT NULL,
  PRIMARY KEY   (`NationalComparison$id`),
  FOREIGN KEY   (`NationalComparison$id`) REFERENCES  `NationalComparison` (`id`)
);

CREATE TABLE `Rating`(
  `Hospital$id`                       INT UNSIGNED NOT NULL,
  `Mortality$id`                      INT UNSIGNED NOT NULL,
  `SafetyOfCare$id`                   INT UNSIGNED NOT NULL,
  `Readmission$id`                    INT UNSIGNED NOT NULL,
  `PatientExperience$id`              INT UNSIGNED NOT NULL,
  `EffectivenessOfCare$id`            INT UNSIGNED NOT NULL,
  `TimelinessOfCare$id`               INT UNSIGNED NOT NULL,
  `EfficientUseOfMedicalImaging$id`   INT UNSIGNED NOT NULL,
  PRIMARY KEY                         (`Hospital$id`, `Mortality$id`, `SafetyOfCare$id`, `Readmission$id`, `PatientExperience$id`, `EffectivenessOfCare$id`, `TimelinessOfCare$id`, `EfficientUseOfMedicalImaging$id`),
  FOREIGN KEY                         (`Hospital$id`) REFERENCES `Hospital` (`id`),
  FOREIGN KEY                         (`Mortality$id`) REFERENCES `Mortality` (`NationalComparison$id`),
  FOREIGN KEY                         (`SafetyOfCare$id`) REFERENCES `SafetyOfCare` (`NationalComparison$id`),
  FOREIGN KEY                         (`Readmission$id`) REFERENCES `Readmission` (`NationalComparison$id`),
  FOREIGN KEY                         (`PatientExperience$id`) REFERENCES `PatientExperience` (`NationalComparison$id`),
  FOREIGN KEY                         (`EffectivenessOfCare$id`) REFERENCES `EffectivenessOfCare` (`NationalComparison$id`),
  FOREIGN KEY                         (`TimelinessOfCare$id`) REFERENCES `TimelinessOfCare` (`NationalComparison$id`),
  FOREIGN KEY                         (`EfficientUseOfMedicalImaging$id`) REFERENCES `EfficientUseOfMedicalImaging` (`NationalComparison$id`)
);

CREATE TABLE `WorksAt`(
  `Hospital$id`   INT UNSIGNED NOT NULL,
  `Employee$id`   INT UNSIGNED NOT NULL,
  PRIMARY KEY     (`Hospital$id`, `Employee$id`),
  FOREIGN KEY     (`Hospital$id`) REFERENCES `Hospital` (`id`),
  FOREIGN KEY     (`Employee$id`) REFERENCES `Employee` (`id`)
);

CREATE TABLE `SupervisedBy`(
  `Doctor$id`   INT UNSIGNED NOT NULL,
  `Nurse$id`   INT UNSIGNED NOT NULL,
  PRIMARY KEY     (`Doctor$id`, `Nurse$id`),
  FOREIGN KEY     (`Doctor$id`) REFERENCES `Doctor` (`Employee$id`),
  FOREIGN KEY     (`Nurse$id`) REFERENCES `Nurse` (`Employee$id`)
);

SHOW TABLES;
