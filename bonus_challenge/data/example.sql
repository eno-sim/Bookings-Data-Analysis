SELECT "Source", SUM("Total ARR") AS total_arr_sum
FROM bookings_data
WHERE "Stage Name" = 'Closed Won'
GROUP BY "Source"
HAVING "Source" IS NOT NULL
ORDER BY total_arr_sum DESC;

