-- Find the film_title of all films which feature both RALPH CRUZ and WILL WILSON
-- Order the results by film_title in ascending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box to figure out how to get a table that shows pairs of actors in movies.


-- Put your query for q5 here.

SELECT rc.title AS film_title FROM
    (SELECT film.film_id, film.title FROM film 
        JOIN film_actor ON film.film_id = film_actor.film_id    
            JOIN actor on film_actor.actor_id = actor.actor_id
                AND actor.actor_id = (SELECT actor.actor_id FROM actor WHERE actor.first_name = 'RALPH' AND actor.last_name = 'CRUZ'))
    AS rc 
JOIN
    (SELECT film.film_id, film.title FROM film 
        JOIN film_actor ON film.film_id = film_actor.film_id    
            JOIN actor on film_actor.actor_id = actor.actor_id
                AND actor.actor_id = (SELECT actor.actor_id FROM actor WHERE actor.first_name = 'WILL' AND actor.last_name = 'WILSON'))
    AS ww 
WHERE rc.film_id = ww.film_id
ORDER BY film_title ASC;