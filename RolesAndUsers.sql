CREATE ROLE DatabaseAdmin;
CREATE ROLE TableAdmin;
CREATE ROLE ColumnAdmin;

GRANT ALL PRIVILEGES ON Olympics.* TO DatabaseAdmin;

GRANT SELECT, INSERT, UPDATE, DELETE ON Olympics.Athletes TO TableAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Olympics.Sports TO TableAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Olympics.Events TO TableAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Olympics.Medals TO TableAdmin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Olympics.Participations TO TableAdmin;

GRANT SELECT(FirstName, LastName, DateOfBirth) ON Olympics.Athletes TO ColumnAdmin;
GRANT SELECT(SportName) ON Olympics.Sports TO ColumnAdmin;
GRANT SELECT(EventName, EventDate) ON Olympics.Events TO ColumnAdmin;
GRANT SELECT(MedalType) ON Olympics.Medals TO ColumnAdmin;

CREATE USER 'db_admin'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'table_admin'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'column_admin'@'localhost' IDENTIFIED BY 'password';

GRANT DatabaseAdmin TO 'db_admin'@'localhost';
GRANT TableAdmin TO 'table_admin'@'localhost';
GRANT ColumnAdmin TO 'column_admin'@'localhost';