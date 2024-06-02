CREATE INDEX idx_EventDate ON Events (EventDate);

CREATE INDEX idx_AthleteName ON Athletes (FirstName, LastName);

CREATE INDEX idx_Country_prefix ON Athletes (Country(10));
