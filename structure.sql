CREATE TABLE Autorzy (
    autorId SMALLINT IDENTITY(1,1) PRIMARY KEY,
    imie NVARCHAR(50) NOT NULL CHECK (LEN(imie) BETWEEN 2 AND 50 AND imie LIKE '[A-ZĄĆĘŁŃÓŚŹŻ]%'),
    nazwisko NVARCHAR(100) NOT NULL CHECK (LEN(nazwisko) BETWEEN 2 AND 100 AND nazwisko LIKE '[A-ZĄĆĘŁŃÓŚŹŻ]%'),
    narodowosc NVARCHAR(30) NOT NULL,
    czyZyje BIT NOT NULL
);

CREATE TABLE Dziela (
    dzieloId SMALLINT IDENTITY(1,1) PRIMARY KEY,
    tytul NVARCHAR(200) NOT NULL,
    rokPowstania SMALLINT CHECK (rokPowstania >= 0 and rokPowstania <= YEAR(GETDATE())),
);

CREATE TABLE AutorzyDziela (
    autorId SMALLINT,
    dzieloId SMALLINT,
    PRIMARY KEY (autorId, dzieloId),
    CONSTRAINT fk_autorzy FOREIGN KEY (autorId) REFERENCES Autorzy(autorId) ON DELETE CASCADE,
    CONSTRAINT fk_dziela FOREIGN KEY (dzieloId) REFERENCES Dziela(dzieloId) ON DELETE CASCADE
);

CREATE TABLE Gatunki (
    gatunekId TINYINT IDENTITY(1,1) PRIMARY KEY,
    nazwa NVARCHAR(50) NOT NULL CHECK (LEN(nazwa) BETWEEN 3 AND 50 AND nazwa LIKE '[A-ZĄĆĘŁŃÓŚŹŻ]%'),
    ikonka NVARCHAR(255) NOT NULL CHECK (ikonka LIKE '%.png' OR ikonka LIKE '%.jpg' OR ikonka LIKE '%.jpeg' OR ikonka LIKE '%.gif')
);

CREATE TABLE DzielaGatunki (
    dzieloId SMALLINT,
    gatunekId TINYINT,
    PRIMARY KEY (dzieloId, gatunekId),
    CONSTRAINT fk_dziela_gatunki FOREIGN KEY (dzieloId) REFERENCES Dziela(dzieloId) ON DELETE CASCADE,
    CONSTRAINT fk_gatunki FOREIGN KEY (gatunekId) REFERENCES Gatunki(gatunekId) ON DELETE CASCADE
);

CREATE TABLE RegulacjeCzasuWypozyczen (
    regulacjaId TINYINT IDENTITY(1,1) PRIMARY KEY,
    maksCzasWypozyczenia SMALLINT NOT NULL CHECK (maksCzasWypozyczenia > 0), -- liczba dni
	dataOd DATE NOT NULL CHECK (CAST(dataOd AS DATE) = CAST(GETDATE() AS DATE)),
    dataDo DATE,
	isActive BIT DEFAULT 1, -- Flaga aktywności regulacji
	gatunekId TINYINT NOT NULL,
    CONSTRAINT fk_regulacje_gatunki FOREIGN KEY (gatunekId) REFERENCES Gatunki(gatunekId) ON DELETE CASCADE
);

CREATE TABLE Wydawcy (
    wydawcaId TINYINT IDENTITY(1,1) PRIMARY KEY,
    nazwa NVARCHAR(255) NOT NULL CHECK (LEN(nazwa) BETWEEN 1 AND 255 AND nazwa LIKE '%[^ ]%'),
    adres NVARCHAR(255) NOT NULL CHECK (LEN(adres) BETWEEN 10 AND 255),
    telefon NVARCHAR(15) NOT NULL CHECK (LEN(telefon) BETWEEN 9 AND 15 AND telefon LIKE '[0-9]%'),
    email NVARCHAR(255) NOT NULL 
        CHECK (
            LEN(email) BETWEEN 5 AND 255 AND
            email LIKE '%_@_%._%' AND  -- Format e-maila
            email NOT LIKE '% %'       -- Bez spacji
        )
);

CREATE TABLE Ksiazki (
    ISBN CHAR(13) PRIMARY KEY NOT NULL CHECK (ISBN LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    tytul NVARCHAR(255) NOT NULL,
    rokWydania INT NOT NULL
        CHECK (rokWydania >= 1450 AND rokWydania <= YEAR(GETDATE()) + 1),
    iloscStron INT NOT NULL
        CHECK (iloscStron >= 1 AND iloscStron <= 10000),
    wydawcaId TINYINT,
    CONSTRAINT fk_ksiazki_wydawcy FOREIGN KEY (wydawcaId) REFERENCES Wydawcy(wydawcaId) ON DELETE SET NULL
);

CREATE TABLE Egzemplarze (
    egzemplarzId SMALLINT IDENTITY(1,1) PRIMARY KEY,
    stan NVARCHAR(100) DEFAULT 'Nowy',
    dataDodania DATE NOT NULL
        CHECK (dataDodania >= '2000-01-01' AND dataDodania <= GETDATE()),
	ISBN CHAR(13),
    CONSTRAINT fk_egzemplarze_ksiazki FOREIGN KEY (ISBN) REFERENCES Ksiazki(ISBN) ON DELETE CASCADE
);

CREATE TABLE Bibliotekarze (
    bibliotekarzId TINYINT IDENTITY(1,1) PRIMARY KEY,
    imie NVARCHAR(50) NOT NULL CHECK (LEN(imie) BETWEEN 2 AND 50 AND imie LIKE '[A-ZĄĆĘŁŃÓŚŹŻ]%'),
    nazwisko NVARCHAR(100) NOT NULL CHECK (LEN(nazwisko) BETWEEN 2 AND 100 AND nazwisko LIKE '[A-ZĄĆĘŁŃÓŚŹŻ]%'),
    login NVARCHAR(30) UNIQUE NOT NULL 
        CHECK (LEN(login) BETWEEN 5 AND 30 AND login NOT LIKE '%[^A-Za-z0-9_-]%'),
    haslo NVARCHAR(128) NOT NULL 
        CHECK (
            LEN(haslo) BETWEEN 8 AND 128 AND
            haslo LIKE '%[A-Z]%' AND  -- co najmniej jedna wielka litera
            haslo LIKE '%[0-9]%' AND  -- co najmniej jedna cyfra
            PATINDEX('%[^A-Za-z0-9]%', haslo) > 0  -- co najmniej jeden znak specjalny
        ),
    email NVARCHAR(255) NOT NULL 
        CHECK (
            LEN(email) BETWEEN 5 AND 255 AND
            email LIKE '%_@_%._%' AND  -- Format e-maila
            email NOT LIKE '% %'       -- Bez spacji
        )
);

CREATE TABLE Czytelnicy (
    czytelnikId SMALLINT IDENTITY(1,1) PRIMARY KEY,
    imie NVARCHAR(50) NOT NULL CHECK (LEN(imie) BETWEEN 2 AND 50 AND imie LIKE '[A-ZĄĆĘŁŃÓŚŹŻ]%'),
    nazwisko NVARCHAR(100) NOT NULL CHECK (LEN(nazwisko) BETWEEN 2 AND 100 AND nazwisko LIKE '[A-ZĄĆĘŁŃÓŚŹŻ]%'),
    dataUrodzenia DATE NOT NULL
        CHECK (dataUrodzenia >= '1900-01-01' AND dataUrodzenia <= GETDATE()),
    plec NVARCHAR(15) NOT NULL 
        CHECK (plec IN ('kobieta', 'mężczyzna', 'nie określono')),
    email NVARCHAR(255) NOT NULL 
        CHECK (
            LEN(email) BETWEEN 5 AND 255 AND
            email LIKE '%_@_%._%' AND  -- Format e-maila
            email NOT LIKE '% %'       -- Bez spacji
        ),
	dataDolaczenia DATE NOT NULL
		CHECK (dataDolaczenia >= '2000-01-01' AND dataDolaczenia <= GETDATE()),
    ktoDodal TINYINT,
    czyPelnoletni BIT NOT NULL,
    czytelnikIdOpiekuna SMALLINT NULL DEFAULT NULL, -- Domyślnie NULL, czyli dorosły
        CHECK (czytelnikIdOpiekuna >= 0),
    CONSTRAINT fk_czytelnicy_bibliotekarze FOREIGN KEY (ktoDodal) REFERENCES Bibliotekarze(bibliotekarzId) ON DELETE SET NULL,
	CONSTRAINT fk_czytelnicy_opiekun FOREIGN KEY (czytelnikIdOpiekuna) REFERENCES Czytelnicy(czytelnikId)
);

CREATE TABLE Wypozyczenia (
    wypozyczenieId INT IDENTITY(1,1) PRIMARY KEY,
    dataWypozyczenia DATE NOT NULL
        CHECK (dataWypozyczenia >= '2000-01-01' AND dataWypozyczenia = CAST(GETDATE() AS DATE)),
    dataZwrotuPlanowana DATE NOT NULL 
        CHECK (dataZwrotuPlanowana >= CAST(GETDATE() AS DATE)),
    czytelnikId SMALLINT,
    bibliotekarzId TINYINT,
    egzemplarzId SMALLINT,
    CONSTRAINT fk_wypozyczenia_czytelnicy FOREIGN KEY (czytelnikId) REFERENCES Czytelnicy(czytelnikId) ON DELETE CASCADE,
    CONSTRAINT fk_wypozyczenia_bibliotekarze FOREIGN KEY (bibliotekarzId) REFERENCES Bibliotekarze(bibliotekarzId) ON DELETE SET NULL,
    CONSTRAINT fk_wypozyczenia_egzemplarze FOREIGN KEY (egzemplarzId) REFERENCES Egzemplarze(egzemplarzId) ON DELETE CASCADE
);


CREATE TABLE RegulaminKary (
    regulaminId TINYINT IDENTITY(1,1) PRIMARY KEY,
    stawkaDzienna DECIMAL(10, 2) NOT NULL
        CHECK (stawkaDzienna > 0),
	dataOd DATE NOT NULL CHECK (CAST(dataOd AS DATE) = CAST(GETDATE() AS DATE)),
    dataDo DATE NULL,
	gatunekId TINYINT,
    CONSTRAINT fk_regulamin_gatunki FOREIGN KEY (gatunekId) REFERENCES Gatunki(gatunekId) ON DELETE CASCADE
);

CREATE TABLE Zwroty (
    zwrotId INT IDENTITY(1,1) PRIMARY KEY,
    dataZwrotuRzeczywista DATE NOT NULL
        CHECK (dataZwrotuRzeczywista <= CAST(GETDATE() AS DATE)), -- Porównanie z bieżącą datą, bez czasu
    opoznienieDni SMALLINT NOT NULL
        CHECK (opoznienieDni >= 0),
    oplataZaOpoznienie DECIMAL(10, 2),
    wypozyczenieId INT,
    regulaminId TINYINT,
    bibliotekarzId TINYINT,
    CONSTRAINT fk_zwroty_wypozyczenia FOREIGN KEY (wypozyczenieId) REFERENCES Wypozyczenia(wypozyczenieId) ON DELETE CASCADE,
    CONSTRAINT fk_zwroty_regulamin FOREIGN KEY (regulaminId) REFERENCES RegulaminKary(regulaminId) ON DELETE CASCADE,
    CONSTRAINT fk_zwroty_bibliotekarz FOREIGN KEY (bibliotekarzId) REFERENCES Bibliotekarze(bibliotekarzId) ON DELETE SET NULL
);

CREATE TABLE DzielaKsiazki (
    dzieloId SMALLINT NOT NULL,
    ISBN CHAR(13) NOT NULL,
    PRIMARY KEY (dzieloId, ISBN),
    CONSTRAINT fk_dzielaksiazki_dzielo
        FOREIGN KEY (dzieloId) REFERENCES Dziela(dzieloId) ON DELETE CASCADE,
    CONSTRAINT fk_dzielaksiazki_ksiazki
        FOREIGN KEY (ISBN) REFERENCES Ksiazki(ISBN) ON DELETE CASCADE
);