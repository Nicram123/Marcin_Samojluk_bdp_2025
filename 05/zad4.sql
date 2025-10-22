-- ST_Collect - zbiera geometrie w jedną kolekcję 
INSERT INTO obiekty ("name", geometry)
SELECT 'obiekt7', ST_Collect(geometry)
FROM obiekty
WHERE "name" = 'obiekt3' OR "name" = 'obiekt4'
