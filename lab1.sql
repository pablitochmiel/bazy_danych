--Zad1
CREATE DATABASE s298240;

--Zad2
CREATE SCHEMA firma;

--Zad3
CREATE ROLE ksiegowosc;
GRANT SELECT ON ALL TABLES IN SCHEMA firma TO ksiegowosc;

--Zad4
--a
CREATE TABLE firma.pracownicy( id_pracownika INT NOT NULL, imie TEXT NOT NULL, nazwisko TEXT NOT NULL, adres TEXT NOT NULL, telefon TEXT NOT NULL);
CREATE TABLE firma.godziny( id_godziny INT NOT NULL, data DATE NOT NULL, liczba_godzin INT NOT NULL, id_pracownika INT NOT NULL);
CREATE TABLE firma.pensja_stanowisko( id_pensji INT NOT NULL, stanowisko TEXT NOT NULL, kwota FLOAT(2));
CREATE TABLE firma.premia( id_premii INT NOT NULL, rodzaj TEXT, kwota FLOAT(2));
CREATE TABLE firma.wynagrodzenie( id_wynagrodzenia INT NOT NULL, data DATE NOT NULL, id_pracownika INT NOT NULL, id_godziny INT, id_pensji INT NOT NULL, id_premii INT);
--b
ALTER TABLE firma.pracownicy ADD PRIMARY KEY(id_pracownika);
ALTER TABLE firma.godziny ADD PRIMARY KEY(id_godziny);
ALTER TABLE firma.pensja_stanowisko ADD PRIMARY KEY(id_pensji);
ALTER TABLE firma.premia ADD PRIMARY KEY(id_premii);
ALTER TABLE firma.wynagrodzenie ADD PRIMARY KEY(id_wynagrodzenia);
--c
ALTER TABLE firma.godziny ADD CONSTRAINT pracownik FOREIGN KEY(id_pracownika) REFERENCES firma.pracownicy(id_pracownika);
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT pracownik FOREIGN KEY(id_pracownika) REFERENCES firma.pracownicy(id_pracownika), ADD CONSTRAINT godziny FOREIGN KEY(id_godziny) REFERENCES firma.godziny(id_godziny), ADD CONSTRAINT pensja FOREIGN KEY( id_pensji) REFERENCES firma.pensja_stanowisko(id_pensji), ADD CONSTRAINT premia FOREIGN KEY (id_premii) REFERENCES firma.premia(id_premii);
--d
--e
COMMENT ON TABLE firma.pracownicy IS 'Tabela zwierająca informacje o pracownikach';
COMMENT ON TABLE firma.godziny IS 'Tabela zwierająca informacje o godzinach';
COMMENT ON TABLE firma.pensja_stanowisko IS 'Tabela zwierająca informacje o pensjach i stanowiskach';
COMMENT ON TABLE firma.premia IS 'Tabela zwierająca informacje o premiach';
COMMENT ON TABLE firma.wynagrodzenie IS 'Tabela zwierająca informacje o wynagrodzeniach';

--Zad5
INSERT INTO firma.pracownicy VALUES (1,'Maciej', 'Jankowski', 'Sandomierz', '123 456 789'),
                                    (2,'Grzegorz','Marcyn','Opatow','123 456 789'),
                                    (3,'Adrianna', 'Kokoszka', 'Kielce', '123 456 789'),
                                    (4,'Justyna', 'Szpyrka','Staszow','123 456 789'),
                                    (5,'Mariola', 'Lapacz', 'Tarnobrzeg','123 456 789'),
                                    (6,'Zbigniew', 'Misky','Dobrodzice','123 456 789'),
                                    (7,'Piotr', 'Passlack','Komorna','123 456 789'),
                                    (8,'Adrian', 'Jakiela', 'Kleczanow','123 456 789'),
                                    (9,'Rafal', 'Penar', 'Stalowa Wola', '123 456 789'),
                                    (10,'Karolina', 'Gadula', 'Okalina', '123 456 789');
INSERT INTO firma.godziny VALUES (1,'2020-10-7',170,1),
                                 (2,'2020-10-7',175,2),
                                 (3,'2020-10-7',170,3),
                                 (4,'2020-10-7',175,4),
                                 (5,'2020-10-7',170,5),
                                 (6,'2020-10-7',175,6),
                                 (7,'2020-10-7',170,7),
                                 (8,'2020-10-7',175,8),
                                 (9,'2020-10-7',170,9),
                                 (10,'2020-10-7',175,10) ;
INSERT INTO firma.pensja_stanowisko VALUES (1,'piekarz',150),
                                           (2,'kucharz', 80),
                                           (3,'sprzatacz',80),
                                           (4,'kierowca',22),
                                           (5,'sprzedawca',17),
                                           (6,'magazynier',17),
                                           (7,'dyrektor',120),
                                           (8,'prezes',20),
                                           (9,'logistyk',40),
                                           (10,'pracownik fizyczny',100);
INSERT INTO firma.premia VALUES (1,'za 110% normy',110),
                                (2,'za 120% normy',120),
                                (3,'za 130% normy',130),
                                (4,'za 140% normy',140),
                                (5,'za 150% normy',150),
                                (6,'za 160% normy',160),
                                (7,'za 170% normy',170),
                                (8,'za 180% normy',180),
                                (9,'za 190% normy',190),
                                (10,'za 200% normy',200);
INSERT INTO firma.wynagrodzenie VALUES (1,'2020-05-10',1,1,1,NULL),
                                       (2,'2020-05-10',2,2,2,1),
                                       (3,'2020-05-10',3,3,3,2),
                                       (4,'2020-05-10',4,4,4,1),
                                       (5,'2020-05-10',5,5,5,NULL),
                                       (6,'2020-05-10',6,6,6,NULL),
                                       (7,'2020-05-10',7,7,7,NULL),
                                       (8,'2020-05-10',8,8,8,5),
                                       (9,'2020-05-10',9,9,9,9),
                                       (10,'2020-05-10',10,10,10,NULL);
--a
ALTER TABLE firma.godziny ADD COLUMN miesiac INT;
ALTER TABLE firma.godziny ADD COLUMN tydzien INT;
--b
ALTER TABLE firma.wynagrodzenie ALTER COLUMN data TYPE TEXT;

--Zad6
--a
SELECT id_pracownika, nazwisko FROM firma.pracownicy;
--b
SELECT pr.id_pracownika FROM firma.pracownicy AS pr JOIN firma.wynagrodzenie AS w ON w.id_pracownika=pr.id_pracownika JOIN firma.pensja_stanowisko AS ps ON w.id_pensji=ps.id_pensji JOIN firma.godziny AS g ON g.id_pracownika=w.id_pracownika WHERE liczba_godzin*kwota>1000;
--c
SELECT pr.id_pracownika FROM firma.pracownicy AS pr JOIN firma.wynagrodzenie AS w ON w.id_pracownika=pr.id_pracownika
                                                    JOIN firma.pensja_stanowisko AS ps ON w.id_pensji=ps.id_pensji
                                                    JOIN firma.godziny AS g ON g.id_pracownika=w.id_pracownika
                                                    FULL JOIN firma.premia ON premia.id_premii=w.id_premii
WHERE liczba_godzin*ps.kwota>2000 AND w.id_premii is null AND pr.id_pracownika is not null;
--d
SELECT imie,nazwisko FROM firma.pracownicy WHERE imie LIKE 'J%';
--e
SELECT imie, nazwisko FROM firma.pracownicy WHERE imie LIKE '%a' AND nazwisko LIKE '%n%';
--f
SELECT pr.id_pracownika,imie,nazwisko,liczba_godzin FROM firma.pracownicy AS pr JOIN firma.godziny AS g ON pr.id_pracownika=g.id_pracownika WHERE liczba_godzin>160;
--g
SELECT pr.id_pracownika FROM firma.pracownicy AS pr JOIN firma.wynagrodzenie AS w ON w.id_pracownika=pr.id_pracownika JOIN firma.pensja_stanowisko AS ps ON w.id_pensji=ps.id_pensji JOIN firma.godziny AS g ON g.id_pracownika=w.id_pracownika WHERE liczba_godzin*kwota BETWEEN 1500 AND 3000;
--h
SELECT pr.id_pracownika,imie,nazwisko,liczba_godzin FROM firma.pracownicy AS pr JOIN firma.wynagrodzenie AS w ON w.id_pracownika=pr.id_pracownika JOIN firma.pensja_stanowisko AS ps ON w.id_pensji=ps.id_pensji JOIN firma.godziny AS g ON g.id_pracownika=w.id_pracownika WHERE liczba_godzin>160 AND id_premii IS NULL;

--Zad7
--a
SELECT pr.id_pracownika FROM firma.pracownicy AS pr JOIN firma.wynagrodzenie AS w ON w.id_pracownika=pr.id_pracownika JOIN firma.pensja_stanowisko AS ps ON w.id_pensji=ps.id_pensji JOIN firma.godziny AS g ON g.id_pracownika=w.id_pracownika ORDER BY liczba_godzin*kwota;
--b
SELECT  pr.id_pracownika,liczba_godzin*ps.kwota AS pensja,premia.kwota FROM firma.pracownicy AS pr JOIN firma.wynagrodzenie AS w ON w.id_pracownika=pr.id_pracownika
                                                                                                   JOIN firma.pensja_stanowisko AS ps ON w.id_pensji=ps.id_pensji
                                                                                                   JOIN firma.godziny AS g ON g.id_pracownika=w.id_pracownika
                                                                                                   FULL JOIN firma.premia ON premia.id_premii=w.id_premii WHERE pr.id_pracownika is not null
ORDER BY liczba_godzin*ps.kwota DESC, premia.kwota DESC ;
--c
SELECT COUNT(pr.id_pracownika),stanowisko FROM firma.pracownicy AS pr JOIN firma.wynagrodzenie AS w ON w.id_pracownika=pr.id_pracownika JOIN firma.pensja_stanowisko AS ps ON w.id_pensji=ps.id_pensji JOIN firma.godziny AS g ON g.id_pracownika=w.id_pracownika GROUP BY stanowisko;
--d
SELECT MIN(liczba_godzin*kwota), AVG(liczba_godzin*kwota) , MAX(liczba_godzin*kwota) ,stanowisko FROM firma.pracownicy AS pr JOIN firma.wynagrodzenie AS w ON w.id_pracownika=pr.id_pracownika JOIN firma.pensja_stanowisko AS ps ON w.id_pensji=ps.id_pensji JOIN firma.godziny AS g ON g.id_pracownika=w.id_pracownika GROUP BY stanowisko HAVING stanowisko='Kierownik';
--e
SELECT SUM(liczba_godzin*kwota) FROM firma.pracownicy AS pr JOIN firma.wynagrodzenie AS w ON w.id_pracownika=pr.id_pracownika JOIN firma.pensja_stanowisko AS ps ON w.id_pensji=ps.id_pensji JOIN firma.godziny AS g ON g.id_pracownika=w.id_pracownika;
--f
SELECT SUM(liczba_godzin*kwota),stanowisko FROM firma.pracownicy AS pr JOIN firma.wynagrodzenie AS w ON w.id_pracownika=pr.id_pracownika JOIN firma.pensja_stanowisko AS ps ON w.id_pensji=ps.id_pensji JOIN firma.godziny AS g ON g.id_pracownika=w.id_pracownika GROUP BY stanowisko;
--g
SELECT COUNT(id_premii) FROM firma.pracownicy AS pr JOIN firma.wynagrodzenie AS w ON w.id_pracownika=pr.id_pracownika JOIN firma.pensja_stanowisko AS ps ON w.id_pensji=ps.id_pensji JOIN firma.godziny AS g ON g.id_pracownika=w.id_pracownika GROUP BY stanowisko;
--h

--Zad8
--a
UPDATE firma.pracownicy SET telefon = '+(48)' || telefon;
--b
--c
--d

--Zad9
