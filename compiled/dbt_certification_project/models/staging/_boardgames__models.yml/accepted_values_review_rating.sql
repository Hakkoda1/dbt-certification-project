

with validation as (
    select
        review_rating as accepted_values_between_1_10
    from BOARDGAME.dbt_prod.stg_boardgames__reviews
),

validation_errors as (
    select
        accepted_values_between_1_10
    from validation
    where accepted_values_between_1_10 not between 1 and 10
)

select *
from validation_errors

