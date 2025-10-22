-- Aby przekształcić LINESTRING w POLYGON (np. ST_MakePolygon(line)), linia musi być zamknięta (pierwszy punkt = ostatni punkt)
-- Pole musi być > 0 

-- ST_IsClosed czy pierwszy punkt = ostatni punkt
UPDATE obiekty
SET geometry = ST_AddPoint(geometry, ST_StartPoint(geometry))
WHERE name='obiekt4' AND NOT ST_IsClosed(geometry);

-- ST_IsValid(ST_MakePolygon(geom)) sprawdza czy poligon będzie poprawny geom 
UPDATE obiekty
SET geometry = ST_MakePolygon(geometry)
WHERE name = 'obiekt4' AND ST_GeometryType(geometry) = 'ST_LineString' AND ST_IsClosed(geometry) AND ST_IsValid(ST_MakePolygon(geometry));


SELECT id, name, ST_GeometryType(geometry), ST_AsText(geometry) FROM obiekty WHERE name='obiekt4';
