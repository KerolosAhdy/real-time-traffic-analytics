
WITH nearest_stations AS (

    SELECT
        tms_number,
        tms_station_name,
        weather_station_id,
        weather_station_name,
        distance_km,
        distance_category

    FROM {{ ref('int_weather_tms_nearest_stations') }}

),

coverage_summary AS (

    SELECT
        *,
        CASE
            WHEN distance_km <= 5 THEN 'EXCELLENT'
            WHEN distance_km <= 10 THEN 'GOOD'
            WHEN distance_km <= 20 THEN 'ACCEPTABLE'
            ELSE 'POOR'
        END AS coverage_status

    FROM nearest_stations

)

SELECT
    tms_number,
    tms_station_name,
    weather_station_id,
    weather_station_name,
    ROUND(distance_km::numeric, 2) AS distance_km,
    distance_category,
    coverage_status,

    CASE
        WHEN distance_km <= 10 THEN TRUE
        ELSE FALSE
    END AS is_well_covered

FROM coverage_summary
