SELECT c.customerid,
       c.firstname,
       c.lastname,
       SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i
ON c.customerid = i.customerid
GROUP BY c.customerid,
         c.firstname,
         c.lastname
ORDER BY total_spent DESC
LIMIT 1;

-- Find the artist with the most tracks.
select ar.artistid, 
	   ar.name, 
       count(t.trackid) as total_tracks
from artist ar
join album a
on a.ArtistId=ar.artistid
join track t
on t.AlbumId=a.AlbumId
group by ar.artistid, ar.name
order by total_tracks desc
limit 1;

-- Find the most purchased track.
select t.trackid, 
		t.name, 
        count(i.invoicelineid) as total_purchase
from track t
join invoiceline i
on t.TrackId=i.trackid
group by t.TrackId,t.Name
order by total_purchase desc
limit 9;

-- Find the most purchased album.
select a.albumid, 
		a.title,
        count(i.invoicelineid) as most_purchase
from album a
join track t
on t.albumid=a.AlbumId
join invoiceline i
on i.TrackId=t.TrackId
group by a.AlbumId, a.title
order by most_purchase desc
limit 1;

-- Find the country generating the highest revenue.
select c.country, 
		sum(i.total) as total_revenue
from customer c
join invoice i
on i.CustomerId=c.CustomerId
group by c.country 
order by total_revenue desc
limit 1;

-- Find the artist with the highest revenue.
SELECT ar.artistid,
       ar.name AS artist_name,
       SUM(il.unitprice * il.quantity) AS total_revenue
FROM artist ar
JOIN album al
ON ar.artistid = al.artistid
JOIN track t
ON al.albumid = t.albumid
JOIN invoiceline il
ON t.trackid = il.trackid
GROUP BY ar.artistid, ar.name
ORDER BY total_revenue DESC
LIMIT 1;
      




