-- Reading the Sqlite database

select
    p.name AS project_name
    , p.description AS project_description
    , l.city AS project_city
    , l.country_code AS project_country_code
    , l.country_code AS project_country_code
    , pl.location_id AS location_id

from projects as p

JOIN project_locations as pl ON pl.project_id = p.id
JOIN locations as l ON l.id = pl.location_id