use sakila;
select distinct amount from payment order by amount desc limit 5;
select max(amount) from payment
where amount < (select max(amount) from payment);


with less_price as
(
select * from payment where amount=0.99)

select payment_id,customer_id from less_price 
where customer_id between 1 and 2;


with all_actors as (select * from actor)
select first_name,last_name from all_actors order by last_name;


with film_rating as (select * from film where rating ='PG')
select title,release_year from film_rating order by title asc;


with customer_detalis as (select c.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        cc.city from customer as c 
left join address as a  on c.address_id = a.address_id
left join city as cc    on a.city_id = cc.city_id 
where cc.city='London')
select * from customer_detalis;


with film_category as (
select f.title,c.name from film as f
left join film_category as fc on f.film_id =fc.film_id
left join category as c on fc.category_id = c.category_id
where c.name='Action')
select * from film_category;


with top_customer as 
(
select c.first_name,c.last_name, sum(amount) as total_amount from customer as c
left join  payment as p on c.customer_id = p.customer_id
group by c.first_name,c.last_name
)
select * from top_customer order by total_amount desc   limit 5 ;

with total_rental_per_film as
(
select f.title, count(r.rental_id)  as count_per_film from film as f 
left join inventory as i on f.film_id = i.film_id
left join rental as r  on i.inventory_id = r.inventory_id
group by f.title
)
select * from total_rental_per_film  order by count_per_film desc;


with never_rental as 
(
select c.first_name,c.last_name from customer as c
left join rental as r on c.customer_id = r.customer_id
where r.rental_id is null)
select * from never_rental;



with most_rental as 
(
select c.category_id,c.name,count(r.rental_id) as no_of_rental from category as c
left join film_category as fc on c.category_id = fc.category_id
left join film as f on fc.film_id = f.film_id
left join inventory as i on f.film_id = i.film_id
left join rental as r on i.inventory_id = r.inventory_id
group by c.category_id,c.name
)
SELECT
  name AS category_name,
  no_of_rental
FROM most_rental
ORDER BY no_of_rental DESC
LIMIT 3;




with no_of_film as 
(
select concat(a.first_name,' ',a.last_name) as full_name,count(fc.film_id) as total_films from actor as a
left join film_actor as fc on a.actor_id = fc.actor_id
left join film as f on fc.film_id = f.film_id
group by full_name
)
select * from no_of_film  order by total_films   desc limit 1;


with hight as 
( 
select s.store_id,sum(p.amount) as total_amount from store  as s
left join staff as st on s.store_id = st.store_id
left join payment as p on st.staff_id= p.staff_id
group by store_id  

)
select * from hight order by total_amount desc  limit 1;



select * from rental  where inventory_id =185