SELECT
    station_id,
    sensor_id,
    measured_time,
    COUNT(*) AS duplicate_count

FROM {{ ref('fct_traffic_measurements') }}

GROUP BY
    station_id,
    sensor_id,
    measured_time

HAVING COUNT(*) > 1