-- 1 

CREATE TABLE obiekty (
	id SERIAL PRIMARY KEY,
	geometry geometry,
	name VARCHAR(32)
);

INSERT INTO obiekty("name", geometry) 
VALUES

('obiekt1', 
	-- typ geometrii wyciaga np. POINT, LINESTRING, 
	ST_CollectionExtract(
		-- łuk na linie/łamaną (wizualnie to samo) - inna reprezentacja 
		ST_CurveToLine(
			-- to samo co ST_GeomFromString tylko tu można podać SRID 
			ST_GeomFromEWKT(
			    -- łączy kilka geometrii w jedną kolekcję 
	 			'SRID=0;GEOMETRYCOLLECTION(
					 LINESTRING(0 1, 1 1),
				 	 CIRCULARSTRING(1 1, 2 0, 3 1),
				 	 CIRCULARSTRING(3 1, 4 2, 5 1),
				 	 LINESTRING(5 1, 6 1)
	 			)'
 			)
		)
	)
),

('obiekt2', 
    -- SRID na 0 (nie zdefiniowany układ wsp)
	ST_SetSRID(
		-- rozpoznaje zamkniete linie tworzy z nich poligon 
		ST_BuildArea(
			-- łączy kilka geometrii w jedną kolekcję 
			ST_Collect(
				ARRAY[
					'LINESTRING(10 6, 14 6)',
					'CIRCULARSTRING(14 6, 16 4, 14 2)',
					'CIRCULARSTRING(14 2, 12 0, 10 2)',
					'LINESTRING(10 2, 10 6)',
					-- okrag srodek, promien, ilosc segmrntow (niemal gladki)
					ST_Buffer(ST_POINT(12, 2), 1, 6000)
				]
			)
		), 0
	)
),
('obiekt3', 
	ST_GeomFromEWKT(
		-- PLYGON zamkniety obszar 
		'SRID=0;POLYGON((10 17, 12 13, 7 15, 10 17))'
	)
),
('obiekt4', 
	ST_GeomFromEWKT(
		'SRID=0;LINESTRING(20 20, 25 25, 27 24, 25 22, 26 21, 22 19, 20.5 19.5)'
	)
),
('obiekt5', 
	ST_GeomFromEWKT(
	     -- (z wymiarem Z) — poprawna reprezentacja dwóch punktów 3D
		'SRID=0;MULTIPOINT((30 30 59), (38 32 234))'
	)
),
('obiekt6', 
	ST_SetSRID(
		-- łączy różne typy geometrii w jedną kolekcję 
		ST_Collect(
			'LINESTRING(1 1, 3 2)',
			'POINT(4 2)'
		), 0
	)
);
