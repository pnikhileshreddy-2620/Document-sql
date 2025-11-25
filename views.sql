use sakila;


create view view_london_customer as 
select c.first_name,c.last_name,c.email  from customer as c
left join address as a on c.address_id=a.address_id
left join city as cs on a.city_id = cs.city_id
where cs.city='London';



CREATE VIEW view_customer_total_payments AS
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    SUM(p.amount) AS total_amount
FROM customer AS c
LEFT JOIN payment AS p 
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id, full_name;


SELECT * FROM view_customer_total_payments;
create view view_film_rental_count as
select f.film_id,f.title,count(r.rental_id)   from film as f
left join inventory as i on f.film_id= i.film_id
left join rental as r  on i.inventory_id = r.inventory_id
group by f.film_id,f.title;

select * from view_film_rental_count;

create view view_category_rental_count as
select c.category_id,c.name,count(r.rental_id)  from category as c 
left join film_category as fc on c.category_id=fc.category_id
left join film as f on fc.film_id = f.film_id
left join inventory as i on f.film_id =i.film_id
left join rental as r on i.inventory_id =r.inventory_id
group by c.category_id,c.name;
select * from view_category_rental_count;










