CREATE TABLE IF NOT EXISTS Users
(
	uid Serial PRIMARY KEY,
	username VARCHAR(25) NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL ,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	validation_url varchar (255) NOT NULL,
	validated BOOLEAN DEFAULT FALSE,
	location VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Schedule
(
	sid Serial PRIMARY KEY,
	uid int REFERENCES Users(uid) ON DELETE CASCADE,
	schedule JSON
);


CREATE TABLE IF NOT EXISTS Playlists
(
	pid Serial PRIMARY KEY,
	uid int REFERENCES Users(uid) ON DELETE CASCADE,
	name varchar(25) NOT NULL,
	playlist JSON,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Molecules
(
	mid Serial PRIMARY KEY,
	link varchar(255) NOT NULL
);

CREATE OR REPLACE FUNCTION insert_schedule() RETURNS trigger AS $$
    BEGIN
        INSERT INTO Schedule(uid, schedule) VALUES(NEW.uid, '[]');
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS User_Inserted ON Users;
CREATE TRIGGER User_Inserted 
	AFTER INSERT ON Users
	FOR EACH ROW
	EXECUTE PROCEDURE insert_schedule();

CREATE INDEX IF NOT EXISTS Usernames ON Users USING hash (username);
CREATE INDEX IF NOT EXISTS Emails ON Users USING hash (email);
CREATE INDEX IF NOT EXISTS UserPlaylists ON Playlists USING hash (uid);