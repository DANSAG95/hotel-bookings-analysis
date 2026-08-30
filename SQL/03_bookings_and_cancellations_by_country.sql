WITH cancelled_bookings AS (
    SELECT country, 
	       COUNT(*) AS total_cancelations
    FROM customers.hotel_bookings
    WHERE is_canceled = 1
	GROUP BY country),
total_bookings AS (
    SELECT country,
	COUNT(*) AS total_bookings
FROM customers.hotel_bookings
GROUP BY country)
SELECT t.country,
       t.total_bookings,
       COALESCE(c.total_cancelations, 0) AS total_cancelations,
	   COALESCE(ROUND(c.total_cancelations::numeric / t.total_bookings::numeric, 2),0) AS cancelation_rate
FROM total_bookings AS t
LEFT JOIN cancelled_bookings AS c
ON t.country = c.country
WHERE t.country IS NOT NULL
ORDER BY t.total_bookings DESC;




