SELECT p.id_pracownika
FROM wynagrodzenie w
JOIN pensja pe ON w.id_pensji = pe.id_pensji
JOIN premia pr ON w.id_premii = pr.id_premii
JOIN pracownicy p ON w.id_pracownika = p.id_pracownika
WHERE pr.kwota = 0 AND pe.kwota > 2000;

