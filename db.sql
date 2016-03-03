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
	uid int REFERENCES Users(uid) NOT NULL,
	metadata JSON
);

CREATE TABLE IF NOT EXISTS Molecules
(
	mid Serial PRIMARY KEY,
	molecule varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Playlists
(
	pid Serial PRIMARY KEY,
	uid int REFERENCES Users(uid) NOT NULL,
	name varchar(25) NOT NULL,
	molecules JSON,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS Usernames ON Users USING hash (username);
CREATE INDEX IF NOT EXISTS Emails ON Users USING hash (email);
CREATE INDEX IF NOT EXISTS UserPlaylists ON Playlists USING hash (uid);