WITH guest_behaviour AS (
    SELECT 
        c.guest_frequency,
        COUNT(*) AS total_bookings,
        SUM(c.cancellations) AS total_cancellations,
        SUM(c.stays_in_week_nights) AS total_week_nights,
        SUM(c.breakfast) AS total_breakfast,
        ROUND(AVG(c.total_of_special_requests), 2) AS avg_special_request,
        ROUND(AVG(c.booking_changes), 2) AS avg_booking_changes
    FROM (
        SELECT 
            *,
            CASE WHEN is_repeated_guest = 1 THEN 'Repeated'
                ELSE 'Non repeated' 
            END AS guest_frequency,
            CASE WHEN meal = 'BB' THEN 1 
                ELSE 0 
            END AS breakfast,
			CASE WHEN reservation_status = 'Canceled' THEN 1 
				ELSE 0
			END AS cancellations
        FROM customers.hotel_bookings
    ) AS c
    GROUP BY c.guest_frequency
),

channel_counts AS (
    SELECT 
        CASE WHEN is_repeated_guest = 1 THEN 'Repeated'
            ELSE 'Non repeated' 
        END AS guest_frequency,
        distribution_channel,
        COUNT(*) AS total_bookings
    FROM customers.hotel_bookings
    GROUP BY 
        CASE WHEN is_repeated_guest = 1 THEN 'Repeated'
            ELSE 'Non repeated' 
        END,
        distribution_channel
),

ranked_channels AS (
    SELECT 
        guest_frequency,
        distribution_channel,
        ROW_NUMBER() OVER (
            PARTITION BY guest_frequency 
            ORDER BY total_bookings DESC
        ) AS channel_rank
    FROM channel_counts
),

top_channels AS (
    SELECT 
        guest_frequency,
        distribution_channel AS top_distribution_channel
    FROM ranked_channels
    WHERE channel_rank = 1
)

SELECT 
    gb.guest_frequency,
    gb.total_bookings,
    ROUND(gb.total_cancellations::numeric / gb.total_bookings::numeric, 2) AS cancellation_rate,
    ROUND(gb.total_breakfast::numeric / gb.total_bookings::numeric, 2) AS breakfast_booking_rate ,
    gb.avg_special_request,
    gb.avg_booking_changes,
    tc.top_distribution_channel
FROM guest_behaviour AS gb
LEFT JOIN top_channels AS tc
    ON gb.guest_frequency = tc.guest_frequency;





