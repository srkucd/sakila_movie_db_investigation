/*
We would like to know who were our top 10 paying customers, how many payments they made on a monthly basis during 2007, 
and what was the amount of the monthly payments. Can you write a query to capture the customer name, month and year of payment,
and total payment amount for each month by these top 10 paying customers?

Check your Solution:
The following table header provides a preview of what your table should look like. The results are sorted first by customer name 
and then for each month. As you can see, total amounts per month are listed for each customer.
*/

SELECT DATE_TRUNC('month',payment_date) AS pay_mon,
       fullname,
       COUNT(*) AS pay_countpermon,
       SUM(amount)
       FROM
(SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS fullname,
       SUM(p.amount) AS pay_amount
FROM customer AS c
LEFT JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY fullname,c.customer_id
ORDER BY pay_amount DESC
LIMIT 10) AS temp
RIGHT JOIN payment AS p ON temp.customer_id = p.customer_id
WHERE fullname IS NOT NULL
GROUP BY pay_mon,fullname
ORDER BY fullname, pay_mon;
