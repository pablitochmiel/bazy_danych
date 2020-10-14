--1-5.
--Pliki wygenerowane przy użyciu narzędzia Vertabelo sa dołaczone
--6. Wstawianie Danych
--Producenci:
INSERT INTO sklep.producenci(nazwa_producenta,mail,telefon) VALUES('Producent 1','producent1@mail.com','111-222-333');
INSERT INTO sklep.producenci(nazwa_producenta,mail,telefon) VALUES('Producent 2','producent2@mail.com','111-222-333');
INSERT INTO sklep.producenci(nazwa_producenta,mail,telefon) VALUES('Producent 3','producent3@mail.com','222-333-333');
INSERT INTO sklep.producenci(nazwa_producenta,mail,telefon) VALUES('Producent 4','producent4@mail.com','333-222-333');
INSERT INTO sklep.producenci(nazwa_producenta,mail,telefon) VALUES('Producent 5','producent5@mail.com','444-222-333');
INSERT INTO sklep.producenci(nazwa_producenta,mail,telefon) VALUES('Producent 6','producent6@mail.com','555-222-333');
INSERT INTO sklep.producenci(nazwa_producenta,mail,telefon) VALUES('Producent 7','producent7@mail.com','666-222-333');
INSERT INTO sklep.producenci(nazwa_producenta,mail,telefon) VALUES('Producent 8','producent8@mail.com','777-222-333');
INSERT INTO sklep.producenci(nazwa_producenta,mail,telefon) VALUES('Producent 9','producent9@mail.com','888-222-333');
INSERT INTO sklep.producenci(nazwa_producenta,mail,telefon) VALUES('Producent 10','producent10@mail.com','999-222-333');

--Produkty:
INSERT INTO sklep.produkty(nazwa_produktu,cena,id_producenta) VALUES('Produkt1',111,1);
INSERT INTO sklep.produkty(nazwa_produktu,cena,id_producenta) VALUES('Produkt2',211,2);
INSERT INTO sklep.produkty(nazwa_produktu,cena,id_producenta) VALUES('Produkt3',311,3);
INSERT INTO sklep.produkty(nazwa_produktu,cena,id_producenta) VALUES('Produkt4',411,4);
INSERT INTO sklep.produkty(nazwa_produktu,cena,id_producenta) VALUES('Produkt5',511,5);
INSERT INTO sklep.produkty(nazwa_produktu,cena,id_producenta) VALUES('Produkt6',611,6);
INSERT INTO sklep.produkty(nazwa_produktu,cena,id_producenta) VALUES('Produkt7',711,7);
INSERT INTO sklep.produkty(nazwa_produktu,cena,id_producenta) VALUES('Produkt8',811,8);
INSERT INTO sklep.produkty(nazwa_produktu,cena,id_producenta) VALUES('Produkt9',911,9);
INSERT INTO sklep.produkty(nazwa_produktu,cena,id_producenta) VALUES('Produkt10',1011,10);

--Zamowienia:
INSERT INTO sklep.zamowienia(ilosc,id_produktu) VALUES(10,1);
INSERT INTO sklep.zamowienia(ilosc,id_produktu) VALUES(20,2);
INSERT INTO sklep.zamowienia(ilosc,id_produktu) VALUES(30,3);
INSERT INTO sklep.zamowienia(ilosc,id_produktu) VALUES(40,4);
INSERT INTO sklep.zamowienia(ilosc,id_produktu) VALUES(50,5);
INSERT INTO sklep.zamowienia(ilosc,id_produktu) VALUES(60,6);
INSERT INTO sklep.zamowienia(ilosc,id_produktu) VALUES(70,7);
INSERT INTO sklep.zamowienia(ilosc,id_produktu) VALUES(80,8);
INSERT INTO sklep.zamowienia(ilosc,id_produktu) VALUES(90,9);
INSERT INTO sklep.zamowienia(ilosc,id_produktu) VALUES(100,10);

--7. zrobiono za pomocą pgAdmin

--8.
DROP DATABASE s298240;

--9. zrobiono za pomocą pgAdmin

--10. zrobiono za pomocą pgAdmin

--11.
--a)
SELECT CONCAT('Producent: ', nazwa_producenta, ', liczba_zamowien: ', COUNT(producenci.id_producenta), ', wartosc_zamowienia', liczba_sztuk*cena) FROM zamowienia INNER JOIN produkty ON zamowienia.id_produktu = produkty.id_produktu INNER JOIN producenci ON produkty.id_producenta = producenci.id_producenta GROUP BY producenci.id_producenta,zamowienia.liczba_sztuk,produkty.cena;
--b)
SELECT CONCAT('Produkt: ', nazwa_produktu, ', liczba_zamowien: ', COUNT(id_zamowienia)) FROM produkty INNER JOIN zamowienia ON produkty.id_produktu = zamowienia.id_produktu GROUP BY produkty.id_produktu;
--c)
SELECT * FROM produkty NATURAL JOIN zamowienia;
--d)
--juz jest
--e)
SELECT * FROM zamowienia WHERE EXTRACT(MONTH FROM data) = 01;
--f)
SELECT EXTRACT(ISODOW FROM data),COUNT(id_zamowienia) FROM zamowienia GROUP BY EXTRACT(ISODOW FROM data) ORDER BY COUNT(id_zamowienia) DESC;
--g)
SELECT nazwa_produktu,COUNT(produkty.id_produktu) FROM zamowienia INNER JOIN produkty ON zamowienia.id_produktu = produkty.id_produktu GROUP BY produkty.id_produktu ORDER BY COUNT(produkty.id_produktu) DESC;

--12.
--a)
SELECT CONCAT('Produkt ',UPPER(nazwa_produktu), ' którego producentem jest ', LOWER(nazwa_producenta), ', zamówiono ', COUNT(id_zamowienia), ' razy') AS opis FROM zamowienia INNER JOIN produkty ON zamowienia.id_produktu = produkty.id_produktu INNER JOIN producenci ON produkty.id_producenta = producenci.id_producenta GROUP BY nazwa_produktu,nazwa_producenta;
--b)
SELECT * FROM zamowienia INNER JOIN produkty ON zamowienia.id_produktu = produkty.id_produktu WHERE (cena*liczba_sztuk) NOT IN (SELECT cena*liczba_sztuk FROM zamowienia INNER JOIN produkty ON zamowienia.id_produktu = produkty.id_produktu ORDER BY cena*liczba_sztuk DESC LIMIT 3);
--c)
CREATE TABLE klienci(id_klienta SERIAL PRIMARY KEY,email VARCHAR(255) NOT NULL,numer_telefonu VARCHAR(255) NOT NULL);
--d)
ALTER TABLE zamowienia ADD id_klienta INT;
ALTER TABLE zamowienia ADD CONSTRAINT fk_zamowienia_klienci FOREIGN KEY (id_klienta) REFERENCES klienci(id_klienta);
--Dodawanie nowych danych:
INSERT INTO klienci(email,numer_telefonu) VALUES('klient1','111-222-333');
INSERT INTO klienci(email,numer_telefonu) VALUES('klient2','122-222-333');
INSERT INTO klienci(email,numer_telefonu) VALUES('klient3','113-222-333');
INSERT INTO klienci(email,numer_telefonu) VALUES('klient4','144-222-333');
INSERT INTO klienci(email,numer_telefonu) VALUES('klient5','155-222-333');
INSERT INTO klienci(email,numer_telefonu) VALUES('klient6','166-222-333');
INSERT INTO klienci(email,numer_telefonu) VALUES('klient7','177-222-333');
INSERT INTO klienci(email,numer_telefonu) VALUES('klient8','188-222-333');
INSERT INTO klienci(email,numer_telefonu) VALUES('klient9','199-222-333');
INSERT INTO klienci(email,numer_telefonu) VALUES('klient10','175-222-333');

UPDATE zamowienia SET id_klienta = 1 WHERE id_zamowienia = 1;
UPDATE zamowienia SET id_klienta = 1 WHERE id_zamowienia = 2;
UPDATE zamowienia SET id_klienta = 1 WHERE id_zamowienia = 3;
UPDATE zamowienia SET id_klienta = 2 WHERE id_zamowienia = 4;
UPDATE zamowienia SET id_klienta = 3 WHERE id_zamowienia = 5;
UPDATE zamowienia SET id_klienta = 6 WHERE id_zamowienia = 6;
UPDATE zamowienia SET id_klienta = 6 WHERE id_zamowienia = 7;
UPDATE zamowienia SET id_klienta = 8 WHERE id_zamowienia = 8;
UPDATE zamowienia SET id_klienta = 9 WHERE id_zamowienia = 9;
UPDATE zamowienia SET id_klienta = 10 WHERE id_zamowienia = 10;
--e)
SELECT email, numer_telefonu, nazwa_produktu, liczba_sztuk, (liczba_sztuk * cena) AS wartość_zamówienia FROM zamowienia INNER JOIN klienci ON zamowienia.id_klienta = klienci.id_klienta INNER JOIN produkty ON produkty.id_produktu = zamowienia.id_produktu;
--f)
SELECT CONCAT('NAJCZĘŚCIEJ ZAMAWIAJĄCY: ', email, ' telefon: ',numer_telefonu, ' całkowita kwota zamówień: ', cena) FROM (SELECT email,numer_telefonu,SUM(cena*liczba_sztuk) AS cena FROM zamowienia INNER JOIN klienci ON zamowienia.id_klienta=klienci.id_klienta INNER JOIN produkty ON produkty.id_produktu=zamowienia.id_produktu GROUP BY zamowienia.id_klienta,email,numer_telefonu ORDER BY COUNT(zamowienia.id_klienta) DESC LIMIT 1) as Najczestszy UNION SELECT CONCAT('NAJRZADZIEJ ZAMAWIAJĄCY: ', email, ' telefon: ',numer_telefonu, ' całkowita kwota zamówień: ', cena) FROM (SELECT email,numer_telefonu,SUM(cena*liczba_sztuk) AS cena FROM zamowienia INNER JOIN klienci ON zamowienia.id_klienta=klienci.id_klienta INNER JOIN produkty ON produkty.id_produktu = zamowienia.id_produktu GROUP BY zamowienia.id_klienta,email,numer_telefonu ORDER BY COUNT(zamowienia.id_klienta) LIMIT 1) AS najrzadziej;
--g)
DELETE FROM produkty WHERE id_produktu IN (SELECT produkty.id_produktu FROM produkty WHERE id_produktu NOT IN (SELECT id_produktu FROM zamowienia));

--13

--14.
a)
SELECT * FROM pg_catalog.pg_user;
b)
CREATE USER Superuser298240 WITH SUPERUSER;
CREATE USER guest298240;
GRANT SELECT ON ALL TABLES IN SCHEMA firma TO guest298240;
SELECT * FROM pg_catalog.pg_user;
c)
ALTER USER Superuser298240 RENAME TO student;
ALTER USER student WITH NOSUPERUSER;
GRANT SELECT ON ALL TABLES IN SCHEMA firma TO student;

--15.
--a)
BEGIN;
UPDATE produkty SET cena = cena + 10 WHERE 1=1;
COMMIT;
--b)
BEGIN;
UPDATE produkty SET cena = cena + 0.1*cena WHERE id_produktu = 3;
SAVEPOINT S1;
UPDATE zamowienia SET liczba_sztuk = liczba_sztuk + 0.25*liczba_sztuk WHERE 1=1;
SAVEPOINT S2;
DELETE FROM klienci WHERE id_klienta = (SELECT zamowienia.id_klienta FROM klienci INNER JOIN zamowienia ON zamowienia.id_klienta = klienci.id_klienta GROUP BY zamowienia.id_klienta ORDER BY zamowienia.id_klienta DESC LIMIT 1);
ROLLBACK TO S2;
ROLLBACK;
COMMIT;
--c)
CREATE OR REPLACE FUNCTION procentowy_udzial()
    RETURNS TABLE (procent text) AS
$func$
BEGIN
    RETURN QUERY
        SELECT
            CONCAT( produkty.nazwa_produktu, ' - ', (COUNT(zamowienia.id_produktu)::decimal / (SELECT COUNT(id_zamowienia) FROM zamowienia)::decimal * 100)::integer, '%', ' wszystkich zamówień')
        FROM
            produkty INNER JOIN zamowienia ON produkty.id_produktu = zamowienia.id_produktu
        GROUP BY
            produkty.nazwa_produktu;
END
$func$ LANGUAGE plpgsql;