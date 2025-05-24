INSERT INTO Gatunki (nazwa, ikonka) VALUES
('Fantasy', 'fantasy.png'),
('Science Fiction', 'scifi.jpg'),
('Horror', 'horror.png'),
('Romans', 'romans.png'),
('Krymina³', 'kryminal.png'),
('Thriller', 'thriller.gif'),
('Dramat', 'dramat.png'),
('Komedia', 'komedia.jpg'),
('Biografia', 'biografia.png'),
('Historia', 'historia.jpg');

INSERT INTO RegulacjeCzasuWypozyczen (maksCzasWypozyczenia, dataOd, dataDo, isActive, gatunekId) VALUES
(30, CAST(GETDATE() AS DATE), '2024-12-31', 1, 1),
(45, CAST(GETDATE() AS DATE), NULL, 1, 2),
(15, CAST(GETDATE() AS DATE), '2024-12-31', 1, 3),
(60, CAST(GETDATE() AS DATE), NULL, 1, 4),
(30, CAST(GETDATE() AS DATE), '2024-12-31', 1, 5),
(20, CAST(GETDATE() AS DATE), NULL, 1, 6),
(40, CAST(GETDATE() AS DATE), '2023-12-31', 1, 7),
(25, CAST(GETDATE() AS DATE), NULL, 1, 8),
(35, CAST(GETDATE() AS DATE), '2023-11-30', 1, 9),
(50, CAST(GETDATE() AS DATE), NULL, 1, 10);

INSERT INTO Wydawcy (nazwa, adres, telefon, email) VALUES
('Wydawnictwo A', 'Warszawa, ul. Kwiatowa 15', '123456789', 'kontakt@wydawca-a.pl'),
('Wydawnictwo B', 'Kraków, ul. Zielona 5', '987654321', 'info@wydawca-b.pl'),
('Wydawnictwo C', 'Gdañsk, ul. Morza 20', '123789456', 'biuro@wydawca-c.pl'),
('Wydawnictwo D', 'Wroc³aw, ul. Górska 30', '321987654', 'kontakt@wydawca-d.pl'),
('Wydawnictwo E', '£ódŸ, ul. S³oñca 50', '456123789', 'info@wydawca-e.pl'),
('Wydawnictwo F', 'Poznañ, ul. Chmielna 10', '789123456', 'kontakt@wydawca-f.pl'),
('Wydawnictwo G', 'Lublin, ul. S³oneczna 25', '654789123', 'info@wydawca-g.pl'),
('Wydawnictwo H', 'Katowice, ul. Weso³a 45', '147852369', 'biuro@wydawca-h.pl'),
('Wydawnictwo I', 'Szczecin, ul. Ró¿ana 35', '852369741', 'kontakt@wydawca-i.pl'),
('Wydawnictwo J', 'Bydgoszcz, ul. Jasna 18', '963852741', 'info@wydawca-j.pl'),
('Wydawnictwo K', 'Toruñ, ul. Kopernika 12', '741852963', 'kontakt@wydawca-k.pl'),
('Wydawnictwo L', 'Rzeszów, ul. Polna 7', '159753486', 'info@wydawca-l.pl'),
('Wydawnictwo M', 'Bia³ystok, ul. Leœna 22', '258369147', 'biuro@wydawca-m.pl'),
('Wydawnictwo N', 'Opole, ul. Wodna 19', '369258147', 'kontakt@wydawca-n.pl'),
('Wydawnictwo O', 'Gdynia, ul. ¯eglarska 5', '753951456', 'info@wydawca-o.pl'),
('Wydawnictwo P', 'Radom, ul. £¹kowa 11', '951753852', 'biuro@wydawca-p.pl'),
('Wydawnictwo Q', 'Kielce, ul. Górnicza 16', '852147963', 'kontakt@wydawca-q.pl'),
('Wydawnictwo R', 'Czêstochowa, ul. Kwiatowa 14', '159486753', 'info@wydawca-r.pl'),
('Wydawnictwo S', 'Gliwice, ul. Sadowa 8', '147369852', 'biuro@wydawca-s.pl'),
('Wydawnictwo T', 'Olsztyn, ul. Parkowa 10', '321654987', 'kontakt@wydawca-t.pl');

INSERT INTO Ksiazki (ISBN, tytul, rokWydania, iloscStron, wydawcaId) VALUES
('9780007117116', 'Pan Tadeusz', 2002, 340, 1),
('9788373192013', 'Quo Vadis', 2012, 580, 2),
('9788373272463', 'W pustyni i w puszczy', 2015, 320, 3),
('9788375780553', 'WiedŸmin: Ostatnie ¿yczenie', 1993, 285, 4),
('9780747532699', 'Harry Potter i Kamieñ Filozoficzny', 1997, 309, 5),
('9780451524935', 'Rok 1984', 1949, 328, 6),
('9780062073488', 'Morderstwo w Orient Expressie', 1934, 256, 7),
('9780385504201', 'Kod Leonarda da Vinci', 2003, 489, 8),
('9780307743657', 'Lœnienie', 1977, 447, 9),
('9780307743656', 'Carrie', 1974, 245, 10),
('9780143107217', 'Sto lat samotnoœci', 1967, 417, 3),
('9780099448822', 'Norwegian Wood', 1987, 296, 4),
('9780385490818', 'Opowieœci podrêcznej', 1985, 311, 2),
('9780553293357', 'Fundacja', 1951, 244, 1),
('9780141186887', 'Czas apokalipsy', 1977, 293, 6),
('9780140441150', 'Ziemia obiecana', 1899, 367, 7),
('9781853260780', 'Pani Bovary', 1857, 335, 8),
('9780679723165', 'Lolita', 1955, 304, 9),
('9780486284736', 'Duma i uprzedzenie', 1813, 279, 10),
('9780743273565', 'Wielki Gatsby', 1925, 180, 5);

INSERT INTO Autorzy (imie, nazwisko, narodowosc, czyZyje) VALUES
('Adam', 'Mickiewicz', 'Polska', 0),
('Juliusz', 'S³owacki', 'Polska', 0),
('Maria', 'Konopnicka', 'Polska', 0),
('Henryk', 'Sienkiewicz', 'Polska', 0),
('Andrzej', 'Sapkowski', 'Polska', 1),
('Stephen', 'King', 'USA', 1),
('J.K.', 'Rowling', 'Wielka Brytania', 1),
('George', 'Orwell', 'Wielka Brytania', 0),
('Agatha', 'Christie', 'Wielka Brytania', 0),
('Dan', 'Brown', 'USA', 1),
('Margaret', 'Atwood', 'Kanada', 1),
('Ursula', 'Le Guin', 'USA', 0),
('Gabriel', 'Garcia Marquez', 'Kolumbia', 0),
('Haruki', 'Murakami', 'Japonia', 1),
('Chimamanda', 'Adichie', 'Nigeria', 1),
('Kazuo', 'Ishiguro', 'Japonia', 1),
('Isaac', 'Asimov', 'USA', 0),
('Arthur', 'Clarke', 'Wielka Brytania', 0),
('Philip', 'Dick', 'USA', 0),
('Ernest', 'Hemingway', 'USA', 0);

INSERT INTO Dziela (tytul, rokPowstania) VALUES
('Pan Tadeusz', 1834),
('Quo Vadis', 1896),
('W pustyni i w puszczy', 1911),
('WiedŸmin: Ostatnie ¿yczenie', 1993),
('Harry Potter i Kamieñ Filozoficzny', 1997),
('Rok 1984', 1949),
('Morderstwo w Orient Expressie', 1934),
('Kod Leonarda da Vinci', 2003),
('Lœnienie', 1977),
('Carrie', 1974),
('Sto lat samotnoœci', 1967),
('Norwegian Wood', 1987),
('Opowieœci podrêcznej', 1985),
('Fundacja', 1951),
('Czas apokalipsy', 1977),
('Ziemia obiecana', 1899),
('Pani Bovary', 1857),
('Lolita', 1955),
('Duma i uprzedzenie', 1813),
('Wielki Gatsby', 1925);

INSERT INTO AutorzyDziela (autorId, dzieloId) VALUES
(1, 1), (4, 2), (4, 3), (5, 4), (7, 5),
(8, 6), (9, 7), (10, 8), (6, 9), (6, 10),
(13, 11), (14, 12), (12, 13), (17, 14), (18, 15),
(3, 16), (19, 17), (20, 18), (2, 19), (11, 20);

INSERT INTO DzielaGatunki (dzieloId, gatunekId) VALUES
(1, 10), (2, 9), (3, 9), (4, 1), (5, 1),
(6, 2), (7, 5), (8, 6), (9, 3), (10, 3),
(11, 7), (12, 7), (13, 8), (14, 2), (15, 4),
(16, 9), (17, 9), (18, 5), (19, 4), (20, 6);

INSERT INTO DzielaKsiazki (dzieloId, ISBN)
VALUES
(1, '9780007117116'), -- Pan Tadeusz
(2, '9788373192013'), -- Quo Vadis
(3, '9788373272463'), -- W pustyni i w puszczy
(4, '9788375780553'), -- WiedŸmin: Ostatnie ¿yczenie
(5, '9780747532699'), -- Harry Potter i Kamieñ Filozoficzny
(6, '9780451524935'), -- Rok 1984
(7, '9780062073488'), -- Morderstwo w Orient Expressie
(8, '9780385504201'), -- Kod Leonarda da Vinci
(9, '9780307743657'), -- Lœnienie
(10, '9780307743656'), -- Carrie
(11, '9780143107217'), -- Sto lat samotnoœci
(12, '9780099448822'), -- Norwegian Wood
(13, '9780385490818'), -- Opowieœci podrêcznej
(14, '9780553293357'), -- Fundacja
(15, '9780141186887'), -- Czas apokalipsy
(16, '9780140441150'), -- Ziemia obiecana
(17, '9781853260780'), -- Pani Bovary
(18, '9780679723165'), -- Lolita
(19, '9780486284736'), -- Duma i uprzedzenie
(20, '9780743273565'); -- Wielki Gatsby

INSERT INTO Bibliotekarze (imie, nazwisko, login, haslo, email) VALUES
('Anna', 'Kowalska', 'anna_k', 'Haslo123!', 'anna.kowalska@biblioteka.pl'),
('Jan', 'Nowak', 'jan_nowak', 'Haslo2023!', 'jan.nowak@biblioteka.pl'),
('Maria', 'Wiœniewska', 'maria_w', 'Wi$nia123', 'maria.wisniewska@biblioteka.pl'),
('Piotr', 'Zieliñski', 'piotr_z', 'Piotr#5678', 'piotr.zielinski@biblioteka.pl'),
('Ewa', 'Kamiñska', 'ewa_k', 'EwaKami!1', 'ewa.kaminska@biblioteka.pl'),
('Krzysztof', 'Lewandowski', 'krzysztof_l', 'Krzy$2018', 'krzysztof.lewandowski@biblioteka.pl'),
('Joanna', 'Mazur', 'joanna_mazur', 'Mazur*Joanna1', 'joanna.mazur@biblioteka.pl'),
('Tomasz', 'Kaczmarek', 'tomasz_k', 'Tom#12345', 'tomasz.kaczmarek@biblioteka.pl'),
('Agnieszka', 'Baran', 'agnieszka_b', 'Baran!2022', 'agnieszka.baran@biblioteka.pl'),
('Marek', 'Wróbel', 'marek_w', 'Wrobel#999', 'marek.wrobel@biblioteka.pl'),
('Katarzyna', 'Piotrowska', 'katarzyna_p', 'Kasia$555', 'katarzyna.piotrowska@biblioteka.pl'),
('Jan', 'Kowalski', 'jan_k', 'Janek$123', 'jan.kowalski@biblioteka.pl'),
('Magdalena', 'Czarnecka', 'magda_c', 'Magda@2023', 'magdalena.czarnecka@biblioteka.pl'),
('Adam', 'Wiœniewski', 'adam_w', 'AdamWi$123', 'adam.wisniewski@biblioteka.pl'),
('Beata', 'Jankowska', 'beata_j', 'Beata#4567', 'beata.jankowska@biblioteka.pl'),
('Grzegorz', 'Kowalczyk', 'grzegorz_k', 'Grzegorz@89', 'grzegorz.kowalczyk@biblioteka.pl'),
('Justyna', 'Duda', 'justyna_d', 'Justyna*Duda1', 'justyna.duda@biblioteka.pl'),
('£ukasz', 'Pawlak', 'lukasz_p', 'Lukasz!2021', 'lukasz.pawlak@biblioteka.pl'),
('Patrycja', 'Zaj¹c', 'patrycja_z', 'Zajac#Patrycja1', 'patrycja.zajac@biblioteka.pl'),
('Rafa³', 'B¹k', 'rafal_b', 'Rafal1234!', 'rafal.bak@biblioteka.pl');

-- Pe³noletni czytelnicy
INSERT INTO Czytelnicy (imie, nazwisko, dataUrodzenia, plec, email, dataDolaczenia, ktoDodal, czyPelnoletni, czytelnikIdOpiekuna)
VALUES 
('Anna', 'Kowalska', '1990-05-15', 'kobieta', 'anna.kowalska@example.com', '2023-01-01', 1, 1, NULL),
('Jan', 'Nowak', '1985-03-10', 'mê¿czyzna', 'jan.nowak@example.com', '2023-01-05', 2, 1, NULL),
('Ewa', 'Wiœniewska', '1987-12-20', 'kobieta', 'ewa.wisniewska@example.com', '2023-02-01', 3, 1, NULL),
('Tomasz', 'Kowalczyk', '1975-08-22', 'mê¿czyzna', 'tomasz.kowalczyk@example.com', '2023-03-15', 4, 1, NULL),
('Karolina', 'Zieliñska', '1995-09-14', 'kobieta', 'karolina.zielinska@example.com', '2023-05-12', 5, 1, NULL),
('Pawe³', 'Szymañski', '1980-11-18', 'mê¿czyzna', 'pawel.szymanski@example.com', '2023-06-18', 6, 1, NULL),
('Agnieszka', 'Mazur', '1999-01-30', 'kobieta', 'agnieszka.mazur@example.com', '2023-09-15', 7, 1, NULL),
('Kamil', 'Wójcik', '1988-06-10', 'mê¿czyzna', 'kamil.wojcik@example.com', '2023-10-20', 8, 1, NULL),
('Joanna', 'Piotrowska', '2001-07-07', 'kobieta', 'joanna.piotrowska@example.com', '2023-12-10', 9, 1, NULL),
('Natalia', 'Michalska', '1997-08-08', 'kobieta', 'natalia.michalska@example.com', '2024-02-20', 10, 1, NULL);


-- Niepe³noletni czytelnicy
INSERT INTO Czytelnicy (imie, nazwisko, dataUrodzenia, plec, email, dataDolaczenia, ktoDodal, czyPelnoletni, czytelnikIdOpiekuna)
VALUES 
('Micha³', 'Nowicki', '2010-07-01', 'mê¿czyzna', 'michal.nowicki@example.com', '2023-04-10', 1, 0, 1),
('Maria', 'WoŸniak', '2003-02-28', 'kobieta', 'maria.wozniak@example.com', '2023-07-22', 2, 0, 2),
('Piotr', 'D¹browski', '2012-04-05', 'mê¿czyzna', 'piotr.dabrowski@example.com', '2023-08-10', 3, 0, 3),
('Dorota', 'Krawczyk', '2015-05-21', 'kobieta', 'dorota.krawczyk@example.com', '2023-11-05', 4, 0, 4),
('Adam', 'Kaczmarek', '2008-09-10', 'mê¿czyzna', 'adam.kaczmarek@example.com', '2023-12-01', 5, 0, 5),
('Monika', 'Pawlak', '2011-11-11', 'kobieta', 'monika.pawlak@example.com', '2024-04-10', 6, 0, 6),
('Damian', 'Zalewski', '2007-12-25', 'mê¿czyzna', 'damian.zalewski@example.com', '2024-05-15', 7, 0, 7),
('Mateusz', 'Sikorski', '2009-09-22', 'mê¿czyzna', 'mateusz.sikorski@example.com', '2024-06-01', 8, 0, 8),
('Aleksandra', 'Jankowska', '2013-11-03', 'kobieta', 'aleksandra.jankowska@example.com', '2024-07-15', 9, 0, 9),
('Bartek', 'Zawadzki', '2012-02-19', 'mê¿czyzna', 'bartek.zawadzki@example.com', '2024-08-20', 10, 0, 10);


INSERT INTO Egzemplarze (stan, dataDodania, ISBN) VALUES
('Nowy', '2023-01-15', '9780007117116'),
('Dobry', '2023-02-20', '9788373192013'),
('Nowy', '2023-03-05', '9788373272463'),
('U¿ywany', '2023-04-10', '9788375780553'),
('Nowy', '2023-05-25', '9780747532699'),
('Nowy', '2023-06-15', '9780451524935'),
('Dobry', '2023-07-20', '9780062073488'),
('U¿ywany', '2023-08-10', '9780385504201'),
('Nowy', '2023-09-15', '9780307743657'),
('U¿ywany', '2023-10-05', '9780307743656'),
('Nowy', '2023-11-01', '9780143107217'),
('Nowy', '2023-11-10', '9780099448822'),
('Dobry', '2023-11-20', '9780385490818'),
('U¿ywany', '2023-12-01', '9780553293357'),
('Nowy', '2023-12-10', '9780141186887'),
('Dobry', '2023-12-15', '9780140441150'),
('Nowy', '2023-12-17', '9781853260780'),
('Nowy', '2023-12-17', '9780679723165'),
('Dobry', '2023-12-17', '9780486284736'),
('U¿ywany', '2023-12-17', '9780743273565'),
('U¿ywany', '2024-12-17', '9780743273565');


INSERT INTO Wypozyczenia (dataWypozyczenia, dataZwrotuPlanowana, czytelnikId, bibliotekarzId, egzemplarzId) 
VALUES
(CAST(GETDATE() AS DATE), DATEADD(DAY, 1, CAST(GETDATE() AS DATE)), 1, 1, 1),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 2, CAST(GETDATE() AS DATE)), 2, 2, 2),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 3, CAST(GETDATE() AS DATE)), 3, 3, 3),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 4, CAST(GETDATE() AS DATE)), 4, 1, 4),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 5, CAST(GETDATE() AS DATE)), 5, 2, 5),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 6, CAST(GETDATE() AS DATE)), 6, 3, 6),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 7, CAST(GETDATE() AS DATE)), 7, 1, 7),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 8, CAST(GETDATE() AS DATE)), 8, 2, 8),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 9, CAST(GETDATE() AS DATE)), 9, 3, 9),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 10, CAST(GETDATE() AS DATE)), 10, 1, 10),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 11, CAST(GETDATE() AS DATE)), 11, 2, 11),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 12, CAST(GETDATE() AS DATE)), 12, 3, 12),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 13, CAST(GETDATE() AS DATE)), 13, 1, 13),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 14, CAST(GETDATE() AS DATE)), 14, 2, 14),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 15, CAST(GETDATE() AS DATE)), 15, 3, 15),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 16, CAST(GETDATE() AS DATE)), 16, 1, 16),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 17, CAST(GETDATE() AS DATE)), 17, 2, 17),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 18, CAST(GETDATE() AS DATE)), 18, 3, 18),
(CAST(GETDATE() AS DATE), DATEADD(DAY, 19, CAST(GETDATE() AS DATE)), 19, 1, 19);
--(CAST(GETDATE() AS DATE), DATEADD(DAY, 20, CAST(GETDATE() AS DATE)), 20, 2, 20),

INSERT INTO RegulaminKary (stawkaDzienna, dataOd, dataDo, gatunekId) 
VALUES
(0.50, CAST(GETDATE() AS DATE), DATEADD(YEAR, 1, CAST(GETDATE() AS DATE)), 1), 
(1.00, CAST(GETDATE() AS DATE), NULL, 2),                                      
(0.75, CAST(GETDATE() AS DATE), DATEADD(MONTH, 6, CAST(GETDATE() AS DATE)), 3),
(1.50, CAST(GETDATE() AS DATE), NULL, 4),                                      
(0.25, CAST(GETDATE() AS DATE), DATEADD(MONTH, 3, CAST(GETDATE() AS DATE)), 5),
(0.80, CAST(GETDATE() AS DATE), NULL, 6),                                     
(1.20, CAST(GETDATE() AS DATE), DATEADD(YEAR, 1, CAST(GETDATE() AS DATE)), 7),
(0.60, CAST(GETDATE() AS DATE), NULL, 8),                                      
(1.10, CAST(GETDATE() AS DATE), DATEADD(MONTH, 2, CAST(GETDATE() AS DATE)), 9),
(0.90, CAST(GETDATE() AS DATE), NULL, 10);                                     

INSERT INTO Zwroty (dataZwrotuRzeczywista, opoznienieDni, oplataZaOpoznienie, wypozyczenieId, regulaminId, bibliotekarzId)
VALUES
(CAST(GETDATE() AS DATE), 0, 0.00, 1, 1, 1),
(DATEADD(DAY, -1, CAST(GETDATE() AS DATE)), 1, 2.50, 2, 2, 2),
(DATEADD(DAY, -5, CAST(GETDATE() AS DATE)), 3, 7.50, 3, 3, 3),
(DATEADD(DAY, -10, CAST(GETDATE() AS DATE)), 0, 0.00, 4, 4, 4),
(DATEADD(DAY, -15, CAST(GETDATE() AS DATE)), 7, 14.00, 5, 5, 5),
(DATEADD(DAY, -20, CAST(GETDATE() AS DATE)), 10, 20.00, 6, 6, 6),
(DATEADD(DAY, -25, CAST(GETDATE() AS DATE)), 0, 0.00, 7, 7, 7),
(DATEADD(DAY, -30, CAST(GETDATE() AS DATE)), 5, 12.50, 8, 8, 8),
(DATEADD(DAY, -35, CAST(GETDATE() AS DATE)), 0, 0.00, 9, 9, 9),
(DATEADD(DAY, -40, CAST(GETDATE() AS DATE)), 8, 16.00, 10, 10, 10),
(DATEADD(DAY, -45, CAST(GETDATE() AS DATE)), 2, 5.00, 11, 1, 1),
(DATEADD(DAY, -50, CAST(GETDATE() AS DATE)), 0, 0.00, 12, 2, 2),
(DATEADD(DAY, -55, CAST(GETDATE() AS DATE)), 4, 10.00, 13, 3, 3),
(DATEADD(DAY, -60, CAST(GETDATE() AS DATE)), 0, 0.00, 14, 4, 4),
(DATEADD(DAY, -65, CAST(GETDATE() AS DATE)), 9, 22.50, 15, 5, 5),
(DATEADD(DAY, -70, CAST(GETDATE() AS DATE)), 0, 0.00, 16, 6, 6),
(DATEADD(DAY, -75, CAST(GETDATE() AS DATE)), 6, 15.00, 17, 7, 7),
(DATEADD(DAY, -80, CAST(GETDATE() AS DATE)), 0, 0.00, 18, 8, 8),
(DATEADD(DAY, -85, CAST(GETDATE() AS DATE)), 12, 30.00, 19, 9, 9);
--(DATEADD(DAY, -90, CAST(GETDATE() AS DATE)), 0, 0.00, 20, 10, 10);