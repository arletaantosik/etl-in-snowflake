-- pipe only can be cloned if refers to external stages
-- named internal stages cannot be cloned
-- creates a snapshot at certain moment, still referencing to an existing table -> no storage cost
-- but when we add a new data, new micro partition will be created
-- privileges will only be inherited only to child object, never to source object itself
-- privileges -> for table - select, for pipe, stream, task - owner, other object - usage
-- load history metadata is not coppied

CREATE TABLE FIRST_DB.PUBLIC.CUSTOMERS_CLONE
CLONE FIRST_DB.PUBLIC.CUSTOMERS;

-- cloning a temporary table to a pernament is not possible!!!
CREATE OR REPLACE TEMPORARY TABLE FIRST_DB.PUBLIC.TEMP_TABLE(
  id int);
-- only to temporary or transient
CREATE TEMPORARY TABLE FIRST_DB.PUBLIC.TABLE_COPY
CLONE FIRST_DB.PUBLIC.TEMP_TABLE;
