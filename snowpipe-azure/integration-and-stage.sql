CREATE OR REPLACE DATABASE SNOWPIPE;

CREATE OR REPLACE STORAGE INTEGRATION azure_snowpipe_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = AZURE
  ENABLED = TRUE
  AZURE_TENANT_ID =  '<tenant-id>'
  STORAGE_ALLOWED_LOCATIONS = ('azure://snowflake.blob.core.windows.net/snowpipe');

DESC STORAGE integration azure_snowpipe_integration;
-- to provide access - click 'login.microsoftonline...
-- then add a role - Storage Blob Data Reader 
-- click members -> add AZURE_MULTI_TENANT_APP_NAME

create or replace file format snowpipe.public.fileformat_azure
    TYPE = CSV
    FIELD_DELIMITER = ','
    SKIP_HEADER = 1;

create or replace stage snowpipe.public.stage_azure
    STORAGE_INTEGRATION = azure_snowpipe_integration
    URL = 'azure://snowflake.blob.core.windows.net/snowpipe'
    FILE_FORMAT = fileformat_azure;

LIST @snowpipe.public.stage_azure;
