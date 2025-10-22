-- WHERE NOT ST_HasArc(geometry) - tylko takie nie zawierające łuków
-- ST_Force3D(geometry) - każdą geometrie do 3D przekształca 
-- ST_Union - wszystkie geometrie łączy w jedną wspólną 
-- ST_Buffer - bufor o promieniu 5 na złaczonej geometrii 
SELECT ST_Area(ST_Buffer(ST_Union(ST_Force3D(geometry)), 5)) 
FROM obiekty
WHERE NOT ST_HasArc(geometry)

