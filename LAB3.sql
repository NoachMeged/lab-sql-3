-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT CONCAT(first_name, last_name)) AS total_distinct_names
FROM sakila.actor;
-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select distinct language_id from sakila.film;
-- How many movies were released with "PG-13" rating?
SELECT COUNT(*) AS total_PG_13_movies
FROM sakila.film
WHERE rating = 'PG-13';
-- How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(now(), MIN(DATE(create_date))) AS days_since_creation
FROM sakila.customer;
-- Show rental info with additional columns month and weekday. Get 20.
SELECT rental_date, return_date, last_update,
    DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
    DATE_FORMAT(rental_date, '%W') AS weekday
FROM sakila.rental
LIMIT 20;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT 
    rental_date, 
    return_date, 
    last_update,
    DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
    DATE_FORMAT(rental_date, '%W') AS weekday,
    CASE WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend' ELSE 'workday' END AS day_type
FROM sakila.rental
LIMIT 20;
-- How many rentals were in the last month of activity?
SELECT COUNT(*) AS rental_count
FROM sakila.rental
WHERE DATE_FORMAT(rental_date, '%Y-%m') = DATE_FORMAT((SELECT MAX(rental_date) FROM sakila.rental), '%Y-%m');






