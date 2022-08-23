use sakila

# 1. Which actor has appeared in the most films? 

select first_name, last_name, count(film_id)
from actor
join film_actor using (actor_id)
group by actor_id
order by count(film_id) DESC
limit 1

# 2. Most active customer (the customer that has rented the most number of films)

select first_name, last_name, count(rental_id)
from customer
join rental using (customer_id)
group by customer_id
order by count(rental_id) DESC
limit 1

# 3. List number of films per `category`.

select name, count(film_id)
from category
join film_category using (category_id)
group by name
order by name ASC

# 4. Display the first and last names, 
# as well as the address, of each staff member.

select first_name, last_name, address
from staff
join address using (address_id)
group by first_name, last_name, address
order by first_name DESC

# 5. Display the total amount rung up by each staff member in August of 2005.

select first_name, last_name, sum(amount)
from staff
join payment using (staff_id)
where payment_date between 050801 and 050831
group by first_name, last_name
order by sum(amount) DESC

# 6. List each film and the number of actors who are listed for that film.

select title, count(actor_id)
from film
join film_actor using (film_id)
group by title
order by count(actor_id) DESC
limit 10

# 7. Using the tables `payment` and `customer` and the JOIN command, 
# list the total paid by each customer. List the customers alphabetically by last name.

select first_name, last_name, sum(amount)
from customer
join payment using (customer_id)
group by first_name, last_name
order by last_name ASC
limit 10

# Optional  
# Which is the most rented film?
# The answer is Bucket Brotherhood
# This query might require using more than one join statement. Give it a try.

select title
from film
join inventory using (film_id)
join rental using (inventory_id)
group by film_id
order by count(film_id) DESC
limit 1

