# Relational Database Course Projects
This repo houses all the projects part of the [Relational Database course](https://www.freecodecamp.org/learn/relational-database) on FreeCodeCamp.

## Project 1: Celestial Bodies Database
 This projects requires building a database of celestial bodies using PostgreSQL within a bash terminal of a virtual Linux machine. The Project1 folder includes the final database dump.

The database schema is defined below in a UML diagram:

Things to note:
- The `universe` database includes five tables: `galaxy`, `star`, `planet`, `moon`, and `space_mission`
- Each table has a primary key
- The `star` table has a one-to-many relationship with the `galaxy` table
- The `planet` table has a one-to-many relationship with the `star` table
- The `moon` table has a one-to-many relationship with the `planet` table