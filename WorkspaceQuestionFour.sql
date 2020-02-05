/*
Question 1:
We want to find out how the two stores compare in their count of rental orders during every month for all the years we have data for.
Write a query that returns the store ID for the store, the year and month and the number of rental orders each store has fulfilled 
for that month. Your table should include a column for each of the following: year, month, store ID and count of rental orders 
fulfilled during that month.

Check Your Solution
The following table header provides a preview of what your table should look like. The count of rental orders is sorted in descending
order.

HINT: One way to solve this query is the use of aggregations.
*/

SELECT DATE_PART('month',r.rental_date) AS Rental_month,
       DATE_PART('year',r.rental_date) AS Rental_year,
       i.store_id,
       COUNT(r.*) AS Count_rentals
FROM inventory AS i
LEFT JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY rental_month, rental_year, store_id
HAVING DATE_PART('year',r.rental_date) IS NOT NULL
ORDER BY count_rentals DESC;
