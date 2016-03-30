INSERT INTO Users(uid, username, email, password, validation_url, validated) values(1, 'batman', 'batman@bruce.com', '$2a$10$gpVOWP1dLHOYo/cPymFSdOn/TUnlLBDHBi6GDfu6MpJTFCCcEI0nW', 'gjhbr3dz400gsk8kowg04so0cww8kc', true);

INSERT INTO Schedule(sid, uid, schedule) values(1, 1,'[{"pid":1, "startTime":"2:00pm"},{"pid":2, "startTime":"4:00pm"},{"pid":3, "startTime":"6:00pm"},{"pid":1, "startTime":"6:00pm"}]');

INSERT INTO Playlists(pid, uid, name, playlist) values(1, 1, 'best playlist ever','[1, 2, 3]');
INSERT INTO Playlists(pid, uid, name, playlist) values(2, 1, 'second best playlist ever','[4,1,5]');
INSERT INTO Playlists(pid, uid, name, playlist) values(3, 1, 'third best playlist ever','[3,2,2]');

INSERT INTO Molecules(mid, link) values(1, 'H2O');
INSERT INTO Molecules(mid, link) values(2, 'HCl');
INSERT INTO Molecules(mid, link) values(3, 'NaCl');
INSERT INTO Molecules(mid, link) values(4, 'N2');
INSERT INTO Molecules(mid, link) values(5, 'H2O2');
