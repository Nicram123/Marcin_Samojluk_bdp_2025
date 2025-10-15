-- 6 
-- a 
-- ST_Length liczy długośc linii na podstawie punktu początkowego i końcowego 
SELECT SUM(ST_Length(geometry)) AS total_length FROM roads;
-- b
-- ST_Area - liczy pole mając punkty wielokąta (wierzchołki) 
-- ST_AsText - wypiuje Poligon((wierzchołki)) 
-- ST_Perimeter - obwód mając wierzchołki 
SELECT 
    ST_AsText(geometry) AS wkt,
    ST_Area(geometry) AS area,
    ST_Perimeter(geometry) AS perimeter
FROM buildings
WHERE name = 'BuildingA';
-- c 
SELECT name, ST_Area(geometry) AS area
FROM buildings
ORDER BY name;

-- d
SELECT name, ST_Perimeter(geometry) AS perimeter
FROM buildings
ORDER BY ST_Area(geometry) DESC
LIMIT 2;


-- e

-- Jeśli geometry1 jest wielokątem (zbiorem wierzchołków) a geometry2 jest punktem, to ST_Distance oblicza odległość między punktem a najbliższym punktem na granicy wielokąta. 
SELECT ST_Distance(
    (SELECT geometry FROM buildings WHERE name = 'BuildingC'),
    (SELECT geometry FROM poi WHERE name = 'K')
) AS distance;

-- f

SELECT 
    ST_Area(
        ST_Difference(
            (SELECT geometry FROM buildings WHERE name='BuildingC'),
            ST_Buffer((SELECT geometry FROM buildings WHERE name='BuildingB'), 0.5)
        )
    ) AS area_diff;

-- g
SELECT b.name
FROM buildings b
WHERE ST_Y(ST_Centroid(b.geometry)) >
      ST_YMax((SELECT geometry FROM roads WHERE name='RoadX'));

--  h

-- Symetryczna różnica to obszar, który jest częścią jednego z wielokątów, ale nie jest częścią obu.
SELECT 
    ST_Area(
        ST_SymDifference(
            (SELECT geometry FROM buildings WHERE name='BuildingC'),
            ST_GeomFromText('POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))', 0)
        )
    ) AS area_not_common;

