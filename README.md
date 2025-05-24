# LibraryDB

[English](#english-version) | [Polski](#wersja-polska)

---

## English Version

### Project Description

Relational database schema and scripts for managing a public library system. Supports authors, works, genres, publishers, books, copies, patrons, librarians, loans, returns and late‐fee regulations.

### Key Features

* **Schema Definition**: normalized tables for authors, works, publishers, genres, and library operations.
* **Data Population**: SQL scripts to create tables, load sample data, define views and stored procedures.
* **ER Diagram**: visual representation of all entities and relationships.
* **Reporting Queries**: example SQL queries for:

  1. Publishers with ≥10 books in category X (2024)
  2. Total fines per gender paid in the previous year
  3. Top 5 genres by loans among children, women, men (last 3 months)
  4. Top 5 deceased authors by loan count to male patrons (last 6 months)
  5. Librarians ranked by number of new patrons who borrowed at least once (last year)

### Schema

```text
Authors(authorId, firstName, lastName, nationality, isAlive)
Works(workId, title, year)
AuthorWorks(authorId→Authors, workId→Works)
Genres(genreId, name, icon)
WorkGenres(workId→Works, genreId→Genres)
Publishers(publisherId, name, address, phone, email)
Books(ISBN, title, year, pages, workId→Works, publisherId→Publishers)
Copies(copyId, ISBN→Books, status, addedDate, inventoryStatus)
Librarians(librarianId, firstName, lastName, login, password, email)
Patrons(patronId, firstName, lastName, birthDate, gender, email,
        addedBy→Librarians, joinedDate, isAdult, guardianId→Patrons)
Loans(loanId, patronId→Patrons, librarianId→Librarians,
      copyId→Copies, loanDate, dueDate)
Returns(returnId, loanId→Loans, returnDate, daysLate, fee, policyId→FeePolicy)
FeePolicy(policyId, genreId→Genres, dailyRate, forAdult, validFrom, validTo)
```

## Wersja polska

### Opis projektu

Schemat relacyjnej bazy danych i skrypty SQL wspierające zarządzanie miejską biblioteką. Obsługuje autorów, dzieła, gatunki, wydawców, książki, egzemplarze, czytelników, bibliotekarzy, wypożyczenia, zwroty i regulaminy kar.

### Kluczowe funkcje

* **Definicja schematu**: tabele z normalizacją dla autorów, dzieł, wydawnictw i operacji bibliotecznych.
* **Ładowanie danych**: skrypty SQL tworzące tabele, wstawiające dane przykładowe, definiujące widoki i procedury.
* **Diagram ERD**: wizualizacja encji i zależności.
* **Przykładowe zapytania**:

  1. Wydawcy z ≥10 książkami z kategorii X (2024)
  2. Całkowite opłaty karne wg płci (rok poprzedni)
  3. Top 5 gatunków wg wypożyczeń dzieci, kobiet, mężczyzn (ostatnie 3 mies.)
  4. Top 5 nieżyjących autorów wg liczby wypożyczeń przez mężczyzn (ostatnie 6 mies.)
  5. Bibliotekarze według liczby nowych czytelników, którzy wypożyczyli przynajmniej raz (rok poprzedni)

### Schemat

```text
Autorzy(autorId, imie, nazwisko, narodowosc, czyZyje)
Dziela(dzieloId, tytul, rok)
AutorzyDziela(autorId→Autorzy, dzieloId→Dziela)
Gatunki(gatunekId, nazwa, ikonka)
DzielaGatunki(dzieloId→Dziela, gatunekId→Gatunki)
Wydawcy(wydawcaId, nazwa, adres, telefon, email)
Ksiazki(ISBN, tytul, rok, strony, dzieloId→Dziela, wydawcaId→Wydawcy)
Egzemplarze(egzemplarzId, ISBN→Ksiazki, stan, dataDodania, stanMagazynowy)
Bibliotekarze(bibliotekarzId, imie, nazwisko, login, haslo, email)
Czytelnicy(czytelnikId, imie, nazwisko, dataUrodzenia, plec, email,
          ktoDodal→Bibliotekarze, dataDolaczenia, czyPelnoletni, czytelnikIdOpiekuna→Czytelnicy)
Wypozyczenia(wypozyczenieId, czytelnikId→Czytelnicy, bibliotekarzId→Bibliotekarze,
             egzemplarzId→Egzemplarze, dataWypozyczenia, dataZwrotuPlanowana)
Zwroty(zwrotId, wypozyczenieId→Wypozyczenia, dataZwrotuRzeczywista,
       opoznienieDni, oplata, regulaminId→RegulaminKary)
RegulaminKary(regulaminId, gatunekId→Gatunki, stawkaDzienna, czyPelnoletni, dataOd, dataDo)
```

## Autor / Author

Igor Tomkowicz
📧 [npnpdev@gmail.com](mailto:npnpdev@gmail.com)
GitHub: [npnpdev](https://github.com/npnpdev)
LinkedIn: [igor-tomkowicz](https://www.linkedin.com/in/igor-tomkowicz-a5760b358/)

## License

MIT License – see [LICENSE](LICENSE) for details.
