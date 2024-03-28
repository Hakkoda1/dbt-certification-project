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