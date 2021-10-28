use sakila;

-- sqljoin part2
-- 1.Write a query to display for each store its store ID, city, and country.

SELECT s.store_id, c1.city, c2.country
FROM store s
JOIN address a 
on a.address_id=s.address_id
JOIN city c1 
on c.city_id=a.city_id
JOIN country c2
on c1.country_id=c2.country_id;

-- 2. Write a query to display how much business, in dollars, each store brought in.

SELECT s.store_id, ROUND(SUM(amount), 2) AS Amount
FROM store s
JOIN customer c USING (store_id)
JOIN payment p USING (customer_id)
JOIN rental r  USING (rental_id)
GROUP BY s.store_id;

-- 3. Which film categories are longest?

select c.name, max(f1.length) as max_length from category c
left join film_category f
on f.category_id=c.category_id
join film f1
on f.film_id=f1.film_id
group by c.name
order by max_length desc
limit 1;



-- 4. Display the most frequently rented movies in descending order.

SELECT f.title AS movies, COUNT(rental_id) AS no_of_times_rented
FROM film f
JOIN inventory  i USING (film_id)
JOIN rental r USING (inventory_id)
GROUP BY f.title
ORDER BY no_of_times_rented DESC;

-- 5. List the top five genres in gross revenue in descending order.

SELECT name, category_id, SUM(amount) AS `gross revenue`
FROM payment 
JOIN rental  USING (rental_id)
JOIN inventory USING (inventory_id)
JOIN film_category  USING (film_id)
JOIN category  USING (category_id)
GROUP BY category_id
ORDER BY `gross revenue` DESC
LIMIT 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?

select f.title, s.store_id from film f
join inventory i
on f.film_id=i.film_id
join store s
on i.store_id=s.store_id
where s.store_id=1
group by s.store_id, f.title
having f.title like "%Academy Dinosaur%";

-- 7 Get all pairs of actors that worked together.
select a.actor_id , a.film_id from film_actor a
join film_actor b
on a.film_id=b.film_id
and a.actor_id<>b.actor_id
order by a.actor_id;

-- 8 Get all pairs of customers that have rented the same film more than 3 times
select concat(c.first_name,'',c.last_name) as name,
r.rental_id as rentalmore3times 
from customer c
join rental r
on r.customer_id=c.customer_id
join inventory i
on i.inventory_id=r.inventory_id
where i.film_id=1
having rentalmore3times>3;

-- 9 For each film, list actor that has acted in more films
select concat(a.first_name,' ', a.last_name) as name
from actor a
join film_actor f
on a.actor_id=f.actor_id
group by name
having count(f.film_id)>2;