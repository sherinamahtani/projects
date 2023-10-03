SELECT DISTINCT
id,
name,
height
FROM dataolympics;

SELECT
id,
COUNT(DISTINCT name) as names
FROM dataolympics
GROUP BY id
HAVING COUNT(DISTINCT name)>1;

SELECT
id,
name,
sex, 
COUNT(DISTINCT age) as ages
FROM dataolympics
GROUP BY id, name,
sex
HAVING COUNT(DISTINCT age)>1;

DROP TABLE athelete;

CREATE TABLE Athelete (
		athlete_id INT,
		name VARCHAR(30),
        sex VARCHAR(2),
		height INT,
		weight INT
        );

INSERT INTO athelete 
	SELECT DISTINCT
		id as athelete_id,
        name,
        sex,
        NULLIF(height,''),
        NULLIF(weight,'')
        FROM dataolympics;

select*
from athelete;

select distinct
	Team,
    NOC,
	NOC_Region
    from dataolympics;
	
select distinct
	ROW_NUMBER() OVER(ORDER BY team) as team_id,
	Team,
    NOC,
	NOC_Region
    from (
			select distinct
				Team,
				NOC,
				NOC_Region
				from dataolympics) as teams;

CREATE TABLE teams (
		team_id int,
		country_region VARCHAR(30),
        country_name VARCHAR(30),
        country_abr VARCHAR(3)
			);

INSERT INTO teams 
		select distinct
	ROW_NUMBER() OVER(ORDER BY team) as team_id,
	NOC_Region,
    Team,
	NOC
    from (
			select distinct
				Team,
				NOC,
				NOC_Region
				from dataolympics) as teams;
	
    select*
    from teams;
    
select distinct
	Sport,
    Event
    from dataolympics;

select distinct
	ROW_NUMBER() OVER(ORDER BY event) as event_id,
    sport,
    event
    from (select distinct
			Sport,
			Event
			from dataolympics) as events;

CREATE TABLE event (
		event_id INT,
        sport VARCHAR(50),
        event VARCHAR(50)
			);
            
INSERT INTO event 
		select distinct
	ROW_NUMBER() OVER(ORDER BY event) as event_id,
    sport,
    event
    from (select distinct
			Sport,
			Event
			from dataolympics) as events;

select* from event;

select distinct
	Games,
    Year,
    Season,
    City
    from dataolympics;

select distinct
		ROW_NUMBER() OVER(ORDER BY games) as game_id,
        	Games,
		Year,
		Season,
		City
		from (
				select distinct
					Games,
					Year,
					Season,
					City
					from dataolympics) as games;
                    
CREATE TABLE games (
		game_id INT,
        games VARCHAR(50),
        year INT,
        season VARCHAR(10),
        city VARCHAR(20));

INSERT INTO games
		select distinct
		ROW_NUMBER() OVER(ORDER BY games) as game_id,
        	Games,
		Year,
		Season,
		City
		from (
				select distinct
					Games,
					Year,
					Season,
					City
					from dataolympics) as games;

select* from games;

DROP TABLE results;

CREATE TABLE results (
	athlete_id INT,
    games_id INT,
    event_id INT,
    teams_id int,
    medal VARCHAR(6),
    age INT);
    
INSERT INTO results
select
	id,
    game_id,
    event_id,
    team_id,
    Medal,
    NULLIF(age,'')
    from dataolympics as D
    inner join teams as T on T.country_name=D.team
    inner join games as G on G.games=D.games
    inner join event as E on E.event=D.event;
    
select* from results;
    
ALTER TABLE athelete ADD PRIMARY KEY(athlete_id);

ALTER TABLE results ADD FOREIGN KEY (athlete_id) REFERENCES athelete(athlete_id);

ALTER TABLE games ADD PRIMARY KEY(game_id);

ALTER TABLE results ADD FOREIGN KEY (games_id) REFERENCES games(game_id);

ALTER TABLE event ADD PRIMARY KEY(event_id);

ALTER TABLE results ADD FOREIGN KEY (event_id) REFERENCES event(event_id);

ALTER TABLE teams ADD PRIMARY KEY(team_id);

ALTER TABLE results ADD FOREIGN KEY (teams_id) REFERENCES teams(team_id);
