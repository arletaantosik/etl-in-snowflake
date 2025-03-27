create or replace masking policy emails as (val varchar) returns varchar ->
case
  when current_role() in ('ANALYST_FULL') then val
  when current_role() in ('ANALYST_MASKED') then regexp_replace(val,'.+\@','*****@') -- leave email domain unmasked
  else '********'
end;
-- '.' - any character, '.+' - multiple characters

ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN email
SET MASKING POLICY emails;

-- 2 example --
-- hash value --

create or replace masking policy sha2 as (val varchar) returns varchar ->
case
  when current_role() in ('ANALYST_FULL') then val
  else sha2(val) -- return hash of the column value
end;

ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN full_name
UNSET MASKING POLICY;

ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN full_name
SET MASKING POLICY sha2;

-- 3 example --

create or replace masking policy dates as (val date) returns date ->
case
  when current_role() in ('ANALYST_FULL') then val
  else date_from_parts(0001, 01, 01)::date -- returns 0001-01-01 00:00:00.000
end;

ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN create_date 
SET MASKING POLICY dates;
