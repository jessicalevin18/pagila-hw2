/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature

SELECT actor.first_name, actor.last_name FROM(
SELECT film_id
FROM (
    SELECT film.title, film_id, unnest(film.special_features) as special_feature
    FROM film
) AS subquery
WHERE special_feature = 'Behind the Scenes')
LEFT JOIN film_actor 
ORDER BY title;
*/
SELECT DISTINCT (actor_list.first_name || ' ' || actor_list.last_name) AS "Actor Name"
FROM (
    SELECT film.title, film_id, unnest(film.special_features) as special_feature
    FROM film
) AS subquery
JOIN (
    SELECT film_actor.film_id, actor.first_name, actor.last_name
    FROM film_actor
    JOIN actor USING (actor_id)
) AS actor_list
USING (film_id)
WHERE special_feature = 'Behind the Scenes';
