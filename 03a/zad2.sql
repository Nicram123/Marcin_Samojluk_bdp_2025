-- 2a. Wyodrębniam POI które pojawiły się w 2019, a nie istniały w 2018
CREATE TABLE new_pois_2019 AS
SELECT p2019.*
FROM t2019_kar_poi_table p2019
LEFT JOIN t2018_kar_poi_table p2018
  ON p2019.poi_id = p2018.poi_id
WHERE p2018.poi_id IS NULL;

-- 2b 
-- układ metryczny 
ALTER TABLE new_pois_2019 ADD COLUMN geom_utm geometry;
UPDATE new_pois_2019
SET geom_utm = ST_Transform(geom, 25832);

-- układ metryczny 
ALTER TABLE new_or_renovated_buildings ADD COLUMN geom_utm geometry;
UPDATE new_or_renovated_buildings
SET geom_utm = ST_Transform(geom, 25832);


-- czy wybiera wszystkie POI z tabeli new_pois_2019 dla których istnieje przy najmniej 1 budynek w obrebie 500 m ( <= 500 m) 
CREATE TABLE new_poi_near_buildings AS
SELECT n.*
FROM new_pois_2019 n
WHERE EXISTS (
  SELECT 1
  FROM new_or_renovated_buildings b
  WHERE ST_DWithin(n.geom_utm, b.geom_utm, 500)
);

-- Policzyc według ich kategorii 
SELECT type, COUNT(*) AS liczba
FROM new_poi_near_buildings
GROUP BY type
ORDER BY liczba DESC;
