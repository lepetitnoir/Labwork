use sakila

select * from actor

select * from address 

select * from category

select * from city

select * from country

select * from customer

select * from film

select * from film_actor

select * from film_category

select * from film_text

select * from inventory

select * from language

select * from payment

select * from rental

select * from staff

select * from store

select title from film

select name AS language from language 

select distinct(name) from language

select count(store_id) from store

select count(staff_id) from staff

select first_name from staff