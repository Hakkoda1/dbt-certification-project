select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select "Bayes average"
from boardgame.raw.rankings
where "Bayes average" is null



      
    ) dbt_internal_test