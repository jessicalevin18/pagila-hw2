/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
SELECT title from (
SELECT unnest(special_features) IN ('Trailers')
UNION
SELECT title FROM film WHERE rating IN ('G')
 ) AS t
ORDER BY title;
*/
SELECT title
FROM film
WHERE rating = 'G'
AND 'Trailers' = ANY(special_features)
ORDER BY title;
