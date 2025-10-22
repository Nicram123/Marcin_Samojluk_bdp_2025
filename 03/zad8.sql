-- 8 

-- ST_Intersects czy się przecinają (TRUE FALSE) - czy mają pkt wspólne, ST_Intersection - gdzie się przecinają 
CREATE TABLE t2019_kar_bridges AS
SELECT ST_Intersection(r.geom, w.geom) AS geom,
       r.link_id,
       w.link_id
FROM t2019_kar_railways r
JOIN t2019_kar_water_lines w
  ON ST_Intersects(r.geom, w.geom)
WHERE NOT ST_IsEmpty(ST_Intersection(r.geom, w.geom)); 
