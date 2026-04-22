SELECT 
    movieid , imdbid , tmdbid 
FROM 
    {{ ref('links') }}
GROUP BY 
    movieid , imdbid , tmdbid
HAVING 
    COUNT(*) > 1