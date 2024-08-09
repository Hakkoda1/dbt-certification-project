select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      




    with grouped_expression as (
    select
        
        
    
  


    
regexp_instr("Year", '^.?\\d{1,4}$', 1, 1, 0, '')


 > 0
 as expression


    from boardgame.raw.rankings
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors





      
    ) dbt_internal_test