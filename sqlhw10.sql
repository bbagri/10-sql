USE sakila;

#1a
SELECT first_name, last_name
FROM actor

#1b
SELECT UPPER(CONCAT(first_name, " ", last_name)) AS "Actor Name"
FROM actor

#2a
SELECT actor_id, first_name, last_name
FROM actor WHERE first_name = "Joe"

#2b
SELECT * 
FROM actor 
WHERE last_name LIKE "%GEN%"

#2c
SELECT *
FROM actor
WHERE last_name LIKE "%LI%"
ORDER BY last_name, first_name

#2d
SELECT country_id, country
FROM country
WHERE country IN ("Afghanistan", "Bangladesh", "China")

#3a
ALTER TABLE actor
ADD COLUMN description BLOB

#3b
ALTER TABLE actor
DROP COLUMN description

#4a
SELECT DISTINCT last_name, count(last_name) 
FROM actor 
GROUP BY last_name

#4b
SELECT DISTINCT last_name, count(last_name)
FROM actor
GROUP BY last_name
HAVING last_name >= 2

#4c
UPDATE actor 
SET first_name = "HARPO"
WHERE first_name = "GROUCHO" AND last_name = "WILLIAMS"

#4d
UPDATE actor 
SET first_name = "GROUCHO"
WHERE first_name = "HARPO" AND last_name = "WILLIAMS"

#5a

#6a
SELECT staff.first_name, staff.last_name, address.address, city.city, country.country
FROM staff
INNER JOIN address ON 
staff.address_id = address.address_id
INNER JOIN city ON 
address.city_id = city.city_id
INNER JOIN country ON 
city.country_id = country.country_id

#6b
SELECT staff.first_name, staff.last_name, SUM(payment.amount) AS revenue_recieved
FROM staff
INNER JOIN payment ON 
staff.staff_id = payment.staff_id
WHERE payment.payment_date LIKE "2005-08%"
GROUP BY payment.staff_id

#6c
SELECT title, COUNT(actor_id) AS "Number of Actors"
FROM film 
INNER JOIN film_actor ON 
film.film_id = film_actor.film_id
GROUP BY title

#6d
SELECT title, COUNT(inventory_id) AS "Number of Copies"
FROM film
INNER JOIN inventory ON 
film.film_id = inventory.film_id
WHERE title = "Hunchback Impossible"

#6e
SELECT last_name, first_name, SUM(amount) AS "Total Paid"
FROM payment
INNER JOIN customer ON 
payment.customer_id = customer.customer_id
GROUP BY payment.customer_id
ORDER BY last_name ASC

#7a
SELECT title
FROM film
WHERE language_id IN
(
	SELECT language_id
    FROM language 
    WHERE name = "English"
    AND ((title LIKE "K%") OR (title LIKE "Q%"))
);

#7b
SELECT last_name, first_name
FROM actor
WHERE actor_id IN
(
	SELECT actor_id 
    FROM film_actor
    WHERE film_id IN
	(
		SELECT film_id
        FROM film
        WHERE title = "Alone Trip"
	)
);

#7c
SELECT customer.last_name, customer.first_name, customer.email
FROM customer
INNER JOIN customer_list ON 
customer.customer_id = customer_list.ID
WHERE customer_list.country = "Canada"

#7d
SELECT title 
FROM film
WHERE film_id IN
(
	SELECT film_id
    FROM film_category
    WHERE category_id IN
    (
		SELECT category_id 
        FROM category
        WHERE name = "Family"
	)
);

#7e
SELECT film.title, COUNT(*) AS "Rent Count"
FROM film, inventory, rental
WHERE film.film_id = inventory.film_id AND rental.inventory_id = inventory.inventory_id
GROUP BY inventory.film_id
ORDER BY COUNT(*) DESC, film.title ASC

#7f
SELECT store.store_id, SUM(amount) as revenue
FROM store
INNER JOIN staff ON 
store.store_id = staff.store_id
INNER JOIN payment ON 
payment.staff_id = staff.staff_id
GROUP BY store.store_id

#7g
SELECT store.store_id, city.city, country.country
FROM store
INNER JOIN address ON
store.address_id = address.address_id
INNER JOIN city ON 
address.city_id = city.city_id
INNER JOIN country ON 
city.country_id = country.country_id

#7h
#8a
#8b
#8c
