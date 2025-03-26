-- to track only insert in a stream
SHOW STREAMS;
-- "mode"=DEFAULT ->  (follows insert, update and delete - all types) - standard
-- append-only -> maybe better for a performance
-- we can't modify this property, only during creation of a stream

CREATE OR REPLACE STREAM SALES_STREAM_APPEND
ON TABLE SALES_RAW_STAGING 
APPEND_ONLY = TRUE;



