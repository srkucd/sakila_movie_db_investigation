/*

Workspace
We have provided a Workspace at the bottom of this page for you to run your queries. Please feel free to use it to write your queries, run them, and export the data to a .csv file.

What are the Question Sets?
We have also provided a set of questions that you are free to consider and include in your Project Submission. These are solely provided for your convenience, and you can choose to use any of the questions in these sets or none at all in your project submission.

If you are unsure what queries to generate (for e.g., what kind of query will require the use of Window Functions), we strongly recommend using questions from the question set.

Question 1
We want to understand more about the movies that families are watching. The following categories are considered family movies: Animation, Children, Classics, Comedy, Family and Music.

Create a query that lists each movie, the film category it is classified in, and the number of times it has been rented out.

Check Your Solution
For this query, you will need 5 tables: Category, Film_Category, Inventory, Rental and Film. Your solution should have three columns: Film title, Category name and Count of Rentals.

The following table header provides a preview of what the resulting table should look like if you order by category name followed by the film title.

*/

SELECT f.title AS film_title,
        c.name AS category_name,
        COUNT(r.rental_id) AS rental_count
 FROM film_category AS fc
LEFT JOIN category AS c ON fc.category_id = c.category_id
 LEFT JOIN film AS f ON fc.film_id = f.film_id
 RIGHT JOIN inventory AS i ON f.film_id = i.film_id
 RIGHT JOIN rental AS r ON r.inventory_id = i.inventory_id
 WHERE c.name = 'Animation' OR c.name = 'Children' OR c.name = 'Classics' OR c.name = 'Comedy' OR c.name = 'Family' OR c.name = 'Music'
 GROUP BY f.title, c.name
 ORDER BY category_name,film_title,rental_count;
