select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select "Users rated"
from boardgame.raw.rankings
where "Users rated" is null



      
    ) dbt_internal_test