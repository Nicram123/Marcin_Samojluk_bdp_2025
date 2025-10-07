-- pracownicy
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) VALUES
('Jan', 'Nowak', 'Warszawa, ul. Kwiatowa 5', '500111222'),
('Anna', 'Kowalska', 'Kraków, ul. Lipowa 12', '501222333'),
('Jakub', 'Zieliński', 'Poznań, ul. Leśna 8', '502333444'),
('Joanna', 'Wiśniewska', 'Gdańsk, ul. Długa 4', '503444555'),
('Kamil', 'Nowicki', 'Łódź, ul. Polna 1', '504555666'),
('Julia', 'Nowakowska', 'Lublin, ul. Słoneczna 3', '505666777'),
('Michał', 'Kamiński', 'Wrocław, ul. Spacerowa 2', '506777888'),
('Justyna', 'Lewandowska', 'Katowice, ul. Parkowa 7', '507888999'),
('Piotr', 'Lis', 'Szczecin, ul. Dębowa 10', '508999000'),
('Natalia', 'Nowak', 'Bydgoszcz, ul. Brzozowa 11', '509000111');

-- pensja
INSERT INTO pensja (stanowisko, kwota) VALUES
('Kierownik', 5000),
('Asystent', 2200),
('Specjalista', 3000),
('Magazynier', 1800),
('Księgowy', 3500),
('Kierowca', 2700),
('Sprzedawca', 2300),
('Recepcjonista', 2000),
('Technik', 2500),
('Administrator', 4000);

-- premia
INSERT INTO premia (rodzaj, kwota) VALUES
('Brak', 0),
('Frekwencja', 300),
('Wyniki', 500),
('Specjalna', 800),
('Brak', 0),
('Okolicznościowa', 200),
('Brak', 0),
('Wyniki', 500),
('Frekwencja', 300),
('Brak', 0);

-- godziny
INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES
('2025-10-01', 170, 1),
('2025-10-01', 160, 2),
('2025-10-01', 150, 3),
('2025-10-01', 175, 4),
('2025-10-01', 165, 5),
('2025-10-01', 162, 6),
('2025-10-01', 158, 7),
('2025-10-01', 180, 8),
('2025-10-01', 140, 9),
('2025-10-01', 172, 10);

-- wynagrodzenie
INSERT INTO wynagrodzenie (data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES
('2025-10-31', 1, 1, 1, 2),
('2025-10-31', 2, 2, 2, 5),
('2025-10-31', 3, 3, 3, 1),
('2025-10-31', 4, 4, 4, 4),
('2025-10-31', 5, 5, 5, 3),
('2025-10-31', 6, 6, 6, 1),
('2025-10-31', 7, 7, 7, 7),
('2025-10-31', 8, 8, 8, 6),
('2025-10-31', 9, 9, 9, 9),
('2025-10-31', 10, 10, 10, 10);

