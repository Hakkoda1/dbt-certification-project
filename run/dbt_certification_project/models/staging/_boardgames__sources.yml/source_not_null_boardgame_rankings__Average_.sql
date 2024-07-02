select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select "Average"
from boardgame.raw.rankings
where "Average" is null



      
    ) dbt_internal_test