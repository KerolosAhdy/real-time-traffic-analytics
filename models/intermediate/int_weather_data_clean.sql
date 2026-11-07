{{ config(materialized='view') }}

SELECT

    w_station_id,
    w_sensor_id,
    w_sensor_name,
    w_sensor_value,
    w_sensor_unit,

    NULLIF(
        TRIM(w_sensor_measured_time),
        ''
    )::timestamptz AS w_sensor_measured_time,

    is_max_visibility,
    is_out_of_range,
    w_sensor_value_raw

FROM {{ ref('stg_weather_data') }}