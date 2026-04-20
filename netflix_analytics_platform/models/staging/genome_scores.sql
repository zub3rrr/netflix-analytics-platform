{{ config(
    materialized='table',
    schema='staging',
    alias='genome_scores',
) }}

SELECT movieid, tagid, ROUND(relevance, 4) AS relevance
FROM {{ source('RAW', 'raw_genome_scores') }}
WHERE relevance IS NOT NULL AND relevance > 0