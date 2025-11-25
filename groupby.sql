use sakila;

select * from city;

select * from country;

select * from address;
select district from address  
group by district 
order by district;