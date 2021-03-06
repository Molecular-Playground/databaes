CREATE TABLE IF NOT EXISTS Users
(
	uid Serial PRIMARY KEY,
	username VARCHAR(25) NOT NULL UNIQUE,
    CONSTRAINT chk_username CHECK (username NOT IN('playlist')),
	email VARCHAR(50) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL ,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	validation_url varchar (30) NOT NULL,
	validated BOOLEAN DEFAULT FALSE,
	location VARCHAR(50),
	password_reset_key VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Admin
(
	uid int REFERENCES Users(uid) ON DELETE CASCADE
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
	name varchar(100) UNIQUE,
	link varchar(255) NOT NULL,
	data_type varchar(10) NOT NULL
);

CREATE OR REPLACE FUNCTION insert_schedule() RETURNS trigger AS $$
    BEGIN
        INSERT INTO Schedule(uid, schedule) VALUES(NEW.uid, '{}');
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
CREATE INDEX IF NOT EXISTS MoleculeNames ON Molecules USING btree (name);
CREATE INDEX IF NOT EXISTS AdminID ON Admin USING btree (uid);
