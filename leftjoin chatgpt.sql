use sakila;
/*6*/
select concat(c.first_name,' ',c.last_name) as c_full_name,sum(amount) as total_amount from customer  as c
left join payment  as p on  c.customer_id = p.customer_id
group by c_full_name;


SELECT
  c.customer_id,
  CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
  COALESCE(SUM(p.amount), 0) AS total_amount,
  COUNT(p.payment_id) AS payments_count
FROM customer AS c
LEFT JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name
'''ORDER BY total_amount DESC;'''


/*7*/
select * from film as f
left join inventory as i  on f.film_id = i.film_id ;

/*8*/
select * from staff as s
left join rental as r on s.staff_id = r.staff_id
;
/*9*/
SELECT
    c.name,
    fi.title
FROM
    category c
LEFT JOIN
    film_category as  f ON c.category_id = f.category_id
LEFT JOIN film as fi on f.film_id = fi.film_id
order by c.name
limit 100;

/*10*/
select * from store as s
inner join inventory as i on s.store_id =i.store_id
inner join rental as r on i.inventory_id = r.inventory_id
SELECT
  c.category_id,
  c.name AS category_name,
  GROUP_CONCAT(fi.title ORDER BY fi.title SEPARATOR ', ') AS films_list,
  COUNT(fi.film_id) AS films_count
FROM category AS c
LEFT JOIN film_category AS fc ON c.category_id = fc.category_id
LEFT JOIN film AS fi ON fc.film_id = fi.film_id
GROUP BY c.category_id, category_name
ORDER BY films_count DESC
LIMIT 100;



