-- if the data in the primary table is changing, the view also
-- every time we run the view, we run the query on the table again
-- use case:
    -- query that takes a lot of time to be processed and is used frequently
    -- underlying data is not changing frequently and on a rather irregular basis
          --> then streams or tasks could be cheaper and a better solution
-- more compute consumption
-- stores it like a 'normal table'
-- good performance

-- LIMITATION --
  -- only for enterprise edition
  -- no joins
  -- limited amount of aggregation functions
  -- no limit, having, order by clause

ALTER SESSION SET USE_CACHED_RESULT=FALSE; -- disable global caching

CREATE OR REPLACE MATERIALIZED VIEW ORDERS_MV
AS 
SELECT
YEAR(O_ORDERDATE) AS YEAR,
MAX(O_COMMENT) AS MAX_COMMENT,
MIN(O_COMMENT) AS MIN_COMMENT,
MAX(O_CLERK) AS MAX_CLERK,
MIN(O_CLERK) AS MIN_CLERK
FROM ORDERS.TPCH_SF100.ORDERS
GROUP BY YEAR(O_ORDERDATE);

SHOW MATERIALIZED VIEWS;
--"behind_by"=0 --> seconds, there's no changes and everything is reflected
--"refreshed_on"=date
