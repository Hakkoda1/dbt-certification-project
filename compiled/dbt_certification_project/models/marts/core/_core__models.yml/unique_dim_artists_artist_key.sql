
    
    

select
    artist_key as unique_field,
    count(*) as n_records

from BOARDGAME.dbt_prod.dim_artists
where artist_key is not null
group by artist_key
having count(*) > 1


