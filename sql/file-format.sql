CREATE OR REPLACE file format MANAGE_DB.file_formats.my_file_format;

DESC file format MANAGE_DB.file_formats.my_file_format;
-- csv by default

COPY INTO FIRST_DB.PUBLIC.ORDERS_EX
    FROM @MANAGE_DB.external_stages.aws_stage_errorex
    file_format= (FORMAT_NAME=MANAGE_DB.file_formats.my_file_format)
    files = ('OrderDetails_error.csv')
    ON_ERROR = 'SKIP_FILE_3'; 

ALTER file format MANAGE_DB.file_formats.my_file_format
    SET SKIP_HEADER = 1; -- 1 -> true


CREATE OR REPLACE file format MANAGE_DB.file_formats.my_file_format
    TYPE=JSON,
    TIME_FORMAT=AUTO; 
