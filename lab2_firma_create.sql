-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-10-14 16:33:01.648

-- tables
-- Table: godziny
CREATE TABLE godziny (
    id_godziny int  NOT NULL,
    data date  NOT NULL,
    liczba_godzin int  NOT NULL,
    id_pracownika int  NOT NULL,
    CONSTRAINT godziny_pk PRIMARY KEY (id_godziny)
);

-- Table: pensja_stanowisko
CREATE TABLE pensja_stanowisko (
    id_pensji int  NOT NULL,
    stanowisko varchar  NOT NULL,
    kwota decimal(15,2)  NOT NULL,
    CONSTRAINT pensja_stanowisko_pk PRIMARY KEY (id_pensji)
);

-- Table: pracownicy
CREATE TABLE pracownicy (
    id_pracownika int  NOT NULL,
    imie varchar  NOT NULL,
    nazwisko varchar  NOT NULL,
    adres varchar  NOT NULL,
    telefon varchar  NOT NULL,
    CONSTRAINT pracownicy_pk PRIMARY KEY (id_pracownika)
);

-- Table: premia
CREATE TABLE premia (
    id_premii int  NOT NULL,
    rodzaj varchar  NOT NULL,
    kwota decimal(15,2)  NOT NULL,
    CONSTRAINT premia_pk PRIMARY KEY (id_premii)
);

-- Table: wynagrodzenia
CREATE TABLE wynagrodzenia (
    id_wynagrodzenia int  NOT NULL,
    data date  NOT NULL,
    id_pensji int  NOT NULL,
    id_pracownika int  NOT NULL,
    id_godziny int  NOT NULL,
    id_premii int  NOT NULL,
    CONSTRAINT wynagrodzenia_pk PRIMARY KEY (id_wynagrodzenia)
);

-- foreign keys
-- Reference: wynagrodzenia_godziny (table: wynagrodzenia)
ALTER TABLE wynagrodzenia ADD CONSTRAINT wynagrodzenia_godziny
    FOREIGN KEY (id_godziny)
    REFERENCES godziny (id_godziny)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenia_id_premii (table: wynagrodzenia)
ALTER TABLE wynagrodzenia ADD CONSTRAINT wynagrodzenia_id_premii
    FOREIGN KEY (id_premii)
    REFERENCES premia (id_premii)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenia_pensja_stanowisko (table: wynagrodzenia)
ALTER TABLE wynagrodzenia ADD CONSTRAINT wynagrodzenia_pensja_stanowisko
    FOREIGN KEY (id_pensji)
    REFERENCES pensja_stanowisko (id_pensji)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenia_pracownicy (table: wynagrodzenia)
ALTER TABLE wynagrodzenia ADD CONSTRAINT wynagrodzenia_pracownicy
    FOREIGN KEY (id_pracownika)
    REFERENCES pracownicy (id_pracownika)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

