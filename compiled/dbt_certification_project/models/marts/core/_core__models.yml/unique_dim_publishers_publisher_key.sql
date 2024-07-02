
    
    

select
    publisher_key as unique_field,
    count(*) as n_records

from BOARDGAME.dbt_prod.dim_publishers
where publisher_key is not null
group by publisher_key
having count(*) > 1


