use sakila;
/*1*/
select film.title,c.name from film 
inner join film_category as fc on film.film_id =fc.film_id
inner join category as c on fc.category_id = c.category_id;
/*2*/

select concat(c.first_name,' ',c.last_name),r.rental_date,f.title from customer as c
inner join rental as r on c.customer_id = r.customer_id
inner join inventory as i on r.inventory_id = i.inventory_id
inner join film as f on i.film_id = f.film_id;

/*3*/

select concat(s.first_name,' ', s.last_name) as staff_name, sum(amount) from staff as s
inner join payment as p on s.staff_id = p.staff_id
group by staff_name;

/*4*/

select f.title,l.name from film as f
inner join language as l on f.language_id = l.language_id;

/*5*/
select concat(c.first_name,' ',c.last_name) as customer_name, concat(s.first_name,' ',s.last_name) from customer as c
inner join payment as p on c.customer_id = p.customer_id
inner join staff as s on p.staff_id = s.staff_id


