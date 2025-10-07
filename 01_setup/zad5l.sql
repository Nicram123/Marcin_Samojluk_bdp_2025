SELECT 
    AVG(pe.kwota) AS srednia,
    MIN(pe.kwota) AS minimalna,
    MAX(pe.kwota) AS maksymalna
FROM pensja pe
WHERE pe.stanowisko = 'Kierownik';

