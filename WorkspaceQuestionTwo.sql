/*

Question 2
Now we need to know how the length of rental duration of these family-friendly movies compares to the duration that all movies are 
rented for. 
Can you provide a table with the movie titles and divide them into 4 levels (first_quarter, second_quarter, third_quarter, and 
final_quarter) based on the quartiles (25%, 50%, 75%) of the rental duration for movies across all categories? Make sure to also 
indicate the category that these family-friendly movies fall into.

Check Your Solution
The data are not very spread out to create a very fun looking solution, but you should see something like the following if you 
correctly split your data. You should only need the category, film_category, and film tables to answer this and the next questions. 

HINT: One way to solve it requires the use of percentiles, Window functions, subqueries or temporary tables.

*/

SELECT *,
        NTILE(4) OVER (ORDER BY rental_duration) AS standard_quartile
        FROM
(SELECT f.title,
       c.name,
       f.rental_duration
FROM film_category AS fc
LEFT JOIN category AS c ON fc.category_id = c.category_id
LEFT JOIN film AS f ON fc.film_id = f.film_id
WHERE c.name = 'Animation' OR 
      c.name = 'Children' OR 
      c.name = 'Classics' OR 
      c.name = 'Comedy' OR 
      c.name = 'Family' OR 
      c.name = 'Music') AS temp;
