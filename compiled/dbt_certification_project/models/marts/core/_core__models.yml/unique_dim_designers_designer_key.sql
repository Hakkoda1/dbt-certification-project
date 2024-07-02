
    
    

select
    designer_key as unique_field,
    count(*) as n_records

from BOARDGAME.dbt_prod.dim_designers
where designer_key is not null
group by designer_key
having count(*) > 1


