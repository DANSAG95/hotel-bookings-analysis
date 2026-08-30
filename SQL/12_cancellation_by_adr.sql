SELECT
    CASE
        WHEN adr >= 150 THEN 'High rate'
        WHEN adr >= 60 THEN 'Medium rate'
        ELSE 'Low rate'
    END AS adr_type,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND(AVG(is_canceled::numeric) * 100, 2) AS cancellation_rate
FROM customers.hotel_bookings
GROUP BY
    CASE
        WHEN adr >= 150 THEN 'High rate'
        WHEN adr >= 60 THEN 'Medium rate'
        ELSE 'Low rate'
    END
ORDER BY cancellation_rate DESC;




