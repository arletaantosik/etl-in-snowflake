SHOW TABLES like '%CUSTOMERS%';

-- 1 method
ALTER TABLE FIRST_DB.PUBLIC.CUSTOMERS
SET DATA_RETENTION_TIME_IN_DAYS = 1;

-- 2 method
CREATE OR REPLACE TABLE FIRST_DB.public.ret_example (
    id int,
    first_name string,
    last_name string,
    email string,
    gender string,
    Job string,
    Phone string)
DATA_RETENTION_TIME_IN_DAYS = 3;

-- 
ALTER TABLE FIRST_DB.public.ret_example
SET DATA_RETENTION_TIME_IN_DAYS = 0;

DROP TABLE FIRST_DB.public.ret_example;
-- when DATA_RETENTION_TIME_IN_DAYS = 0, it's impossible to undrop table
UNDROP TABLE FIRST_DB.public.ret_example;
