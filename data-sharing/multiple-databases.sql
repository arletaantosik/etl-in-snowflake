CREATE SECURE VIEW SECURE_VIEW_M AS
SELECT 
T1.ID, 
T1.FIRST_NAME,
T2.JOB
FROM CUSTOMER_DB.PUBLIC.CUSTOMERS T1
INNER JOIN  FIRST_DB.PUBLIC.CUSTOMERS T2
ON T1.ID = T2.ID;

CREATE OR REPLACE SHARE VIEW_SHARE;

GRANT USAGE ON DATABASE CUSTOMER_DB TO SHARE VIEW_SHARE;
GRANT USAGE ON SCHEMA CUSTOMER_DB.PUBLIC TO SHARE VIEW_SHARE;
GRANT REFERENCE_USAGE ON DATABASE FIRST_DB TO SHARE VIEW_SHARE;

GRANT SELECT ON VIEW  CUSTOMER_DB.PUBLIC.SECURE_VIEW_M TO SHARE VIEW_SHARE;

ALTER SHARE VIEW_SHARE
ADD ACCOUNT=<id>;
