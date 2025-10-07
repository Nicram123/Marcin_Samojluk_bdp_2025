SELECT p.imie, p.nazwisko
FROM pracownicy p
JOIN wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN godziny g ON w.id_godziny = g.id_godziny
JOIN premia pr ON w.id_premii = pr.id_premii
WHERE g.liczba_godzin > 160 AND pr.kwota = 0;

