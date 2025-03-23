-- undrop tables

DROP TABLE FIRST_DB.public.customers;

SELECT * FROM FIRST_DB.public.customers;

UNDROP TABLE FIRST_DB.public.customers;

-- undrop schemas

DROP SCHEMA FIRST_DB.public;

SELECT * FROM FIRST_DB.public.customers;

UNDROP SCHEMA FIRST_DB.public;

-- undrop database

DROP DATABASE FIRST_DB;

SELECT * FROM FIRST_DB.public.customers;

UNDROP DATABASE FIRST_DB;

-- undrop a table

CREATE OR REPLACE TABLE FIRST_DB.public.customers as
SELECT * FROM FIRST_DB.public.customers before (statement => '019b9f7c-0500-851b-0043-4d83000762be');

ALTER TABLE FIRST_DB.public.customers
RENAME TO FIRST_DB.public.customers_wrong;

UNDROP table FIRST_DB.public.customers;

