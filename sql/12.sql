/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
SELECT DISTINCT title
FROM (
    SELECT film.title, film.film_id, unnest(film.special_features) as special_feature
    FROM film
) as t
WHERE special_feature IN ('Trailers', 'Behind the Scenes')
GROUP BY title
HAVING COUNT(DISTINCT special_feature) = 2
ORDER BY title;
