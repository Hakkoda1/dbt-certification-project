
    
    

select
    users as unique_field,
    count(*) as n_records

from boardgame.raw.users
where users is not null
group by users
having count(*) > 1


