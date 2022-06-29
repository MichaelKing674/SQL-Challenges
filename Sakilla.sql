USE sakila;
#Challenge1
SELECT first_name,last_name FROM actor;
#Challenge2
SELECT last_name FROM actor WHERE first_name = 'John';
#Challenge3
SELECT first_name,last_name 
FROM actor WHERE last_name = 'Neeson';
#Challenge4
SELECT actor_id,first_name,last_name 
FROM actor WHERE actor_id%10 = 0;
#Challenge5
SELECT description FROM film WHERE film_id = 100;
#Challenge6
SELECT title,rating FROM film WHERE rating = 'R';
#Challenge7
SELECT title,rating FROM film WHERE rating != 'R';
#Challenge8
SELECT title, length AS leng_of_film 
FROM film ORDER BY length ASC LIMIT 10;
#Challenge9
SELECT title, length AS leng_of_film 
FROM film WHERE length=(
	SELECT MAX(length) FROM film);
#Challenge10
SELECT title FROM film WHERE special_features LIKE '%Deleted%';
#Challenge11
SELECT last_name 
FROM actor GROUP BY last_name 
HAVING count(last_name)=1 ORDER BY last_name DESC;
#Challenge12
SELECT last_name, count(*) 
FROM actor GROUP BY last_name 
HAVING count(last_name)>1 ORDER BY count(last_name) DESC;
#Challenge13
SELECT a.first_name,a.last_name, count(last_name) AS No_of_films
FROM actor a
JOIN film_actor f
ON a.actor_id = f.actor_id
GROUP BY last_name
HAVING count(last_name)
ORDER BY count(last_name) DESC;
#Challenge14
SELECT i.inventory_id,f.title,r.rental_date, DATE_ADD(rental_date,INTERVAL rental_duration DAY) AS ReturnDate
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE f.title = 'ACADEMY DINOSAUR'
AND return_date IS NULL;
#Challenge15
SELECT avg(length) AS AverageRunTime FROM film;
#Challenge16
SELECT c.name,avg(f.length) AS AverageRunTime
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY name;
#Challenge17
SELECT title,description 
FROM film WHERE description LIKE '%robot%';
#Challenge18
SELECT count(film_id) FROM film WHERE release_year = 2010;
#Challenge19
SELECT f.title,c.name AS Genre
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
WHERE c.name = 'Horror';
#Challenge20
SELECT staff_id,first_name,last_name 
FROM staff WHERE staff_id = 2;
#Challenge21
SELECT f.title,a.first_name,a.last_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE a.last_name = 'Costner';
#Challenge22
SELECT DISTINCT count(country) FROM country;
#Challenge23
SELECT name FROM language ORDER BY name DESC;
#Challenge24
SELECT first_name,last_name 
FROM actor WHERE last_name LIKE '%son'
GROUP BY first_name 
ORDER BY first_name ASC;
#Challenge25
SELECT c.name,count(title) AS Number_of_films
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY name
ORDER BY count(title) DESC;







