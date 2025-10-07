SELECT p.id_pracownika
FROM wynagrodzenie w
JOIN pensja pe ON w.id_pensji = pe.id_pensji
JOIN pracownicy p ON w.id_pracownika = p.id_pracownika
WHERE pe.kwota > 1000;

