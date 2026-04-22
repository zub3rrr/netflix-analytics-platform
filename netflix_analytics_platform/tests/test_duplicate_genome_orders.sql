SELECT 
    movieid , tagid 
FROM 
    {{ ref('genome_scores') }}
GROUP BY 
    movieid , tagid
HAVING 
    COUNT(*) > 1