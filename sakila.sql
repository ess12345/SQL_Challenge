USE sakila;

-- List all actors.
SELECT first_name, last_name
FROM actor;
-- Find the surname of the actor with the forename 'John'.
SELECT last_name
FROM actor
WHERE first_name = 'john' ;
-- Find all actors with surname 'Neeson'.
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Neeson';
-- Find all actors with ID numbers divisible by 10.
SELECT *, (actor_id/10) as DIVISIBLE_ID
FROM actor
WHERE (actor_id/10) IS NOT NULL;
-- What is the description of the movie with an ID of 100?
SELECT film_id, description
FROM film
WHERE film_id = 100;
-- Find every R-rated movie.
select title, rating
from film
WHERE rating = 'R';
-- Find every non-R-rated movie.
select title, rating
from film
WHERE rating != 'R';
-- Find the ten shortest movies.
select title, length
from film
order by length asc
limit 10 ;
-- Find the movies with the longest runtime, without using LIMIT.
select title, length
from film
order by length desc
 ;
-- Find all movies that have deleted scenes.
SELECT title, special_features
FROM film
where special_features LIKE "%Deleted Scenes%";
-- Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name from actor
GROUP BY last_name
HAVING COUNT(last_name)=1
ORDER BY last_name DESC;

-- Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name, COUNT(last_name) AS Frequency 
FROM actor
GROUP BY last_name
HAVING COUNT(last_name)>1
ORDER BY COUNT(last_name) desc;

-- Which actor has appeared in the most films?
SELECT first_name AS First, last_name AS Last, COUNT(actor.actor_id) AS Frequency 
FROM actor
JOIN film_actor ON film_actor.actor_id=actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY COUNT(actor.actor_id) DESC
LIMIT 1;
;
-- When is 'Academy Dinosaur' due?
SELECT title, return_date
FROM rental r
INNER JOIN inventory i ON i.inventory_id = r.inventory_id
INNER JOIN  film f ON f.film_id = i.film_id
WHERE f.title = "Academy Dinosaur"
ORDER BY return_date DESC;

-- What is the average runtime of all films?
SELECT avg(length)
FROM Film;
-- List the average runtime for every film category.
SELECT category.name, avg(film.length)
FROM film_category
JOIN film ON film_category.film_id = film.film_id
JOIN category ON film_category.category_id = category.category_id
group by category.name;

-- List all movies featuring a robot.
SELECT title, description
FROM film
where description like "%robot%";
-- How many movies were released in 2010?
select count(release_year) AS movies_released_2010
from film
where release_year = '2010';
-- Find the titles of all the horror movies.
select category.name, film.title
FROM film_category
JOIN film ON film_category.film_id = film.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'horror';

-- List the full name of the staff member with the ID of 2.
SELECT *
FROM staff
WHERE staff_id = 2;

-- List all the movies that Fred Costner has appeared in.
SELECT actor.first_name, actor.last_name, film.title
FROM film_actor
JOIN film ON film_actor.actor_id = film.film_id
JOIN actor ON film_actor.film_id = actor.actor_id
WHERE actor.first_name = 'Fred' AND actor.last_name = 'Costner' 
;


-- How many distinct countries are there?
SELECT count(country)
FROM country;

-- List the name of every language in reverse-alphabetical order.

select *
from language
order by name desc;
-- List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT *
FROM actor
WHERE last_name LIKE "%son%";
-- Which category contains the most films?

SELECT category.name, count(film.title)
FROM film_category
JOIN film ON film_category.film_id = film.film_id
JOIN category ON film_category.category_id = category.category_id
group by category.name
order by category.name desc
limit 1;