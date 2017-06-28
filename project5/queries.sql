USE mydatabase;

/*
Finds all the hospitals with a cardiothoracic surgery doctor that has a overall rating that is between 3 and 5.
*/
select h.name
from employee e, doctor d, specialty s, worksat w, hospital h
where e.id = d.employee$id
and d.specialty$id = s.id
and s.id = 2
and w.employee$id = e.id
and w.hospital$id = h.id
and (h.hospitaloverallrating$id >= 3 and h.hospitaloverallrating$id < 6);

/*
Shows how many pathology doctors works in every state.
*/
select state, count(s.description)
from hospital h, worksat w, employee e, doctor d, specialty s
where h.id = w.hospital$id
and e.id = w.employee$id
and d.employee$id = e.id
and d.specialty$id = 18
group by state
order by state asc;

/*
Finds the employee names that work at a hospital in a state that starts with A
and has a lower hospital rating and a higher mortality rate.
*/
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
