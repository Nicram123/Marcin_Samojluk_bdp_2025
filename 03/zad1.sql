-- znalezienie nowych budynków (zwraca nudynki z 2019 bez odpowiednika w 2018)
SELECT b2019.*
FROM T2019_KAR_BUILDINGS b2019
LEFT JOIN T2018_KAR_BUILDINGS b2018
  ON b2019.polygon_id = b2018.polygon_id
WHERE b2018.polygon_id IS NULL;

-- inna wysokośc lub inna geometria tego samego budynku na przestrzeni 2018 i 2019
SELECT b2019.*
FROM T2019_KAR_BUILDINGS b2019
JOIN T2018_KAR_BUILDINGS b2018
  ON b2019.polygon_id = b2018.polygon_id
WHERE b2019.height != b2018.height
   OR NOT ST_Equals(b2019.geom, b2018.geom);
