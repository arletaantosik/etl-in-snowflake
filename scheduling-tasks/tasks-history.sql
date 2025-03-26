select *
  from table(information_schema.task_history())
  order by scheduled_time desc;

-- "state"=FAILED_AND_AUTO_SUSPENDED -> when a task failed so many times
-- "error_code"
-- "error_message"

-- last 4 hour
select *
  from table(information_schema.task_history(
	scheduled_time_range_start=>dateadd('hour',-4.current_timestamp()),
  -- scheduled_time_range_start=>to_timestamp_ltz('2025-03-22 11:30:00.000 -0700'),
  -- scheduled_time_range_end=>to_timestamp_ltz('2025-03-23 11:30:00.000 -0700'),
	result_limit => 5,
	task_name=>'CUSTOMER_INSERT2'));

-- select TO_TIMESTAMP_LTZ(CURRENT_TIMESTAMP);
