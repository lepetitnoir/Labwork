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

