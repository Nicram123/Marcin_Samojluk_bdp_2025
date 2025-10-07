SET search_path TO ksiegowosc;

-- Tabela pracownicy
CREATE TABLE pracownicy (
    id_pracownika SERIAL PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    adres VARCHAR(100),
    telefon VARCHAR(15)
);
COMMENT ON TABLE pracownicy IS 'Tabela przechowująca dane osobowe pracowników.';

-- Tabela godziny
CREATE TABLE godziny (
    id_godziny SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    liczba_godzin INT NOT NULL CHECK (liczba_godzin >= 0),
    id_pracownika INT REFERENCES pracownicy(id_pracownika)
);
COMMENT ON TABLE godziny IS 'Tabela ewidencjonująca przepracowane godziny pracowników.';

-- Tabela pensja
CREATE TABLE pensja (
    id_pensji SERIAL PRIMARY KEY,
    stanowisko VARCHAR(50) NOT NULL,
    kwota DECIMAL(10,2) NOT NULL CHECK (kwota >= 0)
);
COMMENT ON TABLE pensja IS 'Tabela zawierająca stanowiska i przypisane do nich pensje.';

-- Tabela premia
CREATE TABLE premia (
    id_premii SERIAL PRIMARY KEY,
    rodzaj VARCHAR(50),
    kwota DECIMAL(10,2) CHECK (kwota >= 0)
);
COMMENT ON TABLE premia IS 'Tabela przechowująca informacje o przyznanych premiach.';

-- Tabela wynagrodzenie
CREATE TABLE wynagrodzenie (
    id_wynagrodzenia SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    id_pracownika INT REFERENCES pracownicy(id_pracownika),
    id_godziny INT REFERENCES godziny(id_godziny),
    id_pensji INT REFERENCES pensja(id_pensji),
    id_premii INT REFERENCES premia(id_premii)
);
COMMENT ON TABLE wynagrodzenie IS 'Tabela łącząca dane o pracowniku, jego godzinach pracy, pensji i premii.';
