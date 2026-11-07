
{{ config(materialized='view') }}

WITH source_data AS (

    SELECT DISTINCT
        station_id,
        tms_number,
        measured_time,
        sensor_id,
        sensor_name,
        description,
        value,
        unit,
        sensor_short_name,
        direction

    FROM {{ source('raw_tms', 'tms_meausurments') }}

)

SELECT
    station_id,
    tms_number,

    NULLIF(TRIM(measured_time), '')::timestamptz AS measured_time,

    sensor_id,
    sensor_name,
    description,
    value,
    unit,
    sensor_short_name,
    direction

FROM source_data
