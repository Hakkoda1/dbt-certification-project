

with

rankings as (

    select * from BOARDGAME.snapshots.rankings

),

final as (

    select
        id as boardgame_id,
        "Name" as boardgame_name,
        "Year" as boardgame_year_published,
        "Rank" as boardgame_rank,
        "Average" as boardgame_avg_rating,
        round(case
            when "Bayes average" < 1 then '1'
            else "Bayes average"
        end, 2) as boardgame_bayes_avg_rating,
        "Users rated" as boardgame_total_reviews,
        CONCAT('https://boardgamegeek.com', url) as boardgame_url,
        "Thumbnail" as boardgame_thumbnail,
        case
            when dbt_valid_to is NULL then true
            else false
        end as is_current,
        updated_at,
        dbt_valid_from as valid_from,
        coalesce(
            dbt_valid_to,
            cast( '9999-12-31' as timestamp)
        ) as valid_to

    from rankings

)

select * from final