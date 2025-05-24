-- Usuniêcie kluczy obcych
ALTER TABLE RegulacjeCzasuWypozyczen DROP CONSTRAINT fk_regulacje_gatunki;

ALTER TABLE DzielaKsiazki DROP CONSTRAINT fk_dzielaksiazki_dzielo;
ALTER TABLE DzielaKsiazki DROP CONSTRAINT fk_dzielaksiazki_ksiazki;

ALTER TABLE Zwroty DROP CONSTRAINT fk_zwroty_wypozyczenia;
ALTER TABLE Zwroty DROP CONSTRAINT fk_zwroty_regulamin;
ALTER TABLE Zwroty DROP CONSTRAINT fk_zwroty_bibliotekarz;

ALTER TABLE RegulaminKary DROP CONSTRAINT fk_regulamin_gatunki;

ALTER TABLE Wypozyczenia DROP CONSTRAINT fk_wypozyczenia_czytelnicy;
ALTER TABLE Wypozyczenia DROP CONSTRAINT fk_wypozyczenia_bibliotekarze;
ALTER TABLE Wypozyczenia DROP CONSTRAINT fk_wypozyczenia_egzemplarze;

ALTER TABLE Czytelnicy DROP CONSTRAINT fk_czytelnicy_bibliotekarze;
ALTER TABLE Czytelnicy DROP CONSTRAINT fk_czytelnicy_opiekun;

ALTER TABLE Egzemplarze DROP CONSTRAINT fk_egzemplarze_ksiazki;

ALTER TABLE Ksiazki DROP CONSTRAINT fk_ksiazki_wydawcy;

ALTER TABLE DzielaGatunki DROP CONSTRAINT fk_dziela_gatunki;
ALTER TABLE DzielaGatunki DROP CONSTRAINT fk_gatunki;

ALTER TABLE AutorzyDziela DROP CONSTRAINT fk_autorzy;
ALTER TABLE AutorzyDziela DROP CONSTRAINT fk_dziela;

-- Usuniêcie tabel (w odpowiedniej kolejnoœci)
DROP TABLE RegulacjeCzasuWypozyczen;
DROP TABLE DzielaKsiazki;
DROP TABLE Zwroty;
DROP TABLE RegulaminKary;
DROP TABLE Wypozyczenia;
DROP TABLE Czytelnicy;
DROP TABLE Bibliotekarze;
DROP TABLE Egzemplarze;
DROP TABLE Ksiazki;
DROP TABLE Wydawcy;
DROP TABLE DzielaGatunki;
DROP TABLE Gatunki;
DROP TABLE AutorzyDziela;
DROP TABLE Dziela;
DROP TABLE Autorzy;
