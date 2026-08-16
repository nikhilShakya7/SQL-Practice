-- 1. Database Basics & Discovery
-- Select the Sakila database to work with
USE sakila;

-- Display all tables in the Sakila database
SHOW TABLES;

-- Display all available languages
SELECT * FROM language;

-- Retrieve all records from the actor table
SELECT * FROM actor;

-- Retrieve all countries from the country table
SELECT * FROM country;

-- Retrieve all customer records
SELECT * FROM customer;

-- Display all films
SELECT * FROM film;

-- Display only the title and release_year of all films.
SELECT title, release_year FROM film;



-- 2. Filtering with WHERE
-- Retrieve details of the customer with customer_id = 5
SELECT * FROM customer WHERE customer_id = 5;

-- Find all customers whose first name is MARY.
SELECT * FROM customer WHERE first_name = "Mary";

-- Find all customers whose last name is SMITH
SELECT * FROM customer WHERE last_name = 'Smith';

-- Find all customers from store 2.
SELECT * FROM customer WHERE store_id = 2;

-- Get first and last names of customers belonging to store 1
SELECT first_name, last_name FROM customer WHERE store_id = 1;

-- Find customers who are inactive
SELECT * FROM customer WHERE active = 0;

-- Find films whose rental duration is 6 days
SELECT * FROM film WHERE rental_duration = 6;

-- Find films with a rental duration greater than 5 days.
SELECT * FROM film WHERE rental_duration > 5;

-- Find films with rental rate greater than 4
SELECT title FROM film WHERE rental_rate > 4;

-- Find films released in 2006.
SELECT * FROM film WHERE release_year = 2006;

-- Find all films associated with actor_id = 1
SELECT * FROM film_actor WHERE actor_id = 1;

-- Verify customer ID 10 exists.
SELECT * FROM customer WHERE customer_id = 10;

-- Verify customer 10 has rentals.
SELECT * FROM rental WHERE customer_id = 10;

-- Verify customer 10 has payments.
SELECT * FROM payment WHERE customer_id = 10;

-- Find all customers whose first name starts with 'A'.
SELECT * FROM customer WHERE first_name LIKE 'A%';

-- Find actors whose first name starts with P.
SELECT first_name, last_name, actor_id FROM actor WHERE first_name LIKE "P%";

-- Find films whose title contains LOVE.
SELECT film_id, title FROM film WHERE title LIKE "%Love%";

-- Find customers whose email contains sakilacustomer.org.
SELECT first_name, last_name, email FROM customer WHERE email LIKE "%sakilacustomer.org";

-- 3. Sorting & Pagination (ORDER BY / LIMIT)
-- Display all customers sorted alphabetically by first name
SELECT * FROM customer ORDER BY first_name;

-- Display customers ordered by last name in descending order.
SELECT * FROM customer ORDER BY last_name DESC;

-- Display all films ordered by title.
SELECT * FROM film ORDER BY title ASC;

-- Find the top 10 customers by customer_id.
SELECT * FROM customer ORDER BY customer_id ASC LIMIT 10;

-- Display the first 15 films.
SELECT * FROM film LIMIT 15;

-- 4. Basic Aggregations
-- Count the total number of customers
SELECT COUNT(*) FROM customer;

-- Count the total number of films.
SELECT COUNT(*) FROM film;

-- Find the average rental rate. 
SELECT AVG(rental_rate) AS average_rate FROM film;

-- 5. Grouping & Aggregations (GROUP BY)
-- Count customers per store
SELECT store_id, COUNT(*) AS total_customers 
FROM customer 
GROUP BY store_id;

-- Count customers by active status.
SELECT active, COUNT(*) FROM customer 
GROUP BY active;

-- Count how many films belong to each rating (G, PG, PG-13, R, NC-17).
SELECT rating, COUNT(*) AS films 
FROM film 
GROUP BY rating;

-- Find the average rental rate for each rating
SELECT rating, AVG(rental_rate) AS avg_rate 
FROM film 
GROUP BY rating;

-- Find the number of films for each rental rate.
SELECT rental_rate, COUNT(*) AS total_films 
FROM film  
GROUP BY rental_rate;

-- 6. Group Filtering (HAVING) & Complex Aggregations
-- Show ratings having more than 200 films
SELECT rating, COUNT(*) AS total_films 
FROM film 
GROUP BY rating 
HAVING COUNT(*) > 200;

-- Show customers who rented more than 30 movies.
SELECT customer_id, COUNT(*) AS total_rentals
FROM rental
GROUP BY customer_id
HAVING COUNT(*) > 30;

-- Find the rating category with the most films
SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating
ORDER BY total_films DESC
LIMIT 1;


-- 7. Subqueries
-- Find the most expensive rental rate.
SELECT * FROM film 
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

-- Find the lowest rental rate.
SELECT * FROM film 
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film);

-- Find films whose replacement cost is between $15 and $20.
select film_id, replacement_cost, title 
from film
where replacement_cost > 15 and replacement_cost < 20;

-- Find customers whose last name ends with "SON".
select * from customer 
where last_name like "%son";

-- Find films with a rental duration of 3, 5, or 7 days.
select film_id, title, rental_duration 
from film 
where rental_duration = 3 
or rental_duration= 5
or rental_duration=7;

-- Find customers created after 2006-01-01.
select * from customer
where create_date> "2006-01-01";

-- Find all films that are longer than 150 minutes.
select film_id, title, length
from film
where length > 150;

-- Find the number of customers created each year.
SELECT YEAR(create_date) AS year,
       COUNT(*) AS customer_count
FROM customer
GROUP BY YEAR(create_date)
ORDER BY year;

-- Find the average film length for each rating.
select rating, avg(length)
from film
group by rating;

-- Find the total replacement cost of films in each category.
SELECT c.name AS category,
       SUM(f.replacement_cost) AS total_replacement_cost
FROM film AS f
JOIN film_category AS fc
    ON f.film_id = fc.film_id
JOIN category AS c
    ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY c.name;

