-- only when stream is not created, because when a stream exists, it tracks changes automatically
CREATE OR REPLACE DATABASE SALES_DB;

create or replace table sales_raw(
	id varchar,
	product varchar,
	price varchar,
	amount varchar,
	store_id varchar);

-- insert values
insert into sales_raw
	values
		(1, 'Eggs', 1.39, 1, 1),
		(2, 'Baking powder', 0.99, 1, 1),
		(3, 'Eggplants', 1.79, 1, 2),
		(4, 'Ice cream', 1.89, 1, 2),
		(5, 'Oats', 1.98, 2, 1);

ALTER TABLE sales_raw
SET CHANGE_TRACKING = TRUE;

-- works within time travel period
SELECT * FROM SALES_RAW
CHANGES(information => default)
AT (offset => -0.5*60);
-- during the last 30 minutes

SELECT * FROM SALES_RAW
CHANGES(information  => default)
AT (timestamp => 'your-timestamp'::timestamp_tz);

SELECT * FROM SALES_RAW
CHANGES(information  => append_only)
AT (timestamp => 'your-timestamp'::timestamp_tz);

