-- CREATE DATABASE crime_analytics;

-- Table 1: Locations
CREATE TABLE Locations (
    LocationID SERIAL PRIMARY KEY,
    Address TEXT NOT NULL,
    City VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL
);

-- Table 2: Officers
CREATE TABLE Officers (
    OfficerID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DepartmentID INT
);

-- Decomposed Table: OfficerBadge
CREATE TABLE OfficerBadge (
    BadgeNumber VARCHAR(20) PRIMARY KEY,
    OfficerID INT UNIQUE REFERENCES Officers(OfficerID)
);

-- Table 3: CrimeReports
CREATE TABLE CrimeReports (
    CrimeID SERIAL PRIMARY KEY,
    Date DATE NOT NULL,
    Type VARCHAR(50) NOT NULL,
    LocationID INT REFERENCES Locations(LocationID) ON DELETE CASCADE,
    OfficerID INT REFERENCES Officers(OfficerID) ON DELETE SET NULL
);

-- Table 4: Suspects
CREATE TABLE Suspects (
    SuspectID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age > 0),
    CriminalHistory TEXT
);

-- Table 5: Cases
CREATE TABLE Cases (
    CaseID SERIAL PRIMARY KEY,
    CrimeID INT REFERENCES CrimeReports(CrimeID) ON DELETE CASCADE,
    SuspectID INT REFERENCES Suspects(SuspectID) ON DELETE SET NULL,
    Status VARCHAR(50) CHECK (Status IN ('Open', 'Closed', 'Pending')) DEFAULT 'Open'
);

-- Table 6: Victims
CREATE TABLE Victims (
    VictimID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age > 0),
    CrimeID INT REFERENCES CrimeReports(CrimeID) ON DELETE CASCADE
);

-- Table 7: Evidence
CREATE TABLE Evidence (
    EvidenceID SERIAL PRIMARY KEY,
    CaseID INT REFERENCES Cases(CaseID) ON DELETE CASCADE,
    Description TEXT NOT NULL,
    CollectedDate DATE NOT NULL
);

-- Table 8: Witnesses
CREATE TABLE Witnesses (
    WitnessID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Statement TEXT NOT NULL,
    CrimeID INT REFERENCES CrimeReports(CrimeID) ON DELETE CASCADE
);

-- Table 9: Arrests
CREATE TABLE Arrests (
    ArrestID SERIAL PRIMARY KEY,
    SuspectID INT REFERENCES Suspects(SuspectID) ON DELETE CASCADE,
    CrimeID INT REFERENCES CrimeReports(CrimeID) ON DELETE CASCADE,
    ArrestDate DATE NOT NULL,
    OfficerID INT REFERENCES Officers(OfficerID) ON DELETE SET NULL
);

-- Table 10: CourtCases
CREATE TABLE CourtCases (
    CourtCaseID SERIAL PRIMARY KEY,
    CaseID INT REFERENCES Cases(CaseID) ON DELETE CASCADE,
    JudgeName VARCHAR(100) NOT NULL,
    Verdict VARCHAR(50) CHECK (Verdict IN ('Guilty', 'Not Guilty', 'Pending'))
);
