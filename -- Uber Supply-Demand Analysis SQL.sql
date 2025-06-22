-- Uber Supply-Demand Analysis SQL Queries
-- Prepared by: [Ashifa]
-- Description: SQL queries used for analyzing Uber requests data

-- 1. Total requests by Status
SELECT Status, COUNT(*) AS Total_Requests
FROM uber_data_clean
GROUP BY Status;

-- 2. Request by pickup point and status
SELECT `Pickup Point`, Status, COUNT(*) AS Count
FROM uber_data_clean
GROUP BY `Pickup Point`, Status;

-- 3. Cancellations by Time of Day
SELECT `Time of Day`, COUNT(*) AS Cancellations
FROM uber_data
WHERE Status = 'Cancelled'
GROUP BY `Time of Day`;

-- 4. Hourly demand Analysis
SELECT strftime('%H', `Request timestamp`) AS Hour, COUNT(*) AS Request_Count
FROM uber_data_data
GROUP BY Hour
ORDER BY Hour;

-- 5. Average trip duration
SELECT AVG(`Trip duration (mins)`) AS avg_duration
FROM uber_data_clean_clean
WHERE Status = 'Trip Completed';

-- 6. Cancellations by time of day
SELECT `Time of Day`, COUNT(*) AS cancellations
FROM uber_data_clean
WHERE Status = 'Cancelled'
GROUP BY `Time of Day`;

-- 7. No Cars Available by pickup point
SELECT `Pickup point`, COUNT(*) AS no_cars_count
FROM uber_data_clean
WHERE Status = 'No Cars Available'
GROUP BY `Pickup point`;
