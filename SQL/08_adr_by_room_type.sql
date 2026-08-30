SELECT
    assigned_room_type,
    ROUND(AVG(adr), 2) AS average_adr
FROM customers.hotel_bookings
GROUP BY assigned_room_type
ORDER BY average_adr DESC;




