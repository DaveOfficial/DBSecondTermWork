INSERT INTO Athletes (AthleteID, FirstName, LastName, DateOfBirth, Country)
VALUES
    (1, 'Michael', 'Phelps', '1985-06-30', 'United States'),
    (2, 'Usain', 'Bolt', '1986-08-21', 'Jamaica'),
    (3, 'Simone', 'Biles', '1997-03-14', 'United States'),
    (4, 'Katie', 'Ledecky', '1997-03-17', 'United States'),
    (5, 'Serena', 'Williams', '1981-09-26', 'United States');

INSERT INTO Sports (SportID, SportName)
VALUES
    (1, 'Swimming'),
    (2, 'Track and Field'),
    (3, 'Gymnastics'),
    (4, 'Tennis');

INSERT INTO Events (EventID, EventName, SportID, EventDate)
VALUES
    (1, '100m Freestyle', 1, '2024-08-01'),
    (2, '200m Freestyle', 1, '2024-08-03'),
    (3, '100m Butterfly', 1, '2024-08-05'),
    (4, '100m Sprint', 2, '2024-08-06'),
    (5, 'Vault', 3, '2024-08-10'),
    (6, 'Balance Beam', 3, '2024-08-11'),
    (7, 'Singles', 4, '2024-08-15');

INSERT INTO Medals (MedalID, MedalType)
VALUES
    (1, 'Gold'),
    (2, 'Silver'),
    (3, 'Bronze');

INSERT INTO Participations (ParticipationID, AthleteID, EventID, MedalID)
VALUES
    (1, 1, 1, 1),  
    (2, 1, 2, 1),  
    (3, 1, 3, 2),  
    (4, 2, 4, 1), 
    (5, 3, 5, 1),  
    (6, 3, 6, 1), 
    (7, 5, 7, 3);  