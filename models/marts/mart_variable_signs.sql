
WITH source AS (

    SELECT *
    FROM {{ ref('int_variable_signs_clean') }}

),

final AS (

    SELECT
        type,
        geometry_type,
        geometry_coordinates,

        properties_id,
        properties_type,
        properties_road_address,
        properties_direction,
        properties_carriageway,

        properties_display_value,
        properties_additional_information,

        properties_effect_date,
        properties_reliability,

        properties_text_rows_0_screen,
        properties_text_rows_0_row_number,
        properties_text_rows_0_text,

        properties_text_rows_1_screen,
        properties_text_rows_1_row_number,
        properties_text_rows_1_text,

        properties_text_rows_2_screen,
        properties_text_rows_2_row_number,
        properties_text_rows_2_text,

        properties_text_rows_3_screen,
        properties_text_rows_3_row_number,
        properties_text_rows_3_text,

        properties_text_rows,

        CASE
            WHEN properties_reliability = 'MALFUNCTION'
            THEN TRUE
            ELSE FALSE
        END AS is_malfunction,

        CASE
            WHEN properties_display_value IS NOT NULL
            THEN TRUE
            ELSE FALSE
        END AS has_display_value,

        CASE
            WHEN properties_display_value IS NOT NULL
            THEN 'NUMERIC'
            ELSE 'TEXT_OR_OTHER'
        END AS display_type

    FROM source

)

SELECT *
FROM final
