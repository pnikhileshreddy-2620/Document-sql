use sakila;

select * from customer as c
left join payment as p on
c.customer_id= p.customer_id;

select * from film as f
left join inventory as i on
f.film_id=i.film_id;