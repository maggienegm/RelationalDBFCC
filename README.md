# Relational Database Course Projects
This repo houses all the projects part of the [Relational Database course](https://www.freecodecamp.org/learn/relational-database) on freeCodeCamp. All projects must pass defined user tests.

## Project 1: Celestial Bodies Database
 This project required building a database of celestial bodies using PostgreSQL within a bash terminal of a virtual Linux machine. The Project1 folder includes the final database dump.

The database schema is defined below using an entity relationship diagram (ERD):
![UniverseDatabaseSchema](https://github.com/maggienegm/RelationalDBFCC/assets/8771586/3e691875-0003-48c3-a4eb-b7e36275fd94)

Things to note:
- The `universe` database includes five tables: `galaxy`, `star`, `planet`, `moon`, and `space_mission`
- The `star` table has a one-to-many relationship with the `galaxy` table
- The `planet` table has a one-to-many relationship with the `star` table
- The `moon` table has a one-to-many relationship with the `planet` table

## Project 2: World Cup Database
This project required using bash and PostgreSQL to create and query data about past World Cups.

First, the required database and its tables were created by running PostgreSQL commands in a bash terminal. An ERD representation of the database schema is below:

![World Cup Database](https://github.com/maggienegm/RelationalDBFCC/assets/8771586/a7fa17f6-8985-42a2-8070-1e4dd4da891c)

Things to note about the database schema:
- The `worldcup` database has two tables: `teams` and `games`
- The `games` table has a one-to-many relationship with the `teams` table

After the `worldcup` database and its tables were created, `insert_data.sh` was run to insert past World Cup data stored in `games.csv` into a PostgreSQL database. Next, `queries.sh` was run to query data from the newly created database using PostgreSQL commands, after which its output was compared against `expected_output.txt`. Lastly, a final database dump was created and stored in `worldcup.sql`.
