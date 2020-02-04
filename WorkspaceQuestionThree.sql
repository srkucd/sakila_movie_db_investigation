/*
Question 3
Finally, provide a table with the family-friendly film category, each of the quartiles, 
and the corresponding count of movies within each combination of film category for each 
corresponding rental duration category. The resulting table should have three columns:

Category
Rental length category
Count
*/

SELECT name,
       standard_quartile,
       COUNT(title)
       FROM
(SELECT *,
        NTILE(4) OVER (ORDER BY rental_duration) AS standard_quartile
        FROM
(SELECT f.title,
       c.name,
       f.rental_duration
FROM film_category AS fc
LEFT JOIN category AS c ON fc.category_id = c.category_id
LEFT JOIN film AS f ON fc.film_id = f.film_id
WHERE c.name = 'Animation' OR c.name = 'Children' OR c.name = 'Classics' OR c.name = 'Comedy' OR c.name = 'Family' OR c.name = 'Music') AS temp) AS temp2
GROUP BY name, standard_quartile
ORDER BY name, standard_quartile;
