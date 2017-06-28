USE mydatabase;

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

/*
This query takes half the time on my machine after using indexing on the employee name.
This result makes sense because compared to the hospital table, the employee table is very large and to search through the table takes a lot of time.
The indexing allows the database to quickly find the result we want without checking the whole table.
*/
