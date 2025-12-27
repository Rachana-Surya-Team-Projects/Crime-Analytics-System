EXPLAIN ANALYZE
SELECT * FROM CrimeReports WHERE Type = 'Theft';


CREATE INDEX idx_crimereports_type ON CrimeReports(Type);


EXPLAIN ANALYZE
SELECT * FROM CrimeReports WHERE Type = 'Theft';


EXPLAIN ANALYZE
SELECT * FROM Cases WHERE Status = 'Closed';


CREATE INDEX idx_cases_status ON Cases(Status);


EXPLAIN ANALYZE
SELECT * FROM Cases WHERE Status = 'Closed';



EXPLAIN ANALYZE
SELECT cr.CrimeID, cr.Date, o.Name
FROM CrimeReports cr
JOIN Officers o ON cr.OfficerID = o.OfficerID
WHERE cr.Date > '2023-01-01';


CREATE INDEX idx_crimereports_officerid ON CrimeReports(OfficerID);
CREATE INDEX idx_crimereports_date ON CrimeReports(Date);


EXPLAIN ANALYZE
SELECT cr.CrimeID, cr.Date, o.Name
FROM CrimeReports cr
JOIN Officers o ON cr.OfficerID = o.OfficerID
WHERE cr.Date > '2023-01-01';