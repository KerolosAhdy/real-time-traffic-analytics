{{ config(materialized='view') }}

WITH forecasts AS (

    SELECT *
    FROM {{ ref('stg_weather_forecast') }}

),

sections AS (

    SELECT *
    FROM {{ ref('stg_weather_sections') }}

)

SELECT

    -- Forecast information
    forecasts.id AS section_id,
    forecasts.forecast_time,
    forecasts.horizon_hours,
    forecasts.is_forecast,

    -- Weather information
    forecasts.road_temperature,
    forecasts.temperature,
    forecasts.wind_speed,
    forecasts.wind_direction,
    forecasts.overall_road_condition,
    forecasts.weather_symbol,
    forecasts.precipitation_condition,
    forecasts.road_condition,
    forecasts.is_strong_wind,
    forecasts.is_slippery,
    forecasts.is_very_slippery,
    forecasts.is_poor,
    forecasts.is_daylight,
    forecasts.weather_symbol_code,
    forecasts.is_estimated,

    forecasts.section_updated_time,

    -- Road section information
    sections.road_number,
    sections.road_section_number,
    sections.description AS section_description,
    sections.is_bridge,
    sections.length AS section_length,
    sections.carriageway,
    sections.lon_center,
    sections.lat_center,
    sections.geometry_valid,
    sections.geometry_truncated,
    sections.geometry_wkt

FROM forecasts

LEFT JOIN sections
    ON forecasts.id = sections.id