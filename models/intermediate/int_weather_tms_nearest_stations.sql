
WITH tms_stations AS (

    SELECT DISTINCT ON (tms_number)
        id,
        tms_number,
        station_name AS tms_station_name,
        longitude AS tms_longitude,
        latitude AS tms_latitude

    FROM {{ ref('int_tms_stations_coordinates') }}

    ORDER BY tms_number, id

),

weather_stations AS (

    SELECT
        station_id AS weather_station_id,
        station_name AS weather_station_name,
        longitude AS weather_longitude,
        latitude AS weather_latitude

    FROM {{ source('raw_weather', 'weather_stations') }}

    WHERE station_name NOT LIKE 'TEST%'

),

distances AS (

    SELECT
        t.tms_number,
        t.tms_station_name,
        w.weather_station_id,
        w.weather_station_name,

        6371 * 2 * ASIN(
            SQRT(
                POWER(
                    SIN(
                        RADIANS(w.weather_latitude - t.tms_latitude) / 2
                    ),
                    2
                )
                +
                COS(RADIANS(t.tms_latitude))
                * COS(RADIANS(w.weather_latitude))
                * POWER(
                    SIN(
                        RADIANS(w.weather_longitude - t.tms_longitude) / 2
                    ),
                    2
                )
            )
        ) AS distance_km

    FROM tms_stations t
    CROSS JOIN weather_stations w

),

ranked_stations AS (

    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY tms_number
            ORDER BY distance_km
        ) AS station_rank

    FROM distances

)

SELECT
    tms_number,
    tms_station_name,
    weather_station_id,
    weather_station_name,
    distance_km,

    CASE
        WHEN distance_km <= 5 THEN 'VERY_CLOSE'
        WHEN distance_km <= 10 THEN 'CLOSE'
        WHEN distance_km <= 20 THEN 'MODERATE'
        ELSE 'FAR'
    END AS distance_category

FROM ranked_stations

WHERE station_rank = 1
