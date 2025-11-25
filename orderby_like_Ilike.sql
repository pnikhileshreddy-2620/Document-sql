use sakila;
select * from customer;
select * from customer order by first_name;
select * from customer order by first_name asc, last_name desc;
select * from customer order by first_name asc, last_name desc limit 10;




select * from customer where first_name like 'a%';
select * from customer where first_name like '%a';
select * from customer where first_name like 'a%' and last_name like '%Z';
select * from customer where first_name like 'a___%';
select * from customer where first_name like '___a%';
select * from customer where first_name like '%a__';