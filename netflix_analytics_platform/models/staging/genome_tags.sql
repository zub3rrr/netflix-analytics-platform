{{ config(
    materialized='table',
    schema='staging',
    alias='genome_tags',
) }}

SELECT *
FROM {{ source('RAW', 'raw_genome_tags') }}