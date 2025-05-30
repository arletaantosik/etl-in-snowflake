-- bad approach -> user has access to definition of the view
CREATE OR REPLACE VIEW CUSTOMER_DB.PUBLIC.CUSTOMER_VIEW AS
SELECT 
FIRST_NAME,
LAST_NAME,
EMAIL
FROM CUSTOMER_DB.PUBLIC.CUSTOMERS
WHERE JOB != 'DATA SCIENTIST'; 

GRANT USAGE ON DATABASE CUSTOMER_DB TO ROLE PUBLIC;
GRANT USAGE ON SCHEMA CUSTOMER_DB.PUBLIC TO ROLE PUBLIC;
GRANT SELECT ON TABLE CUSTOMER_DB.PUBLIC.CUSTOMERS TO ROLE PUBLIC;
GRANT SELECT ON VIEW CUSTOMER_DB.PUBLIC.CUSTOMER_VIEW TO ROLE PUBLIC;

SHOW VIEWS LIKE '%CUSTOMER%';
-- "is_secure" = FALSE

-- BETTER WAY

CREATE OR REPLACE SECURE VIEW CUSTOMER_DB.PUBLIC.CUSTOMER_VIEW_SECURE AS
SELECT 
FIRST_NAME,
LAST_NAME,
EMAIL
FROM CUSTOMER_DB.PUBLIC.CUSTOMERS
WHERE JOB != 'DATA SCIENTIST' ;

GRANT SELECT ON VIEW CUSTOMER_DB.PUBLIC.CUSTOMER_VIEW_SECURE TO ROLE PUBLIC;

SHOW VIEWS LIKE '%CUSTOMER%';
-- the definition is not available - "text" is empty, also the icon of the view is a little different
-- "is_secure" = true
