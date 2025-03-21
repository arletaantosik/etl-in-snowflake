create or replace file format demo_db.public.fileformat_azure
    TYPE = CSV
    FIELD_DELIMITER = ','
    SKIP_HEADER = 0; -- to see if there's any header

create or replace stage demo_db.public.stage_azure
    STORAGE_INTEGRATION = azure_integration
    URL = 'azure://snowflake.blob.core.windows.net/csv'
    FILE_FORMAT = fileformat_azure;

LIST @demo_db.public.stage_azure;
