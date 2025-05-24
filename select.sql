-- 1. Zapytanie tworzy widok WidokMiesieczneWypozyczenia, kt�ry pozwala analizowa�, ile wypo�ycze� by�o realizowanych w danym miesi�cu, z podzia�em na gatunki 

/*
CREATE VIEW WidokMiesieczneWypozyczenia AS
SELECT 
    YEAR(w.dataWypozyczenia) AS rok,
    MONTH(w.dataWypozyczenia) AS miesiac,
    g.nazwa AS gatunek,
    COUNT(*) AS liczba_wypozyczen
FROM Wypozyczenia w
JOIN Egzemplarze e ON w.egzemplarzId = e.egzemplarzId
JOIN Ksiazki k ON e.ISBN = k.ISBN
JOIN DzielaKsiazki dk ON k.ISBN = dk.ISBN
JOIN Dziela d ON dk.dzieloId = d.dzieloId
JOIN DzielaGatunki dg ON d.dzieloId = dg.dzieloId
JOIN Gatunki g ON dg.gatunekId = g.gatunekId
GROUP BY YEAR(w.dataWypozyczenia), MONTH(w.dataWypozyczenia), g.nazwa;
*/

-- 1.1 Zapytanie wykorzystuj�ce widok: oblicza procentowy udzia� gatunk�w w wypo�yczeniach w danym miesi�cu
SELECT rok, miesiac, gatunek, liczba_wypozyczen,
    ROUND(
        (liczba_wypozyczen * 100.0) / SUM(liczba_wypozyczen) OVER (PARTITION BY rok, miesiac), 2) AS procent_udzialu
FROM WidokMiesieczneWypozyczenia
ORDER BY rok DESC, miesiac DESC, procent_udzialu DESC;
--DROP VIEW WidokMiesieczneWypozyczenia;


-- 2. Najpopularniejsi autorzy ostatnich 5 lat
SELECT TOP 10
    a.imie, 
    a.nazwisko, 
    COUNT(*) AS liczba_wypozyczen
FROM Autorzy a
JOIN AutorzyDziela ad ON a.autorId = ad.autorId
JOIN Dziela d ON ad.dzieloId = d.dzieloId
JOIN DzielaKsiazki dk ON d.dzieloId = dk.dzieloId
JOIN Ksiazki k ON dk.ISBN = k.ISBN
JOIN Egzemplarze e ON k.ISBN = e.ISBN
JOIN Wypozyczenia w ON e.egzemplarzId = w.egzemplarzId
WHERE YEAR(w.dataWypozyczenia) >= YEAR(GETDATE()) - 5
GROUP BY a.imie, a.nazwisko, a.autorId
ORDER BY liczba_wypozyczen DESC;


-- 3. �rednia op�ata za op�nienie wed�ug gatunku
SELECT 
    g.nazwa AS gatunek,
    AVG(z.oplataZaOpoznienie) AS srednia_oplata
FROM Zwroty z
JOIN RegulaminKary rk ON z.regulaminId = rk.regulaminId
JOIN Gatunki g ON rk.gatunekId = g.gatunekId
GROUP BY g.nazwa;


-- 4. Wydawcy z najwi�ksz� liczb� ksi��ek w gatunku "Historia"
SELECT TOP 10
    w.nazwa AS wydawca,
    COUNT(k.ISBN) AS liczba_ksiazek
FROM Wydawcy w
JOIN Ksiazki k ON w.wydawcaId = k.wydawcaId
JOIN DzielaKsiazki dk ON k.ISBN = dk.ISBN
JOIN DzielaGatunki dg ON dk.dzieloId = dg.dzieloId
JOIN Gatunki g ON dg.gatunekId = g.gatunekId
--WHERE g.nazwa = 'Historia'
GROUP BY w.nazwa
ORDER BY liczba_ksiazek DESC;


/*
5. Kwerenda pokazuje, kt�re ksi��ki s� wypo�yczane na najd�u�szy okres. Mo�e to wskazywa� na ich szczeg�ln� warto�� dla czytelnik�w
i ewentualnie wymaga�oby zam�wienie wi�kszej ilo�ci egzemplarzy.
*/
SELECT 
    k.tytul,
    k.ISBN,
    AVG(DATEDIFF(DAY, w.dataWypozyczenia, z.dataZwrotuRzeczywista)) AS sredni_czas_wypozyczenia
FROM Ksiazki k
JOIN Egzemplarze e ON k.ISBN = e.ISBN
JOIN Wypozyczenia w ON e.egzemplarzId = w.egzemplarzId
JOIN Zwroty z ON w.wypozyczenieId = z.wypozyczenieId
GROUP BY k.ISBN, k.tytul
ORDER BY sredni_czas_wypozyczenia DESC;


-- 6. Ksi��ki, kt�re nigdy nie by�y wypo�yczane
SELECT k.tytul, k.ISBN
FROM Ksiazki k
WHERE NOT EXISTS (
    SELECT *
    FROM Egzemplarze e
    JOIN Wypozyczenia w ON e.egzemplarzId = w.egzemplarzId
    WHERE e.ISBN = k.ISBN
);


-- 7. Wydawcy z najwi�ksz� liczb� ksi��ek w bazie
SELECT 
    w.nazwa AS wydawca,
    COUNT(k.ISBN) AS liczba_ksiazek
FROM Wydawcy w
JOIN Ksiazki k ON w.wydawcaId = k.wydawcaId
GROUP BY w.nazwa
ORDER BY liczba_ksiazek DESC;


-- 8. Czytelnicy, kt�rzy nigdy nie wypo�yczyli ksi��ki
SELECT 
    c.imie,
    c.nazwisko,
    c.email,
    c.dataDolaczenia
FROM Czytelnicy c
WHERE c.czytelnikId NOT IN (
    SELECT DISTINCT w.czytelnikId
    FROM Wypozyczenia w
)
ORDER BY c.nazwisko ASC, c.imie ASC;


-- 9. Ksi��ki, kt�re maj� wi�cej ni� jeden egzemplarz w bibliotece
SELECT 
	k.tytul, 
	k.ISBN,
    w.nazwa AS wydawca,
    COUNT(e.egzemplarzId) AS liczba_egzemplarzy
FROM Ksiazki k
JOIN Egzemplarze e ON k.ISBN = e.ISBN
LEFT JOIN Wydawcy w ON k.wydawcaId = w.wydawcaId
GROUP BY k.tytul, k.ISBN, w.nazwa
HAVING COUNT(e.egzemplarzId) > 1
ORDER BY liczba_egzemplarzy DESC;
