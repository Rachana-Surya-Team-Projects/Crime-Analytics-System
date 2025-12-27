
INSERT INTO Locations (LocationID, Address, City, ZipCode) 
VALUES (3001, '987 Neo Ave', 'Cyberville', '99999');

INSERT INTO Officers (OfficerID, Name, DepartmentID) 
VALUES (3001, 'Officer Quantum', 9);


UPDATE Suspects 
SET Age = 50 
WHERE SuspectID = 5;

UPDATE Cases 
SET Status = 'Pending' 
WHERE CaseID = 20;


DELETE FROM Victims 
WHERE VictimID = 10;

DELETE FROM Evidence 
WHERE EvidenceID = 11;


SELECT cr.CrimeID, cr.Date, cr.Type, o.Name AS OfficerName, l.City
FROM CrimeReports cr
JOIN Officers o ON cr.OfficerID = o.OfficerID
JOIN Locations l ON cr.LocationID = l.LocationID
LIMIT 10;


SELECT Name, Age FROM Suspects
ORDER BY Age DESC
LIMIT 10;


SELECT Type, COUNT(*) AS CrimeCount
FROM CrimeReports
GROUP BY Type;


SELECT Name FROM Suspects
WHERE SuspectID IN (
    SELECT SuspectID FROM Cases
    GROUP BY SuspectID
    HAVING COUNT(*) > 2
)
LIMIT 10;


CREATE OR REPLACE FUNCTION insert_officer_func(officer_id INT, full_name VARCHAR, dept_id INT)
RETURNS TEXT AS $$
BEGIN
    INSERT INTO Officers (OfficerID, Name, DepartmentID)
    VALUES (officer_id, full_name, dept_id);

    RETURN 'Officer inserted successfully';
EXCEPTION WHEN unique_violation THEN
    RETURN 'Officer ID already exists';
END;
$$ LANGUAGE plpgsql;

SELECT insert_officer_func(3001, 'John Doe', 99);


CREATE OR REPLACE FUNCTION update_case_status_func(case_id INT, new_status VARCHAR)
RETURNS TEXT AS $$
BEGIN
    UPDATE Cases
    SET Status = new_status
    WHERE CaseID = case_id;

    IF FOUND THEN
        RETURN 'Case status updated successfully';
    ELSE
        RETURN 'Case ID not found';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT update_case_status_func(599, 'Pending');



CREATE OR REPLACE FUNCTION delete_case_func(cid INT)
RETURNS TEXT AS $$
BEGIN
    DELETE FROM Cases
    WHERE CaseID = cid;

    IF FOUND THEN
        RETURN 'Case deleted successfully';
    ELSE
        RETURN 'Case ID not found';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT delete_case_func(599);


CREATE OR REPLACE FUNCTION get_crimes_by_city(city_name VARCHAR)
RETURNS TABLE(CrimeID INT, Type VARCHAR, Date DATE, City VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT cr.CrimeID, cr.Type, cr.Date, l.City
    FROM CrimeReports cr
    JOIN Locations l ON cr.LocationID = l.LocationID
    WHERE l.City = city_name;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_crimes_by_city('East Dawn');