SELECT *
FROM payments
WHERE DAY(payment_date) IN (5, 6)
LIMIT 25;


SELECT creditLimit
FROM customers
WHERE country = 'USA'
AND phone LIKE '%5555%'
ORDER BY creditLimit DESC
LIMIT 1 OFFSET 4;