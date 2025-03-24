-- pernament -> time travel retention period + fail safe
-- transient -> only time travel retention period
-- temporary -> only in session - time travel retention period, we cant create 'temporary' database

-- pernament
SHOW DATABASES;
SHOW TABLES;
-- if the table/database is other type than 'pernament', we could see that in the 'OPTIONS' column

SELECT * FROM SNOWFLAKE.ACCOUNT_USAGE.TABLE_STORAGE_METRICS
-- "IS_TRANSIENT" column 

CREATE OR REPLACE TRANSIENT TABLE TDB.public.customers_transient (
   id int,
   first_name string,
  last_name string,
  email string,
  gender string,
  Job string,
  Phone string);

SHOW TABLES;
-- "kind"

CREATE OR REPLACE TRANSIENT SCHEMA TRANSIENT_SCHEMA;

SHOW SCHEMAS;
-- "option"


--- TEMPORARY
CREATE OR REPLACE TABLE PDB.public.customers (
   id int,
   first_name string,
  last_name string,
  email string,
  gender string,
  Job string,
  Phone string);

CREATE OR REPLACE TEMPORARY TABLE PDB.public.customers (
   id int,
   first_name string,
  last_name string,
  email string,
  gender string,
  Job string,
  Phone string);
-- recreating a table, to work with the data only within the current session, for other users pernament table still exists

-- inheritance
CREATE transient DATABASE temp;
-- if the database is transient, the table is this database will be transient too, even it was created as 'pernament'
CREATE OR REPLACE TABLE new_table (
   id int,
   first_name string,
  last_name string,
  email string,
  gender string,
  Job string,
  Phone string);

