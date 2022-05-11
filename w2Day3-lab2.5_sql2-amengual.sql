-- Lab | SQL Queries - Lesson 2.5

USE sakila;



--

-- 1. Select all the actors with the first name ‘Scarlett’.


select * from actor
where first_name = 'Scarlett';


--

-- 2. How many films (movies) are available for rent and how many films have been rented?


-- films in inventory in all the stores: copies
select * from inventory;
select count(inventory_id) as available_copies from inventory;

-- titles of films
select * from film;
select count(film_id) as availabe_titles from film; -- available titles of films

-- select min(rental_duration) from film;


select * from rental;
select count(rental_id) as total_rentals from rental;  
select count(distinct(inventory_id)) as copies_already_rented from rental;



--

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select min(length) as min_duration, max(length) as max_duration from film;



-- 

-- 4. What's the average movie duration expressed in format (hours, minutes)?

select length as mean_duration from film;
select convert(length,time) as mean_duration from film;
select time_format(convert(avg(length),time), '%i:%s') as mean_duration from film; 
-- it considers the hours as minutes and the minutes as seconds



--

-- 5. How many distinct (different) actors' last names are there?

select count(distinct last_name) from actor;



--

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?

select * from rental;

select min(rental_date) from rental;
select max(rental_date) from rental;
select datediff(max(rental_date), min(rental_date)) from rental;


-- 

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

select *, month(rental_date), weekday(rental_date) from rental
limit 20;


--

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending 
-- on the rental day of the week.

select *, month(rental_date), weekday(rental_date) from rental;



select *,
case
when weekday(rental_date) in (5,6) then 'weekend'
-- = 5 or weekday(rental_date) = 6 then 'weekend'
else 'workday'
end as day_type
from rental;



--

-- 9. Get release years.

select distinct release_year from film;




--

-- 10. Get all films with ARMAGEDDON in the title.

select title from film
where title regexp 'ARMAGEDDON';

select title from film;



--

-- 11. Get all films which title ends with APOLLO.

select title from film
where title regexp 'APOLLO$';



--

-- 12. Get 10 the longest films.

select title, length from film
order by length desc
limit 10;



--

-- 13. How many films include Behind the Scenes content?

select distinct special_features from film;

select count(film_id) from film
where special_features regexp 'Behind the Scenes';















