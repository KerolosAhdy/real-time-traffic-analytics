{{ config(materialized='view') }}

WITH source_data AS (

    SELECT DISTINCT
        id,
        road_number,
        section_number,
        part3,
        part4,
        part5,
        time,
        horizon_hours,
        is_forecast,
        road_temperature,
        temperature,
        wind_speed,
        wind_direction,
        overall_road_condition,
        weather_symbol,
        precipitation_condition,
        road_condition,
        is_strong_wind,
        is_slippery,
        is_very_slippery,
        is_poor,
        is_daylight,
        weather_symbol_code,
        is_estimated,
        section_updated_time

    FROM {{ source('raw_weather', 'weather_forecast_long') }}

)

SELECT
    id,
    road_number,
    section_number,
    part3,
    part4,
    part5,

    NULLIF(TRIM(time), '')::timestamptz AS forecast_time,

    horizon_hours,
    is_forecast,
    road_temperature,
    temperature,
    wind_speed,
    wind_direction,
    overall_road_condition,
    weather_symbol,
    precipitation_condition,
    road_condition,
    is_strong_wind,
    is_slippery,
    is_very_slippery,
    is_poor,
    is_daylight,
    weather_symbol_code,
    is_estimated,

    NULLIF(TRIM(section_updated_time), '')::timestamptz
        AS section_updated_time

FROM source_data