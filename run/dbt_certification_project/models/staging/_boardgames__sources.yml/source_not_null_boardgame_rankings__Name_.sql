select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select "Name"
from boardgame.raw.rankings
where "Name" is null



      
    ) dbt_internal_test