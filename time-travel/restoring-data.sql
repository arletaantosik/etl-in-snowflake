CREATE OR REPLACE TABLE FIRST_DB.public.test_backup as
SELECT * FROM FIRST_DB.public.test before (statement => '019b9ef0-0500-8473-0043-4d830007309a');

TRUNCATE FIRST_DB.public.test;

INSERT INTO FIRST_DB.public.test
SELECT * FROM FIRST_DB.public.test_backup;

