use sakila;

select f.title,c.name from film as f
inner join film_category as fc on f.film_id = fc.film_id
inner join category as c on fc.category_id=c.category_id;

select c.first_name,c.last_name,f.title,r.rental_date from customer as c
inner join rental as r on c.customer_id = r.customer_id
inner join inventory as i on r.inventory_id = i.inventory_id
inner join film as f on i.film_id = f.film_id;


select concat(c.first_name,'  ',c.last_name) as full_name ,concat(s.first_name,' ',s.last_name) as staff_name ,p.amount from customer as c
inner join payment as p on c.customer_id=p.customer_id
inner join staff as s on p.staff_id = s.staff_id 
