SELECT "Sales Segment", SUM("Total ARR") AS total_arr_sum
FROM bookings_data
WHERE "Stage Name" = 'Closed Won'
GROUP BY "Sales Segment"
HAVING "Sales Segment" IS NOT NULL
ORDER BY total_arr_sum DESC;

