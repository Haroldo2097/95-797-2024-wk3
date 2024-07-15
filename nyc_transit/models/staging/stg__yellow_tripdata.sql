with source as (

    select * from {{ source('main', 'yellow_tripdata') }}

),

renamed as (

    select
        vendorid,
        tpep_pickup_datetime,
        tpep_dropoff_datetime,
        passenger_count::int as passenger_count,
        trip_distance,
        ratecodeid,
        CASE WHEN store_and_fwd_flag = 'Y' THEN true ELSE false END as store_and_fwd_flag_boolean,
      -- {{flag_to_bool("store_and_fwd_flag")}} as store_and_fwd_flag,
        pulocationid,
        dolocationid,
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        congestion_surcharge,
        airport_fee,
        filename

    from source
        WHERE tpep_pickup_datetime < TIMESTAMP '2022-12-31' -- drop rows in the future
          AND trip_distance >= 0 -- drop negative trip_distance
)

select * from renamed
--HAVING
--    CAST(SUM(CASE WHEN shared_request_flag = 'Y' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) <= 0.5;
