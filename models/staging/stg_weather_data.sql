{{ config(materialized='view') }}

SELECT DISTINCT

    w_station_id,
    w_sensor_id,
    w_sensor_name,
    w_sensor_value,
    w_sensor_unit,
    w_sensor_measured_time,
    is_max_visibility,
    is_out_of_range,
    w_sensor_value_raw

FROM {{ source('raw_weather', 'w_data_long_clean') }}