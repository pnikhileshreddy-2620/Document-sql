select now();
select current_date();
select current_timestamp();
select DATE('2025-11-16 15:43:34');
select TIME('2025-01-11 12:12:12');
select datediff('2025-01-01','2025-11-16');
select EXtract(month from '2025-02-26 15:45:01');
select EXtract(YEAR from '2025-02-26 15:45:01');
select EXtract(day from '2025-02-26 15:45:01');

select last_day('2025-12-31');

select dayname('2000-02-26');
select dayofweek('2000-02-26');

select * from rental;
select rental.*, datediff(return_date,rental_date) as total_days from rental;
select YEAR(rental_date) from rental;
SELECT rental_date,date_add(rental_date,interval 5 daY) from rental


