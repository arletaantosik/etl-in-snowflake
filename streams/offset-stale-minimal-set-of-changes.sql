-- tracks the changes
-- if we want to consume only a half of the data in the stream, the other half will be lost
-- therefore the stream will be empty and will be a new offset
-- offset = 0 -> before update
-- offset = 1 -> after update
-- METADATA$ROW_ID is the same

DESC STREAM sales_stream;
-- when "stale"=true; we cant follow the changes that are being made, "stale_after"=<date> -> after this date, stale=true
-- to remain "stale"=false, we have to 'consume' the new data within 14 days (default)

SHOW PARAMETERS IN TABLE sales_raw_staging;
-- MAX_DATA_EXTENSION_TIME_IN_DAYS -> default value = 14, but we can change it, date to become stale

ALTER TABLE sales_raw_staging
SET MAX_DATA_EXTENSION_TIME_IN_DAYS = 14;

-- MINIMAL SET OF CHANGES --
-- when we update a row a lot within 1 offset, it will take only the previous (first) version and the current one, skips intermediate results
