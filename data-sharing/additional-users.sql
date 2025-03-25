-- from reader account, who has ACCOUNTADMIN role
CREATE USER user123 PASSWORD = 'password';

-- every user has accent to this warehouse
GRANT USAGE ON WAREHOUSE READ_WH TO ROLE PUBLIC;

-- grating privileges on a Shared Database for other users
GRANT IMPORTED PRIVILEGES ON DATABASE DATA_SHARE_DB TO ROLE PUBLIC;

-- account_locator_url the same for user123 as for reader account
