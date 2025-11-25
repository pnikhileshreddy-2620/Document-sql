use sakila;

CREATE TEMPORARY TABLE temp_customer_payments AS
SELECT 
    customer_id,
    SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id;

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    t.total_spent
FROM temp_customer_payments t
JOIN customer c 
    ON t.customer_id = c.customer_id
ORDER BY t.total_spent DESC
LIMIT 10;



create temporary table city as (
select  c.first_name,c.last_name, c.email  from customer as c
left join address as a   on c.address_id =a.address_id
left join city as cc     on a.city_id = cc.city_id
where city ='London'
);

select * from city;

create temporary table temp_high_payments as
(
select  p.customer_id,sum(amount)  from payment as p 
group by p.customer_id
having sum(amount)>150
);
select * from temp_high_payments ;

create temporary table temp_top_movies as (
select  f.film_id,f.title,count(r.inventory_id) as top_movis from film as f
left join inventory as i on f.film_id = i.film_id
left join rental as r on i.inventory_id =r.inventory_id
group by f.film_id
having top_movis >30
);
select * from temp_top_movies order by top_movis  desc limit 10;



create temporary table temp_late_returns as 
(
select rental_id,customer_id,rental_date,return_date,DATEDIFF(return_date,rental_date) as days_late from rental 
having DATEDIFF(return_date,rental_date) -3 >0
);
select * from temp_late_returns;

create temporary table temp_staff_collection as
(
select s.staff_id,concat(s.first_name,'  ',s.last_name ) as  full_name, sum(p.amount) from staff as s 
left join payment as p on s.staff_id= p.staff_id 
group by s.staff_id
having sum(p.amount)>5000
);
select * from temp_staff_collection;
















select * from temp_customer_payments