select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select "Rank"
from boardgame.raw.rankings
where "Rank" is null



      
    ) dbt_internal_test