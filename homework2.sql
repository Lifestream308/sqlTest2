-- 1 List all customers who live in Texas (use joins) 
select first_name ,last_name , customer.address_id , district 
from customer 
inner join address 
on customer.address_id = address.address_id 
where district = 'Texas'

-- 2 Get all payments above 6.99 with the Customers Full name.
select first_name , last_name , customer.customer_id , amount
from customer 
inner join payment 
on payment.customer_id = customer.customer_id 
where amount > 6.99
order by amount asc

-- 3 Show all customer name who made payments over 175 (use subqueries)
select first_name , last_name FROM
	(select first_name , last_name , customer.customer_id , amount
	from customer 
	inner join payment 
	on payment.customer_id = customer.customer_id 
	where amount > 175) sub
group by first_name , last_name

-- 4 List all customers that live in Nepal (use city table)
select * 
from city 
where district = 'Nepal'

-- 5 Which Staff member had the most transactions? 
select first_name, last_name, count(rental_id) , rental.staff_id 
from rental
inner join staff 
on rental.staff_id = staff.staff_id 
group by first_name , last_name , rental.staff_id 
order by count desc

-- 6 How many movies of each rating are there
select rating , count(rating) 
from film
group by rating 

-- 7 Show all the customers who have made a single payment above 6.99
-- (use subqueries)
select first_name , last_name, count FROM
	(select first_name , last_name , count(amount) FROM
		(select first_name , last_name , amount
		from customer 
		inner join payment 
		on payment.customer_id = customer.customer_id 
		where amount > 6.99
		order by amount asc) sub
	group by first_name , last_name 
	order by count asc) sub_2
where count = 1

-- 8 How many free rentals did our stores give away? 
select customer_id , count(amount) 
from payment
where amount <= 0
group by customer_id 

