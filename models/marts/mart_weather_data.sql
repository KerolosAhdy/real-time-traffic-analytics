
WITH weather_readings AS (

    SELECT
        w_station_id,
        w_sensor_id,
        w_sensor_name,
        w_sensor_value,
        w_sensor_unit,
        w_sensor_measured_time,
        is_max_visibility,
        is_out_of_range,
        w_sensor_value_raw

    FROM {{ ref('int_weather_data_clean') }}

),

weather_stations AS (

    SELECT
        station_id,
        station_name,
        longitude,
        latitude,
        altitude,
        collection_status

    FROM {{ source('raw_weather', 'weather_stations') }}

    WHERE station_name NOT LIKE 'TEST%'

),

final AS (

    SELECT
        r.w_station_id,
        s.station_name,
        s.longitude,
        s.latitude,
        s.altitude,
        s.collection_status,

        r.w_sensor_id,
        r.w_sensor_name,
        r.w_sensor_value,
        r.w_sensor_unit,
        r.w_sensor_measured_time,

        r.w_sensor_value_raw,
        r.is_max_visibility,
        r.is_out_of_range

    FROM weather_readings r

    LEFT JOIN weather_stations s
        ON r.w_station_id = s.station_id

)

SELECT *
FROM final
