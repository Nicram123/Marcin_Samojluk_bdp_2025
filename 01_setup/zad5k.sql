SELECT pe.stanowisko, COUNT(*) AS liczba_pracownikow
FROM pensja pe
JOIN wynagrodzenie w ON pe.id_pensji = w.id_pensji
GROUP BY pe.stanowisko;

