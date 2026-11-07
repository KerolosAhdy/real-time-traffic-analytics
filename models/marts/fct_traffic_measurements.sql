{{ config(materialized='table') }}

SELECT

    station_id,
    tms_number,
    station_name,
    station_bearing,
    station_state,
    station_coordinates,

    sensor_id,
    sensor_name_enriched,
    sensor_short_name_enriched,
    sensor_description,

    measured_time,
    value,
    unit,
    direction

FROM {{ ref('int_tms_measurements_enriched') }}