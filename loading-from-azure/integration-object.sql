CREATE STORAGE INTEGRATION azure_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = AZURE
  ENABLED = TRUE
  AZURE_TENANT_ID = '' -- organisation's ID
  STORAGE_ALLOWED_LOCATIONS = ('azure://snowflake.blob.core.windows.net/csv', 'azure://snowflake.blob.core.windows.net/json');

DESC STORAGE integration azure_integration;
-- to click in the link to accept access and create a role in azure (storage blob data contibutor/reader)
-- member -> azure_multi_tenant_app_name
