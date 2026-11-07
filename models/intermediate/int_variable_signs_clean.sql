
{{ config(materialized='view') }}

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

    NULLIF(TRIM(properties_effect_date), '')::timestamptz
        AS properties_effect_date,

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

    properties_text_rows

FROM {{ ref('stg_variable_signs') }}
