-- Count the number of customers in each country.
select count(*), country
from customer
group by country;

-- Find the average track length for each genre.
select  t.genreid, g.name, avg(t.milliseconds) as average_length
from track t
join genre g
on g.genreid=t.genreid
group by g.name, t.genreid;

-- Find the total sales for each customer.
select c.customerid, 
	c.firstname,
    c.lastname,
    sum(i.total)
from customer c
join invoice i
on c.customerid=i.customerid
group by c.customerid;

-- Find the average invoice amount.
select invoiceid, avg(total) as avg
from invoice
group by invoiceid;

-- Find the highest invoice total.
select invoiceid ,total
from invoice
order by total desc
limit 1;

-- Find the lowest invoice total.
select invoiceid, total
from invoice
order by total asc
limit 1;

-- Find customers who spent more than $40.
select c.customerid, 
	c.firstname, 
	c.lastname,
	sum(i.total)
from customer c
join invoice i
on i.customerid=c.customerid
group by c.customerid, c.firstname, c.lastname
having sum(i.total)>40;

-- Count tracks in each album.

 
-- Count albums for each artist.
select ar.artistid, ar.name, count(*) as total_albums
from album al
join artist ar
on ar.artistid=al.artistid
group by ar.artistid, ar.name;

-- Find the average price of tracks by genre.
select g.genreid, 
	g.name as genre,
	avg(t.unitprice) avg_price
from track t
join genre g
on g.genreid=t.genreid
group by g.name, g.genreid;


