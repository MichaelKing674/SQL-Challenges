USE world;
#Challenge1
SELECT co.Name AS Country, count(ci.id) AS NumberOfCities
FROM country co
JOIN city ci ON co.code = ci.CountryCode
WHERE  LocalName  = 'United States'
GROUP BY co.name;
#Challenge2
SELECT Name AS Country,Population,LifeExpectancy
FROM country
WHERE LocalName = 'Argentina';
#Challenge3
SELECT Name,LifeExpectancy
FROM country
WHERE LifeExpectancy IS NOT NULL
GROUP BY Name
ORDER BY LifeExpectancy DESC
LIMIT 1;
#Challenge4
SELECT co.name AS Country,ci.name AS CapitalCity
FROM country co
JOIN city ci ON co.capital = ci.id
WHERE co.name = 'Spain';
#Challenge5
SELECT co.name AS Country,cl.language AS Language,co.region AS Region
FROM country co
JOIN countrylanguage cl ON co.code = cl.CountryCode
WHERE co.region = 'Southeast Asia'
GROUP BY language;
#Challenge6
SELECT name AS CityStartingWithF
FROM city
WHERE name LIKE 'F%'
LIMIT 25;
#Challenge7
SELECT co.name AS Country,count(ci.ID) AS NumberOfCities
FROM country co
JOIN city ci ON co.code = ci.CountryCode
WHERE co.name = 'China';
#Challenge8
SELECT Name,Population
FROM country
WHERE Population IS NOT NULL
GROUP BY Name
ORDER BY Population ASC
LIMIT 1;
#Challenge9
SELECT count(Name) AS NumberOfCountries
FROM country;
#Challenge10
SELECT Name AS Country, SurfaceArea
FROM country
ORDER BY SurfaceArea DESC
LIMIT 10;
#Challenge11
SELECT ci.Name AS City,ci.Population AS Population
FROM city ci
JOIN country co ON ci.CountryCode = co.Code
WHERE co.name = 'Japan'
ORDER BY Population DESC
LIMIT 5;
#Challenge12
UPDATE country SET HeadOfState = 'Elizabeth II' 
WHERE HeadOfState = 'Elisabeth II';
SELECT Name AS Country,HeadOfState
FROM country
WHERE HeadOfState = 'Elizabeth II';
#Challenge13
CREATE VIEW ratios
AS
	SELECT name,population/surfacearea AS pop_surfacearea_ratio
	FROM country
;
SELECT Name,pop_surfacearea_ratio
FROM ratios
WHERE pop_surfacearea_ratio != 0
GROUP BY Name
ORDER BY pop_surfacearea_ratio ASC;
#Challenge14
SELECT DISTINCT Language
FROM countrylanguage
ORDER BY Language;
#Challenge15
SELECT name AS Country,GNP
FROM country
ORDER BY GNP DESC
LIMIT 10;
#Challenge16
SELECT co.name AS Country,count(Language) AS LanguagesSpoken
FROM country co
JOIN countrylanguage cl ON co.code = cl.CountryCode
GROUP BY co.name
ORDER BY count(language) DESC
LIMIT 10;
#Challenge17
SELECT co.name AS Country,cl.Percentage AS GermanPercent
FROM country co
JOIN countrylanguage cl ON co.Code = cl.CountryCode
WHERE cl.Language = 'German'
AND cl.Percentage >= 50
ORDER BY co.name;
#Challenge18
SELECT Name AS Country,LifeExpectancy
FROM country
WHERE LifeExpectancy != 0
AND LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy ASC
LIMIT 1;
#Challenge19
SELECT GovernmentForm,count(*)
FROM country
GROUP BY GovernmentForm
ORDER BY count(*) DESC
LIMIT 3;
#Challenge20
SELECT count(IndepYear) AS IndependantCounties
FROM country
WHERE IndepYear IS NOT NULL;




