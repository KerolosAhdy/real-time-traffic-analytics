
{{ config(materialized='view') }}

SELECT DISTINCT
    id,
    subtypecode,
    descriptionen
FROM {{ source('raw_tms', 'traffic_message_locations_ty_english_only') }}
