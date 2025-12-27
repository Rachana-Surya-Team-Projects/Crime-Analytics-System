SELECT Type, COUNT(*) AS TotalCrimes
FROM CrimeReports
GROUP BY Type
ORDER BY TotalCrimes DESC;

SELECT DATE_PART('day', Date) AS DayOfMonth, COUNT(*) AS TotalCrimes
FROM CrimeReports
GROUP BY DayOfMonth
ORDER BY DayOfMonth;

SELECT Status, COUNT(*) AS CaseCount
FROM Cases
GROUP BY Status;

SELECT o.Name, COUNT(*) AS TotalCases
FROM CrimeReports cr
JOIN Officers o ON cr.OfficerID = o.OfficerID
GROUP BY o.Name
ORDER BY TotalCases DESC
LIMIT 20;

SELECT l.City, COUNT(*) AS TotalCrimes
FROM CrimeReports cr
JOIN Locations l ON cr.LocationID = l.LocationID
GROUP BY l.City
ORDER BY TotalCrimes DESC
LIMIT 20;


