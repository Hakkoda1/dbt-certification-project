
    
    

select
    user_key as unique_field,
    count(*) as n_records

from BOARDGAME.dbt_prod.dim_users
where user_key is not null
group by user_key
having count(*) > 1


