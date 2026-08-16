use sakila;

-- Verify customer 25 exists.
select * from customer
where customer_id=25;

-- Verify customer 25 is active.
select active from customer
where customer_id=25;

-- Find all inactive customers.
select * from customer
where active=0;

-- Find films costing more than $4.
select * from film
where rental_rate > 4;

-- Find all PG-13 movies.
select * from film
where rating = "PG-13";

-- Count customers in each store.
select store_id ,count(*) as num_of_customer from customer
group by store_id;

-- Count rentals for customer 50.
select customer_id, count(*) 
from rental
 where customer_id=50
 group by customer_id;
 
 -- Find the highest payment made.
 select max(amount) as highest_payment from payment;
 
 -- Find the newest payment.
SELECT *
FROM payment
ORDER BY payment_date DESC
LIMIT 1; 
 -- Find all movies starting with "A".
 select * from film
 where title like"A%";
 
 -- Verify a customer was created
 select * from customer
 where customer_id=500;
 
 -- Verify customer 20 belongs to Store 2.
 select * from customer
 where customer_id=20
 and store_id=2;
 
 
 -- Verify a customer is active.
 select * from customer
 where customer_id=5
 and active=1;
 
 -- Verify films with rental duration of 7 days.
 select * from film 
 where rental_duration=7;
 
 -- Admin wants newest payments first.
 select * from payment
 order by payment_date desc;
 
 -- Highest payment first.
 select * from payment
 order by amount desc;
 
 -- Alphabetical customer list.
 select * from customer
 order by first_name;
 
 -- Top 5 highest payments.
 select * from payment
 order by amount
 limit 5;
 
 -- Verify total customers.
 select count(*) from customer as total_customer;
 
 -- Count customers in each store.
 select store_id, count(*)  as total_customer from customer
 group by store_id;
 
 -- Count movies by rating.
 select rating,  count(*) as total_movies from
 film group by rating;
 
 -- Find customers with more than 30 rentals.
 select customer_id, count(*) as rentals
 from rental
 group by customer_id
 having count(*)>30;