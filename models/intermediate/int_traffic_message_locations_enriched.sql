
{{ config(materialized='view') }}

WITH locations AS (
    SELECT *
    FROM {{ ref('stg_traffic_message_locations') }}
),

location_types AS (
    SELECT
        id AS location_type_id,
        subtypecode[1] AS subtypecode,
        descriptionen
    FROM {{ ref('stg_traffic_message_locations_ty') }}
)

SELECT
    locations.*,
    location_types.location_type_id,
    location_types.descriptionen AS location_type_description
FROM locations
LEFT JOIN location_types
    ON locations.subtypecode = location_types.subtypecode
