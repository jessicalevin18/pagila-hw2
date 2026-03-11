/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */
SELECT unnest(special_features) as special_features , count(*) from film
GROUP BY unnest(special_features)
ORDER BY unnest(special_features);
