SELECT pe.stanowisko, COUNT(pr.id_premii) AS liczba_premii
FROM wynagrodzenie w
JOIN pensja pe ON w.id_pensji = pe.id_pensji
JOIN premia pr ON w.id_premii = pr.id_premii
WHERE pr.kwota > 0
GROUP BY pe.stanowisko;

