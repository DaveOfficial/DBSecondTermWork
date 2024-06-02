SELECT *
FROM Events
WHERE EventDate > '2024-06-01';

SELECT *
FROM Athletes
WHERE FirstName = 'Michael' AND LastName = 'Phelps';

SELECT *
FROM Athletes
WHERE Country LIKE 'J%';