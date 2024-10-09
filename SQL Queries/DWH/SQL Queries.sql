-- 1. Find the busiest pickup hour
SELECT d.pick_hour, COUNT(*) AS TripCount
FROM fact_table f
JOIN datetime_dim d ON f.datetime_id = d.datetime_id
GROUP BY d.pick_hour
ORDER BY TripCount DESC;

-- 2. Calculate average trip distance by passenger count
SELECT pc.passenger_count, AVG(td.trip_distance) AS AvgTripDistance
FROM fact_table f
JOIN passenger_count_dim pc ON f.passenger_count_id = pc.passenger_count_id
JOIN trip_distance_dim td ON f.trip_distance_id = td.trip_distance_id
GROUP BY pc.passenger_count
ORDER BY pc.passenger_count;

-- 3. Get total tips by payment type
SELECT pt.payment_type_name, SUM(f.tip_amount) AS TotalTips
FROM fact_table f
JOIN payment_type_dim pt ON f.payment_type_id = pt.payment_type_id
GROUP BY pt.payment_type_name;

-- 4. Find the most common rate code
SELECT TOP 1 rc.rate_code_name, COUNT(*) AS UseCount
FROM fact_table f
JOIN rate_code_dim rc ON f.rate_code_id = rc.rate_code_id
GROUP BY rc.rate_code_name
ORDER BY UseCount DESC;