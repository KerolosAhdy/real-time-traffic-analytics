{{ config(materialized='table') }}

SELECT

    id AS sensor_id,

    name AS sensor_name,

    short_name,

    unit,

    direction,

    description

FROM {{ ref('stg_tms_sensors') }}