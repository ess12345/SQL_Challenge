USE Movielens;


-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
SELECT * 
FROM movies
where release_date between '1983-01-01' and '1993-01-01'
order by release_date desc;
  ;
-- Without using LIMIT, list the titles of the movies with the lowest average rating.
SELECT movies.title,  SUM(ratings.rating)/COUNT(ratings.movie_id) AS average 
FROM movies
JOIN ratings ON movies.id = ratings.movie_id
group by movies.id
order by SUM(ratings.rating)/COUNT(ratings.movie_id)  asc;
-- List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.

SELECT users.id, genres.name, users.age, users.gender, ratings.rating, movies.title
FROM genres_movies
JOIN movies ON genres_movies.movie_id = movies.id
JOIN genres ON genres_movies.genre_id = genres.id
JOIN ratings ON movies.id = ratings.movie_id
JOIN users ON ratings.user_id = users.id  
WHERE ratings.rating = 5 AND
users.gender = 'M'
AND genres.name = 'Sci-Fi'
AND users.age = 24
;

-- List the unique titles of each of the movies released on the most popular release day.
SELECT title, release_date 
from movies
WHERE release_date = (SELECT release_date FROM movies
GROUP BY release_date ORDER BY COUNT(id) DESC LIMIT 1);


-- Find the total number of movies in each genre; list the results in ascending numeric order.

SELECT genres.name, count(movies.title) AS NumberofMovies
FROM genres_movies
JOIN movies ON genres_movies.movie_id = movies.id
JOIN genres ON genres_movies.genre_id = genres.id
group by genres.name;