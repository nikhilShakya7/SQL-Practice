-- Show customer name and invoice date.
select c.firstname, 
		c.lastname, 
        i.invoicedate
from customer c
join invoice i
on i.CustomerId=c.CustomerId;

-- Show customer name and invoice total.
select c.firstname, 
		c.lastname, 
        i.total
from customer c
join invoice i
on i.CustomerId=c.CustomerId;

-- Show track name and album title.
select t.name as track_name,
		a.title as album_title
from album a
join track t
on t.AlbumId=a.AlbumId;

-- Show track name and artist name.
select a.name as artist_name,
		t.name as track_name
from artist a
join album al
on al.ArtistId= a.ArtistId
join track t
on al.albumid= t.AlbumId;

-- Show track name and genre.
select t.name as track_name,
		g.name as genre_name
from track t
join genre g
on g.genreid=t.genreid;

-- Show album title and artist name.
select al.title, ar.name
from album al
join artist ar
on ar.artistid=al.artistid;

-- Show invoice number and purchased track names.
select i.invoiceid, t.name
from invoice i
join invoiceline il
on il.InvoiceId=i.InvoiceId
join track t
on t.trackid = il.TrackId;

-- Show invoice number, customer name, and total.
select i.invoiceid, 
	c.FirstName,
    c.LastName,
    i.total
from invoice i
join customer c
on c.CustomerId=i.CustomerId;

-- Show employee name and customers assigned to them.
SELECT e.FirstName,
       e.LastName,
       c.FirstName AS customer_first_name,
       c.LastName AS customer_last_name
FROM Employee e
JOIN Customer c
ON e.EmployeeId = c.SupportRepId;

-- Find artists who have no albums.
select ar.artistid,
	    ar.name, 
		al.title
from artist ar
left join album al
on al.artistid=ar.artistid
where al.albumid is null;

-- Find albums with no tracks.
select al.title, 
	   t.name
from album al
left join track t
on al.albumid=t.albumid
where t.trackid is null;

-- Find customers who never made a purchase.
select c.customerid, 
		c.firstname,
        c.lastname,
        i.total
from customer c
left join invoice i
on i.customerid= c.customerid
where i.invoiceid is null;

-- Find genres with no tracks.
select g.genreid, 
		g.name
from genre g
left join track t
on g.genreid=t.genreid
where t.trackid is null;

        
