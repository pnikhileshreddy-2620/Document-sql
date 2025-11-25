use sakila;

select * from payment;

select count(amount) from payment group by amount having count(*) >amount;
select * from payme





