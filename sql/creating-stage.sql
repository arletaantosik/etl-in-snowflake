CREATE OR REPLACE DATABASE MANAGE_DB;
CREATE OR REPLACE SCHEMA external_stages;

CREATE OR REPLACE STAGE MANAGE_DB.external_stages.aws_stage
    url='s3://bucketsnowflakes3'
    credentials=(aws_key_id='ABCD_DUMMY_ID' aws_secret_key='1234abcd_key');

DESC STAGE MANAGE_DB.external_stages.aws_stage; 

ALTER STAGE aws_stage
    SET credentials=(aws_key_id='XYZ_DUMMY_ID' aws_secret_key='987xyz');

-- public access 
CREATE OR REPLACE STAGE MANAGE_DB.external_stages.aws_stage
    url='s3://bucketsnowflakes3';

LIST @aws_stage;
