

with dim_rankings as (
    select * from BOARDGAME.dbt_prod.dim_rankings
)

select * from dim_rankings



  -- this filter will only be applied on an incremental run
  -- (uses >= to include records arriving later on the same day as the last run of this model)
  where updated_at > (select max(updated_at) from BOARDGAME.dbt_prod.dim_rankings_current_day)

