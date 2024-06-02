START TRANSACTION;

INSERT INTO Athletes (AthleteID, FirstName, LastName, DateOfBirth, Country)
VALUES (6, 'Naomi', 'Osaka', '1997-10-16', 'Japan');

INSERT INTO Events (EventID, EventName, SportID, EventDate)
VALUES (8, 'Doubles', 4, '2024-08-17')
ON DUPLICATE KEY UPDATE EventID = EventID;

INSERT INTO Participations (ParticipationID, AthleteID, EventID, MedalID)
VALUES (8, 6, 8, NULL);

COMMIT;