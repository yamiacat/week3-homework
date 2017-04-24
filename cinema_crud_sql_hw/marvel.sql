DROP TABLE attendances;
DROP TABLE movies;
DROP TABLE people;

CREATE TABLE movies (
	id SERIAL8 PRIMARY KEY,
	title VARCHAR(255),
	year INT2,
	show_time VARCHAR(255)
);

CREATE TABLE people (
	id SERIAL8 PRIMARY KEY,
	name VARCHAR(255)
);

CREATE TABLE attendances (
	id SERIAL8 PRIMARY KEY,
	person_id INT REFERENCES people(id) ON DELETE CASCADE,
	movie_id INT REFERENCES movies(id) ON DELETE CASCADE
);

INSERT INTO people (name) VALUES ('Alasdair Gerrie');
INSERT INTO people (name) VALUES ('Alex Berry');
INSERT INTO people (name) VALUES ('Charlie Wood');
INSERT INTO people (name) VALUES ('Christopher Woodall');
INSERT INTO people (name) VALUES ('Daniel Garrido');
INSERT INTO people (name) VALUES ('Eoghan Crowley');
INSERT INTO people (name) VALUES ('Craig Morton');
INSERT INTO people (name) VALUES ('Simon');
INSERT INTO people (name) VALUES ('Simon');
INSERT INTO people (name) VALUES ('Gillian Liddle');
INSERT INTO people (name) VALUES ('Irma Rasikeviciute');
INSERT INTO people (name) VALUES ('Jnny Watson');
INSERT INTO people (name) VALUES ('Lewis Burns');
INSERT INTO people (name) VALUES ('Louise Camlin');
INSERT INTO people (name) VALUES ('Marilena Alexe');
INSERT INTO people (name) VALUES ('Matt Rose');
INSERT INTO people (name) VALUES ('Mike Casey');
INSERT INTO people (name) VALUES ('Mungo Dewar');
INSERT INTO people (name) VALUES ('Nick Bulbeck');
INSERT INTO people (name) VALUES ('Paul Jablonski');
INSERT INTO people (name) VALUES ('Richard Edwards');

INSERT INTO movies (title, year, show_time) VALUES ('Iron Man', 2008, '14:05');
INSERT INTO movies (title, year, show_time) VALUES ('The Incredible Hulk', 2008, '15:20');
INSERT INTO movies (title, year, show_time) VALUES ('Iron Man 2', 2010, '19:20');
INSERT INTO movies (title, year, show_time) VALUES ('Thor', 2011, '22:40');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: The First Avenger', 2011, '21:55');
INSERT INTO movies (title, year, show_time) VALUES ('Avengers Assemble', 2012, '17:25');
INSERT INTO movies (title, year, show_time) VALUES ('Iron Man 3', 2013, '15:55');
INSERT INTO movies (title, year, show_time) VALUES ('Thor: The Dark World', 2013, '18:55');
INSERT INTO movies (title, year, show_time) VALUES ('Batman Begins', 2005, '22:25');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: The Winter Soldier', 2014, '15:25');
INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy', 2014, '21:45');
INSERT INTO movies (title, year, show_time) VALUES ('Avengers: Age of Ultron', 2015, '18:30');
INSERT INTO movies (title, year, show_time) VALUES ('Ant-Man', 2015, '21:10');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: Civil War', 2016, '22:45');
INSERT INTO movies (title, year, show_time) VALUES ('Doctor Strange', 2016, '12:40');

INSERT INTO attendances (person_id, movie_id) VALUES (19, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (19, 11);
INSERT INTO attendances (person_id, movie_id) VALUES (11, 1);
INSERT INTO attendances (person_id, movie_id) VALUES (19, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (11, 6);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (3, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (4, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (17, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (13, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (8, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (18, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (15, 5);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 6);
INSERT INTO attendances (person_id, movie_id) VALUES (17, 11);
INSERT INTO attendances (person_id, movie_id) VALUES (21, 15);
INSERT INTO attendances (person_id, movie_id) VALUES (5, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (10, 4);
INSERT INTO attendances (person_id, movie_id) VALUES (20, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (2, 11);
INSERT INTO attendances (person_id, movie_id) VALUES (21, 4);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (8, 5);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (6, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (18, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (5, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (6, 15);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (21, 11);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 11);
INSERT INTO attendances (person_id, movie_id) VALUES (6, 3);
INSERT INTO attendances (person_id, movie_id) VALUES (13, 6);
INSERT INTO attendances (person_id, movie_id) VALUES (5, 3);
INSERT INTO attendances (person_id, movie_id) VALUES (8, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 9);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (18, 6);
INSERT INTO attendances (person_id, movie_id) VALUES (13, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 5);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 1);
INSERT INTO attendances (person_id, movie_id) VALUES (16, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (2, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (3, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (18, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (8, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (8, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (15, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 11);
INSERT INTO attendances (person_id, movie_id) VALUES (2, 4);
INSERT INTO attendances (person_id, movie_id) VALUES (8, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (10, 6);
INSERT INTO attendances (person_id, movie_id) VALUES (16, 15);
INSERT INTO attendances (person_id, movie_id) VALUES (4, 1);
INSERT INTO attendances (person_id, movie_id) VALUES (3, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (10, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (5, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 3);
INSERT INTO attendances (person_id, movie_id) VALUES (6, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (20, 1);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 4);
INSERT INTO attendances (person_id, movie_id) VALUES (15, 1);
INSERT INTO attendances (person_id, movie_id) VALUES (18, 9);
INSERT INTO attendances (person_id, movie_id) VALUES (7, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (14, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (7, 15);
INSERT INTO attendances (person_id, movie_id) VALUES (21, 9);
INSERT INTO attendances (person_id, movie_id) VALUES (20, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (17, 3);
INSERT INTO attendances (person_id, movie_id) VALUES (10, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (17, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (13, 9);
INSERT INTO attendances (person_id, movie_id) VALUES (11, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 9);
INSERT INTO attendances (person_id, movie_id) VALUES (13, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (10, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (17, 1);
INSERT INTO attendances (person_id, movie_id) VALUES (16, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 6);
INSERT INTO attendances (person_id, movie_id) VALUES (21, 5);


UPDATE movies SET show_time = 21.30 WHERE id = 11;


SELECT * FROM movies;
