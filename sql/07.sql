/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 07b you will use the LEFT JOIN clause.
 *
 * NOTE:
 * This is the last problem that will require you to use a particular method to solve the query.
 * In future problems, you may choose whether to use the LEFT JOIN or NOT IN clause if they are more applicable.
 */

SELECT f.title
    FROM film f
    WHERE f.film_id IN ( 
        SELECT i.film_id FROM inventory i)
    AND f.film_id NOT IN
    (SELECT i.film_id 
        FROM inventory i
        JOIN rental r ON i.inventory_id = r.inventory_id
        JOIN customer c ON r.customer_id = c.customer_id
        JOIN address a ON c.address_id = a.address_id
        JOIN city ON a.city_id = city.city_id
        JOIN country ON city.country_id = country.country_id
        WHERE country.country_id = '103')
    ORDER BY f.title;
