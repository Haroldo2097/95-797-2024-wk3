--Using these to split out the bike data and create dimension table by addint lat and long
--Can think of this as creating list of station ids with additional attributes we want

select
    distinct
    start_station_id as station_id,
    start_station_name as station_name,
    start_lat station_lat,
    start_lng station_lng
from {{ ref('stg__bike_data') }}
union
select
    distinct
    end_station_id as station_id,
    end_station_name as station_name,
    end_lat station_lat,
    end_lng station_lng
from {{ ref('stg__bike_data') }}