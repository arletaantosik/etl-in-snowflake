-- data doesnt copy from the source to a table
-- just a metadata, information, what was changed
-- we dont have to pay additional storage cost, just a cost of columns of metadata (METADATA$ACTION, METADATA$UPDATE, METADATA$ROW_ID)
-- view new data through a stream object in a source table
-- when data is consumed, inserted from a stream object to a target table, the data is removed from a stream object

CREATE OR REPLACE TRANSIENT DATABASE STREAMS_DB;

create or replace table sales_raw_staging(
  id varchar,
  product varchar,
  price varchar,
  amount varchar,
  store_id varchar);

insert into sales_raw_staging 
    values
        (1,'Banana',1.99,1,1),
        (2,'Lemon',0.99,1,1),
        (3,'Apple',1.79,1,2),
        (4,'Orange Juice',1.89,1,2),
        (5,'Cereals',5.98,2,1);  

-- dimensional table - additional information
create or replace table store_table(
  store_id number,
  location varchar,
  employees number);

INSERT INTO STORE_TABLE VALUES(1,'Chicago',33);
INSERT INTO STORE_TABLE VALUES(2,'London',12);

create or replace table sales_final_table(
  id int,
  product varchar,
  price number,
  amount int,
  store_id int,
  location varchar,
  employees int);

INSERT INTO sales_final_table 
    SELECT 
    SA.id,
    SA.product,
    SA.price,
    SA.amount,
    ST.STORE_ID,
    ST.LOCATION, 
    ST.EMPLOYEES 
    FROM SALES_RAW_STAGING SA
    JOIN STORE_TABLE ST ON ST.STORE_ID=SA.STORE_ID ;

create or replace stream sales_stream on table sales_raw_staging;

SHOW STREAMS;
-- "type" - delta
-- "base_tables"

DESC STREAM sales_stream;

insert into sales_raw_staging  
    values
        (6,'Mango',1.99,1,2),
        (7,'Garlic',0.99,1,1);

select * from sales_stream;
-- "METADATA$ACTION" = insert
select * from sales_raw_staging;               
select * from sales_final_table; 

-- consume stream object
INSERT INTO sales_final_table 
    SELECT 
    SA.id,
    SA.product,
    SA.price,
    SA.amount,
    ST.STORE_ID,
    ST.LOCATION, 
    ST.EMPLOYEES 
    FROM SALES_STREAM SA -- stream instead of sales_raw_staging;     
    JOIN STORE_TABLE ST ON ST.STORE_ID=SA.STORE_ID ;






