{{ config(materialized='view') }}

WITH measurements AS (

    SELECT *
    FROM {{ ref('stg_tms_meausurments') }}

),

sensors AS (

    SELECT *
    FROM {{ ref('stg_tms_sensors') }}

),

stations AS (

    SELECT *
    FROM {{ ref('stg_tms_stations') }}

)

SELECT
    measurements.*,

    -- Sensor information
    sensors.name AS sensor_name_enriched,
    sensors.short_name AS sensor_short_name_enriched,
    sensors.accuracy AS sensor_accuracy,
    sensors.description AS sensor_description,

    -- Station information
    stations.station_name,
    stations.bearing AS station_bearing,
    stations.collection_status,
    stations.state AS station_state,
    stations.coordinates AS station_coordinates

FROM measurements

LEFT JOIN sensors
    ON measurements.sensor_id = sensors.id

LEFT JOIN stations
    ON measurements.station_id = stations.id