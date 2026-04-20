{{ config(
    materialized='table',
    schema='staging',
    alias='tags',
) }}

SELECT *
FROM {{ source('RAW', 'raw_tags') }}