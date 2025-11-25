use sakila;
desc film;
select * from actor;
select concat(first_name,last_name) from actor;
select concat(first_name,'  ',last_name) from actor;
select concat('Nikhilesh',' ',first_name) as newname from actor;
select * from film;
desc film;
select CONCAT('$',rental_rate) from  film;
select film.* ,CONCAT('$',rental_rate) as newrental_rate from  film;
desc film;
select concat(first_name,'  ',last_name) ,length(concat(first_name,'  ',last_name))from actor;

select concat(first_name,'  ',last_name) ,length(concat(first_name,'  ',last_name))from actor
where length(concat(first_name,'  ',last_name))>10;
