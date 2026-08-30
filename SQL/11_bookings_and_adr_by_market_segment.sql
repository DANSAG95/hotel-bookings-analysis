SELECT
    market_segment,
    COUNT(*) AS total_bookings,
    ROUND(AVG(adr), 2) AS average_adr
FROM customers.hotel_bookings
WHERE is_canceled = 0
  AND market_segment <> 'Undefined'
GROUP BY market_segment
ORDER BY total_bookings DESC;




