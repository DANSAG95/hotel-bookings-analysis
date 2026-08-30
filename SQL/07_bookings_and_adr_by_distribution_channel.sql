SELECT
    distribution_channel,
    COUNT(*) AS total_bookings,
    ROUND(AVG(adr), 2) AS average_adr
FROM customers.hotel_bookings
WHERE is_canceled = 0
GROUP BY distribution_channel
ORDER BY total_bookings DESC;




