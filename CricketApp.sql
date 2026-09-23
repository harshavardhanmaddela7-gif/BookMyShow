CREATE DATABASE CricketApp;

CREATE TABLE Players
(
    Player_id INT PRIMARY KEY,
    Player_Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    Role VARCHAR(25),
    Country VARCHAR(20)
);

INSERT INTO Players VALUES
(1, 'Arjun', 24, 'Male', 'Batsman', 'India'),
(2, 'Rohan', 31, 'Male', 'Batsman', 'India'),
(3, 'Suresh', 27, 'Male', 'Bowler', 'India'),
(4, 'Vikram', 33, 'Male', 'All-Rounder', 'India'),
(5, 'Michael', 29, 'Male', 'Batsman', 'Australia'),
(6, 'James', 34, 'Male', 'Bowler', 'Australia'),
(7, 'Harry', 26, 'Male', 'Batsman', 'England'),
(8, 'Ben', 36, 'Male', 'Bowler', 'England'),
(9, 'Aditya', 41, 'Male', 'Batsman', 'India'),
(10, 'Ravi', 30, 'Male', 'Batsman', 'India'),
(11, 'Karthik', 23, 'Male', 'Bowler', 'India'),
(12, 'Manoj', 37, 'Male', 'All-Rounder', 'India'),
(13, 'William', 32, 'Male', 'Bowler', 'Australia'),
(14, 'Dale', 28, 'Male', 'Batsman', 'South Africa'),
(15, 'Jack', 47, 'Male', 'Batsman', 'England');


CREATE TABLE Team
(
    Team_ID INT PRIMARY KEY,
    Team_Name VARCHAR(50),
    Country VARCHAR(30),
    Coach VARCHAR(50),
    Ranking INT
);

INSERT INTO Team VALUES
(101, 'India', 'India', 'Rahul Dravid', 3),
(102, 'Australia', 'Australia', 'Pat Cummins', 1),
(103, 'England', 'England', 'Jos Buttler', 5),
(104, 'South Africa', 'South Africa', 'Mark Boucher', 6),
(105, 'New Zealand', 'New Zealand', 'Tom Latham', 8);


CREATE TABLE Matches
(
    Match_ID INT PRIMARY KEY,
    Team1_ID INT,
    Team2_ID INT,
    Match_Date DATE,
    Venue VARCHAR(100),
    Match_Type VARCHAR(20),
    Winner_ID INT
);

INSERT INTO Matches VALUES
(201, 101, 102, '2026-04-10', 'Kolkata', 'T20', 102),
(202, 103, 104, '2026-04-15', 'Pune', 'ODI', 104),
(203, 101, 103, '2026-05-05', 'Delhi', 'T20', 101),
(204, 102, 104, '2026-05-12', 'Chennai', 'Test', 104),
(205, 101, 105, '2026-06-01', 'Mumbai', 'T20', 105),
(206, 102, 103, '2026-06-10', 'Ahmedabad', 'ODI', 103);


CREATE TABLE Player_Performance
(
    Performance_ID INT PRIMARY KEY,
    Match_ID INT,
    Player_ID INT,
    Runs INT,
    Wickets INT,
    Catches INT
);

INSERT INTO Player_Performance VALUES
(301, 201, 1, 72, 0, 1),
(302, 201, 2, 58, 0, 2),
(303, 201, 3, 15, 4, 1),
(304, 201, 4, 52, 2, 3),
(305, 202, 5, 125, 0, 2),
(306, 202, 6, 21, 5, 1),
(307, 202, 7, 44, 0, 3),
(308, 202, 8, 11, 3, 2),
(309, 203, 1, 81, 0, 2),
(310, 203, 2, 49, 1, 1),
(311, 203, 3, 28, 2, 0),
(312, 203, 10, 102, 0, 3),
(313, 204, 6, 14, 4, 1),
(314, 204, 13, 31, 3, 2),
(315, 204, 9, 115, 0, 4),
(316, 205, 4, 67, 3, 2),
(317, 205, 11, 18, 5, 1),
(318, 205, 12, 98, 2, 3),
(319, 206, 5, 83, 0, 3),
(320, 206, 8, 35, 2, 1);


CREATE TABLE Match_Official
(
    Official_ID INT PRIMARY KEY,
    Official_Name VARCHAR(50),
    Role VARCHAR(30),
    Country VARCHAR(30),
    Match_ID INT
);

INSERT INTO Match_Official VALUES
(401, 'Rajesh Singh', 'Umpire', 'India', 201),
(402, 'Robert Brown', 'Umpire', 'Australia', 202),
(403, 'Anil Sharma', 'Third Umpire', 'India', 203),
(404, 'Peter Jones', 'Match Referee', 'Australia', 204),
(405, 'George Miller', 'Umpire', 'England', 205);


CREATE TABLE Payment
(
    Payment_ID INT PRIMARY KEY,
    Booking_ID INT,
    Amount DECIMAL(10,2),
    Payment_Mode VARCHAR(20),
    Payment_Status VARCHAR(20)
);

INSERT INTO Payment VALUES
(501, 2001, 350.00, 'UPI', 'Success'),
(502, 2002, 550.00, 'Card', 'Success'),
(503, 2003, 275.00, 'Cash', 'Pending'),
(504, 2004, 750.00, 'UPI', 'Failed'),
(505, 2005, 650.00, 'Card', 'Success');

1. SELECT Player_Name, Country
FROM Players
WHERE Role = 'Batsman'
AND Age > 25;

2.SELECT Player_Name
FROM Players
WHERE (Country = 'India'
OR Country = 'Australia')
AND Age < 30;

3.SELECT *
FROM Team
WHERE Ranking <= 10
AND Country = 'India';

4.SELECT Match_ID, Venue, Match_Type
FROM Matches
WHERE Match_Type = 'T20'
AND Venue = 'Mumbai';

5.SELECT Player_ID, Runs, Wickets
FROM Player_Performance
WHERE Runs > 60
OR Wickets > 3;

6.SELECT DISTINCT Country
FROM Players;

7.SELECT DISTINCT Match_Type
FROM Matches;

8.SELECT Player_Name
FROM Players
WHERE Player_Name LIKE 'R%'
AND Country = 'India';

9.SELECT COUNT(*) AS Total_Indian_Players
FROM Players
WHERE Country = 'India';

10.
SELECT MAX(Runs) AS Maximum_Runs
FROM Player_Performance;

11.
SELECT AVG(Runs) AS Average_Runs
FROM Player_Performance
WHERE Runs > 30;

12.
SELECT SUM(Wickets) AS Total_Wickets
FROM Player_Performance;

13. 
SELECT 
    MIN(Catches) AS Minimum_Catches,
    MAX(Catches) AS Maximum_Catches,
    AVG(Catches) AS Average_Catches
FROM Player_Performance;

14.
SELECT Role,
       COUNT(*) AS Number_Of_Players
FROM Players
WHERE Age > 25
GROUP BY Role;

15. 
SELECT Country,
       COUNT(*) AS Number_Of_Bowlers
FROM Players
WHERE Role = 'Bowler'
GROUP BY Country;

16.
SELECT Player_ID,
       SUM(Runs) AS Total_Runs
FROM Player_Performance
WHERE Runs > 25
GROUP BY Player_ID;

17. 
SELECT Match_ID,
       SUM(Wickets) AS Total_Wickets
FROM Player_Performance
WHERE Wickets > 0
GROUP BY Match_ID;

18.
SELECT Country,
       COUNT(*) AS Number_Of_Players
FROM Players
GROUP BY Country
HAVING COUNT(*) > 2;

19.
SELECT Player_ID,
       SUM(Runs) AS Total_Runs
FROM Player_Performance
GROUP BY Player_ID
HAVING SUM(Runs) > 100;

20.
SELECT Match_ID,
       SUM(Wickets) AS Total_Wickets
FROM Player_Performance
GROUP BY Match_ID
HAVING SUM(Wickets) > 5;

21.
SELECT Player_ID,
       SUM(Runs) AS Total_Runs
FROM Player_Performance
GROUP BY Player_ID
HAVING SUM(Runs) > 100
ORDER BY Total_Runs DESC;

22.
SELECT Player_ID,
       AVG(Runs) AS Average_Runs
FROM Player_Performance
GROUP BY Player_ID
HAVING AVG(Runs) > 40
ORDER BY Average_Runs ASC;

23.
UPDATE Team
SET Ranking = 2
WHERE Team_ID = 101;

24.
UPDATE Players
SET Age = Age + 1
WHERE Age > 30
AND Role = 'Batsman';

25.
UPDATE Player_Performance
SET Catches = Catches + 1
WHERE Wickets > 2
AND Catches < 3;

26. 
DELETE FROM Players
WHERE Age > 45
AND Country <> 'India';

27.
DELETE FROM Player_Performance
WHERE Runs < 10
AND Wickets = 0;

28.
DELETE FROM Team
WHERE Ranking > 15
AND Country = 'India';

29.
SELECT P.Player_Name,
       P.Role,
       PP.Runs
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID;

30.
SELECT T.Team_Name,
       M.Match_Date,
       M.Venue
FROM Team T
JOIN Matches M
ON T.Team_ID = M.Team1_ID;

31.
SELECT P.Player_Name,
       PP.Match_ID,
       PP.Runs,
       PP.Wickets
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID
WHERE PP.Runs > 50;

32.
SELECT P.Player_Name,
       M.Match_Date,
       M.Venue,
       PP.Runs
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID
JOIN Matches M
ON PP.Match_ID = M.Match_ID;

33.
SELECT P.Player_Name,
       M.Match_Type,
       M.Venue,
       PP.Wickets
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID
JOIN Matches M
ON PP.Match_ID = M.Match_ID
WHERE PP.Wickets > 2;

34.
SELECT DISTINCT P.Player_Name
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID
WHERE PP.Runs > 
(
    SELECT AVG(Runs)
    FROM Player_Performance
);

35.
SELECT P.Player_Name
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID
GROUP BY P.Player_ID, P.Player_Name
HAVING SUM(PP.Runs) >
(
    SELECT SUM(Runs)
    FROM Player_Performance
    WHERE Player_ID = 1
);