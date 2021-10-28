-- sqljoin part2

-- 1.Write a query to display for each store its store ID, city, and country.
select s.store_id, c1.city, c2.country from store as s 
join adress a
on a.adress_id=s.adress_id
join city c1
on a.city_id=c1.city_id
join country c2
on c2.country_id=c1.country_id;


-- 2.Write a query to display how much business, in dollars, each store brought in.
select p.count(amount) from store s
join inventory i
on s.store_id=i.store_id
right join rental r
on i.iventory_id=r.inventory_id
right join payment p
on p.rental_id=r.rental_id
group by s.store_id;

--- 3. Which film categories are longest?

select c.name, max(f1.length) as max_length from category c
left join film_category f
on f.category_id=c.category_id
join film f1
on f.film_id=f1.film_id
group by c.name
order by max_length desc
limit 1;

-- 4. Display the most frequently rented movies in descending order.

select f.title, count(rental_id) as frequency_rental
from film f
left join inventory i
on f.film_id=i.film_id
right join rental r
on i.inventory_id=r.inventory_id
group by f.title
order by frequency_rental
limit 1;

-- 5.List the top five genres in gross revenue in descending order.



-- 6.Is "Academy Dinosaur" available for rent from Store 1?
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






















