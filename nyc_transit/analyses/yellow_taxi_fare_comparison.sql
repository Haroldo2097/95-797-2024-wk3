SELECT 
    fare_amount,
    zone,
    avg(fare_amount) OVER (PARTITION BY zone) AS zone_avg_fare, 
    -- this window function finds the average fare amount for the zone this trip is in
    borough,
    avg(fare_amount) OVER (PARTITION BY borough) AS borough_avg_fare
    -- this window function finds the average fare amount for the borough this trip is in
FROM {{ ref('stg__yellow_tripdata') }} y
JOIN {{ ref('mart__dim_locations') }} l 
ON y.PUlocationID = l.locationid
LIMIT 100000;
