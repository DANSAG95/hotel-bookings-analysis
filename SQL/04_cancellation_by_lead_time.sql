SELECT
    CASE
        WHEN lead_time >= 100 THEN 'Long'
        WHEN lead_time >= 30 THEN 'Medium'
        ELSE 'Short'
    END AS lead_time_type,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND(AVG(is_canceled::numeric) * 100, 2) AS cancellation_rate
FROM customers.hotel_bookings
GROUP BY
    CASE
        WHEN lead_time >= 100 THEN 'Long'
        WHEN lead_time >= 30 THEN 'Medium'
        ELSE 'Short'
    END
ORDER BY cancellation_rate DESC;




