# Summary
This SQL code is designed to process and structure data related to the Olympics. It encompasses a series of operations on the dataset, including querying, table creation, and data insertion. The main objectives are to extract pertinent information, organize it into meaningful tables, and establish relationships between those tables for efficient retrieval and analysis.

# Code Overview
Data Selection Queries:

**Query 1:** Selects distinct athlete IDs, names, and heights from the dataolympics table.
**Query 2:** Retrieves athlete IDs with more than one distinct associated name from the dataolympics table.
**Query 3: **Retrieves athlete IDs, names, sexes, and counts the number of distinct ages associated with each athlete with more than one distinct age from the dataolympics table.
Table Operations:

Drop Table: Drops the athelete table if it exists.
Create Table (athelete): Creates a new table athelete with columns for athlete ID, name, sex, height, and weight.
Insert Into (athelete): Inserts data from dataolympics into the athelete table, applying some transformation (converting height and weight to integers, handling possible empty values).
Data Selection and Transformation:

Query 4: Selects distinct Team, NOC, and NOC Region from the dataolympics table.
Query 5: Assigns a unique team ID to each distinct team.
Table Operations:

Create Table (teams): Creates a new table teams with columns for team ID, country region, country name, and country abbreviation.
Insert Into (teams): Inserts data from the transformed teams query into the teams table.
Data Selection and Transformation:

Query 6: Selects distinct Sport and Event from the dataolympics table.
Query 7: Assigns a unique event ID to each distinct event.
Table Operations:

Create Table (event): Creates a new table event with columns for event ID, sport, and event.
Insert Into (event): Inserts data from the transformed events query into the event table.
Data Selection and Transformation:

Query 8: Selects distinct Games, Year, Season, and City from the dataolympics table.
Query 9: Assigns a unique game ID to each distinct set of Games, Year, Season, and City.
Table Operations:

Create Table (games): Creates a new table games with columns for game ID, games, year, season, and city.
Insert Into (games): Inserts data from the transformed games query into the games table.
Table Operations:

Drop Table (results): Drops the results table if it exists.
Create Table (results):

Creates a new table results with columns for athlete ID, game ID, event ID, team ID, medal, and age.
Insert Into (results):
Inserts data from the dataolympics table, joining with teams, games, event to populate the results table.
Primary Keys and Foreign Keys:
Establishes primary and foreign key relationships between the tables (athelete, results, games, event, teams) to ensure data integrity.
Usage
To apply this code, follow these steps:

Create Database: Ensure you have a suitable database environment set up (e.g., MySQL, PostgreSQL).

Execute Queries: Run the queries in a SQL environment in the order presented, paying attention to any potential dependencies.

Check Table Relationships: Verify that the primary and foreign key relationships have been correctly established.

Test Queries: Test the newly created tables with your own queries to ensure they are functioning as expected.

Note
This code assumes that there is a dataset named dataolympics already available in the database. Please make sure to replace this with the actual table name if it differs.

Acknowledgments
This code was authored by Sherina Mahtani as a solution to an SQL challenge related to the Olympics dataset.

