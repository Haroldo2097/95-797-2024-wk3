--Pulling out only the attributes from stagging that we want to use for analysis
--Here is a step past stagging where we can add derived fields, ie trip duration in mins and secs
select
	started_at_ts,
	ended_at_ts,
	datediff('minute', started_at_ts, ended_at_ts) as duration_min,
	datediff('second', started_at_ts, ended_at_ts) as duration_sec,
	start_station_id,
	end_station_id
from {{ ref('stg__bike_data') }}