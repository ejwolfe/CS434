USE mydatabase;

SET profiling = 1;

SELECT *
FROM employee
WHERE name LIKE '%z%';

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

SELECT *
FROM employee
WHERE name LIKE '%z%';

SHOW PROFILES;

/*
The time between using the indexes and not using the indexes is small but there is a difference between using indexes and not using indexes. This is good to use when you want to look for the names of doctors that work at certain hospitals. For instance, in this project, I did a query that got all of the doctor names that had a certain specialty. This would speed up that query.
*/
