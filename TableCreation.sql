CREATE schema Olympics;

USE Olympics;

CREATE TABLE Athletes (
    AthleteID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Country VARCHAR(50),
    UNIQUE (FirstName, LastName, DateOfBirth)
);

CREATE TABLE Sports (
    SportID INT PRIMARY KEY,
    SportName VARCHAR(100)
);

CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    SportID INT,
    EventDate DATE,
    FOREIGN KEY (SportID) REFERENCES Sports(SportID)
);

CREATE TABLE Medals (
    MedalID INT PRIMARY KEY,
    MedalType VARCHAR(10) CHECK (MedalType IN ('Gold', 'Silver', 'Bronze'))
);

CREATE TABLE Participations (
    ParticipationID INT PRIMARY KEY,
    AthleteID INT,
    EventID INT,
    MedalID INT,
    FOREIGN KEY (AthleteID) REFERENCES Athletes(AthleteID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (MedalID) REFERENCES Medals(MedalID)
);
