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

dim_boardgames as (
    select 
        md5(cast(coalesce(cast(boardgames_filtered.boardgame_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as boardgame_key,
        boardgame_id,
        boardgame_name,
        boardgame_avg_weight,
        boardgame_avg_rating,
        boardgame_year_published,
        boardgame_min_players,
        boardgame_max_players,
        boardgame_min_play_time_in_mins,
        boardgame_max_play_time_in_mins,
        boardgame_min_age,
        boardgame_total_owners

    from boardgames_filtered
)

select * from dim_boardgames