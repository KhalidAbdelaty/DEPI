SELECT 
    f.trip_id,
    d.tpep_pickup_datetime,
    d.tpep_dropoff_datetime,
    DATEDIFF(MINUTE, d.tpep_pickup_datetime, d.tpep_dropoff_datetime) AS trip_duration_minutes,
    p.passenger_count,
    t.trip_distance,
    r.rate_code_name,
    pl.pickup_latitude,
    pl.pickup_longitude,
    dl.dropoff_latitude,
    dl.dropoff_longitude,
    pt.payment_type_name,
    f.fare_amount,
    f.extra,
    f.mta_tax,
    f.tip_amount,
    f.tolls_amount,
    f.total_amount,
    d.pick_hour,
    d.pick_day,
    d.pick_month,
    d.pick_year,
    d.pick_weekday
FROM 
    fact_table f
    JOIN datetime_dim d ON f.datetime_id = d.datetime_id
    JOIN passenger_count_dim p ON f.passenger_count_id = p.passenger_count_id
    JOIN trip_distance_dim t ON f.trip_distance_id = t.trip_distance_id
    JOIN rate_code_dim r ON f.rate_code_id = r.rate_code_id
    JOIN pickup_location_dim pl ON f.pickup_location_id = pl.pickup_location_id
    JOIN dropoff_location_dim dl ON f.dropoff_location_id = dl.dropoff_location_id
    JOIN payment_type_dim pt ON f.payment_type_id = pt.payment_type_id