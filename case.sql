use skaila;

select * from payment;

select payment.payment_id,amount,
case
when amount <3 then 'Low'
when amount between 3 and 6 then 'Medium'
else 'High'
end  as amount_level
from payment;


select customer.customer_id, 
case 
 when  customer_id%2=0  Then 'Even'
 else 'Odd'
 end as odd_even 
 from customer;
 
 
 select rental.rental_id,
 case
 when return_date is not null then 'Return'
 else 'Not Return'
 end as status
 from rental;
 
 
 
 select staff.staff_id,
 case
 when staff_id =1 Then 'Manager'
 when staff_id =2 then  'Assistant'
 else 'Other'
 end as role
 from staff;
 
 /*-----------------------------------------------*/
 
 /*6*/
 
 select 
 amount,
 case
 when amount >10 then 'Premiun'
 when amount >5 then 'Standard'
 else 'Basic'
 end as payment_type
 from payment;
 
 /*7*/
 select rental_date,return_date,
 case
 when datediff(return_date,rental_date) <=1 then 'SHORT'
 when  datediff(return_date,rental_date) between 2 and 5 then 'MEDIUM'
 else 'LONG'
 end as duration_type
 from rental;
 
 select film.title,film.language_id,
 case
    WHEN film.language_id = 1 THEN 'English'
    ELSE 'Other Language'
END  as lang_type

  from film;
 
 
 /*q8*/
 select f.film_id,f.title,f.rating,
 case 
 when f.rating='G' then 'Kids'
 when  f.rating ='PG' then 'Family'
 when f.rating='R'  then 'Adults'
 else 'Other'
 end as rating_group
 from film  as f;
 
 /*q9*/
 
 select c.customer_id,concat(c.first_name,'  ', c.last_name)as full_name,count(p.payment_id) as payment_count ,
 case
 when count(p.payment_id)> 30 then 'Super Active'
 when count(p.payment_id)> 15 then 'Active'
else 'Normal'
end as activity_level 
from customer  as c
left join payment as p on c.customer_id=p.customer_id
group by customer_id,full_name
ORDER BY 
    payment_count DESC;
    
    SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    COUNT(p.payment_id) AS payment_count,
    CASE
        WHEN COUNT(p.payment_id) > 30 THEN 'SUPER ACTIVE'
        WHEN COUNT(p.payment_id) > 15 THEN 'ACTIVE'
        ELSE 'NORMAL'
    END AS activity_level
FROM customer AS c
LEFT JOIN payment AS p 
    ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id, full_name
ORDER BY 
    payment_count DESC;
/*q10*/

USE sakila;

SELECT
  f.film_id,
  f.title,
  COUNT(i.inventory_id) AS inventory_count,
  CASE
    WHEN COUNT(i.inventory_id) > 0 THEN 'In Stock'
    ELSE 'No Stock'
  END AS stock_type
FROM film AS f
LEFT JOIN inventory AS i
  ON f.film_id = i.film_id
GROUP BY f.film_id, f.title
ORDER BY inventory_count DESC, f.title
LIMIT 200;
