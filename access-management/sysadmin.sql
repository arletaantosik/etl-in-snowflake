-- SYSADMIN --

-- creates and manages objects
-- creates and manages warehouses, databases, tables etc.
-- custom roles should be assigned to the SYSADMIN role as the parent
    -- therefore has the ability to grant privileges to the custom roles

grant usage on warehouse public_wh 
to role public;

create database common_db;
grant usage on database common_db to role public;

create database sales_database;
grant ownership on database sales_database to role sales_admin;
grant ownership on schema sales_database.public to role sales_admin;

SHOW DATABASES;


