-- Miniproject-18: Music Streaming Database

CREATE DATABASE IF NOT EXISTS project_18_db;
USE project_18_db;

DROP TABLE IF EXISTS PlaylistSongs;
DROP TABLE IF EXISTS Playlists;
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE Songs (
    song_id INT PRIMARY KEY,
    title VARCHAR(100),
    artist VARCHAR(100),
    play_count INT DEFAULT 0
);

CREATE TABLE Playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE PlaylistSongs (
    id INT PRIMARY KEY,
    playlist_id INT,
    song_id INT,
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

INSERT INTO Users VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Songs VALUES
(1, 'Blinding Lights', 'The Weeknd', 150),
(2, 'Shape of You', 'Ed Sheeran', 200),
(3, 'Levitating', 'Dua Lipa', 180),
(4, 'Dance Monkey', 'Tones and I', 140),
(5, 'Perfect', 'Ed Sheeran', 120);

INSERT INTO Playlists VALUES
(1, 1, 'Morning Vibes'),
(2, 1, 'Workout Mix'),
(3, 2, 'Chill'),
(4, 3, 'Top Hits'),
(5, 3, 'Evening Relax');

INSERT INTO PlaylistSongs VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 2),
(5, 3, 5),
(6, 4, 1),
(7, 4, 3),
(8, 5, 4);


SELECT title, artist, play_count
FROM Songs
ORDER BY play_count DESC
LIMIT 3;


SELECT u.username, COUNT(p.playlist_id) AS total_playlists
FROM Users u
JOIN Playlists p ON u.user_id = p.user_id
GROUP BY u.user_id
HAVING total_playlists > 2;
