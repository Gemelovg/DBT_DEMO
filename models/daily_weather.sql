WITH daily_weather as (

SELECT DATE(time) as daily_weather
, weather
, temp
, pressure
, humidity
, clouds
from {{ source('demo', 'weather') }}
limit 10
),

daily_weather_agg as(

select
    daily_weather
    , weather
    , count(weather)
    group by daily_weather, weather

)




select * from daily_weather_agg