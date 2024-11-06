-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Lis 06, 2024 at 11:34 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `KINO4tig1`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Bilety`
--

CREATE TABLE `Bilety` (
  `ID` int(11) NOT NULL,
  `Seans_ID` int(11) NOT NULL,
  `Sprzedawca_ID` int(11) NOT NULL,
  `Klient_ID` int(11) NOT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Bilety`
--

INSERT INTO `Bilety` (`ID`, `Seans_ID`, `Sprzedawca_ID`, `Klient_ID`, `cena`) VALUES
(1, 1, 1, 1, 20),
(2, 2, 2, 2, 25),
(3, 3, 3, 3, 22);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Filmy`
--

CREATE TABLE `Filmy` (
  `ID` int(11) NOT NULL,
  `Tytuł` varchar(40) NOT NULL,
  `Reżyser` varchar(20) NOT NULL,
  `Czas_trwania(min)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Filmy`
--

INSERT INTO `Filmy` (`ID`, `Tytuł`, `Reżyser`, `Czas_trwania(min)`) VALUES
(1, 'Auta', 'Kamil Ślimak', 90),
(2, 'Iron Man', 'Piotr Nowak', 120),
(3, 'Ostatni Taniec', 'Adam Polik', 100);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Filmy_Rodzaj`
--

CREATE TABLE `Filmy_Rodzaj` (
  `ID` int(11) NOT NULL,
  `Filmy_ID` int(11) NOT NULL,
  `Rodzaj_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Filmy_Rodzaj`
--

INSERT INTO `Filmy_Rodzaj` (`ID`, `Filmy_ID`, `Rodzaj_ID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Klienci`
--

CREATE TABLE `Klienci` (
  `ID` int(11) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `mail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Klienci`
--

INSERT INTO `Klienci` (`ID`, `imie`, `nazwisko`, `mail`) VALUES
(1, 'Szymon', 'Piotrowski', 'szymonp@gmail.com'),
(2, 'Tadeusz', 'Marcinkowski', 'tadekm@wp.pl'),
(3, 'Julia', 'Wronka', 'juliag@onet.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Rodzaj_filmu`
--

CREATE TABLE `Rodzaj_filmu` (
  `ID` int(11) NOT NULL,
  `Nazwa` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Rodzaj_filmu`
--

INSERT INTO `Rodzaj_filmu` (`ID`, `Nazwa`) VALUES
(1, 'animacja'),
(2, 'scifi'),
(3, 'horror');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Sale`
--

CREATE TABLE `Sale` (
  `ID` int(11) NOT NULL,
  `ilość_miejsc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sale`
--

INSERT INTO `Sale` (`ID`, `ilość_miejsc`) VALUES
(1, 30),
(2, 35),
(3, 40);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Seanse`
--

CREATE TABLE `Seanse` (
  `ID` int(11) NOT NULL,
  `Termin` datetime NOT NULL,
  `Sala_ID` int(11) NOT NULL,
  `Film_ID` int(11) NOT NULL,
  `Liczba_wolnych_miejsc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Seanse`
--

INSERT INTO `Seanse` (`ID`, `Termin`, `Sala_ID`, `Film_ID`, `Liczba_wolnych_miejsc`) VALUES
(1, '2024-11-11 13:30:00', 1, 1, 30),
(2, '2024-10-13 12:00:00', 2, 2, 35),
(3, '2024-09-10 18:30:00', 3, 3, 40);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Sprzedawcy`
--

CREATE TABLE `Sprzedawcy` (
  `ID` int(11) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sprzedawcy`
--

INSERT INTO `Sprzedawcy` (`ID`, `imie`, `nazwisko`) VALUES
(1, 'Nikodem', 'Kononowicz'),
(2, 'Piotr', 'Kamijczyk'),
(3, 'Sebastian', 'Bach');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Bilety`
--
ALTER TABLE `Bilety`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Seans_FK` (`Seans_ID`),
  ADD KEY `Sprzedawca_FK` (`Sprzedawca_ID`),
  ADD KEY `Klient_FK` (`Klient_ID`);

--
-- Indeksy dla tabeli `Filmy`
--
ALTER TABLE `Filmy`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `Filmy_Rodzaj`
--
ALTER TABLE `Filmy_Rodzaj`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Filmy_FK` (`Filmy_ID`),
  ADD KEY `Rodzaj_FK` (`Rodzaj_ID`);

--
-- Indeksy dla tabeli `Klienci`
--
ALTER TABLE `Klienci`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `Rodzaj_filmu`
--
ALTER TABLE `Rodzaj_filmu`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `Sale`
--
ALTER TABLE `Sale`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `Seanse`
--
ALTER TABLE `Seanse`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sala_FK` (`Sala_ID`),
  ADD KEY `Film_FK2` (`Film_ID`);

--
-- Indeksy dla tabeli `Sprzedawcy`
--
ALTER TABLE `Sprzedawcy`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Bilety`
--
ALTER TABLE `Bilety`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Filmy`
--
ALTER TABLE `Filmy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Filmy_Rodzaj`
--
ALTER TABLE `Filmy_Rodzaj`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Klienci`
--
ALTER TABLE `Klienci`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Rodzaj_filmu`
--
ALTER TABLE `Rodzaj_filmu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Sale`
--
ALTER TABLE `Sale`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Seanse`
--
ALTER TABLE `Seanse`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Sprzedawcy`
--
ALTER TABLE `Sprzedawcy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Bilety`
--
ALTER TABLE `Bilety`
  ADD CONSTRAINT `Klient_FK` FOREIGN KEY (`Klient_ID`) REFERENCES `Klienci` (`ID`),
  ADD CONSTRAINT `Seans_FK` FOREIGN KEY (`Seans_ID`) REFERENCES `Seanse` (`ID`),
  ADD CONSTRAINT `Sprzedawca_FK` FOREIGN KEY (`Sprzedawca_ID`) REFERENCES `Sprzedawcy` (`ID`);

--
-- Constraints for table `Filmy_Rodzaj`
--
ALTER TABLE `Filmy_Rodzaj`
  ADD CONSTRAINT `Filmy_FK` FOREIGN KEY (`Filmy_ID`) REFERENCES `Filmy` (`ID`),
  ADD CONSTRAINT `Rodzaj_FK` FOREIGN KEY (`Rodzaj_ID`) REFERENCES `Rodzaj_filmu` (`ID`);

--
-- Constraints for table `Seanse`
--
ALTER TABLE `Seanse`
  ADD CONSTRAINT `Film_FK2` FOREIGN KEY (`Film_ID`) REFERENCES `Filmy` (`ID`),
  ADD CONSTRAINT `Sala_FK` FOREIGN KEY (`Sala_ID`) REFERENCES `Sale` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
