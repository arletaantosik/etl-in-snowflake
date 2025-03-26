USE ROLE ACCOUNTADMIN;

-- we can apply policy on multiple columns
-- apply policy on a specific column 
ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN full_name 
SET MASKING POLICY phone;

-- apply policy on another specific column 
ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN phone
SET MASKING POLICY phone;

--- UNSET POLICY  ---

DESC MASKING POLICY phone;
SHOW MASKING POLICIES;

-- show columns with applied policies
SELECT * FROM table(information_schema.policy_references(policy_name=>'phone'));

-- remove policy before replacing/dropping 
ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN email
UNSET MASKING POLICY;

ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN phone
UNSET MASKING POLICY;

-- replace policy
create or replace masking policy names as (val varchar) returns varchar ->
            case
            when current_role() in ('ANALYST_FULL', 'ACCOUNTADMIN') then val
            else CONCAT(LEFT(val,2),'*******') -- e.g. aa*******
            end;

ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN full_name
SET MASKING POLICY names;

DROP masking policy phone;
