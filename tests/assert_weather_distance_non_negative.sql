
SELECT *
FROM {{ ref('mart_weather_station_coverage') }}
WHERE distance_km < 0
