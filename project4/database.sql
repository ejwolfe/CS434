DROP DATABASE IF EXISTS mydatabase;
CREATE DATABASE mydatabase;
USE mydatabase;

CREATE TABLE `Employee` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(100) NOT NULL,
  `phoneNumber` VARCHAR(20) NOT NULL,
  `dateofbirth` DATE NOT NULL,
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
  `rating`      VARCHAR(20) NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `Hospital`(
  `id`                        INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`                      VARCHAR(100) NOT NULL,
  `phoneNumber`               VARCHAR(15) NOT NULL,
  `address`                   VARCHAR(50) NOT NULL,
  `xCoordinate`               DOUBLE NOT NULL,
  `yCoordinate`               DOUBLE NOT NULL,
  `ES`                        BOOL NOT NULL,
  `EHS`                       BOOL NOT NULL,
  `city`                      VARCHAR(50) NOT NULL,
  `state`                     VARCHAR(25) NOT NULL,
  `zipcode`                   INT UNSIGNED NOT NULL,
  `county`                    VARCHAR(50) NOT NULL,
  `HospitalType$id`           INT UNSIGNED NOT NULL,
  `HospitalOwnership$id`      INT UNSIGNED NOT NULL,
  `HospitalOverallRating$id`  INT UNSIGNED NOT NULL,
  PRIMARY KEY                 (`id`),
  FOREIGN KEY                 (`HospitalType$id`) REFERENCES `HospitalType` (`id`),
  FOREIGN KEY                 (`HospitalOwnership$id`) REFERENCES `HospitalOwnership` (`id`),
  FOREIGN KEY                 (`HospitalOverallRating$id`) REFERENCES `HospitalOverallRating` (`id`)
);

CREATE TABLE `Footnote`(
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `note`        VARCHAR(500) NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `NationalComparisonDescription` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY   (`id`)
);

CREATE TABLE `NationalComparison`(
  `id`                                 INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `NationalComparisonDescription$id`   INT UNSIGNED NOT NULL,
  `Footnote$id`                        INT UNSIGNED NULL,
  PRIMARY KEY                          (`id`),
  FOREIGN KEY                          (`NationalComparisonDescription$id`) REFERENCES `NationalComparisonDescription` (`id`),
  FOREIGN KEY                          (`Footnote$id`) REFERENCES `Footnote` (`id`)
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

DESCRIBE `Employee`;
DESCRIBE `Nurse`;
DESCRIBE `Specialty`;
DESCRIBE `Doctor`;
DESCRIBE `HospitalType`;
DESCRIBE `HospitalOwnership`;
DESCRIBE `HospitalOverallRating`;
DESCRIBE `Hospital`;
DESCRIBE `Footnote`;
DESCRIBE `NationalComparison`;
DESCRIBE `NationalComparisonDescription`;
DESCRIBE `Mortality`;
DESCRIBE `SafetyOfCare`;
DESCRIBE `Readmission`;
DESCRIBE `PatientExperience`;
DESCRIBE `EffectivenessOfCare`;
DESCRIBE `TimelinessOfCare`;
DESCRIBE `EfficientUseOfMedicalImaging`;
DESCRIBE `Rating`;
DESCRIBE `WorksAt`;
DESCRIBE `SupervisedBy`;

SELECT * FROM `Doctor`;

INSERT INTO `HospitalType` (`name`)
VALUES ('Acute Care Hospitals'),
('Childrens'),
('Critical Access Hospitals');

SELECT * FROM `HospitalType`;

INSERT INTO `HospitalOwnership` (`name`)
VALUES ('Government - Federal'),
('Government - Hospital District or Authority'),
('Government - Local'),
('Government - State'),
('Physician'),
('Proprietary'),
('Tribal'),
('Voluntary non-profit - Church'),
('Voluntary non-profit - Other'),
('Voluntary non-profit - Private');

SELECT * FROM `HospitalOwnership`;

INSERT INTO `HospitalOverallRating` (`rating`)
VALUES (1),
(2),
(3),
(4),
(5),
('Not Avaliable');

SELECT * FROM `HospitalOverallRating`;

INSERT INTO `Footnote` (`note`)
VALUES ('Results are not available for this reporting period'),
('There are too few measures or measure groups reported to calculate a star rating or measure group score'),
('Data are shown only for hospitals that participate in the Inpatient quality Reporting (IQR) and Outpatient Quality Reporting (OQR) programs'),
('This hospitals star rating only includes data reported on inpatient servies'),
('Data suppressed by CMS for one or more quarters'),
('Not Available');

SELECT * FROM `Footnote`;

INSERT INTO `NationalComparisonDescription` (`description`)
VALUES ('Above the national average'),
('Below the national average'),
('Same as the national average'),
('Not Avaliable');

SELECT * FROM `NationalComparisonDescription`;
