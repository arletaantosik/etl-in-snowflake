-- SECURITYADMIN --

-- manages any object grant grobally
-- creates, monitors and manages users & roles
-- inherits USERADMIN privileges

create role sales_admin;
create role sales_users;

-- create hierarchy
grant role sales_users to role sales_admin;
-- sales_admin has access to everything like a sales_users

grant role sales_admin to role SYSADMIN;
-- sysadmin has access to objects created by lower roles
