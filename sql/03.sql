/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */
SELECT DISTINCT customer.customer_id
FROM customer
JOIN rental on customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id  = inventory.inventory_id
WHERE inventory.film_id IN
    (SELECT film.film_id
    FROM film
    JOIN inventory ON film.film_id = inventory.film_id
    JOIN rental ON inventory.inventory_id = rental.inventory_id
    JOIN payment ON rental.rental_id = payment.rental_id
    GROUP BY film.film_id
    ORDER BY sum(payment.amount) DESC
    LIMIT 5)
ORDER BY customer.customer_id;
