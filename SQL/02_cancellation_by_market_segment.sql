SELECT
    market_segment,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND(
        AVG(is_canceled::numeric) * 100,
        2
    ) AS cancellation_rate
FROM customers.hotel_bookings
WHERE market_segment <> 'Undefined'
GROUP BY market_segment
ORDER BY cancellation_rate DESC;




