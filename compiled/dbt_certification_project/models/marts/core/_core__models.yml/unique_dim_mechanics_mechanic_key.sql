
    
    

select
    mechanic_key as unique_field,
    count(*) as n_records

from BOARDGAME.dbt_prod.dim_mechanics
where mechanic_key is not null
group by mechanic_key
having count(*) > 1


