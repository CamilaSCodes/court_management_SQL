# Database Management System for the Courts

## Logical and conceptual database models, SQL scripts, and ERD for the database schema of a court management system
The Court Database Management System (CDMS) aims to provide a structured database schema for efficiently managing legal cases, parties involved, court information, notices, and their relationships. It is designed to be scalable and adaptable to different legal environments.

## Overview
Legal proceedings often involve complex and voluminous data, making it challenging for legal professionals to manage cases effectively. Existing manual or disparate systems lead to inefficiencies, such as data redundancy, information silos, and cumbersome communication channels. Moreover, ensuring compliance with legal regulations and deadlines poses significant operational risks without a robust system in place. Addressing these challenges requires a centralized, scalable, and user-friendly solution tailored to the needs of legal practitioners.

CDMS offers a centralized database schema built on PostgreSQL, incorporating best practices in legal case management. The solution encompasses various modules to manage key aspects of legal cases, including parties involved, court proceedings, notices, and case types. Leveraging foreign key constraints and relational integrity, CDMS ensures data accuracy and consistency across all interactions. Additionally, CDMS integrates seamlessly with existing tools and workflows, enhancing operational efficiency and facilitating informed decision-making.
## Schema
### Main tables
- `court_case`: Represents individual legal cases with associated details like date of charge, location, etc.
- `case_types`: Defines various types of legal cases.
- `notice`: Stores notices issued in legal cases.
- `court`: Contains information about different courts.
- `process`: Represents legal processing with details like time, date, courts involved, etc.
- `location`: Contains information about courts geographical locations.
- `party`: Represents parties involved in legal cases with details such as name, phone number, etc.
- `party_type`: Defines various types of parties involved in legal cases.
- `email`: Stores email addresses related to parties.
- `place`: Stores address details related to parties.
### Relationship tables
- `possesses`: Manages possession relationships between parties and party types.
- `owns`: Manages ownership relationships between parties and email addresses.
- `assigned`: Stores assignments of parties to cases.
- `issues`: Manages notices issued sent on specific cases.
- `receives`: Tracks notices received by parties.
### Normalization in the CDMS
**1. First Normal Form (1NF):**  Ensures each table represents a single entity with atomic attributes.

**2. Second Normal Form (2NF):**  Eliminates partial dependencies, ensuring all non-key attributes are fully functionally dependent on the primary key.

**3. Third Normal Form (3NF):**  Reduces redundancy by eliminating transitive dependencies.

### Conceptual Model 

![Conceptual Model](https://github.com/CamilaSCodes/court_management_SQL/blob/main/images/conceptual_model.png) 

### Logical Model 

![Logical Model](https://github.com/CamilaSCodes/court_management_SQL/blob/main/images/logical_model.png) 

### Entity Relationship Diagram

![EDR](https://github.com/CamilaSCodes/court_management_SQL/blob/main/images/court-management-ERD.png) 

## Usage
To use this database schema, follow these steps:
1. Set up a PostgreSQL database.
2. Execute the provided [SQL script](https://github.com/CamilaSCodes/court_management_SQL/blob/main/court-management-SQL.sql) in your PostgreSQL environment to create the tables and establish the necessary relationships.
3. Optionally, refer to the [conceptual](https://github.com/CamilaSCodes/court_management_SQL/blob/main/conceptual-model.brM3)  and [logical](https://github.com/CamilaSCodes/court_management_SQL/blob/main/logical-model.brM3) models created using BRModelo and the [ERD](https://github.com/CamilaSCodes/court_management_SQL/blob/main/court-management-ERD.pgerd) created using PostgreSQL for further insights into the database structure.

## Technologies
![PostgreSQL Badge](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=fff&style=for-the-badge)
