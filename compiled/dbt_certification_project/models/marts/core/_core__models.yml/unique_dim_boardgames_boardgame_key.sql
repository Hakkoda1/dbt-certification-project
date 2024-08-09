
    
    

select
    boardgame_key as unique_field,
    count(*) as n_records

from BOARDGAME.dbt_prod.dim_boardgames
where boardgame_key is not null
group by boardgame_key
having count(*) > 1


