--Zad4
CREATE TABLE tableB AS SELECT popp.* FROM popp, majrivers GROUP BY(popp.gid) HAVING popp.f_codedesc LIKE 'Building' AND MIN(ST_Distance(popp.geom, majrivers.geom)) < 100000;
--Zad5
CREATE TABLE airportsNew (name VARCHAR(80), geom geometry, elev NUMERIC);
INSERT INTO airportsNew (name, geom, elev) SELECT name, geom, elev FROM airports;

--a
SELECT * FROM airportsNew WHERE ST_X(geom) = (SELECT MAX(ST_X(geom)) FROM airportsNew) OR ST_X(geom) = (SELECT MIN(ST_X(geom)) FROM airportsNew);
--b
INSERT INTO airportsNew VALUES('airportB', ST_LineInterpolatePoints(ST_MakeLine((SELECT geom FROM airportsNew WHERE ST_X(geom) = (SELECT MAX(ST_X(geom)) FROM airportsNew)), (SELECT geom FROM airportsNew WHERE ST_X(geom) = (SELECT MIN(ST_X(geom)) FROM airportsNew))), 0.5, false), 69);

--Zad6
SELECT ST_Area(ST_Buffer(ST_ShortestLine((SELECT geom FROM lakes WHERE names LIKE 'Iliamna Lake'), (SELECT geom FROM airportsNew WHERE name LIKE 'AMBLER')),999));

--Zad7
SELECT SUM(ST_Area(ST_Intersection(t.geom, a.geom))) as areas, vegdesc FROM trees t, ( SELECT geom FROM tundra UNION ALL SELECT geom FROM swamp) a WHERE ST_Intersects(t.geom, a.geom) GROUP BY t.vegdesc;