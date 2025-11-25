use sakila;
select * from customer;
select * from address;

select * from payment  where amount =5.99;

select count(amount),amount from payment  group by amount having amount >5;


select count(customer_id),customer_id customer from payment   group by customer_id having
sum(amount)>8;

select customer_id,count(customer_id) from payment
group by customer_id
having count(customer_id)>10;

select * from payment where customer_id =1;



select * from payment;
select sum(amount) from payment;

select sum(amount), staff_id from payment 
group by staff_id
having sum(amount)>3000;


select * from payment;

select count(payment_date),payment_date from payment
group by payment_date
having count(payment_date)>100;

select sum(amount),count(*) from payment 
group by amount
having amount50;


select  count(customer_id),customer_id from payment 
group by customer_id
having count(customer_id) >20;

select sum(amount),staff_id from payment
group by staff_id
having sum(amount)>3000;

select count(date(payment_date)), payment_date from payment
group by payment_date
having count(payment_date)>100;

select avg(amount),customer_id from payment
group by customer_id
having avg(amount)>5;


select * from film;
select *from film_category;
select * from category;
select * from inventory;
select * from rental;



select c.name,count(r.rental_id) from category  as c
join film_category as fc on c.category_id=fc.category_id
join film as f on fc.film_id = f.film_id
join inventory as i on f.film_id = i.film_id
join rental as r on i.inventory_id = r.inventory_id
group by c.name
having count(r.rental_id) >1000;


select * from rental;

select datediff(rental_date,return_date) as df, count(*) as occ from rental
group by df
having count(*)>200;






SELECT amount, COUNT(*) AS occurrences, SUM(amount) AS total_amount
FROM payment
GROUP BY amount
HAVING COUNT(*) > 50
ORDER BY occurrences DESC;



