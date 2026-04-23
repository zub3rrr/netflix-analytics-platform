{{ config(
    materialized='table',
    schema='staging',
    alias='ratings',
) }}

SELECT * ,
TO_CHAR(TO_TIMESTAMP(TIMESTAMP), 'MM-DD-YYYY') as date
FROM {{ source('RAW', 'raw_ratings') }}