/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */
SELECT
    "rank",
    title,
    revenue,
    "total revenue",
    to_char(100 * "total revenue" / sum(revenue) OVER (), 'FM900.00') AS "percent revenue"
FROM (
    SELECT
        "rank",
        title,
        revenue,
        sum(revenue) OVER (ORDER BY "rank") as "total revenue"
    FROM (
        SELECT
            RANK() OVER (ORDER BY revenue DESC) as "rank",
            title,
            revenue
        FROM (
            SELECT
                f.title,
                COALESCE(SUM(p.amount), 0.00) as revenue
            FROM film f
            LEFT JOIN
                inventory i ON f.film_id = i.film_id
            LEFT JOIN
                rental r ON i.inventory_id = r.inventory_id
            LEFT JOIN
                payment p ON r.rental_id = p.rental_id
            GROUP BY
                f.title
        ) AS subquery
    ) AS subquery2
) AS subquery3
ORDER BY "rank", title;
