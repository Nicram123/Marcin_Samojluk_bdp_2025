
-- 7 

-- JOIN lączy wszystkie kombinacje par spełniające warunek że znajdują się w obrębie 300 m 
-- jak wiele sklepów jak jeden pasuje do dwóch parków to nadal zalicza się jako jeden sklep dlatego DISTINCT 
SELECT COUNT(DISTINCT p.poi_id) AS sporting_goods_count
FROM t2019_kar_poi_table p
JOIN t2019_kar_land_use_a parks   
  ON ST_DWithin(
       ST_Transform(p.geom, 25832),
       ST_Transform(parks.geom, 25832),
       300
     )
WHERE p.type = 'Sporting Goods Store';
