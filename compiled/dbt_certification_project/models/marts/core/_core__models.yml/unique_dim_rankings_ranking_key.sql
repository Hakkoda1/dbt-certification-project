
    
    

select
    ranking_key as unique_field,
    count(*) as n_records

from BOARDGAME.dbt_prod.dim_rankings
where ranking_key is not null
group by ranking_key
having count(*) > 1


