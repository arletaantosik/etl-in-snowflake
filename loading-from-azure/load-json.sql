create or replace file format demo_db.public.fileformat_azure_json
    TYPE = JSON;

create or replace stage demo_db.public.stage_azure
    STORAGE_INTEGRATION = azure_integration
    URL = 'azure://snowflake.blob.core.windows.net/json'
    FILE_FORMAT = fileformat_azure_json; 

SELECT $1:"Car Model" FROM @demo_db.public.stage_azure; 
SELECT $1:"Car Model"::STRING FROM @demo_db.public.stage_azure; 

Create or replace table car_owner (
    car_model varchar, 
    car_model_year int,
    car_make varchar, 
    first_name varchar,
    last_name varchar);
 
COPY INTO car_owner
FROM
(SELECT 
$1:"Car Model"::STRING as car_model, 
$1:"Car Model Year"::INT as car_model_year,
$1:"car make"::STRING as "car make", 
$1:"first_name"::STRING as first_name,
$1:"last_name"::STRING as last_name
FROM @demo_db.public.stage_azure);

-- raw table
create or replace table car_owner_raw (
  raw variant);

COPY INTO car_owner_raw
FROM @demo_db.public.stage_azure;
