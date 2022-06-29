USE movielens;
#Challenge1
SELECT title,release_date 
FROM movies WHERE release_date 
BETWEEN '1983-01-01' AND '1993-12-31'
GROUP BY title
ORDER BY release_date DESC;
#Challenge2
CREATE VIEW Average_ratings
AS
	SELECT m.title,AVG(rating) AS AverageRating
	FROM ratings r
	JOIN movies m ON r.movie_id = m.id
	GROUP BY title
	ORDER BY AVG(rating)
;
SELECT title,AverageRating 
FROM average_ratings WHERE AverageRating =(
	SELECT min(AverageRating)
    FROM average_ratings)
;
#Challenge3
SELECT m.title,u.age,r.rating,u.gender,o.name AS Occupation,g.name AS Genre
FROM movies m
JOIN ratings r ON m.id = r.movie_id
JOIN users u ON r.user_id = u.id
JOIN genres_movies gm ON m.id = gm.movie_id
JOIN genres g ON gm.genre_id = g.id
JOIN occupations o ON u.occupation_id = o.id
WHERE age = 24
AND rating = 5
AND gender = 'M'
AND o.name = 'Student'
AND g.name = 'Sci-Fi';

#Challenge4
CREATE VIEW view_occurances
AS
	SELECT release_date,count(*) AS occurance
	FROM movies
	GROUP BY release_date
	ORDER BY occurance DESC
    LIMIT 1;
SELECT title, release_date
FROM movies
WHERE release_date=(
	SELECT release_date
	FROM view_occurances)
;
#Challenge5
SELECT g.name AS Genre,count(gm.movie_id) AS NumberOfMovies
FROM genres g
JOIN genres_movies gm ON g.id = gm.genre_id
GROUP BY g.name
ORDER BY NumberOfMovies ASC;















