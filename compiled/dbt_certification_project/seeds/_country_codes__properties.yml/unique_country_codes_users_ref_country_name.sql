
    
    

select
    country_name as unique_field,
    count(*) as n_records

from BOARDGAME.SEEDS.country_codes_users_ref
where country_name is not null
group by country_name
having count(*) > 1


