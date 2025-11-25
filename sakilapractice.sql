use sakila;
show tables;

select * from film;
select film_id,title from film;
select * from film where title='ACADEMY DINOSAUR';
select * from film where release_year=2006;
select * from payment;
select * from payment where amount=2.99;
select * from payment where amount>2.99;
select * from payment where amount<2.99;
select * from payment where amount<>2.99;
select * from payment where amount!=2.99;

select * from film;

select * from film where release_year=2006 and rental_duration >6;
select * from film where release_year=2006 or rental_duration >6;

select film_id,title from film where film_id  not in(1,2,3,10,45,90);

select 1+1 as adds;

select 1-8;
select 5*5 as muli;

select 5%5;

select distinct rental_rate from film;
select distinct rating from film;
