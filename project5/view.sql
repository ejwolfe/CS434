USE mydatabase;

/*
Creates a view of only the hospitals that are in the state of missouri.
*/
CREATE VIEW Missouri_Hospitals AS
  SELECT name, phoneNumber, address, ES, EHR, city, state, zipcode,
  county, HospitalType$id, HospitalOwnership$id, HospitalOverallRating$id
  FROM hospital
  WHERE state = 'MO';

/*
Query to find all the hospitals that contain a b in the name that resides in the Missouri_Hospitals table.
*/
SELECT name
FROM Missouri_Hospitals
WHERE name like '%B%';

/*
This insertion will work because I have only limited this table to the hospital that are in Missouri and have used all the other columns.
Also, the id was not used in this table because it is auto incrementing and will be incremented with the new insertion.
*/
INSERT INTO Missouri_Hospitals (name, phoneNumber, address, ES, EHR, city, state, zipcode,
county, HospitalType$id, HospitalOwnership$id, HospitalOverallRating$id)
VALUES ('BBB', '1234567890', 'SIUE', 1, 0, 'Edwardsville', 'MO', '62294', 'Madison',
1, 1, 1);
