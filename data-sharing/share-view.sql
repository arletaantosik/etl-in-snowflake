CREATE OR REPLACE SHARE VIEW_SHARE;

GRANT USAGE ON DATABASE CUSTOMER_DB TO SHARE VIEW_SHARE;
GRANT USAGE ON SCHEMA CUSTOMER_DB.PUBLIC TO SHARE VIEW_SHARE;

GRANT SELECT ON VIEW  CUSTOMER_DB.PUBLIC.CUSTOMER_VIEW TO SHARE VIEW_SHARE;
-- standard view cannot be granted, only when "secure_objects_only" = false
-- sometimes a standard view is better in case of performance than a secure view
GRANT SELECT ON VIEW  CUSTOMER_DB.PUBLIC.CUSTOMER_VIEW_SECURE TO SHARE VIEW_SHARE;

alter share VIEW_SHARE
set secure_objects_only = false;

ALTER SHARE VIEW_SHARE
ADD ACCOUNT=<locator_reader_account>;
