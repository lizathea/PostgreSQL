SELECT DISTINCT first_name, last_name, email FROM customer;

-- DISTINCT 
SELECT DISTINCT (release_year) FROM film;

SELECT DISTINCT rental_rate FROM film;

SELECT * FROM film;

SELECT DISTINCT rating FROM film;

-- COUNT
SELECT COUNT(first_name) FROM customer;

SELECT COUNT(*) FROM customer;

SELECT COUNT(*) FROM payment;

SELECT COUNT(DISTINCT(amount)) FROM payment;

-- WHERE

SELECT * FROM customer 
WHERE first_name = 'Jared';

SELECT * FROM film
WHERE rental_rate > 4;

-- AND
SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99;

SELECT COUNT(title) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';

-- OR
SELECT COUNT(title) FROM film
WHERE rating = 'R' OR rating = 'PG-13';

-- CHALLENGE
SELECT email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

-- CHALLENGE 
SELECT description FROM film
WHERE title = 'Outlaw Hanky';

-- CHALLENGE
SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

-- ORDER BY
SELECT * FROM customer 
ORDER BY first_name DESC;

SELECT store_id, first_name, last_name FROM customer 
ORDER BY store_id DESC, first_name ASC;

-- LIMIT
SELECT * FROM payment
WHERE amount != 0
ORDER BY payment_date DESC
LIMIT 5;

-- CHALLENGE
SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;

-- CHALLENGE
SELECT title , length FROM film
ORDER BY length ASC
LIMIT 5;

-- CHALLENGE
SELECT COUNT(title) FROM film
WHERE length <= 50; 

-- BETWEEN
SELECT * FROM payment
ORDER BY amount NOT BETWEEN 8 AND 9;

SELECT * FROM payment
ORDER BY payment_date BETWEEN '2007-02-01' AND '2007-02-15';

-- IN
SELECT DISTINCT(amount) FROM payment
LIMIT 2;

SELECT * FROM payment
WHERE amount IN (0.99, 1.98, 1.99);

SELECT COUNT(*) FROM payment
WHERE amount IN (0.99, 1.98, 1.99);

SELECT * FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);

SELECT * FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie');

-- LIKE AND ILIKE
SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

SELECT * FROM customer
WHERE first_name LIKE '_her%';

SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;

-- CHALLENGE
SELECT COUNT(amount) FROM payment
WHERE amount > 5;

-- CHALLENGE
SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

-- CHALLENGE
SELECT COUNT(DISTINCT(district)) FROM address;

-- CHALLENGE
SELECT DISTINCT(district) FROM address;

-- CHALLENGE
SELECT COUNT(*) FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

-- CHALLENGE
SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';

-- AGGREGATE FUNCTION
SELECT MIN(replacement_cost) FROM film;

SELECT MAX(replacement_cost) FROM film;

SELECT ROUND(AVG(replacement_cost), 2) FROM film;

SELECT SUM(replacement_cost) FROM film;

-- GROUP BY 
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC;

SELECT customer_id, staff_id , SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id;

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;

-- CHALLENGE
SELECT staff_id, COUNT(*) FROM payment
GROUP BY staff_id;

SELECT rating, ROUND(AVG(replacement_cost),2) FROM film
GROUP BY rating
ORDER BY AVG(replacement_cost) DESC;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

-- HAVING
SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

-- CHALLENGE
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40;

SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2 
GROUP BY customer_id
HAVING SUM(amount) > 100;

-- ASSESSMENT 1
SELECT customer_id , SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110;

SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';

SELECT customer_id, first_name, last_name FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
GROUP BY customer_id
ORDER BY customer_id DESC
LIMIT 1;

-- JOINS
-- AS
SELECT COUNT(*) AS num_transaction FROM payment;

SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id;

SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT customer_id, amount AS customer
FROM payment
WHERE amount > 2;
