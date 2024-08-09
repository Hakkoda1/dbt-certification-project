select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    "Rank" as unique_field,
    count(*) as n_records

from boardgame.raw.rankings
where "Rank" is not null
group by "Rank"
having count(*) > 1



      
    ) dbt_internal_test