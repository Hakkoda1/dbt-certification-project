
    
    

select
    category_key as unique_field,
    count(*) as n_records

from BOARDGAME.dbt_prod.dim_categories
where category_key is not null
group by category_key
having count(*) > 1


