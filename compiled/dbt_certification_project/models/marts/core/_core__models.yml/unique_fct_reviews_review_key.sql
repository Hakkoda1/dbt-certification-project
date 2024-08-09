
    
    

select
    review_key as unique_field,
    count(*) as n_records

from BOARDGAME.dbt_prod.fct_reviews
where review_key is not null
group by review_key
having count(*) > 1


