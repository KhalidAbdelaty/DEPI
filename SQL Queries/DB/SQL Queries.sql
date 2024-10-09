-- 1. Count total number of trips
SELECT COUNT(*) AS TotalTrips FROM UberTrips;

-- 2. Get average trip distance
SELECT AVG(trip_distance) AS AvgTripDistance FROM UberTrips;

-- 3. Find the top 5 longest trips
SELECT TOP 5 * FROM UberTrips ORDER BY trip_distance DESC;

-- 4. Calculate total fare amount for each vendor
SELECT VendorID, SUM(fare_amount) AS TotalFare FROM UberTrips GROUP BY VendorID;

-- 5. Get the number of trips per payment type
SELECT payment_type, COUNT(*) AS TripCount FROM UberTrips GROUP BY payment_type;

-- 6. Find the average number of passengers per trip
SELECT AVG(CAST(passenger_count AS FLOAT)) AS AvgPassengers FROM UberTrips;

-- 7. Get the total tips for credit card payments
SELECT SUM(tip_amount) AS TotalTips FROM UberTrips WHERE payment_type = 1;

-- 8. Find the busiest pickup hour
SELECT DATEPART(HOUR, tpep_pickup_datetime) AS PickupHour, COUNT(*) AS TripCount
FROM UberTrips
GROUP BY DATEPART(HOUR, tpep_pickup_datetime)
ORDER BY TripCount DESC;

-- 9. Calculate the average fare for each passenger count
SELECT passenger_count, AVG(fare_amount) AS AvgFare
FROM UberTrips
GROUP BY passenger_count
ORDER BY passenger_count;

-- 10. Find trips with fare amount greater than $50
SELECT * FROM UberTrips WHERE fare_amount > 50;

-- 11. Get the total number of trips per day
SELECT CAST(tpep_pickup_datetime AS DATE) AS TripDate, COUNT(*) AS TripCount
FROM UberTrips
GROUP BY CAST(tpep_pickup_datetime AS DATE)
ORDER BY TripDate;

-- 12. Find the longest trip duration
SELECT TOP 1 *, DATEDIFF(MINUTE, tpep_pickup_datetime, tpep_dropoff_datetime) AS TripDurationMinutes
FROM UberTrips
ORDER BY TripDurationMinutes DESC;

-- 13. Calculate the percentage of trips with tips
SELECT 
    (COUNT(CASE WHEN tip_amount > 0 THEN 1 END) * 100.0 / COUNT(*)) AS PercentageTripsWithTips
FROM UberTrips;

-- 14. Find the average fare amount for each RatecodeID
SELECT RatecodeID, AVG(fare_amount) AS AvgFare
FROM UberTrips
GROUP BY RatecodeID
ORDER BY RatecodeID;

-- 15. Get the total number of trips for each store_and_fwd_flag
SELECT store_and_fwd_flag, COUNT(*) AS TripCount
FROM UberTrips
GROUP BY store_and_fwd_flag;

-- 16. Find trips with total amount exceeding $100
SELECT * FROM UberTrips WHERE total_amount > 100;

-- 17. Calculate the average tip percentage
SELECT AVG((tip_amount / fare_amount) * 100) AS AvgTipPercentage
FROM UberTrips
WHERE fare_amount > 0;

-- 18. Find the number of trips per vendor per month
SELECT 
    VendorID,
    YEAR(tpep_pickup_datetime) AS Year,
    MONTH(tpep_pickup_datetime) AS Month,
    COUNT(*) AS TripCount
FROM UberTrips
GROUP BY VendorID, YEAR(tpep_pickup_datetime), MONTH(tpep_pickup_datetime)
ORDER BY VendorID, Year, Month;

-- 19. Get the average trip distance for each payment type
SELECT payment_type, AVG(trip_distance) AS AvgTripDistance
FROM UberTrips
GROUP BY payment_type
ORDER BY payment_type;