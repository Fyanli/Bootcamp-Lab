use sakila;
-- lab3.01
-- 1. Drop column picture from staff
ALTER TABLE staff
drop  COLUMN picture；

-- 2.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer.  Update the database accordingly

INSERT INTO customer (last_name,first_name)
values('SANDERS','TAMMY');

-- 3.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1

alter table sakila.customer
add column rental_id int after store_id;

select * from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';














