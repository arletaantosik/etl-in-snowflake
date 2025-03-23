CREATE OR REPLACE pipe MANAGE_DB.pipes.employee_pipe
auto_ingest = TRUE
AS
COPY INTO OUR_FIRST_DB.PUBLIC.employees
FROM @MANAGE_DB.external_stages.csv_folder  ;

DESC pipe employee_pipe;
-- copy NOTIFICATION_CHANNEL to event notification section in AWS 
-- prefix: csv/snowpipe/
-- suffix -> can be used to limit certain format types 
-- destination -> SQS queue 
-- enter SQS queue ARN -> paste NOTIFICATION_CHANNEL
