--This is just a fancy select *. Seclect all attributes out of taxi_zone_lookup
select
  {{ dbt_utils.star(ref('taxi_zone_lookup')) }}
from {{ ref('taxi_zone_lookup') }}