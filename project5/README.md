# Report

## Queries

1. Finds all the hospitals with a cardiothoracic surgery doctor that has a overall rating that is between 3 AND 5.
``` sql
SELECT h.name
FROM employee e, doctor d, specialty s, worksat w, hospital h
WHERE e.id = d.employee$id
AND d.specialty$id = s.id
AND s.id = 2
AND w.employee$id = e.id
AND w.hospital$id = h.id
AND (h.hospitaloverallrating$id >= 3 AND h.hospitaloverallrating$id < 6);
```
2. Shows how many pathology doctors works in every state.
``` sql
SELECT state, count(s.description)
FROM hospital h, worksat w, employee e, doctor d, specialty s
WHERE h.id = w.hospital$id
AND e.id = w.employee$id
AND d.employee$id = e.id
AND d.specialty$id = 18
GROUP BY state
ORDER BY state ASC;
```
3. Finds the employee names that work at a hospital in a state that starts with A AND has a lower hospital rating AND a higher mortality rate.
``` sql
select h.name, h.state, e.name
FROM hospital h, employee e, rating r, worksat w, nationalcomparison nc, mortality m
WHERE e.id = w.employee$id
AND h.id = w.hospital$id
AND r.hospital$id = h.id
AND nc.id = r.mortality$id
AND nc.nationalcomparisondescription$id = 2
AND h.hospitaloverallrating$id < 3
AND state LIKE 'A%'
AND nc.id = m.nationalcomparison$id
ORDER BY h.state ASC;
```

## Modifications

1. Inserts a new specialty called holistic into the specialty table.
``` sql
INSERT INTO specialty (description)
VALUES ('Holistic');
```
2. Deletes any specialty that contains the word pathology in the description column.
``` sql
DELETE
FROM doctor
WHERE employee$id = 100;
```
3. Updates any employee name that is Jerrie Hutt with my name.
``` sql
UPDATE employee
SET name = 'Eric Wolfe'
WHERE name = 'Jerrie Hutt';
```

## View

1. Creates a view of only the hospitals that are in the state of missouri.
``` sql
CREATE VIEW Missouri_Hospitals AS
  SELECT name, phoneNumber, address, ES, EHR, city, state, zipcode,
  county, HospitalType$id, HospitalOwnership$id, HospitalOverallRating$id
  FROM hospital
  WHERE state = 'MO';
```
2. Query to find all the hospitals that contain a b in the name that resides in the Missouri_Hospitals table.
``` sql
SELECT name
FROM Missouri_Hospitals
WHERE name like '%B%';
```
3. This insertion will work because I have only limited this table to the hospital that are in Missouri and have used all the other columns. Also, the id was not used in this table because it is auto incrementing and will be incremented with the new insertion.
``` sql
INSERT INTO Missouri_Hospitals (name, phoneNumber, address, ES, EHR, city, state, zipcode,
county, HospitalType$id, HospitalOwnership$id, HospitalOverallRating$id)
VALUES ('BBB', '1234567890', 'SIUE', 1, 0, 'Edwardsville', 'MO', '62294', 'Madison',
1, 1, 1);
```

## Index

This query takes half the time on my machine after using indexing on the employee name. This result makes sense because compared to the hospital table, the employee table is very large and to search through the table takes a lot of time. The indexing allows the database to quickly find the result we want without checking the whole table.

``` sql
SET profiling = 1;

select h.name, h.state, e.name
from hospital h, employee e, rating r, worksat w, nationalcomparison nc, mortality m
where e.id = w.employee$id
and h.id = w.hospital$id
and r.hospital$id = h.id
and nc.id = r.mortality$id
and nc.nationalcomparisondescription$id = 2
and h.hospitaloverallrating$id < 3
and state like 'A%'
and nc.id = m.nationalcomparison$id
order by h.state asc;

CREATE INDEX Employee_index
ON employee(name);

select h.name, h.state, e.name
from hospital h, employee e, rating r, worksat w, nationalcomparison nc, mortality m
where e.id = w.employee$id
and h.id = w.hospital$id
and r.hospital$id = h.id
and nc.id = r.mortality$id
and nc.nationalcomparisondescription$id = 2
and h.hospitaloverallrating$id < 3
and state like 'A%'
and nc.id = m.nationalcomparison$id
order by h.state asc;

SHOW PROFILES;
```
