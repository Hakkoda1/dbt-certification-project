with reviews as (
    select * from BOARDGAME.dbt_prod.stg_boardgames__reviews
),

dim_users as (
    select * from BOARDGAME.dbt_prod.dim_users
),

dim_boardgames as (
    select * from BOARDGAME.dbt_prod.dim_boardgames
),

dim_reviews as (
    select
        md5(cast(coalesce(cast(dim_users.user_key as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(dim_boardgames.boardgame_key as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(review_rating as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as review_key,
        dim_users.user_key,
        dim_boardgames.boardgame_key,
        review_rating

    from reviews
    inner join dim_users on dim_users.user_username = reviews.review_username
    inner join dim_boardgames on dim_boardgames.boardgame_id = reviews.boardgame_id
)

select * from dim_reviews