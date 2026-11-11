
WITH source AS (

    SELECT *
    FROM {{ ref('int_traffic_message_locations_enriched') }}

),

final AS (

    SELECT
        id,
        type,
        locationcode,
        subtypecode,

        roadjunction,
        roadname,
        firstname,
        secondname,

        arearef,
        linearref,
        negoffset,
        posoffset,
        urban,
        geocode,
        orderofpoint,

        dataupdatedtime,
        locationversion,
        coordinatesetrs89,
        geometry_type,
        geometry_coordinates,

        location_type_id,
        location_type_description,

        CASE
            WHEN array_to_string(coordinatesetrs89, '') <> ''
            THEN TRUE
            ELSE FALSE
        END AS has_coordinates

    FROM source

)

SELECT *
FROM final
