SELECT
    deposit_type,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND(AVG(is_canceled::numeric) * 100, 2) AS cancellation_rate
FROM customers.hotel_bookings
GROUP BY deposit_type
ORDER BY cancellation_rate DESC;




