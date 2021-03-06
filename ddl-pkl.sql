-- PROGRESSION - 1

-- 1. **Create table city**
create table CITY(ID INT PRIMARY KEY,NAME VARCHAR(50) NOT NULL);

-- 2. **Create table referee**
create table REFREE(ID INT,NAME VARCHAR(50) NOT NULL,CONSTRAINT REFEREE PRIMARY KEY (ID));


-- 3. **Create table innings**
create table INNINGS(ID INT,INNINGS_NUMBER INT NOT NULL, CONSTRAINT INNINGS PRIMARY KEY (ID));

-- 4. **Create table extra_type**
create table EXTRA_TYPE(ID INT,NAME VARCHAR(50) NOT NULL, CONSTRAINT EXTRA_TYPE PRIMARY KEY (ID));

-- 5. **Create table skill**
create table SKILL(ID INT PRIMARY KEY,NAME VARCHAR(50) NOT NULL);

-- 6. **Create table team**
create table TEAM(ID INT PRIMARY KEY,NAME VARCHAR(50) NOT NULL,COACH VARCHAR(50) NOT NULL,HOME_CITY INT REFERENCES CITY(ID) NOT NULL);

-- 7. **Create table player**
create table PLAYER(ID INT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
COUNTRY VARCHAR(50) NOT NULL,
SKILL_ID INT REFERENCES SKILL(ID),
TEAM_ID INT REFERENCES TEAM(ID));


-- 8. **Create table venue**
create table VENUE(ID INT PRIMARY KEY,
STADIUM_NAME VARCHAR(50),
CITY_ID INT REFERENCES CITY(ID));


-- 9. **Create table event**
create table EVENT(ID INT PRIMARY KEY,
   INNINGS_ID INT REFERENCES INNINGS(ID),
   EVENT_NO INT NOT NULL,
   RAIDER_ID INT REFERENCES PLAYER(ID),
   RAID_POINTS INT NOT NULL,
   DEFENDING_POINTS INT NOT NULL,
   CLOCK_IN_SECONDS INT NOT NULL,
   TEAM_ONE_SCORE INT NOT NULL,
   TEAM_TWO_SCORE INT NOT NULL
);




-- 10. **Create table extra_event**
CREATE  TABLE EXTRA_EVENT(
ID INT PRIMARY KEY,
EVENT_ID INT REFERENCES EVENT(ID),
EXTRA_TYPE_ID  INT REFERENCES EXTRA_TYPE(ID),
POINTS INT NOT NULL,
SCORING_TEAM_ID INT REFERENCES TEAM(ID)
);



-- 11. **Create table outcome**
CREATE TABLE OUTCOME(
ID INT PRIMARY KEY,
STATUS VARCHAR(100) NOT NULL,
WINNER_TEAM_ID INT,
SCORE INT,
PLAYER_OF_MATCH INT
);


-- 12. **Create table game**
CREATE TABLE GAME(ID INT PRIMARY KEY,
                 GAME_DATE DATE,
                 TEAM_ID_1 INT REFERENCES TEAM(ID),
                 TEAM_ID_2 INT REFERENCES TEAM(ID),
                 VENUE_ID INT REFERENCES VENUE(ID),
                 OUTCOME_ID INT REFERENCES OUTCOME(ID),
                 REFEREE_ID_1 INT REFERENCES REFREE(ID),
                 REFEREE_ID_2 INT REFERENCES REFREE(ID),
                 FIRST_INNINGS_ID INT REFERENCES INNINGS(ID),
                 SECOND_INNINGS_ID INT REFERENCES INNINGS(ID)                          
);




-- 13. **Drop table city**
DROP TABLE CITY;

-- 14. **Drop table innings**
DROP TABLE INNINGS;


-- 15. **Drop table skill**
DROP TABLE SKILL;

-- 16. **Drop table extra_type**
DROP TABLE EXTRA_TYPE;
