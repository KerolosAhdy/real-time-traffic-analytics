
WITH source AS (

    SELECT *
    FROM {{ ref('int_weather_forecast_enriched') }}

),

final AS (

    SELECT
        section_id,
        forecast_time,
        horizon_hours,

        is_forecast,

        CASE
            WHEN is_forecast = TRUE THEN 'FORECAST'
            ELSE 'CURRENT'
        END AS record_type,

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

        section_updated_time,

        road_number,
        road_section_number,
        section_description,
        is_bridge,
        section_length,
        carriageway,

        lon_center,
        lat_center,
        geometry_valid,
        geometry_truncated,
        geometry_wkt

    FROM source

)

SELECT *
FROM final
