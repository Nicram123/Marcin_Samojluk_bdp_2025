SELECT SUM(pe.kwota + pr.kwota) AS suma_wynagrodzen
FROM wynagrodzenie w
JOIN pensja pe ON w.id_pensji = pe.id_pensji
JOIN premia pr ON w.id_premii = pr.id_premii;

