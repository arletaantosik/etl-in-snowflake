-- 1 method - row or bernoulli method
-- every row is chosen with percentage p
-- more "randomness"
-- smaller tables

-- 2nd method - block or system method
-- every block is chosen with percentage p
-- more effective processing
-- larger tables

CREATE OR REPLACE TRANSIENT DATABASE SAMPLING_DB;

-- 1 method
CREATE OR REPLACE VIEW ADDRESS_SAMPLE
AS 
SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.CUSTOMER_ADDRESS 
SAMPLE ROW (1) SEED(27);
-- sample row(1) - >  1% of random row
-- seed(27) - > random number generator, the sampling is repeatable (you'll get the same randomly chosen row every time you run the query)

SELECT CA_LOCATION_TYPE, COUNT(*)/3254250*100
FROM ADDRESS_SAMPLE
GROUP BY CA_LOCATION_TYPE;

-- 2 method
SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.CUSTOMER_ADDRESS 
SAMPLE SYSTEM (1) SEED(23);

