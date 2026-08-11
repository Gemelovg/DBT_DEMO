WITH daily_weather as (

SELECT DATE(time) as daily_weather
, weather
, temp
, pressure
, humidity
, clouds
from {{ source('demo', 'weather') }}
),

daily_weather_agg as(

select
    daily_weather
    , weather
    , round(avg(temp),2) as avg_tmp
    , avg(pressure) as avg_presure
    , avg(humidity) as avg_humidity
    , row_number() over(partition by daily_weather order by count(weather) desc) as  rn

from daily_weather
group by daily_weather, weather

)


select 
*
from daily_weather_agg
where rn = 1