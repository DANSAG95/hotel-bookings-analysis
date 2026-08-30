SELECT 
    total_bookings,
    total_cancelations,
    ROUND(total_cancelations::numeric / total_bookings::numeric, 2) AS cancelation_rate
FROM (SELECT (SELECT COUNT(*)
    FROM customers.hotel_bookings
    WHERE is_canceled = 1) AS total_cancelations,
    COUNT(*) AS total_bookings
FROM customers.hotel_bookings);