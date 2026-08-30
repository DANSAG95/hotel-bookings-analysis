SELECT
    CASE
        WHEN hotel LIKE 'Resort Hotel%' THEN 'Resort Hotel'
        WHEN hotel LIKE 'City Hotel%' THEN 'City Hotel'
    END AS hotel_type,
    ROUND(AVG(adr), 2) AS average_adr
FROM customers.hotel_bookings
GROUP BY
    CASE
        WHEN hotel LIKE 'Resort Hotel%' THEN 'Resort Hotel'
        WHEN hotel LIKE 'City Hotel%' THEN 'City Hotel'
    END
ORDER BY average_adr DESC;




