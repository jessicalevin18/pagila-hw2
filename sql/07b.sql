/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */ 
SELECT f.title
FROM (
    SELECT f.title, f.film_id
    FROM film f
    WHERE f.film_id IN (SELECT i.film_id FROM inventory i)
) AS f
LEFT JOIN (
    SELECT i.film_id
    FROM inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN customer c ON r.customer_id = c.customer_id
    JOIN address a ON c.address_id = a.address_id
    JOIN city ON a.city_id = city.city_id
    JOIN country ON city.country_id = country.country_id
    WHERE country.country_id = '103'
) AS sub ON f.film_id = sub.film_id
WHERE sub.film_id IS NULL
ORDER BY f.title;
