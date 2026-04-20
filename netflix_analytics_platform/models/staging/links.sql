{{ config(
    materialized='table',
    schema='staging',
    alias='links',
) }}

SELECT *
FROM {{ source('RAW', 'raw_links') }}