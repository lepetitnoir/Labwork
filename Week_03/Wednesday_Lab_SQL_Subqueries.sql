use sakila

#1 How many copies of the film Hunchback Impossible exist in the inventory system? [output = number]

select count(film_id)
from inventory
where film_id =
(select film_id 
from film
where title = "Hunchback Impossible")

#2 List all films whose length is longer than the average of all the films.[output = titles]

select title
from film
where `length` > (select avg(`length`) from film)

#3 Use subqueries to display all actors who appear in the film Alone Trip. [output = names]

select first_name, last_name
from actor 
where actor_id in 
(
select actor_id
from film_actor
where film_id =
(
select film_id 
from film
where title = "Alone Trip"
))


#4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
# Identify all movies categorized as family films. [output = titles]

select title 
from film 
where film_id in
(select film_id
from film_category
where category_id =
(select category_id
from category
where name = "Family"))

#5  Get name and email from customers from Canada using subqueries. 
# Do the same with joins. Note that to create a join, you will have to
# identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information. [output = name, e-mail]

select first_name, last_name, email from customer where address_id in
(select address_id from address where city_id in
(select city_id from city where country_id =
(select country_id from country where country = "Canada")))

#6 Which are films starred by the most prolific actor? 
# Most prolific actor is defined as the actor that has acted in the most number of films.
# First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

# getting most prolific actor by join-function

select actor_id, count(film_id)
from actor
join film_actor using (actor_id)
join film using (film_id)
group by actor_id
order by count(film_id) DESC
limit 1

# getting title of films of most prolific actor by subquery (actor_id)

select title
from film
where film_id in
(select film_id 
from film_actor
where actor_id = "107")

# getting most prolific actor and movie titles with two subqueries and group by

select title 
from film 
where film_id in
(select film_id
from film_actor
where actor_id =
(select actor_id
from film_actor
group by actor_id
order by count(film_id) desc limit 1))


