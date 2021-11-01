use sakila;
-- 3.02
-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?

select * from sakila.inventory
where film_id =
      (select film_id
      from sakila.film
      where title= 'Hunchback Impossible');

-- 2. List all films whose length is longer than the average of all the films.

select title,length 
from sakila.film
where length > 
     (select avg(length) 
     from sakila.film);

-- 3.Use subqueries to display all actors who appear in the film Alone Trip.
select * from actor;
select * from film;

select first_name,last_name from actor 
where actor_id in 
       (select actor_id from film_actor
       where film_id in 
       (select film_id from film
       where title="Alone Trip")


-- 4.Sales have been lagging among young families, and you wish to target all family movies for a promotion. -- Identify all movies categorized as family films.
  select * from category;
  select * from film;
  
  select title from film
  join film_category using(film_id)
  join category using (category_id)
  where name='family';
 
       
-- 5.Get name and email from customers from Canada using subqueries.
select * from customer;

select last_name,first_name,email
from  customer
where address_id in 
	(select  address_id 
	from address
	where city_id in
	(select city_id 
	from city
	where country_id =
	(select country_id 
	from country
	where country="Canada");
      
select email,last_name,first_name  from customer
join address using(adress_id)
join city using(city_id)
join country using(country_id)
where country.country="Canada";


-- 6.Which are films starred by the most prolific actor?

select  title, film_id  from film
join film_actor using(film_id)
group by film_id
having max(actor_id)
order by max(actor_id) desc
limit 1;



-- 7.Films rented by most profitable customer.

select last_name,first_name, amount from customer 
join payment  using(customer_id)
order by amount desc
limit 10;

--- 8.Customers who spent more than the average payments.

select customer.last_name, customer.first_name, payment.amount from customer
join payment
on customer.customer_id=payment.customer_id
where payment.amount >
      (select avg(amount)
      from payment)
order by payment.amount;
      






      









