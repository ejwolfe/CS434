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

-- SHOW TABLES;

/*DESCRIBE `Employee`;
DESCRIBE `Nurse`;
DESCRIBE `Specialty`;
DESCRIBE `Doctor`;
DESCRIBE `City`;
DESCRIBE `State`;
DESCRIBE `Zipcode`;
DESCRIBE `County`;
DESCRIBE `HospitalType`;
DESCRIBE `HospitalOwnership`;
DESCRIBE `HospitalOverallRating`;
DESCRIBE `Hospital`;
DESCRIBE `Footnote`;
DESCRIBE `NationalComparison`;
DESCRIBE `Mortality`;
DESCRIBE `SafetyOfCare`;
DESCRIBE `Readmission`;
DESCRIBE `PatientExperience`;
DESCRIBE `EffectivenessOfCare`;
DESCRIBE `TimelinessOfCare`;
DESCRIBE `EfficientUseOfMedicalImaging`;
DESCRIBE `Rating`;
DESCRIBE `WorksAt`;
DESCRIBE `SupervisedBy`;*/

INSERT INTO `Employee` (`name`, `phoneNumber`, `dateOfBirth`)
VALUES ('Eric', '0000000000', '1994-12-24'),
('Tammy', '0000000001', '1994-12-25'),
('Bob', '0000000002', '1994-12-26'),
('Scott', '0000000003', '1994-12-27'),
('Jimmy', '0000000004', '1994-12-28'),
('Jose', '0000000005', '1994-12-29'),
('Cat', '0000000006', '1994-12-30'),
('Dog', '0000000007', '1994-12-31'),
('Jack', '0000000008', '1995-1-1'),
('Shandy', '0000000009', '1995-1-2');

SELECT * FROM `Employee`;

INSERT INTO `Nurse` (`Employee$id`)
VALUES (1),
(2),
(3),
(4),
(5);

SELECT * FROM `Nurse`;

INSERT INTO `Specialty` (`description`)
VALUES ('foot'),
('head'),
('heart'),
('immune'),
('nutritionist');

SELECT * FROM `Specialty`;

INSERT INTO `Doctor` (`Employee$id`, `Specialty$id`)
VALUES (6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

SELECT * FROM `Doctor`;

INSERT INTO `City` (`name`)
VALUES ('Dothan'),
('Boaz'),
('Florence'),
('Opp'),
('Luverne');

SELECT * FROM `City`;

INSERT INTO `State` (`name`)
VALUES ('AL'),
('AK'),
('AZ'),
('AR'),
('KY');

SELECT * FROM `State`;

INSERT INTO `Zipcode` (`code`)
VALUES (36301),
(35957),
(35631),
(36467),
(36049);

SELECT * FROM `Zipcode`;

INSERT INTO `County` (`name`)
VALUES ('Houston'),
('Marshall'),
('Lauderdale'),
('Covington'),
('Crenshaw');

SELECT * FROM `County`;

INSERT INTO `HospitalType` (`name`)
VALUES ('Acute Care Hospitals'),
('Childs'),
('Critical Access Hospitals');

SELECT * FROM `HospitalType`;

INSERT INTO `HospitalOwnership` (`name`)
VALUES ('Government - Hospital District or Authority'),
('Voluntary non-profit - Private'),
('Propietary'),
('Government - Local'),
('Government - State');

SELECT * FROM `HospitalOwnership`;

INSERT INTO `HospitalOverallRating` (`rating`)
VALUES (1),
(2),
(3),
(4),
(5);

SELECT * FROM `HospitalOverallRating`;

INSERT INTO `Hospital` (`name`, `phoneNumber`, `address`, `xCoordinate`, `yCoordinate`,
`ES`, `EHS`, `City$id`, `State$id`, `Zipcode$id`, `County$id`, `HospitalType$id`,
`HospitalOwnership$id`, `HospitalOverallRating$id`)
VALUES ('Southeast Alabama Medical Center', '3347938701', '1108 Ross Clark Circle',
31.214058, -85.361725, 1, 1, 1, 1, 1, 1, 1, 1, 3),
('Marshall Medical Center South', '2565938310', '2505 US Highway 431 North',
0, 0, 1, 1, 2, 1, 2, 2, 1, 1, 3),
('Eliza Coffee Memorial Hospital', '2567688400', '205 Marengo Street',
34.79366, -87.684348, 1, 1, 3, 1, 3, 3, 1, 1, 2),
('Mizell Memorial Hospital', '3344933541', '702 N Main St',
31.291972, -86.255415, 1, 1, 4, 1, 4, 4, 1, 2, 2),
('Crenshaw Community Hospital', '3343353374', '101 Hospital Circle',
31.692595, -86.266156, 1, 1, 5, 1, 5, 5, 1, 3, 3);

SELECT * FROM `Hospital`;

INSERT INTO `Footnote` (`note`)
VALUES ('Results are not avaliable for this reporting period'),
('There are too few measures or measure groups reported to calculate a star rating or measure group score'),
('Data are shown only for hospital that participate in the Inpatient quality Reporting (IQR) and Outpatient Quality Reporting (OQR) programs'),
('This hospitals star rating only includes data reported on inpatient servies'),
('Not Avaliable');

SELECT * FROM `Footnote`;

INSERT INTO `NationalComparison` (`description`, `Footnote$id`)
VALUES ('Same as the national average', NULL),
('Below the national average', NULL),
('Below the national average', NULL),
('Same as the national average', NULL),
('Same as the national average', NULL),
('Above the national average', NULL),
('Same as the national average', NULL),
('Same as the national average', NULL),
('Not Avaliable', 1),
('Not Avaliable', 1),
('Same as the national average', NULL),
('Above the national average', NULL),
('Same as the national average', NULL),
('Below the national average', NULL),
('Same as the national average', NULL),
('Below the national average', NULL),
('Same as the national average', NULL),
('Below the national average', NULL),
('Same as the national average', NULL),
('Not Avaliable', 1),
('Same as the national average', NULL),
('Same as the national average', NULL),
('Same as the national average', NULL),
('Below the national average', NULL),
('Same as the national average', NULL),
('Same as the national average', NULL),
('Above the national average', NULL),
('Above the national average', NULL),
('Above the national average', NULL),
('Above the national average', NULL),
('Same as the national average', NULL),
('Below the national average', NULL),
('Same as the national average', NULL),
('Not Avaliable', 1),
('Not Avaliable', 1);

SELECT * FROM `NationalComparison`;

INSERT INTO `Mortality` (`NationalComparison$id`)
VALUES (1),
(2),
(3),
(4),
(5);

SELECT * FROM `Mortality`;

INSERT INTO `SafetyOfCare` (`NationalComparison$id`)
VALUES (6),
(7),
(8),
(9),
(10);

SELECT * FROM `SafetyOfCare`;

INSERT INTO `Readmission` (`NationalComparison$id`)
VALUES (11),
(12),
(13),
(14),
(15);

SELECT * FROM `Readmission`;

INSERT INTO `PatientExperience` (`NationalComparison$id`)
VALUES (16),
(17),
(18),
(19),
(20);

SELECT * FROM `PatientExperience`;

INSERT INTO `EffectivenessOfCare` (`NationalComparison$id`)
VALUES (21),
(22),
(23),
(24),
(25);

SELECT * FROM `EffectivenessOfCare`;

INSERT INTO `TimelinessOfCare` (`NationalComparison$id`)
VALUES (26),
(27),
(28),
(29),
(30);

SELECT * FROM `TimelinessOfCare`;

INSERT INTO `EfficientUseOfMedicalImaging` (`NationalComparison$id`)
VALUES (31),
(32),
(33),
(34),
(35);

SELECT * FROM `EfficientUseOfMedicalImaging`;
