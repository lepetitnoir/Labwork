use bank

select * from client

select * from loan

# Query 1
# Get the `id` values of the first 5 clients from `district_id` with a value equals to 1.

select client_id, district_id 
from client 
where district_id = 1  limit 5

# Query 2
# In the `client` table, get an `id` value of the last client where the `district_id` equals to 72

select client_id
from client 
where district_id = 72 and client_id > 13260

# Query 3
# Get the 3 lowest amounts in the `loan` table.

select amount, loan_id 
from loan 
order by amount ASC

select amount 
from loan 
where amount between 4000 and 8000 
order by amount ASC

# Query 4
# What are the possible values for `status`, ordered alphabetically in ascending order in the `loan` table?

select status 
from loan 

select distinct(status) 
from loan
order by status ASC

# Query 5
# What is the `loan_id` of the highest payment received in the `loan` table?

select max(payments) 
from loan

select loan_id 
from loan
where payments = 9910

# Query 6
# What is the loan `amount` of the lowest 5 `account_id`s in the `loan` table? Show the `account_id` and the corresponding `amount`

select amount, account_id
from loan
order by amount ASC

select amount, account_id
from loan
where amount < 11000
group by amount, account_id
order by amount ASC

# Query 7
# What are the top 5 `account_id`s with the lowest loan `amount` that have a loan `duration` of 60 in the `loan` table?

select amount, account_id, duration
from loan
where duration = 60 
group by amount, account_id, duration
order by amount ASC

select account_id
from loan
where amount < 31620 and duration = 60 
group by amount, account_id, duration
order by amount ASC

# Query 8
# What are the unique values of `k_symbol` in the `order` table?
# You have to use backticks to escape the `order` table name

select distinct (k_symbol)
from `order`

# Query 9
# In the `order` table, what are the `order_id`s of the client with the `account_id` 34?

select `order_id`
from `order`
where account_id = 34 
group by `order_id`, account_id

# Query 10
# In the `order` table, which `account_id`s were responsible for orders between `order_id` 29540 and `order_id` 29560 (inclusive)?

select distinct(account_id)
from `order`
where `order_id` between 29539 and 29560
group by `order_id`, account_id

# Query 11
# In the `order` table, what are the individual amounts that were sent to (`account_to`) id 30067122

select account_to
from `order`

select distinct(amount)
from `order`
where account_to = 30067122
group by amount, account_to 

# Query 12
# In the `trans` table, show the `trans_id`, `date`, `type` and `amount` of 
# the 10 first transactions from `account_id` 793  in chronological order, from newest to oldest.

select `date`, `type`, amount
from trans
order by date ASC

select trans_id, `date`, `type`, amount
from trans
where account_id = 793 
group by trans_id, `date`, account_id, `type`, amount
order by `date` DESC
limit 10

# Query 13
# In the `client` table, of all districts with a `district_id` lower than 10, how many clients are from 
# each `district_id`? Show the results sorted by the `district_id` in ascending order.

select count(client_id)
from client

# How/why does it count every district individually?
select district_id, count(client_id)
from client
where district_id < 10
group by district_id
order by district_id ASC

# Query 14
# In the `card` table, how many cards exist for each `type`? 
# Rank the result starting with the most frequent `type`!

select `type`, count(`type`)
from card
group by `type`
order by count(type) DESC

# Query 15
# Using the `loan` table, print the top 10 `account_id`s 
# based on the sum of all of their loan amounts.

select account_id, sum(amount)
from loan
group by account_id
order by sum(amount) DESC
limit 10

# Query 16
# In the `loan` table, retrieve the number of loans issued for each day, 
# before (excl) 930907, ordered by date in descending order.

# Query 17
# In the `loan` table, for each day in December 1997, count the number of loans issued for each unique loan duration, 
# ordered by date and duration, both in ascending order. 
# You can ignore days without any loans in your output.

# Query 18
# In the `trans` table, for `account_id` 396, sum the amount of transactions for each type (`VYDAJ` = Outgoing, `PRIJEM` = Incoming). 
# Your output should have the `account_id`, the `type` and the sum of amount, named as `total_amount`. Sort alphabetically by type.

# Query 19
# From the previous output, translate the values for `type` to English, rename the column to `transaction_type`,
# round `total_amount` down to an integer
 
# Query 20
# From the previous result, modify your query so that it returns only one row, with a column for incoming amount, 
# outgoing amount and the difference.

# Query 21
# Continuing with the previous example, rank the top 10 `account_id`s based on their difference.
 