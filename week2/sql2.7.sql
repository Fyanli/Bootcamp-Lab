use sakila;
-- lab2.7 sqljoin part 1

-- 1. How many films are there for each of the categories in the category table

select f.category_id, c.name, count(film_id) as number
from film_category f
join category c
on f.category_id=c.category_id
group by fc.category_id and c.name
order by number desc;

-- 2. Display the total amount rung up by each staff member in August of 2005.

select s.staff_id,CONCAT(s.first_name, ' ', s.last_name) AS employee,    
SUM(p.amount) AS 'total amount' FROM  sakila.staff AS s       
INNER JOIN  sakila.payment AS p ON s.staff_id = p.staff_id
WHERE MONTH(p.payment_date)= 8        
AND YEAR(p.payment_date) = 2005
GROUP BY s.staff_id;

-- 3. Which actor has appeared in the most films?

select a.actor_id, a.first_name,a.last_name, 
count(a.actor_id) as film_count
from actor a 
join film_actor f
group by a.actor_id
order by film_count desc
limit 1;


-- 4.Most active customer

select *, count(r.rental_id) as rental_count
from customer c
join rental r
on c.customer_id=r.customer_id
group by c.customer_id
order by rental_count desc
limit 1;

-- 5.Display the first and last names, as well as the address, of each staff member.

select s.first_name, s.last_name, a.address
from staff s
join address a
on a.address_id=s.address_id;

-- 6.List each film and the number of actors who are listed for that film

select f1.title,count(f2.actor_id) as number_actor
from film as f1
join film_actor f2
on f1.film_id=f2.film_id
group by f1.film_id;

-- 7. Using the tables payment and customer and the JOIN command,
-- list the total paid by each customer.List the customers alphabetically 
-- by last name.

select c.first_name, c.last_name, count(p.amount)
from customer c
join payment p
group by c.customer_id
order by c.last_name;

-- 8.List number of films per category

select c.name, count(f.film_id) as number_film 
from category c
join film_category f
on c.category_id=f.category_id
group by c.category_id;
