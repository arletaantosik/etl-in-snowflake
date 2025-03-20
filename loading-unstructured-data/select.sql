SELECT RAW_FILE:city FROM FIRST_DB.PUBLIC.JSON_RAW;
SELECT $1:first_name FROM FIRST_DB.PUBLIC.JSON_RAW;

-- formated
SELECT RAW_FILE:first_name::string as first_name  FROM FIRST_DB.PUBLIC.JSON_RAW;
SELECT RAW_FILE:id::int as id  FROM FIRST_DB.PUBLIC.JSON_RAW;

SELECT 
    RAW_FILE:id::int as id,  
    RAW_FILE:first_name::STRING as first_name,
    RAW_FILE:last_name::STRING as last_name,
    RAW_FILE:gender::STRING as gender
FROM FIRST_DB.PUBLIC.JSON_RAW;

-- nested {}

SELECT RAW_FILE:job as job  FROM FIRST_DB.PUBLIC.JSON_RAW;

SELECT 
      RAW_FILE:job.salary::INT as salary
FROM FIRST_DB.PUBLIC.JSON_RAW;

SELECT 
    RAW_FILE:first_name::STRING as first_name,
    RAW_FILE:job.salary::INT as salary,
    RAW_FILE:job.title::STRING as title
FROM FIRST_DB.PUBLIC.JSON_RAW;

-- arrays []
SELECT
    RAW_FILE:prev_company as prev_company
FROM FIRST_DB.PUBLIC.JSON_RAW;

SELECT
    RAW_FILE:prev_company[1]::STRING as prev_company
FROM FIRST_DB.PUBLIC.JSON_RAW;

SELECT
    ARRAY_SIZE(RAW_FILE:prev_company) as prev_company
FROM FIRST_DB.PUBLIC.JSON_RAW;

SELECT 
    RAW_FILE:id::int as id,  
    RAW_FILE:first_name::STRING as first_name,
    RAW_FILE:prev_company[0]::STRING as prev_company
FROM FIRST_DB.PUBLIC.JSON_RAW
UNION ALL 
SELECT 
    RAW_FILE:id::int as id,  
    RAW_FILE:first_name::STRING as first_name,
    RAW_FILE:prev_company[1]::STRING as prev_company
FROM FIRST_DB.PUBLIC.JSON_RAW
ORDER BY id;


