-- QUESTION 1
SELECT *
FROM cd.facilities;

-- QUESTION 2
SELECT name, membercost
FROM cd.facilities;

-- QUESTION 3
SELECT *
FROM cd.facilities
WHERE membercost > 0;

-- QUESTION 4
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0 AND membercost < (monthlymaintenance/50.0); 

-- QUESTION 5
SELECT *
FROM cd.facilities
WHERE name LIKE '%Tennis%';

-- QUESTION 6
SELECT *
FROM cd.facilities
WHERE facid IN (1, 5);

-- QUESTION 7
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate > '2012-09-01';

-- QUESTION 8
SELECT surname
FROM cd.members
ORDER BY surname ASC
LIMIT 10;

-- QUESTION 9
SELECT MAX(joindate) AS latest_signup
FROM cd.members;

-- QUESTION 10
SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >= 10; 

-- QUESTION 11
SELECT facid, SUM(slots) AS "Total Slots"
FROM cd.bookings
WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01'
GROUP BY facid
ORDER BY SUM(slots);

-- QUESTION 12
SELECT facid, SUM(slots) AS "total_slots"
FROM cd.bookings
GROUP BY facid 
HAVING SUM(slots) > 1000 
ORDER BY facid;

-- QUESTION 13
SELECT cd.bookings.starttime AS start, cd.facilities.name AS name
FROM cd.bookings
INNER JOIN cd.facilities
ON cd.bookings.facid = cd.facilities.facid
WHERE cd.facilities.facid IN (0,1) AND
      cd.bookings.starttime >= '2012-09-21' AND 
      cd.bookings.starttime < '2012-09-22'
ORDER BY cd.bookings.starttime;

-- QUESTION 14
SELECT cd.bookings.starttime AS start, cd.members.firstname, cd.members.surname
FROM cd.members
INNER JOIN cd.bookings
ON cd.members.memid = cd.bookings.memid
WHERE cd.members.firstname = 'David' AND cd.members.surname = 'Farrell';


