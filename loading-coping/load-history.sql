-- Query load history within a database --

SELECT * FROM information_schema.load_history;

-- Query load history gloabally from SNOWFLAKE database --
-- to see unique id of table even if it was replaced
SELECT * FROM snowflake.account_usage.load_history;

-- Filter on specific table & schema
SELECT * FROM snowflake.account_usage.load_history
  where schema_name='PUBLIC' and
  table_name='ORDERS' and
  error_count > 0;

SELECT * FROM snowflake.account_usage.load_history
WHERE DATE(LAST_LOAD_TIME) <= DATEADD(days,-1,CURRENT_DATE); -- from yesterday to today
