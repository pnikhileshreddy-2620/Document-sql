use sakila;
select * from rental;
select * from payment;
select min(amount) as min_amount from payment;
select min(amount) as min_amount,max(amount) as max_amount from payment;

select count(amount) from payment where amount>10;

select concat('$',sum(amount)) from payment;
