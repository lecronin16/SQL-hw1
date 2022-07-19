--How many actors are there with the last name ‘Wahlberg’?
--2
SELECT * FROM actor;
SELECT actor_id
FROM actor
WHERE last_name LIKE 'Wahlberg';

-- How many payments were made between $3.99 and $5.99?
-- 4764
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--What film does the store have the most of? (search in inventory)
--film_id 200
SELECT * FROM inventory;

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

--How many customers have the last name ‘William’?
--0
SELECT * FROM customer;

SELECT customer_id
FROM customer
WHERE last_name LIKE 'William';

--What store employee (get the id) sold the most rentals?
-- staff id 1 sold 36 more

SELECT * FROM rental;

SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id;

--How many different district names are there?
--378

SELECT * FROM address;

SELECT COUNT(DISTINCT district)
FROM address;

--What film has the most actors in it? (use film_actor table and get film_id)
-- film id 508

SELECT COUNT(actor_id), film_id 
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;


--From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
--13
SELECT * FROM customer;

SELECT store_id, customer_id, last_name
FROM customer
WHERE last_name LIKE '%es'
GROUP BY customer_id
HAVING store_id = '1';

SELECT SUM(store_id)
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id
HAVING store_id = '1';

--How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
--3
SELECT * FROM payment;

SELECT amount, COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250
ORDER BY COUNT(rental_id) DESC;


--Within the film table, how many rating categories are there? And what rating has the most
--movies total?
-- 5 rating categories, most moves fall under PG-13

SELECT * FROM film

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;