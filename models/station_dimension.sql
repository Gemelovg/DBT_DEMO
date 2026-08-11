WITH BIKE AS (
    SELECT
    DISTINCT START_STATIO_ID as START_STATION_ID
    , start_station_name
    , start_lat
    , start_lng
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
    limit 10

)

select * from BIKE