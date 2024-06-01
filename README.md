# Relational Database Course Projects
This repo houses all the projects part of the [Relational Database course](https://www.freecodecamp.org/learn/relational-database) on freeCodeCamp. All projects must pass defined user stories and tests.

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

First, the required `worldcup` database and its tables were created by running PostgreSQL commands in a bash terminal. An ERD representation of the database schema is below:

![World Cup Database](https://github.com/maggienegm/RelationalDBFCC/assets/8771586/a7fa17f6-8985-42a2-8070-1e4dd4da891c)

Things to note about the database schema:
- The `worldcup` database has two tables: `teams` and `games`
- The `games` table has a one-to-many relationship with the `teams` table

After the `worldcup` database and its tables were created, `insert_data.sh` was created to insert past World Cup data stored in `games.csv` into the newly created `worldcup` database. Next, `queries.sh` was created to query specific data from the `worldcup` database using PostgreSQL commands, after which its output was compared against `expected_output.txt`. Lastly, a final database dump was generated and stored in `worldcup.sql`.

## Project 3: Salon Appointment Scheduler
This project required building an interactive Bash program that uses PostgreSQL to track salon customers and appointments.

First, the required `salon` database and its tables were created by running PostgreSQL commands in a bash terminal. An ERD representation of the database schema is below:

![Salon Appointment Schedular](https://github.com/maggienegm/RelationalDBFCC/assets/8771586/92c645ab-bf66-4efa-b6de-7d6af5235100)

Things to note about the database schema:
- The `salon` database has three tables: `customers`, `services`, and `appointments`
- Both the `customers` and `services` tables have a one-to-many relationship with the `appointments` table

After the `salon` database and its tables were created, an interactive salon appointment schedular app was built using Bash and PostgreSQL in `salon.sh` and then run against defined user tests. Lastly, a final database dump was generated and stored in `salon.sql`. (`examples.txt` was provided to show what passing output would look like when compared against defined tests.)

## Project 4: Periodic Table
This project first required fixing an existing database and it's tables based on defined user stories and requirements. 

An ERD representation of the database schema is below:

TODO: insert schema here

Things to note about the database schema:
- The database is called `periodic_table` and has three tables: `elements`, `properties`, and `types`
- The `elements` table has a one-to-one relationship with the `properties` table
- The `properties` table has a one-to-many relationship with the `types` table

After the `periodic_table` database was fixed, a local GitHub repo was created with a Bash script inside called `element.sh`. `element.sh` accepts an argument in the form of an atomic number, symbol, or name of an element and outputs some information queried from the database about the given element. Lastly, a final database dump was generated and stored in `periodic_table.sql`.