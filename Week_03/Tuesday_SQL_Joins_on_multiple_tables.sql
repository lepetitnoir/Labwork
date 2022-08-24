use sakila

# 1. Write a query to display for each store its store ID, city, and country.

select store_id, city, country
from store
join address using (address_id)
join city using (city_id)
join country using (country_id)
group by store_id, city, country

# 2. Write a query to display how much business, in dollars, each store brought in.

select store_id, sum(amount)
from store
join staff using (store_id)
join payment using (staff_id)
group by store_id

# 3. What is the average running time(length) of films by category?

# 4. Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)

# 5. Display the top 5 most frequently(number of times) rented movies in descending order.

# 6. List the top five genres in gross revenue in descending order.

# 7. Is "Academy Dinosaur" available for rent from Store 1?





