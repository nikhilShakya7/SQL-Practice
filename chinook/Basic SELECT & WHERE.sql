-- Show all customers from Brazil.
select * 
from customer 
where country = 'Brazil';

-- Find customers whose first name starts with A.
select firstname, lastname, customerID 
from customer
where firstname like 'A%';

-- Find customers who don't have a fax number.
select firstname, lastname, customerID, fax 
from customer
where fax = null;

-- Show tracks longer than 5 minutes.
select trackid, name , milliseconds 
from track
where milliseconds > 300000;

-- Find tracks whose unit price is greater than 1.50.
select trackid, name, unitprice
from track
where unitprice > 1.50;

-- Find all Rock songs.
select t.trackid, t.name, g.name as genre
from track t
join genre g
on t.genreid=g.genreid
where g.name='Rock';

-- Find albums whose title contains Live.
select * 
from album 
where title like '%live%';

-- Show employees hired after 2003.
select * 
from employee
where hiredate > '2003-12-31';

-- Find customers from USA or Canada.
select customerid, firstname, lastname, country 
from customer 
where country = 'USA' or country= 'Canada';

-- Find the 10 longest tracks
select trackid, name, milliseconds
from track 
order by milliseconds desc
limit 10;




