
create table if not exists BOARDGAME.dbt_prod.dbt_audit
(
    run_id text,
    run_object text,
    run_activity text,
    created_at timestamp_ntz
);

