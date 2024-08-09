

with  __dbt__cte__int_boardgames__boardgames_filtered as (
with
    
boardgames as (
    select * from BOARDGAME.dbt_prod.stg_boardgames__boardgames
),

reviews as (
    select * from BOARDGAME.dbt_prod.stg_boardgames__reviews
),

boardgames_filtered as (
    select
        *
    from boardgames
    where 
        boardgame_id in (select boardgame_id from reviews)
        and boardgame_type = 'boardgame'
        and boardgame_avg_rating <> '-1'
        and boardgame_avg_weight <> '-1'
)

select * from boardgames_filtered
), boardgames_filtered as (
    select * from __dbt__cte__int_boardgames__boardgames_filtered
),

rankings as (
    select * from BOARDGAME.dbt_prod.stg_boardgames__rankings
),

dim_rankings as (
    select
        md5(cast(coalesce(cast(boardgame_rank as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(rankings.boardgame_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(updated_at as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT))as ranking_key,
        md5(cast(coalesce(cast(rankings.boardgame_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as boardgame_key,
        boardgame_rank,
        boardgame_total_reviews,
        boardgame_url,
        boardgame_thumbnail,
        updated_at,
        valid_from,
        valid_to,
        is_current

    from rankings
    where boardgame_id in (select boardgame_id from boardgames_filtered)
)

select * from dim_rankings



  -- this filter will only be applied on an incremental run
  -- (uses >= to include records arriving later than the previous 3 days)
  where updated_at > dateadd(day, -3, current_date)

