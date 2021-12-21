-- Table: Businesses, BUSINESS_ATTRBITUES,
CREATE TABLE Businesses(
business_id text,
name text, neighborhood text,
address text, city text,
state text, postal_code integer,
latitude integer, longitude integer,
stars integer, review_count integer,
is_open text,
categories text)
;
COPY businesses FROM ‎'/Elements/yelp-dataset/yelp_business.csv' CSV HEADER;
--TRIED TO COPY DATA ONTO TABLE BUT DID NOT WORK. MAYBE DUE TO EXTERNAL HARDDRIVE LOCATION?
CREATE TABLE Business_Attributes(
    business_id text,
AcceptsInsurance text,
ByAppointmentOnly text,
BusinessAcceptsCreditCards text,
BusinessParking_garage text,
BusinessParking_street text,
BusinessParking_validated text,
BusinessParking_lot text,
BusinessParking_valet text,
HairSpecializesIn_coloring text,
HairSpecializesIn_africanamerican text,
HairSpecializesIn_curly text,
HairSpecializesIn_perms text,
HairSpecializesIn_kids text,
HairSpecializesIn_extensions text,
HairSpecializesIn_asian text,
HairSpecializesIn_straightperms text,
RestaurantsPriceRange2 text,
GoodForKids text,
WheelchairAccessible text,
BikeParking text,
Alcohol text,
HasTV text,
NoiseLevel text,
RestaurantsAttire text,
Music_dj text,
Music_background_music text,
Music_no_music text,
Music_karaoke text,
Music_live text,
Music_video text,
Music_jukebox text,
Ambience_romantic text,
Ambience_intimate text,
Ambience_classy text,
Ambience_hipster text,
Ambience_divey text,
Ambience_touristy text,
Ambience_trendy text,
Ambience_upscale text,
Ambience_casual text,
RestaurantsGoodForGroups text,
Caters text,
WiFi text,
RestaurantsReservations text,
RestaurantsTakeOut text,
HappyHour text,
GoodForDancing text,
RestaurantsTableService text,
OutdoorSeating text,
RestaurantsDelivery text,
BestNights_monday text,
BestNights_tuesday text,
BestNights_friday text,
BestNights_wednesday text,
BestNights_thursday text,
BestNights_sunday text,
BestNights_saturday text,
GoodForMeal_dessert text,
GoodForMeal_latenight text,
GoodForMeal_lunch text,
GoodForMeal_dinner text,
GoodForMeal_breakfast text,
GoodForMeal_brunch text,
CoatCheck text,
Smoking text,
DriveThru text,
DogsAllowed text,
BusinessAcceptsBitcoin text,
Open24Hours text,
BYOBCorkage text,
BYOB text,
Corkage text,
DietaryRestrictions_dairyfree text,
DietaryRestrictions_glutenfree text,
DietaryRestrictions_vegan text,
DietaryRestrictions_kosher text,
DietaryRestrictions_halal text,
DietaryRestrictions_soyfree text,
DietaryRestrictions_vegetarian text,
AgesAllowed text,
RestaurantsCounterService text
)
;
CREATE TABLE Users(
user_id text,
name text,
review_count integer,
yelping_since date,
friends text,
useful integer,
funny integer,
cool integer,
fans integer,
elite text,
average_stars integer,
compliment_hot integer,
compliment_more integer,
compliment_profile integer,
compliment_cute integer,
compliment_list integer,
compliment_note integer,
compliment_plain integer,
compliment_cool integer,
compliment_funny integer,
compliment_writer integer,
compliment_photos integer);

CREATE TABLE Business_Hours(
business_id text,
monday text,
tuesday text,
wednesday text,
thursday text,
friday text,
saturday text,
sunday text);

CREATE TABLE Checkins(
business_id text,
weekday text,
hour timestamp,
checkins integer
);
CREATE TABLE Reviews( review_id text,
user_id text,
business_id text,
stars integer,
useful integer,
funny integer,
cool integer,
Text text,
date timestamp);
--TESTING TABLES
select *
from businesses
;
SELECT distinct CITY, STATE
FROM busineSsES
;
SELECT distinct city, STATE, NAME
FROM busineSsES
WHERE categories ILIKE '%mexican%' OR CATEGORIES ILIKE '%LAtin%'
;
SELECT city, STATE, NAME, STARS, REVIEW_COUNT
FROM busineSsES
WHERE categories ILIKE '%mexican%' OR CATEGORIES ILIKE '%LAtin%' AND review_count >=200
AND stars >= 4
;
--4088 BUSINESSES CATEGORIZED UNDER MEXICAN OR LATIN THAT HAVE A RATING OF
-- FOUR STARS OR MORE AND HAS MORE THAN 200 REVIEWS
--PROBABLY USE CASE TO SEPERATE MEXICAN/LATIN/CUBAN/ETC
SELECT name, business_id, city, review_count, STARS
from businesses
WHERE categories ILIKE '%MEXICAN%' OR categories ILIKE '%LATIN%' OR categories ILIKE '%SPANISH%'
;
--5152 DIFFERENT CATEGORIES FOR MEXICAN TYPE RESTRARANUTS
SELECT CATEGORIES
FROM BUSINESSES
WHERE CATEGORIES ILIKE '%TRUCK%' OR CATEGORIES ILIKE '%STREET%'
OR CATEGORIES ILIKE '%VENDOR%' OR CATEGORIES ILIKE '%MEXICAN%'
;
--LOOKING FOR REVIEWS THAT MENTION TACOS
SELECT COUNT(TEXT)
FROM REVIEWS
WHERE TEXT ILIKE '%TACO%'
ORDER BY 1
;
--138381 REVIEWS THAT MENTION TACO
--LOOKING FOR REVIEWS THAT MENTION GREAT/AMAZING TACOS
SELECT COUNT(TEXT)
FROM REVIEWS
WHERE TEXT ILIKE '%TACO%'
AND TEXT ILIKE '%GREAT%'
AND TEXT ILIKE '%AMAZING%'
ORDER BY 1
;
--8241 REVIEWS THAT MENTION GREAT/AMAZING TACOS
-- CHANGING GREAT AND AMAZING TO GREAT OR AMAZING
SELECT COUNT(TEXT)
FROM REVIEWS
WHERE TEXT ILIKE '%TACO%'
AND (TEXT ILIKE '%GREAT%'
OR TEXT ILIKE '%AMAZING%')
ORDER BY 1
;
-- 60959 REVIEWS THAT MENTION TACOS THAT WERE GREAT OR AMAZING
--LOOKING FOR REVIEWS WITH BAD TACOS
SELECT COUNT(TEXT)
FROM REVIEWS
WHERE TEXT ILIKE '%TACO%'
AND TEXT ILIKE '%BAD%'
ORDER BY 1
;
-- 13414 REVIEWS FOR BAD TACOS
-- LOOKING AT THE GREAT AND AMAZING TACOS AND THE AVERAGE REVIEW THAT WAS LEFT
SELECT COUNT(TEXT), AVG(STARS)
FROM REVIEWS
WHERE TEXT ILIKE '%TACO%'
AND (TEXT ILIKE '%GREAT%'
OR TEXT ILIKE '%AMAZING%')
ORDER BY 1
;
--THE 60959 REVIEWS FOR TACOS THAT ARE GREAT OR AMAZING HAVE AN AVERAGE REVIEW OF 4.15
SELECT DISTINCT COUNT( USER_ID)
FROM USERS
WHERE REVIEW_COUNT >= 1
;
-- THERE ARE 1324828 USERS THAT LEFT REVIEWS
SELECT NAME, REVIEW_COUNT, AVERAGE_STARS, YELPING_SINCE
FROM USERS
WHERE REVIEW_COUNT >= 25
;
select min(yelping_since), max(yelping_since)
from users
WHERE review_count >= 1
;
SELECT NAME, CATEGORIES
FROM BUSINESSES
WHERE CATEGORIES ILIKE '%MEXICAN%'
OR CATEGORIES ILIKE '%LATIN%' AND
   CATEGORIES != '%FAST%' AND CATEGORIES != '%FOOD%'
;
--FINDING CITIES, STATES AND CATEGORIES FOR THE REVIEWS WITH THE AMAZING/GREAT TACOS
SELECT B.NAME, B.CITY, B.STATE, B.CATEGORIES

    FROM BUSINESSES B
LEFT JOIN REVIEWS R
ON B.BUSINESS_ID = R.BUSINESS_ID
      WHERE R.TEXT ILIKE '%TACO%'
AND (R.TEXT ILIKE '%GREAT%'
OR R.TEXT ILIKE '%AMAZING%')
ORDER BY 3, 2, 4
;
SELECT DISTINCT state, count(business_id)
FROM BUSINESSES
WHERE categories ILIKE '%MEXICAN%' OR CATEGORIES ILIKE '%LATIN%'
group by 1
LIMIT 10000
;
--AVG SCORE FOR CITIES
SELECT DISTINCT state, count(business_id), AVG(STARS), AVG(REVIEW_COUNT)
FROM BUSINESSES
WHERE categories ILIKE '%MEXICAN%' OR CATEGORIES ILIKE '%LATIN%'
group by 1
LIMIT 10000
;
--average age/# of ratings and location of user
SELECT U.name, U.REVIEW_COUNT, U.YELPING_SINCE, U.AVERAGE_STARS
FROM USERS U
LEFT JOIN REVIEWS R
ON U.USER_ID = R.USER_ID
 WHERE R.TEXT ILIKE '%TACO%'
AND (R.TEXT ILIKE '%GREAT%'
OR R.TEXT ILIKE '%AMAZING%')
GROUP BY 1 , 2, 3, 4
LIMIT 1000
;
select
    case when (categories ILIKE '%mexican%' AND categories ILIKE '%latin%'
SELECT
CASE WHEN STARS >= 3 then 'Good'
WHEN stars >= 4 then 'Great'
else 'Eh' end as Taco_Ratings
from
(SELECT b.name, Avg(r.stars)
FROM reviews r
LEFT JOIN businesses b
ON r.business_ID = b.business_ID
 WHERE R.TEXT ILIKE '%TACO%'
AND (R.TEXT ILIKE '%GREAT%'
OR R.TEXT ILIKE '%AMAZING%')
GROUP BY 1) as Avg_stars
group by 1
;

SELECT b.name, Avg(r.stars), b.categories
FROM businesses b
LEFT JOIN reviews r
ON r.business_ID = b.business_ID
 WHERE R.TEXT ILIKE '%TACO%'
AND (R.TEXT ILIKE '%GREAT%'
OR R.TEXT ILIKE '%AMAZING%')
AND (categories ILIKE '%MEXICAN%' OR CATEGORIES ILIKE '%LATIN%')
AND CATEGORIES ILIKE '%RESTAURANT%'
AND (CATEGORIES ILIKE '%VENDOR%' OR CATEGORIES ILIKE '%STREET%')
GROUP BY 1, 3
ORDER BY 2
;
--RESTAURANTS MEXICAN
SELECT NAME, REVIEW_COUNT, STARS, CITY
FROM BUSINESSES
WHERE CATEGORIES ILIKE '%RESTAURANTS%'
AND (CATEGORIES ILIKE '%MEXICAN%' OR CATEGORIES ILIKE '%LATIN%')
;
--FINDING AMAZING GREAT TACOS
SELECT B.NAME, B.CITY, AVG(R.STARS), b.review_count,
       CASE WHEN ba.restaurantstakeout, ba.happyhour, ba.bestnights_tuesday,
       ba.goodformeal_latenight, ba.open24hours

    FROM BUSINESSES B
LEFT JOIN REVIEWS R
ON B.BUSINESS_ID = R.BUSINESS_ID
inner join business_attributes ba
on ba.business_id = b.business_id
      WHERE R.TEXT ILIKE '%TACO%'
AND (R.TEXT ILIKE '%GREAT%'
OR R.TEXT ILIKE '%AMAZING%')
GROUP BY 1, 2,4, 5, 6, 7, 8, 9, B.CATEGORIES
HAVING  B.CATEGORIES ILIKE '%RESTAURANTS%'
AND (B.CATEGORIES ILIKE '%MEXICAN%' OR B.CATEGORIES ILIKE '%LATIN%')
ORDER BY 3
;
SELECT NAME, CITY, LONGITUDE, LATITUDE, STARS, REVIEW_COUNT, CATEGORIES
FROM BUSINESSES
WHERE IS_OPEN = '1'
AND CATEGORIES ILIKE '%RESTAURANTS%'
AND (CATEGORIES ILIKE '%MEXICAN%' OR CATEGORIES ILIKE '%LATIN%')
;

SELECT DISTINCT count(business_id)
FROM BUSINESSES
;
--USERS THAT HAVE LEFT REVIEWS WITH TACOS AT MEXICAN/ LATIN RESTAURANTS
SELECT U.USER_ID, U.REVIEW_COUNT, U.YELPING_SINCE, U.AVERAGE_STARS, U.USEFUL, U.FUNNY, U.COOL, U.ELITE, U.FANS
FROM REVIEWS R
LEFT JOIN USERS U
ON U.USER_ID = R.USER_ID
LEFT JOIN BUSINESSES B
ON R.BUSINESS_ID = B.BUSINESS_ID
WHERE R.TEXT ILIKE '%TACO%'
AND B.IS_OPEN = '1'
AND B.CATEGORIES ILIKE '%RESTAURANTS%'
AND (B.CATEGORIES ILIKE '%MEXICAN%' OR B.CATEGORIES ILIKE '%LATIN%')
;
SELECT B.NAME,
CASE WHEN AVG(R.STARS) >= 3 then 'Good'
WHEN AVG(R.stars) >= 4 then 'Great'
else 'Eh' end as Taco_Ratings
from REVIEWS R
LEFT JOIN BUSINESSES B
ON B.BUSINESS_ID = R.BUSINESS_ID
WHERE R.TEXT ILIKE '%TACO%'
AND B.IS_OPEN = '1'
AND B.CATEGORIES ILIKE '%RESTAURANTS%'
AND (B.CATEGORIES ILIKE '%MEXICAN%' OR B.CATEGORIES ILIKE '%LATIN%')
GROUP BY 1
;
SELECT COUNT(TACO_RATINGS)

CASE WHEN AVG(R.STARS) >= 3 then 'Good'
WHEN AVG(R.stars) >= 4 then 'Great'
else 'Eh' end as Taco_Ratings
from REVIEWS R
LEFT JOIN BUSINESSES B
ON B.BUSINESS_ID = R.BUSINESS_ID
WHERE R.TEXT ILIKE '%TACO%'
AND B.IS_OPEN = '1'
AND B.CATEGORIES ILIKE '%RESTAURANTS%'
AND (B.CATEGORIES ILIKE '%MEXICAN%' OR B.CATEGORIES ILIKE '%LATIN%')
GROUP BY 1)
;
SELECT DISTINCT POSTAL_CODE, CITY
FROM BUSINESSES
WHERE POSTAL_CODE IS NOT NULL
;
select count(b.business_id)
from REVIEWS R
LEFT JOIN BUSINESSES B
ON B.BUSINESS_ID = R.BUSINESS_ID
WHERE R.TEXT ILIKE '%TACO%'
AND B.IS_OPEN = '1'
AND B.CATEGORIES ILIKE '%RESTAURANTS%'
AND (B.CATEGORIES ILIKE '%MEXICAN%' OR B.CATEGORIES ILIKE '%LATIN%')
;
select distinct state
from businesses
;
select count(is_open)
from businesses
where is_open = '0'
;
select count(b.business_id)
from REVIEWS R
LEFT JOIN BUSINESSES B
ON B.BUSINESS_ID = R.BUSINESS_ID
WHERE R.TEXT ILIKE '%TACO%'
AND B.IS_OPEN = '0'
AND B.CATEGORIES ILIKE '%RESTAURANTS%'
AND (B.CATEGORIES ILIKE '%MEXICAN%' OR B.CATEGORIES ILIKE '%LATIN%')
;
select count(r.user_id)
from REVIEWS R
LEFT JOIN BUSINESSES B
ON B.BUSINESS_ID = R.BUSINESS_ID
WHERE R.TEXT ILIKE '%TACO%'
AND B.IS_OPEN = '1'
AND B.CATEGORIES ILIKE '%RESTAURANTS%'
AND (B.CATEGORIES ILIKE '%MEXICAN%' OR B.CATEGORIES ILIKE '%LATIN%')
;
-- MEXICAN/LATIN SPOTS PER CITY...AVG STARS AND REVIEW COUNT
SELECT DISTINCT city, count(business_id), AVG(STARS), AVG(REVIEW_COUNT)
FROM BUSINESSES
WHERE CATEGORIES ILIKE '%RESTAURANTS%' AND
      (categories ILIKE '%MEXICAN%' OR CATEGORIES ILIKE '%LATIN%')
group by 1
order by 2,3,4
;
select min(yelping_since)
from users
;
-- BREAKDOWN CITIES WITH HIGHEST STARS AVG PER CITY BY STATES
SELECT B.STATE, B.CITY, AVG(B.STARS)
FROM BUSINESSES B
HAVING AVG(B.STARS) > '4.2'
ORDER BY 1, 2
;
-- count of total businesses
SELECT COUNT(business_id)
from businesses
;
-- count of total reviews
select count(review_id)
from reviews
;
--avg star rating
select avg(stars)
from businesses
;
--address test
select address
from businesses
limit 5
;
-avg stars for each state
select count(business_id), avg(stars), state, city
from businesses
group by 3, 4
order by 1, 2
;
-avg stars for each state where there are more than 300 businesses in that state
select count(business_id), avg(stars), state, city
from businesses
group by 3, 4
having count(business_id) > '300'
order by 1 desc
;
-- mexican/latin restuarants avg strs: this looks like the best areas to focus on for the best taco
select count(business_id), avg(stars), state, city
from businesses
where categories ilike '%mexican%' or categories ilike '%latin%'
group by 3, 4
having count(business_id) > '100'
order by 1 desc
;
