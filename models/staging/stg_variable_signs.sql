{{ config(materialized='view') }}

SELECT DISTINCT

    type,
    geometry_type,
    geometry_coordinates,

    properties_id,
    properties_type,
    "properties_roadAddress" AS properties_road_address,
    properties_direction,
    properties_carriageway,
    "properties_displayValue" AS properties_display_value,
    "properties_additionalInformation" AS properties_additional_information,

    "properties_effectDate" AS properties_effect_date,
    properties_reliability,

    "properties_textRows_0_screen" AS properties_text_rows_0_screen,
    "properties_textRows_0_rowNumber" AS properties_text_rows_0_row_number,
    "properties_textRows_0_text" AS properties_text_rows_0_text,

    "properties_textRows_1_screen" AS properties_text_rows_1_screen,
    "properties_textRows_1_rowNumber" AS properties_text_rows_1_row_number,
    "properties_textRows_1_text" AS properties_text_rows_1_text,

    "properties_textRows_2_screen" AS properties_text_rows_2_screen,
    "properties_textRows_2_rowNumber" AS properties_text_rows_2_row_number,
    "properties_textRows_2_text" AS properties_text_rows_2_text,

    "properties_textRows_3_screen" AS properties_text_rows_3_screen,
    "properties_textRows_3_rowNumber" AS properties_text_rows_3_row_number,
    "properties_textRows_3_text" AS properties_text_rows_3_text,

    "properties_textRows" AS properties_text_rows

FROM {{ source('raw_tms', 'cleaned_variable_signs') }}