use sakila;
Select * from actor;
Select * from address;
Select * from category;
Select * from city;
Select * from country;
Select * from customer;
Select * from film;
Select * from film_actor;
Select * from film_category;
Select * from film_text;
Select * from inventory;
Select * from language;
Select * from payment;
Select * from rental;
Select * from staff;
Select * from store;

-- Task 1---
Select * from actor;

-- Task 2i--- 
SELECT first_name, COUNT(*) AS Count FROM actor GROUP BY first_name;

-- Task 2ii---
SELECT first_name, COUNT(*) AS Count FROM actor GROUP BY first_name HAVING COUNT(*) = 1;

-- Task 3i--- 
Select last_name, COUNT(*) AS Count FROM actor Group By last_name;

-- Task 3ii---
SELECT last_name, COUNT(*) AS Count FROM actor GROUP BY last_name HAVING COUNT(*) = 1;

-- Task 4i---
SELECT film_id, title, rating FROM film WHERE rating = 'R';

-- Task 4ii---
Select film_id, title, rating From film where NOT rating = "R";

-- Task 4iii---
Select film_id, title, rating From film where rating = "G";

-- Task 5i---
Select film_id, title, replacement_cost From film where replacement_cost<=11;

-- Task 5ii---
Select film_id, title, replacement_cost From film where replacement_cost between 11 and 20;

-- Task 5iii---
Select film_id, title, replacement_cost from film order by replacement_cost desc; 

-- Task 6---
SELECT film.title, COUNT(actor.actor_id) AS actor_count FROM film JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id GROUP BY film.film_id ORDER BY actor_count DESC LIMIT 3;

-- Task 7---
Select title from film where title like 'K%' or title like 'Q%';

-- Task 8---
SELECT actor.actor_id, actor.first_name, actor.last_name FROM actor JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film  ON film_actor.film_id = film.film_id WHERE film.title = 'Agent Truman';

-- Task 9--- 
Select film.title from film JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id where category.name = 'Family';

-- Task 10i--- 
SELECT film.rating, MAX(rental_rate) AS max_rental_rate, MIN(rental_rate) AS min_rental_rate, AVG(rental_rate) AS avg_rental_rate
FROM film GROUP BY film.rating ORDER BY avg_rental_rate DESC;

-- Task 10ii---
SELECT film.film_id, title, COUNT(rental_id) AS rental_count FROM rental JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id GROUP BY film.film_id, title ORDER BY rental_count DESC;

-- Task 11---
SELECT category.name AS category_name, AVG(film.replacement_cost - film.rental_rate) AS cost_rate_difference FROM film
JOIN film_category ON film.film_id = film_category.film_id JOIN category ON film_category.category_id = category.category_id
GROUP BY category_name HAVING AVG(film.replacement_cost - film.rental_rate) > 15;

-- Task 12---
SELECT category.name AS category_name, COUNT(film.film_id) AS movie_count FROM category
JOIN film_category ON category.category_id = film_category.category_id JOIN film ON film_category.film_id = film.film_id
GROUP BY category_name HAVING movie_count > 70;