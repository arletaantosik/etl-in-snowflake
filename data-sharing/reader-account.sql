-- for non-snowflake user 
-- create a reader account, created by accountadmin
-- they dont pay for the compute
-- immediately visible data
-- data exchange -> private hub for sharing data -> enabled by snowflake support

CREATE MANAGED ACCOUNT tech_account
ADMIN_NAME = tech_admin,
ADMIN_PASSWORD = 'password',
TYPE = READER;

SHOW MANAGED ACCOUNTS;
-- account_locator_url -> copy and paste in the browser

DROP MANAGED ACCOUNT tech_account;

ALTER SHARE ORDERS_SHARE 
ADD ACCOUNT =  <reader-account-id> -- locator
SHARE_RESTRICTIONS=false;

SHOW SHARES;

DESC SHARE <owner_account>.ORDERS_SHARE; --order_share -> name
-- to see details on share

-- create a database in consumer account using the share
CREATE DATABASE DATA_SHARE_DB FROM SHARE <account_name_producer>.ORDERS_SHARE;

CREATE WAREHOUSE READ_WH WITH
WAREHOUSE_SIZE='X-SMALL'
AUTO_SUSPEND = 180
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE;

SELECT * FROM  DATA_SHARE_DB.PUBLIC.ORDERS;
