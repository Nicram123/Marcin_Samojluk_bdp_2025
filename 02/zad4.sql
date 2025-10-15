-- SET search_path = public, ksiegowosc;

-- nie określono systemu odniesienia dla danych geometrycznych ( , 0)

-- Polygon czyli wielokąt na powierzchni (co najmniej trzy punkty - trójkąt)
CREATE TABLE buildings (
    id SERIAL PRIMARY KEY,
    geometry geometry(Polygon, 0),
    name varchar(50)
);

-- LineString no bo łamana (składa się co najmniej z 2 punktów, ale może być złożona z wielu odcinków) , 
CREATE TABLE roads (
    id SERIAL PRIMARY KEY,
    geometry geometry(LineString, 0),
    name varchar(50)
);

-- Punkt (długość, szerokość geograficzna)
CREATE TABLE poi (
    id SERIAL PRIMARY KEY,
    geometry geometry(Point, 0),
    name varchar(50)
);

