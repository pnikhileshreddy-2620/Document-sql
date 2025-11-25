select round(3.4);
select round(3.5);
select round(3.4123456,2);
select floor(3.4);
select floor(3.6);
select ceil(3.4);
select pow(2,2);
select pow(2,3);

use sakila;
select * from payment;

select amount,round(amount)  as amount_paid from payment;
select amount,floor(amount)  as amount_paid from payment;
select amount,ceiling(amount)  as amount_paid from payment;


select abs(-5.6);
select sqrt(9);