SHOW MATERIALIZED VIEWS;
-- "refreshed_on" -> when there's a change in the root table, the view is up=to-date when we select on the view
-- "compacted_on" -> the same, but for the delete operations
-- "behind_by" -> how long the materialized view hasn't been updated since the first change in the primary table

--- COST MANAGEMENT ---

select * from table(information_schema.materialized_view_refresh_history());
--uses the last 12 hours by default
-- we can see used credits

-- MATERIALIZED_VIEW_REFRESH_HISTORY(
--   [ DATE_RANGE_START => <constant_expr> ]
--   [ , DATE_RANGE_END => <constant_expr> ]
--   [ , MATERIALIZED_VIEW_NAME => '<string>' ] )
