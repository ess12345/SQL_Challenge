USE world;

-- Using COUNT, get the number of cities in the USA.
SELECT countrycode, COUNT(DISTINCT `name`) AS numberOfUSACities 
FROM city 
WHERE countrycode = 'USA';

-- Find out the population and life expectancy for people in Argentina.
SELECT lifeexpectancy, population, region, code
FROM country
WHERE code LIKE "%ARG%";
-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT Name, lifeexpectancy
FROM country
WHERE lifeexpectancy IS NOT NULL
ORDER BY lifeexpectancy desc
LIMIT 1;
-- Using JOIN ... ON, find the capital city of Spain.
SELECT city.name, country.name
FROM country
LEFT JOIN city
ON country.capital=city.ID
AND country.code=city.countryCode
WHERE country.code='ESP'
;

-- Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT countrylanguage.Language, country.region
FROM countrylanguage
JOIN country ON countrylanguage.countrycode = country.code
WHERE country.region LIKE "%Southeast Asia%";
-- Using a single query, list 25 cities around the world that start with the letter F.
SELECT NAME
FROM city
WHERE Name LIKE "%F%"
LIMIT 25
 ;
-- Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT country.name, COUNT(city.name)
FROM country
JOIN city ON country.code = city.countrycode
WHERE country.name = 'China';

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT name, population
FROM country
WHERE population IS NOT NULL AND population != 0
ORDER BY population asc 
LIMIT 1
;
-- Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(name)
FROM country;
-- What are the top ten largest countries by area?
SELECT name, surfacearea
FROM country
order by surfacearea desc
LIMIT 5;
-- List the five largest cities by population in Japan.
SELECT country.name, country.population, city.name
FROM country
JOIN city ON country.code = city.countrycode
WHERE Country.name = "Japan" 
ORDER by population asc
limit 5;

-- List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
SELECT name, code, headofstate
FROM country
WHERE headofstate = "elisabeth II";


-- List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.

SELECT NAME, (population/surfacearea) AS Ratio
FROM country
WHERE (population/surfacearea) != 0
order by ratio asc
limit 1;
-- List every unique world language.
SELECT DISTINCT(language)
FROM countrylanguage;
-- List the names and GNP of the world's top 10 richest countries.
SELECT NAME, GNP
FROM country
order by GNP desc
limit 10;
-- List the names of, and number of languages spoken by, the top ten most multilingual countries.
select country.name, COUNT(countrylanguage.language)
from country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
group by country.name
order by COUNT(countrylanguage.language) desc
limit 10 ;
-- List every country where over 50% of its population can speak German.
select country.name, countrylanguage.language, countrylanguage.percentage
from country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE countrylanguage.language = "German" AND countrylanguage.percentage >= 50;
-- Which country has the worst life expectancy? Discard zero or null values.
SELECT name, lifeexpectancy 
FROM Country
where lifeexpectancy IS NOT NULL
order by lifeexpectancy asc
limit 1;
-- List the top three most common government forms.
SELECT governmentform, COUNT(Governmentform) AS No_of_GovernmentForm
FROM country
group by governmentform
order by COUNT(Governmentform) desc
limit 3;
-- How many countries have gained independence since records began?
SELECT   count(indepyear)
FROM country
WHERE indepyear IS NOT NULL
;