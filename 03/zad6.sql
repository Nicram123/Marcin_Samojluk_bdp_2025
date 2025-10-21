---- 6. 25832 metryczny układ 
-- ST_MakeLine buduje linie z punktów 

WITH line AS (
  SELECT ST_Transform(ST_MakeLine(geom ORDER BY id), 25832) AS geom_line_utm
  FROM input_points
)
SELECT s.*, ST_Transform(s.geom, 25832) AS geom_utm
FROM t2019_kar_street_node s, line l
WHERE ST_DWithin(
        ST_Transform(s.geom, 25832),
        l.geom_line_utm,
        200
      )
  AND s.intersect = 'Y';
