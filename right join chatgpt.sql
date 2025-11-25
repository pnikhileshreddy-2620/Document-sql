use sakila;

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    COUNT(p.payment_id) AS no_of_transactions,
    COALESCE(SUM(p.amount), 0) AS total_amount
FROM customer AS c
RIGHT JOIN payment AS p 
    ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id, full_name
ORDER BY 
    no_of_transactions DESC;
    
    
    
select 
r.rental_id,r.rental_date,r.return_date,s.staff_id,s.email,concat(s.first_name,' ',s.last_name) as full_name
from rental as r
right join staff as s on r.staff_id=s.staff_id;

SELECT 
    r.rental_id,
    r.rental_date,
    r.return_date,
    s.staff_id,
    CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
    s.email
FROM staff AS s
RIGHT JOIN rental AS r
    ON s.staff_id = r.staff_id;

SELECT 
    p.payment_id,
    p.amount,
    p.payment_date,
    p.staff_id,
    CONCAT(s.first_name, ' ', s.last_name) AS staff_name
FROM staff AS s
RIGHT JOIN payment AS p
    ON s.staff_id = p.staff_id;




select i.inventory_id,i.store_id,f.title from film as f
right join inventory as i on f.film_id=i.film_id
order by i.inventory_id;


select r.rental_id,r.return_date,concat(c.first_name, c.last_name) as full_name from customer as c
right join rental as r on
c.customer_id = r.customer_id





