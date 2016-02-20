DROP TABLE if exists Users CASCADE;
DROP TABLE if exists Schedule CASCADE;
DROP TABLE if exists Playlists CASCADE;
DROP TABLE if exists Molecules CASCADE;
DROP TABLE if exists Plays CASCADE;

CREATE TABLE Users
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

CREATE TABLE Schedule
(
	sid Serial PRIMARY KEY,
	uid int REFERENCES Users(uid) NOT NULL,
	metadata TEXT
);

CREATE TABLE Molecules
(
	mid Serial PRIMARY KEY,
	molecule TEXT NOT NULL
);

CREATE TABLE Playlists
(
	pid Serial PRIMARY KEY,
	uid int REFERENCES Users(uid) NOT NULL,
	mid int REFERENCES Molecules(mid) NOT NULL
);

CREATE TABLE Plays
(
	sid int REFERENCES Schedule(sid),
	pid int REFERENCES Playlists(pid),
	PRIMARY KEY (sid, pid)
);