




    with grouped_expression as (
    select
        
        
    
  


    
regexp_instr(year_published, '^.?\\d{1,4}$', 1, 1, 0, '')


 > 0
 as expression


    from boardgame.raw.boardgames
    

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




