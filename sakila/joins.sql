USE sakila;
-- Inner joins
SELECT c.first_name,
    p.amount
FROM customer c
    INNER JOIN payment p ON c.customer_id = p.customer_id;
-- Show movies with their language.
SELECT f.title,
    l.name
FROM film f
    INNER JOIN language l ON f.language_id = l.language_id;
-- Customer with Address
SELECT c.first_name,
    c.last_name,
    a.address
FROM customer c
    INNER JOIN address a ON c.address_id = a.address_id;
-- Show customer names and email.
SELECT c.first_name,
    c.last_name,
    c.email
FROM customer c;
-- Show movie titles and language.
SELECT f.title,
    l.name
FROM language l
    INNER JOIN film f ON f.language_id = l.language_id;
-- Show customer names and addresses.
SELECT c.first_name,
    c.last_name,
    a.address
FROM customer c
    JOIN address a ON c.address_id = a.address_id;
-- Show customer names and city.
SELECT c.first_name,
    c.last_name,
    ci.city
FROM customer c
    JOIN address a ON c.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id;
-- Show customer names and country.
SELECT c.first_name,
    c.last_name,
    co.country
FROM customer c
    JOIN address a ON c.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id
    JOIN country co ON ci.country_id = co.country_id;
-- Show customer names and payment amounts.
SELECT c.first_name,
    c.last_name,
    p.amount
FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id;
-- Show customer names and rental dates.
SELECT c.first_name,
    c.last_name,
    r.rental_date
FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id;
-- Show customer names and movie titles.
SELECT c.first_name,
    c.last_name,
    f.title
FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
WHERE c.customer_id = 45;
-- Show movie titles and actor names.
SELECT f.title,
    a.first_name,
    a.last_name,
    a.actor_id
FROM film f
    JOIN film_actor fa ON f.film_id = fa.film_id
    JOIN actor a ON a.actor_id = fa.actor_id
WHERE f.film_id = 8;
-- Show customer name, movie title, rental date, and payment amount.
SELECT c.first_name,
    c.last_name,
    f.title,
    r.rental_date,
    p.amount
FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN inventory i ON i.inventory_id = r.inventory_id
    JOIN film f ON f.film_id = i.inventory_id
    JOIN payment p ON r.rental_id = p.rental_id;
-- Show every actor who acted in more than 20 films.
SELECT a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS total_films
FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id,
    a.first_name,
    a.last_name
HAVING COUNT(fa.film_id) > 20;
-- Find customers who never rented a movie.
SELECT c.first_name,
    c.last_name
FROM customer c
    LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL;
--  Find customers who never made a payment.
SELECT c.first_name,
    c.last_name
FROM customer c
    LEFT JOIN payment p ON c.customer_id = p.customer_id
WHERE p.payment_id IS NULL;
--  Find films that have never been rented.
SELECT f.film_id,
    f.title
FROM film f
    LEFT JOIN inventory i ON f.film_id = i.film_id
    LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;
--  Find actors who never acted in a film.
SELECT a.first_name,
    a.last_name
FROM actor a
    LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
    LEFT JOIN film f ON f.film_id = fa.film_id
WHERE fa.film_id IS NULL;
-- Find categories that have no films.
SELECT c.name
FROM category c
    LEFT JOIN film_category fc ON c.category_id = fc.category_id
    LEFT JOIN film f ON f.film_id = fc.film_id
WHERE f.film_id IS NULL;
-- Verify which customer rented "ACADEMY DINOSAUR".
SELECT c.first_name,
    c.last_name,
    c.customer_id,
    f.title
FROM customer c
    INNER JOIN rental r ON c.customer_id = r.customer_id
    INNER JOIN inventory i ON i.inventory_id = r.inventory_id
    INNER JOIN film f ON f.film_id = i.film_id
WHERE f.title = 'ACADEMY DINOSAUR';
-- Verify the payment made for "ACADEMY DINOSAUR".
SELECT f.title,
    c.first_name
FROM film f
    JOIN inventory i ON i.film_id = f.film_id
    JOIN rental r ON r.inventory_id = i.inventory_id
    JOIN customer c ON c.customer_id = r.customer_id
WHERE c.customer_id = 48;
-- Show all payments made by customer 20 .
SELECT p.amount,
    c.first_name,
    c.last_name
FROM payment p
    JOIN customer c ON p.customer_id = c.customer_id
WHERE c.customer_id = 20;
-- Show all actors in the movie "ACADEMY DINOSAUR".
SELECT a.first_name,
    a.last_name,
    f.title
FROM actor a
    JOIN film_actor fa ON fa.actor_id = a.actor_id
    JOIN film f ON f.film_id = fa.film_id
WHERE f.title = 'ACADEMY DINOSAUR';
-- Show every rental with:Customer name Movie title Rental date Payment amount
SELECT c.first_name,
    c.last_name,
    f.title,
    r.rental_date,
    p.amount
FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN payment p ON r.rental_id = p.rental_id
    JOIN inventory i ON i.inventory_id = r.inventory_id
    JOIN film f ON f.film_id = i.film_id;
-- Find customers who rented more than 30 movies.
SELECT c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(r.rental_id) > 30;
-- Find the total amount paid by each customer.
SELECT c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_payment
FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id,
    c.first_name,
    c.last_name;
-- Find customers who spent more than $100.
SELECT c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_payment
FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(p.amount) > 150;
-- Find the total revenue generated by each store.Tables: payment, staff, store
SELECT s.store_id,
    SUM(p.amount) AS total_revenue
FROM store s
    JOIN staff st ON s.store_id = st.store_id
    JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;
-- Find the total payment collected by each staff member.
SELECT s.staff_id,
    s.first_name,
    s.last_name,
    SUM(p.amount) AS total_amount
FROM staff s
    JOIN payment p ON s.staff_id = p.staff_id
GROUP BY staff_id;
-- Find the total payment for customer 10.
SELECT c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount)
FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING c.customer_id = 10;
-- Find the customer who made the highest single payment.
SELECT c.customer_id,
    c.first_name,
    c.last_name,
    p.amount
FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
ORDER BY p.amount DESC
LIMIT 1;
-- Find customers who have never made a payment.
SELECT c.customer_id,
    c.first_name,
    c.last_name,
    p.amount
FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
WHERE p.amount = NULL;
-- Find customers who have spent exactly $0.
SELECT c.customer_id,
    c.first_name,
    c.last_name,
    p.amount
FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
WHERE p.amount = 0;
-- Find movies that have never been rented.
SELECT f.film_id,
    f.title
FROM film f
    LEFT JOIN inventory i ON f.film_id = i.film_id
    LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;
-- Find the average payment made by each customer.
SELECT c.customer_id,
    c.first_name,
    c.last_name,
    AVG(p.amount) AS average_amounr
FROM customer c
    JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id;
-- Find customers whose average payment is greater than $5.
SELECT c.customer_id,
    c.first_name,
    c.last_name,
    AVG(p.amount) AS average_amounr
FROM customer c
    JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING AVG(p.amount) > 5;
-- Find the average rental duration of all films.
SELECT title,
    AVG(rental_duration)
FROM film
GROUP BY film_id;
-- Find the movie with the highest replacement cost.
SELECT film_id,
    title,
    replacement_cost
FROM film
ORDER BY replacement_cost DESC
LIMIT 1;
-- Find the average payment processed by each staff member.
SELECT s.staff_id,
    s.first_name,
    s.last_name,
    AVG(p.amount)
FROM staff s
    JOIN payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id;
-- Find the total replacement cost of films in each category.
SELECT c.name AS category,
    SUM(f.replacement_cost) AS total_replacement_cost
FROM film AS f
    JOIN film_category AS fc ON f.film_id = fc.film_id
    JOIN category AS c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY c.name;
-- Show movie title, rental rate, and language.
SELECT f.title,
    f.rental_rate,
    l.name
FROM film f
    JOIN language l ON f.language_id = l.language_id;
-- Show customer name, email, city, and store ID.
SELECT cu.first_name,
    cu.email,
    ci.city,
    cu.store_id
FROM customer cu
    INNER JOIN address a ON cu.address_id = a.address_id
    INNER JOIN city ci ON ci.city_id = a.city_id;
-- Show movie title, category, and language.
SELECT f.title,
    c.name AS category,
    l.name AS language
FROM film f
    JOIN language l ON l.language_id = f.language_id
    JOIN film_category fc ON fc.film_id = f.film_id
    JOIN category c ON c.category_id = fc.category_id;
-- Show actor name, movie title, and movie language.
SELECT a.first_name,
    a.last_name,
    f.title,
    l.name
FROM actor a
    JOIN film_actor fa ON fa.actor_id = a.actor_id
    JOIN film f ON f.film_id = fa.film_id
    JOIN language l ON l.language_id = f.language_id;
-- Show customer name, staff member who served them, and payment amount.
SELECT c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    s.first_name AS staff_first_name,
    s.last_name AS staff_last_name,
    p.amount AS payment
FROM payment AS p
    JOIN customer AS c ON p.customer_id = c.customer_id
    JOIN staff AS s ON p.staff_id = s.staff_id;
-- Find categories that have no movies.
SELECT c.name
FROM category AS c
    LEFT JOIN film_category AS fc ON c.category_id = fc.category_id
WHERE fc.film_id IS NULL;
-- Find languages that are not used by any movie.
select l.name
from language l
    left join film f on l.language_id = f.language_id
where f.film_id is null;
-- Find addresses that are not assigned to any customer.
select a.address,
    a.address2
from address a
    left join customer c on c.address_id = a.address_id
where customer_id is null;
-- Find inventory items that have never been rented.
select i.inventory_id
from inventory i
    left join rental r on i.inventory_id = r.inventory_id
where rental_id is null;
-- Find staff members who never processed a payment.
select s.first_name,
    s.last_name,
    p.amount
from staff s
    left join payment p on s.staff_id = p.staff_id
where payment_id is null;
-- Find the customer who rented movies from the largest number of different categories.
SELECT c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT fc.category_id) AS category_count
FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film_category fc ON i.film_id = fc.film_id
GROUP BY c.customer_id,
    customer_name
ORDER BY category_count DESC
LIMIT 1;