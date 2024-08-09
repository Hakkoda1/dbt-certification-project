with  __dbt__cte__int_users_countries_joined as (
with
    
users as (
    select * from BOARDGAME.dbt_prod.stg_boardgames__users
),

countries as (
    select * from BOARDGAME.dbt_prod.stg_country_codes
),

countries_users_ref as (
    select * from BOARDGAME.dbt_prod.stg_country_codes_users_ref
),

users_countries_joined as (
    select
        users.user_username,
        users.user_url,
        coalesce(countries.country_code, countries_users_ref.country_code) as country_code,
        coalesce(countries.country_name, countries_users_ref.country_name) as country_name
    from users
    left join countries_users_ref on users.country_name = countries_users_ref.country_name
    left join countries on countries.country_name = users.country_name

)

select * from users_countries_joined
), users_countries_joined as (
    select * from __dbt__cte__int_users_countries_joined
),

dim_users as (
    select
        md5(cast(coalesce(cast(user_username as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(user_url as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(country_code as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as user_key,
        user_username,
        user_url,
        country_name

    from users_countries_joined
)

select * from dim_users