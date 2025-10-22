-- wyodrębnia geometrie obiekt3 
WITH
g3 AS (
  SELECT geometry FROM obiekty WHERE name = 'obiekt3' LIMIT 1
),
g4 AS (
  SELECT geometry FROM obiekty WHERE name = 'obiekt4' LIMIT 1
),
-- szuka najkrotszej linii lączącej obiekt3 z 4 , FROM g3, g4 działa jak CROSS JOIN 
-- ST_ShortestLine zwraca geometrie 
short AS (
  SELECT ST_ShortestLine(g3.geometry, g4.geometry) AS s
  FROM g3, g4
)
SELECT
  ST_Area(ST_Buffer(s, 5)) AS buffer_area
FROM short;
