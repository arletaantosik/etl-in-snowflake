DESC pipe MANAGE_DB.pipes.employee_pipe;

SHOW PIPES;

SHOW PIPES like '%employee%';

SHOW PIPES in database MANAGE_DB;

SHOW PIPES in schema MANAGE_DB.pipes;

SHOW PIPES like '%employee%' in Database MANAGE_DB;

CREATE OR REPLACE TABLE FIRST_DB.PUBLIC.employees2 (
  id INT,
  first_name STRING,
  last_name STRING,
  email STRING,
  location STRING,
  department STRING
  );

-- first pause pipe
ALTER PIPE MANAGE_DB.pipes.employee_pipe SET PIPE_EXECUTION_PAUSED = true;

-- to verify that pipe is paused and has pendingFileCount = 0
SELECT SYSTEM$PIPE_STATUS('MANAGE_DB.pipes.employee_pipe') ;

-- when recreating the pipe, the metadata about processed files still exists
CREATE OR REPLACE pipe MANAGE_DB.pipes.employee_pipe
auto_ingest = TRUE
AS
COPY INTO FIRST_DB.PUBLIC.employees2
FROM @MANAGE_DB.external_stages.csv_folder ;

-- to see status of files: e.g. sent
ALTER PIPE  MANAGE_DB.pipes.employee_pipe refresh;

-- resume pipe
ALTER PIPE MANAGE_DB.pipes.employee_pipe SET PIPE_EXECUTION_PAUSED = false;
