DELIMITER $$

CREATE TRIGGER before_athlete_insert
BEFORE INSERT ON Athletes
FOR EACH ROW
BEGIN
    IF NEW.DateOfBirth > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date of Birth cannot be in the future';
    END IF;
END$$

CREATE TRIGGER before_athlete_update
BEFORE UPDATE ON Athletes
FOR EACH ROW
BEGIN
    IF NEW.DateOfBirth > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date of Birth cannot be in the future';
    END IF;
END$$

CREATE TRIGGER before_event_insert
BEFORE INSERT ON Events
FOR EACH ROW
BEGIN
    IF NEW.EventDate < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Event Date cannot be in the past';
    END IF;
END$$

CREATE TRIGGER before_event_update
BEFORE UPDATE ON Events
FOR EACH ROW
BEGIN
    IF NEW.EventDate < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Event Date cannot be in the past';
    END IF;
END$$

CREATE TRIGGER before_participation_insert
BEFORE INSERT ON Participations
FOR EACH ROW
BEGIN
    DECLARE athlete_country VARCHAR(50);
    DECLARE event_sport_id INT;

    SELECT Country INTO athlete_country FROM Athletes WHERE AthleteID = NEW.AthleteID;
    SELECT SportID INTO event_sport_id FROM Events WHERE EventID = NEW.EventID;

    IF athlete_country != (SELECT Country FROM Events e JOIN Sports s ON e.SportID = s.SportID WHERE e.EventID = NEW.EventID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Athlete cannot participate in an event of a different country';
    END IF;

    IF event_sport_id != (SELECT SportID FROM Athletes a JOIN Participations p ON a.AthleteID = p.AthleteID JOIN Events e ON p.EventID = e.EventID WHERE a.AthleteID = NEW.AthleteID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Athlete cannot participate in an event of a different sport';
    END IF;
END$$

CREATE TRIGGER before_participation_update
BEFORE UPDATE ON Participations
FOR EACH ROW
BEGIN
    DECLARE athlete_country VARCHAR(50);
    DECLARE event_sport_id INT;

    SELECT Country INTO athlete_country FROM Athletes WHERE AthleteID = NEW.AthleteID;
    SELECT SportID INTO event_sport_id FROM Events WHERE EventID = NEW.EventID;

    IF athlete_country != (SELECT Country FROM Events e JOIN Sports s ON e.SportID = s.SportID WHERE e.EventID = NEW.EventID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Athlete cannot participate in an event of a different country';
    END IF;

    IF event_sport_id != (SELECT SportID FROM Athletes a JOIN Participations p ON a.AthleteID = p.AthleteID JOIN Events e ON p.EventID = e.EventID WHERE a.AthleteID = NEW.AthleteID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Athlete cannot participate in an event of a different sport';
    END IF;
END$$

DELIMITER ;