WITH source AS (

    SELECT *
    FROM {{ source('raw_tms', 'tms_stations') }}

),

parsed_coordinates AS (

    SELECT
        id,
        tms_number,
        station_name,
        bearing,
        collection_status,
        state,

        SPLIT_PART(
            REPLACE(REPLACE(coordinates, '(', ''), ')', ''),
            ',',
            1
        )::DOUBLE PRECISION AS longitude,

        SPLIT_PART(
            REPLACE(REPLACE(coordinates, '(', ''), ')', ''),
            ',',
            2
        )::DOUBLE PRECISION AS latitude

    FROM source
    WHERE coordinates IS NOT NULL

)

SELECT *
FROM parsed_coordinates