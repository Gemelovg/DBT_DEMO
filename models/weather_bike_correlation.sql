with trip_fact_cte as (
    select
    t.*,
    w.*,
    from {{ ref('trip_facts') }} t
    left join {{ ref('daily_weather') }} w
    on t.trip_data = w.daily_weather

)

select * from trip_fact_cte;