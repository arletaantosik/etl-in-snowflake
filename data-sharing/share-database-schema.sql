SHOW SHARES;

CREATE OR REPLACE SHARE COMEPLETE_SCHEMA_SHARE;

GRANT USAGE ON DATABASE FIRST_DB TO SHARE COMEPLETE_SCHEMA_SHARE;
-- only 1 database for 1 share
GRANT USAGE ON SCHEMA FIRST_DB.PUBLIC TO SHARE COMEPLETE_SCHEMA_SHARE;

GRANT SELECT ON ALL TABLES IN SCHEMA FIRST_DB.PUBLIC TO SHARE COMEPLETE_SCHEMA_SHARE;
GRANT SELECT ON ALL TABLES IN DATABASE FIRST_DB TO SHARE COMEPLETE_SCHEMA_SHARE;

ALTER SHARE COMEPLETE_SCHEMA_SHARE
ADD ACCOUNT=<locator>;

-- from reader account

DESC SHARE QNA46172.ORDERS_SHARE;
-- to see what we have access to

CREATE DATABASE FIRST_DB FROM SHARE <account_name_producer>.COMEPLETE_SCHEMA_SHARE;

-- when we update the table from provider, the updated data is instantly copied for consumer
-- but when we create a new table from provider, the new table is NOT provided for consumer
  -- so we have to grant a new access
