CREATE TABLE IF NOT EXISTS TransactionFailures (
    LogID SERIAL PRIMARY KEY,
    Message TEXT NOT NULL,
    Timestamp TIMESTAMP DEFAULT NOW()
);


CREATE OR REPLACE FUNCTION log_failed_badge()
RETURNS TRIGGER AS $$
DECLARE
    exists_count INT;
BEGIN
    SELECT COUNT(*) INTO exists_count
    FROM OfficerBadge
    WHERE BadgeNumber = NEW.BadgeNumber;

    IF exists_count > 0 THEN
        INSERT INTO TransactionFailures (Message)
        VALUES ('Duplicate BadgeNumber attempted: ' || NEW.BadgeNumber);

        RAISE EXCEPTION 'Duplicate BadgeNumber Detected: %', NEW.BadgeNumber;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS badge_insert_trigger ON OfficerBadge;

CREATE TRIGGER badge_insert_trigger
BEFORE INSERT ON OfficerBadge
FOR EACH ROW
EXECUTE FUNCTION log_failed_badge();


INSERT INTO Officers (OfficerID, Name, DepartmentID)
VALUES (3100, 'Officer TestSubject', 88);

INSERT INTO OfficerBadge (BadgeNumber, OfficerID)
VALUES ('BN99999', 3100);


BEGIN;


INSERT INTO Officers (OfficerID, Name, DepartmentID)
VALUES (4002, 'Officer Duplicate', 88);


INSERT INTO OfficerBadge (BadgeNumber, OfficerID)
VALUES ('BN99999', 4002);

ROLLBACK;


