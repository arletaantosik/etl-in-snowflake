-- cloning table using time travel
-- 1 method
CREATE OR REPLACE TABLE FIRST_DB.PUBLIC.time_travel_clone
CLONE FIRST_DB.public.time_travel at (OFFSET => -60*1.5);

-- 2nd method
CREATE OR REPLACE TABLE FIRST_DB.PUBLIC.time_travel_clone_of_clone
CLONE FIRST_DB.public.time_travel_clone before (statement => '<your-query-id>');

