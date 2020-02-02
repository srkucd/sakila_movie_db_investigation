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
