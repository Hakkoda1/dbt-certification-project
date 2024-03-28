
    
    

select
    url as unique_field,
    count(*) as n_records

from boardgame.raw.users
where url is not null
group by url
having count(*) > 1


