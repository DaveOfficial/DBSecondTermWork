CREATE VIEW athletes_with_country AS
SELECT a.AthleteID, a.FirstName, a.LastName, a.DateOfBirth, a.Country
FROM Athletes a;

CREATE VIEW events_with_sport AS
SELECT e.EventID, e.EventName, e.EventDate, s.SportName
FROM Events e
JOIN Sports s ON e.SportID = s.SportID;

CREATE VIEW medal_winners AS
SELECT p.ParticipationID, a.FirstName, a.LastName, e.EventName, m.MedalType
FROM Participations p
JOIN Athletes a ON p.AthleteID = a.AthleteID
JOIN Events e ON p.EventID = e.EventID
JOIN Medals m ON p.MedalID = m.MedalID;
