-- Find the 5 most expensive tracks.
select trackid, name, unitprice 
from track
order by UnitPrice desc
limit 5;

-- Find the newest employee.
select employeeid, firstname, lastname, HireDate
from employee
order by hiredate desc
limit 1;

-- Find the oldest employee.
select employeeid, firstname, lastname, HireDate
from employee
order by hiredate asc
limit 1;

-- Show customers ordered by last name.
select customerid, firstname, lastname
from customer
order by lastname asc;

-- Show the shortest 20 tracks.
select trackid, name, milliseconds
from track
order by Milliseconds asc
limit 20;