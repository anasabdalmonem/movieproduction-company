
--1
  select title
 from Movies
 order by ReleaseYear;
 --2
 select DirectorID , Title,ReleaseYear
 from Movies
 where ReleaseYear>=1980;
 --3
 select * from Awards
where AwardName = 'Academy Award';

--4
select Budget
from MovieProduction
order by Budget 
offset 5 rows
fetch next 5 rows only;


--5
select * from Movies
where Genre=5;

--6
SELECT Awards.AwardID, Awards.Category, Movies.title
FROM Awards
INNER JOIN Movies ON Awards.AwardID = Movies.MoviesID
group by Awards.AwardID, Awards.Category, Movies.title
order by Awards.category desc;
--7
SELECT Movies.MoviesID,Movies.Title,MovieProduction.CompanyID,ProductionCompanies.CompanyName
FROM Movies
INNER  JOIN MovieProduction ON Movies.MoviesID=MovieProduction.MovieID
INNER JOIN ProductionCompanies ON MovieProduction.CompanyID=ProductionCompanies.CompanyID;


--8
 SELECT * FROM Actors
 WHERE DateOfBirth>'1980-01-01';
 --9
 SELECT * FROM Actors
 WHERE Nationality='American';
 --10
 SELECT  Actors.ActorID AS AID,Actors.FirstName AS FN, Actors.DateOfBirth AS DOB
 FROM Actors
 ORDER BY DOB


 --11
SELECT Movies.Title, Movies.MoviesID, movie_directors.movie_movieid , movie_directors.director_directorsid ,Directors.directorid,Directors.lastname
FROM Movies
inner JOIN movie_directors ON Movies.MoviesID = movie_directors.director_directorsid
inner JOIN Directors ON movie_directors.director_directorsid=Directors.directorid
order by Directors.lastname
-12
SELECT Movies.Title, Movies.MoviesID, movie_directors.movie_movieid , movie_directors.director_directorsid
FROM Movies
FULL OUTER JOIN movie_directors ON Movies.MoviesID = movie_directors.movie_movieid
group by Movies.Title, Movies.MoviesID, movie_directors.movie_movieid , movie_directors.director_directorsid
having movie_directors.director_directorsid >0