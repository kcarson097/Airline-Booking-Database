-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 28, 2020 at 11:37 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kcarson09`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL,
  `FirstLineOfAddress` varchar(255) NOT NULL,
  `Town/City` varchar(255) NOT NULL,
  `Postcode` varchar(255) NOT NULL,
  `Country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressID`, `FirstLineOfAddress`, `Town/City`, `Postcode`, `Country`) VALUES
(1, '12 Orchard Hill', 'Lisburn', 'BT26 6SG', 1),
(2, 'Old Trafford', 'Manchester', 'M16 OTH', 1),
(3, '15 Northland Crescent', 'Manchester', 'M16 46L', 1),
(4, 'Edinburgh Castle', 'Edinburgh', 'EH1 2NG', 1),
(5, '59 Magners Corner', 'Belfast', 'BT28 34F', 1),
(6, '25 Malone Road', 'Belfast', 'BT28 24L', 1),
(7, 'Placa de Catalunya', 'Barcelona', 'N45 234', 3),
(8, '12 Cental Square', 'Krakow', 'P0L 23E', 4),
(11, '12 Malone Road', 'Belfast', 'BT28 3LN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `address_country`
--

CREATE TABLE `address_country` (
  `CountryID` int(11) NOT NULL,
  `CountryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address_country`
--

INSERT INTO `address_country` (`CountryID`, `CountryName`) VALUES
(1, 'United Kingdom'),
(2, 'Netherlands'),
(3, 'Spain'),
(4, 'Poland'),
(5, 'Croatia'),
(6, 'France');

-- --------------------------------------------------------

--
-- Table structure for table `aircraft`
--

CREATE TABLE `aircraft` (
  `AircraftID` int(11) NOT NULL,
  `AircraftModel` varchar(255) NOT NULL,
  `AircraftCapacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aircraft`
--

INSERT INTO `aircraft` (`AircraftID`, `AircraftModel`, `AircraftCapacity`) VALUES
(1, 'Airbus A319', 10),
(2, 'Airbus A320', 10),
(3, 'Airbus A321neo', 10);

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `AirportID` int(11) NOT NULL,
  `AirportName` varchar(255) NOT NULL,
  `AirportCountry` varchar(255) NOT NULL,
  `AirportCode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`AirportID`, `AirportName`, `AirportCountry`, `AirportCode`) VALUES
(1, 'Belfast International', 'Northern Ireland', 'BFS'),
(2, 'Amsterdam Schiphol Airport', 'Netherlands', 'AMS'),
(3, 'Barcelona', 'Spain', 'BCN'),
(4, 'Krakow', 'Poland', 'KRK'),
(5, 'Edinburgh', 'Scotland', 'EDI'),
(6, 'London Gatwick', 'England', 'LGW'),
(7, 'Lanzarote', 'Spain', 'ACE'),
(8, 'Split', 'Croatia', 'SPU'),
(9, 'Manchester ', 'England', 'MAN'),
(10, 'Paris Charles de Gaulle', 'France', 'CDG');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `BookingID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BookingRefCode` varchar(255) NOT NULL,
  `BookingDateMade` date NOT NULL,
  `T&CAccepted` int(11) NOT NULL,
  `PaymentDetails` int(11) NOT NULL,
  `TotalPrice` decimal(12,2) NOT NULL,
  `Currency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `UserID`, `BookingRefCode`, `BookingDateMade`, `T&CAccepted`, `PaymentDetails`, `TotalPrice`, `Currency`) VALUES
(2, 1, '100596', '2020-11-08', 1, 2, '95.99', 1),
(4, 2, '175646', '2020-11-04', 1, 3, '626.50', 1),
(5, 3, '465481', '2020-11-29', 1, 4, '699.50', 1),
(6, 4, '108467', '2020-12-16', 1, 5, '1064.42', 1),
(7, 5, '984521', '2020-11-24', 1, 6, '302.50', 1),
(8, 6, '954712', '2020-12-06', 1, 7, '154.48', 1),
(9, 7, '489324', '2020-12-18', 1, 8, '254.94', 2),
(10, 8, '754123', '2020-12-22', 1, 9, '2285.00', 3),
(11, 1, '48931', '2020-11-08', 1, 2, '134.49', 1),
(12, 8, '465489', '2020-11-17', 1, 9, '62.50', 1),
(16, 11, '4812358', '2020-11-30', 1, 11, '366.47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookings_line_items`
--

CREATE TABLE `bookings_line_items` (
  `BookingLineItemID` int(11) NOT NULL,
  `LineItemName` varchar(255) NOT NULL,
  `LineItemDesc` text NOT NULL,
  `LineItemCost` decimal(12,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings_line_items`
--

INSERT INTO `bookings_line_items` (`BookingLineItemID`, `LineItemName`, `LineItemDesc`, `LineItemCost`, `CurrencyID`, `BookingID`) VALUES
(1, 'Hold Bag - 23kg', '1 Hold Bag - Maximum Weight = 23 kg', '25.00', 1, 2),
(2, 'Cabin Bag (Handbag, backpack)', 'One small back to be stored under seat', '5.00', 1, 2),
(3, 'Belfast to Amsterdam Adult Fare', 'Adult ticket from Belfast to Amsterdam', '50.00', 1, 2),
(4, 'Booking Fee', '', '2.50', 1, 2),
(5, 'Up Front Seat', 'Additional Surcharge for seat choice', '13.49', 1, 2),
(6, 'Food and Drink Voucher', 'Food and Drink Voucher for Outward Journey', '6.00', 1, 4),
(7, 'Food and Drink Voucher', 'Food and Drink Voucher for Return Journey', '6.00', 1, 4),
(8, 'Food and Drink Voucher', 'Food and Drink Voucher for Outward Journey', '6.00', 1, 4),
(9, 'Food and Drink Voucher', 'Food and Drink Voucher for Return Journey', '6.00', 1, 4),
(10, 'Bicycle ', 'Bicycle in hold of aircraft', '45.00', 1, 4),
(11, 'Bicycle ', 'Bicycle in hold of aircraft', '45.00', 1, 4),
(12, 'Cabin Bag', 'Small Personal Bag in Cabin for Outward Journey', '5.00', 1, 4),
(13, 'Cabin Bag', 'Small Personal Bag in Cabin for Return Journey', '5.00', 1, 4),
(14, 'Hold Bag (27kg+)', 'Hold Bag for Outward Journey', '50.00', 1, 4),
(15, 'Hold Bag (27kg+)', 'Hold Bag for Return Journey', '50.00', 1, 4),
(16, 'Adult Ticket', 'Adult ticket for Manchester to Paris Flight ', '100.00', 1, 4),
(17, 'Adult Ticket', 'Adult ticket for Manchester to Paris Flight ', '100.00', 1, 4),
(18, 'Adult Ticket', 'Adult ticket for Paris to Manchester Flight ', '100.00', 1, 4),
(19, 'Adult Ticket', 'Adult ticket for Paris to Manchester Flight ', '100.00', 1, 4),
(20, 'Adult Ticket', 'Adult Ticket for Outward Journey Manchester to Paris', '100.00', 1, 5),
(100, 'Adult Ticket', 'Adult Ticket for Outward Journey Manchester to Paris', '100.00', 1, 5),
(101, 'Child Ticket', 'Adult Ticket for Return Journey Paris to Manchester', '80.00', 1, 5),
(102, 'Child Ticket', 'Adult Ticket for Return Journey Paris to Manchester', '80.00', 1, 5),
(103, 'Child Ticket', 'Child Ticket for Return Journey Paris to Manchester', '60.00', 1, 5),
(104, 'Child Ticket', 'Child Ticket for Return Journey Paris to Manchester', '60.00', 1, 5),
(105, 'Child Ticket', 'Child Ticket for Outward Journey Paris to Manchester', '80.00', 1, 5),
(106, 'Child Ticket', 'Child Ticket for Outward Journey Paris to Manchester', '80.00', 1, 5),
(107, 'Booking Fee', '', '2.50', 1, 4),
(108, 'Booking Fee', '', '2.50', 1, 5),
(109, 'Overhead Locker Bag', 'Cabin bag for overhead locker for outward journey Manchester to Paris', '10.00', 1, 5),
(110, 'Overhead Locker Bag', 'Cabin bag for overhead locker for return journey Paris to Manchester', '10.00', 1, 5),
(111, 'Sporting Firearm', 'Sporting Firearm for outward journey Manchester to Paris', '37.00', 1, 5),
(112, 'Adult Ticket', 'Adult ticket for Outward Journey Edinburgh to Lanzarote', '150.00', 1, 6),
(113, 'Adult Ticket', 'Adult ticket for Outward Journey Edinburgh to Lanzarote', '150.00', 1, 6),
(114, 'Adult Ticket', 'Adult ticket for Return Journey Lanzarote to Edinburgh', '80.00', 1, 6),
(115, 'Adult Ticket', 'Adult ticket for Return Journey Lanzarote to Edinburgh', '80.00', 1, 6),
(116, 'Child Ticket', 'Child ticket for Edinburgh to Lanzarote', '130.00', 1, 6),
(117, 'Child Ticket', 'Child ticket for Edinburgh to Lanzarote', '130.00', 1, 6),
(118, 'Child Ticket', 'Child Ticket for Lanzarote to Edinburgh', '60.00', 1, 6),
(119, 'Child Ticket', 'Child Ticket for Lanzarote to Edinburgh', '60.00', 1, 6),
(120, 'Standard Seat', 'Standard Seat Reservation for Edinburg to Lanzarote', '5.99', 1, 6),
(121, 'Standard Seat', 'Standard Seat Reservation for Edinburg to Lanzarote', '5.99', 1, 6),
(122, 'Standard Seat', 'Standard Seat Reservation for Edinburg to Lanzarote', '5.99', 1, 6),
(123, 'Standard Seat', 'Standard Seat Reservation for Edinburg to Lanzarote', '5.99', 1, 6),
(124, 'Standard Seat', 'Standard Seat Reservation for Lanzarote to Edinburgh', '5.99', 1, 6),
(125, 'Standard Seat', 'Standard Seat Reservation for Lanzarote to Edinburgh', '5.99', 1, 6),
(126, 'Standard Seat', 'Standard Seat Reservation for Lanzarote to Edinburgh', '5.99', 1, 6),
(127, 'Standard Seat', 'Standard Seat Reservation for Lanzarote to Edinburgh', '5.99', 1, 6),
(128, 'Airport Transport', 'Airport Transport provided for passenger', '0.00', 1, 6),
(129, 'Boarding Assistance', 'Boarding Assistance provided for passenger', '0.00', 1, 6),
(130, 'Golf Bag', 'Golf Bag transported in hold of aircraft', '37.00', 1, 6),
(131, 'Golf Bag', 'Golf Bag transported in hold of aircraft', '37.00', 1, 6),
(132, '26 kg Hold Bag', '26 kg Hold Bag for Edinburg to Lanzarote', '30.00', 1, 6),
(133, '15 Hold Bag', '15 kg Hold Bag for Edinburg to Lanzarote', '20.00', 1, 6),
(134, '26 kg Hold Bag', '26 kg Hold Bag for Lanzarote to Edinburgh', '30.00', 1, 6),
(135, '15 Hold Bag', '15 kg Hold Bag for Lanzarote to Edinburgh', '20.00', 1, 6),
(136, 'Adult Ticket', 'Adult Ticket for Belfast to Amsterdam', '55.00', 1, 7),
(137, 'Adult Ticket', 'Adult Ticket for Belfast to Amsterdam', '55.00', 1, 7),
(138, 'Adult Ticket', 'Adult Ticket for Amsterdam to Belfast', '35.00', 1, 7),
(139, 'Adult Ticket', 'Adult Ticket for Amsterdam to Belfast', '35.00', 1, 7),
(140, '23 kg Hold Bag', 'Hold baggage for Belfast to Amsterdam ', '25.00', 1, 7),
(141, '23 kg Hold Bag', 'Hold baggage for Amsterdam to Belfast', '25.00', 1, 7),
(142, '27+ kg Hold Bag', 'Hold bag for Amsterdam to Belfast', '50.00', 1, 7),
(143, '15 kg Hold Bag', 'Hold bag for Belfast to Amsterdam', '20.00', 1, 7),
(144, 'Deaf/Impairment Assistance', 'Special Assistance provided free of charge', '0.00', 1, 7),
(145, 'Deaf/Impairment Assistance', 'Special Assistance provided free of charge', '0.00', 1, 7),
(146, 'Up-Front Seat', 'Up-Front Seat, Fee waived as user is ejMember', '0.00', 1, 7),
(147, 'Extra Legroom Seat', 'Up-Front Seat, Fee waived as user is ejMember', '0.00', 1, 7),
(148, 'Adult Ticket', 'Adult Ticket for Belfast to London flight', '45.00', 1, 8),
(149, 'Infant Ticket', 'Infant Ticket for Belfast to London flight', '35.00', 1, 8),
(150, 'Extra Hold ALlowance', 'Special Assistance - extra hold allowance for mobility equipment', '0.00', 1, 8),
(151, 'Wheelchair Assistance', 'Wheelchair Assistance', '0.00', 1, 8),
(152, 'Cabin Bag', 'Small Personal Bag', '5.00', 1, 8),
(153, 'Cabin Bag', 'Bag for overhead lockers', '10.00', 1, 8),
(154, 'Hold Bag', '26 kg Hold Bag', '30.00', 1, 8),
(155, 'Booking Fee', 'Administration fee for booking on website', '2.50', 1, 8),
(156, 'Booking Fee', 'Administration fee for booking on website', '2.50', 1, 7),
(157, 'Booking Fee', 'Admin fee', '2.50', 1, 6),
(158, 'Up Front Seat', 'Up Front Seat reservation', '13.49', 1, 8),
(159, 'Up Front Seat', 'Up Front Seat reservation', '13.49', 1, 8),
(160, 'Adult Ticket', 'Adult Ticket for Barcelona to Belfast', '87.99', 2, 9),
(161, 'Adult Ticket', 'Adult Ticket for Barcelona to Belfast', '87.99', 2, 9),
(162, 'Extra Legroom', 'Extra Legroom seat reservation - cost waived as user is ejMember', '0.00', 2, 9),
(163, 'Extra Legroom', 'Extra Legroom seat reservation - cost waived as user is ejMember', '0.00', 2, 9),
(164, 'Cabin Bag', 'Overhead Locker Bag', '12.99', 2, 9),
(165, 'Cabin Bag', 'Small Personal Bag', '5.99', 2, 9),
(166, 'Hold Bag', '27 kg + bag for hold of aircraft', '56.99', 2, 9),
(167, 'Booking Fee', 'Admin charge', '2.99', 2, 9),
(168, 'Adult Ticket', 'Adult Ticket Krakow to Belfast', '500.00', 3, 10),
(169, 'Adult Ticket', 'Adult Ticket Krakow to Belfast', '500.00', 3, 10),
(170, 'Child Ticket', 'Child Ticket Krakow to Belfast', '450.00', 3, 10),
(171, 'Child Ticket', 'Child Ticket Krakow to Belfast', '450.00', 3, 10),
(172, 'Standard Seat', 'Standard Seat Reservation - fee waived as user is member', '0.00', 3, 10),
(173, 'Standard Seat', 'Standard Seat Reservation - fee waived as user is member', '0.00', 3, 10),
(174, 'Standard Seat', 'Standard Seat Reservation - fee waived as user is member', '0.00', 3, 10),
(175, 'Standard Seat', 'Standard Seat Reservation - fee waived as user is member', '0.00', 3, 10),
(176, 'Booking Fee', 'Admin Fee for Booking', '50.00', 3, 10),
(177, 'Food And Drink Voucher', 'Food and Drink Voucher for Krakow to Belfast', '30.00', 3, 10),
(178, 'Food And Drink Voucher', 'Food and Drink Voucher for Krakow to Belfast', '30.00', 3, 10),
(179, 'Hold Bag', '27 kg + Hold Bag', '250.00', 3, 10),
(180, 'Cabin Bag', 'Small Personal Bag', '25.00', 3, 10),
(181, 'Adult Ticket', 'Adult Ticket for London to Paris', '65.00', 1, 11),
(182, 'Booking Fee', 'Admin Fee ', '2.50', 1, 11),
(183, 'Seat Reservation', 'Extra Legroom Seat Reservation', '21.99', 1, 11),
(184, 'Sports Equipment', 'Windsurfing Board', '45.00', 1, 11),
(185, 'Adult Ticket', 'Adult Ticket for Belfast to London', '45.00', 1, 12),
(186, 'Booking Fee', 'Admin Fee for Booking', '2.50', 1, 12),
(187, 'Seat Reservation', 'Extra Legroom - waived as member', '0.00', 1, 12),
(188, 'Cabin Bag', 'Small Personal Bag', '5.00', 1, 12),
(189, 'Cabin Bag', 'Overhead locker bag', '10.00', 1, 12),
(232, 'Adult Ticket ', 'Adult Ticket for Manchester to Paris', '100.00', 1, 16),
(233, 'Adult Ticket ', 'Adult Ticket for Manchester to Paris', '100.00', 1, 16),
(234, 'Child Ticket ', 'Child Ticket for Manchester to Paris', '80.00', 1, 16),
(235, 'Up Front Seat ', 'Up Front Seat for Manchester to Paris', '13.49', 1, 16),
(236, 'Up Front Seat  ', 'Up Front Seat for Manchester to Paris', '13.49', 1, 16),
(237, 'Standard Seat ', 'Standard Seat for Manchester to Paris', '5.99', 1, 16),
(238, '23 kg Bag', 'Hold Baggage - Up to 23 kg', '25.00', 1, 16),
(239, '15 kg Bag', 'Hold Baggage - Up to 15 kg', '20.00', 1, 16),
(240, 'Booking Fee', 'Admin Fee', '2.50', 1, 16),
(242, 'Food And Drink VOucher', 'Voucher for in flight meals', '6.00', 1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `cabin_baggage`
--

CREATE TABLE `cabin_baggage` (
  `CabinBagID` int(11) NOT NULL,
  `CabinBagType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cabin_baggage`
--

INSERT INTO `cabin_baggage` (`CabinBagID`, `CabinBagType`) VALUES
(3, 'Small Personal Bag (Handbags,Backpack)'),
(4, 'Overhead Locker Bag (Max 56 x 45 x 25 cm)');

-- --------------------------------------------------------

--
-- Table structure for table `cabin_bag_prices`
--

CREATE TABLE `cabin_bag_prices` (
  `CabinBagPriceID` int(11) NOT NULL,
  `CabinBagID` int(11) NOT NULL,
  `Price` decimal(12,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cabin_bag_prices`
--

INSERT INTO `cabin_bag_prices` (`CabinBagPriceID`, `CabinBagID`, `Price`, `CurrencyID`) VALUES
(1, 3, '5.00', 1),
(2, 3, '5.99', 2),
(3, 3, '25.00', 3),
(4, 4, '10.00', 1),
(5, 4, '50.00', 3),
(6, 4, '12.99', 2);

-- --------------------------------------------------------

--
-- Table structure for table `card_provider`
--

CREATE TABLE `card_provider` (
  `CardProviderID` int(11) NOT NULL,
  `ProviderName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `card_provider`
--

INSERT INTO `card_provider` (`CardProviderID`, `ProviderName`) VALUES
(1, 'Visa'),
(2, 'Mastercard'),
(3, 'American Express'),
(4, 'Discover');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `CurrencyID` int(11) NOT NULL,
  `CurrencyName` varchar(255) NOT NULL,
  `CurrencySymbol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`CurrencyID`, `CurrencyName`, `CurrencySymbol`) VALUES
(1, 'Pounds Sterling', '£'),
(2, 'Euros', '€'),
(3, 'Polish Zloty', 'zl');

-- --------------------------------------------------------

--
-- Table structure for table `ejplusaccount`
--

CREATE TABLE `ejplusaccount` (
  `EJPlusMembershipID` int(11) NOT NULL,
  `MembershipRefNumber` varchar(255) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ejplusaccount`
--

INSERT INTO `ejplusaccount` (`EJPlusMembershipID`, `MembershipRefNumber`, `UserID`) VALUES
(2, '465418', 2),
(3, '489431', 5),
(4, '121894', 7),
(5, '745624', 8);

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `FlightID` int(11) NOT NULL,
  `RouteID` int(11) NOT NULL,
  `DepartureTime` datetime NOT NULL,
  `ArrivalTime` datetime NOT NULL,
  `AircraftID` int(11) NOT NULL,
  `FlightNumber` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`FlightID`, `RouteID`, `DepartureTime`, `ArrivalTime`, `AircraftID`, `FlightNumber`) VALUES
(1, 1, '2020-12-23 09:50:00', '2020-12-23 12:25:00', 2, 'EZY6771'),
(4, 2, '2020-12-27 18:00:00', '2020-12-27 19:35:00', 3, 'EZY8746'),
(5, 3, '2020-12-08 19:00:00', '2020-12-08 21:30:00', 1, 'EZY4119'),
(6, 4, '2020-12-07 10:00:00', '2020-12-07 12:30:00', 2, 'EZY9945'),
(7, 5, '2021-05-08 12:00:00', '2021-05-08 14:45:00', 3, 'EZY9418'),
(8, 6, '2021-01-08 09:00:00', '2021-01-08 11:45:00', 3, 'EZY9464'),
(9, 7, '2021-01-04 09:00:00', '2021-01-04 10:05:00', 1, 'EZY2397'),
(10, 9, '2020-12-14 09:00:00', '2020-11-14 11:20:00', 3, 'EZY5874'),
(11, 10, '2021-01-12 12:00:00', '2021-01-12 13:20:00', 3, 'EZY5687'),
(12, 11, '2021-02-09 09:00:00', '2021-02-09 13:15:00', 2, 'EZY6884'),
(13, 15, '2021-01-12 19:50:00', '2021-01-12 21:20:00', 3, 'EZY6723'),
(14, 16, '2021-01-19 19:50:00', '2021-01-19 21:20:00', 3, 'EZY6323'),
(15, 17, '2021-02-16 12:23:19', '2021-02-16 16:45:00', 2, 'EZY3256'),
(18, 1, '2020-12-15 13:35:00', '2020-12-15 14:35:00', 2, 'EZY3454'),
(19, 1, '2020-12-30 15:35:00', '2020-12-30 15:35:00', 3, 'EZY4895'),
(20, 15, '2021-01-14 11:30:00', '2020-12-14 13:00:00', 2, 'EZY4978');

-- --------------------------------------------------------

--
-- Table structure for table `flight_prices`
--

CREATE TABLE `flight_prices` (
  `FlightPriceID` int(11) NOT NULL,
  `FlightID` int(11) NOT NULL,
  `PassengerTypeID` int(11) NOT NULL,
  `Price` decimal(12,2) NOT NULL,
  `Currency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_prices`
--

INSERT INTO `flight_prices` (`FlightPriceID`, `FlightID`, `PassengerTypeID`, `Price`, `Currency`) VALUES
(1, 1, 1, '60.50', 1),
(2, 1, 1, '58.99', 2),
(3, 1, 1, '300.00', 3),
(4, 1, 2, '44.00', 1),
(5, 1, 2, '46.99', 2),
(6, 1, 2, '220.00', 3),
(7, 1, 3, '33.00', 1),
(8, 1, 3, '35.00', 2),
(9, 1, 3, '170.00', 3),
(10, 4, 1, '35.00', 1),
(11, 4, 1, '41.99', 2),
(12, 4, 1, '170.00', 3),
(13, 4, 2, '30.00', 1),
(14, 4, 2, '32.99', 2),
(15, 4, 2, '150.00', 3),
(16, 4, 3, '20.00', 1),
(17, 4, 3, '22.99', 2),
(18, 4, 3, '120.00', 3),
(19, 5, 1, '100.00', 1),
(20, 5, 1, '110.00', 2),
(21, 5, 1, '500.00', 3),
(22, 5, 2, '85.00', 1),
(23, 5, 2, '88.99', 2),
(24, 5, 2, '420.00', 3),
(25, 5, 3, '70.00', 1),
(26, 5, 3, '72.99', 2),
(27, 5, 3, '400.00', 3),
(28, 6, 1, '113.14', 1),
(29, 6, 1, '117.12', 2),
(30, 6, 1, '559.02', 3),
(31, 6, 2, '93.17', 1),
(32, 6, 2, '97.15', 2),
(33, 6, 2, '505.78', 3),
(34, 6, 3, '66.55', 1),
(35, 6, 3, '70.53', 2),
(36, 6, 3, '399.30', 3),
(37, 7, 1, '120.00', 1),
(38, 7, 1, '125.99', 2),
(39, 7, 1, '550.00', 3),
(40, 7, 2, '95.00', 1),
(41, 7, 2, '99.99', 2),
(42, 7, 2, '480.00', 3),
(43, 7, 3, '80.00', 1),
(44, 7, 3, '82.99', 2),
(45, 7, 3, '430.00', 3),
(46, 8, 1, '100.00', 1),
(47, 8, 1, '105.99', 2),
(48, 8, 1, '500.00', 3),
(49, 8, 2, '85.00', 1),
(50, 8, 2, '89.99', 2),
(51, 8, 2, '450.00', 3),
(52, 8, 3, '70.00', 1),
(53, 8, 3, '72.99', 2),
(54, 8, 3, '400.00', 3),
(55, 9, 1, '45.00', 1),
(56, 9, 1, '46.99', 2),
(57, 9, 1, '260.00', 3),
(58, 9, 2, '35.00', 1),
(59, 9, 2, '39.99', 2),
(60, 9, 2, '220.00', 3),
(61, 9, 3, '20.00', 1),
(62, 9, 3, '22.99', 2),
(63, 9, 3, '200.00', 3),
(64, 10, 1, '65.00', 1),
(65, 10, 1, '69.99', 2),
(66, 10, 1, '290.00', 3),
(67, 10, 2, '55.00', 1),
(68, 10, 2, '55.00', 2),
(69, 10, 2, '260.00', 3),
(70, 10, 3, '30.00', 1),
(71, 10, 3, '32.99', 2),
(72, 10, 3, '240.00', 3),
(73, 11, 1, '60.00', 1),
(74, 11, 1, '62.99', 2),
(75, 11, 1, '290.00', 3),
(76, 11, 2, '40.00', 1),
(77, 11, 2, '42.99', 2),
(78, 11, 2, '230.00', 3),
(79, 11, 3, '25.00', 1),
(80, 11, 3, '26.99', 2),
(81, 11, 3, '200.00', 3),
(82, 12, 1, '150.00', 1),
(83, 12, 1, '155.99', 2),
(84, 12, 1, '600.00', 3),
(85, 12, 2, '130.00', 1),
(86, 12, 2, '135.00', 2),
(87, 12, 2, '550.00', 3),
(88, 12, 3, '100.00', 1),
(89, 12, 3, '102.99', 2),
(90, 12, 3, '500.00', 3),
(91, 13, 1, '100.00', 1),
(92, 13, 1, '102.99', 2),
(93, 13, 1, '500.00', 3),
(94, 13, 2, '80.00', 1),
(95, 13, 2, '82.99', 2),
(96, 13, 2, '470.00', 3),
(97, 13, 3, '70.00', 1),
(98, 13, 3, '72.99', 2),
(99, 13, 3, '420.00', 3),
(100, 14, 1, '80.00', 1),
(101, 14, 1, '82.99', 2),
(102, 14, 1, '450.00', 3),
(103, 14, 2, '60.00', 1),
(104, 14, 2, '55.00', 2),
(105, 14, 2, '420.00', 3),
(106, 14, 3, '60.00', 1),
(107, 14, 3, '62.99', 2),
(108, 14, 3, '380.00', 3),
(109, 15, 1, '80.00', 1),
(110, 15, 1, '82.99', 2),
(111, 15, 1, '450.00', 3),
(112, 15, 2, '60.00', 1),
(113, 15, 2, '55.00', 2),
(114, 15, 2, '420.00', 3),
(115, 15, 3, '60.00', 1),
(116, 15, 3, '62.99', 2),
(117, 15, 3, '380.00', 3),
(118, 20, 1, '150.00', 1),
(119, 20, 2, '125.00', 1),
(120, 20, 3, '100.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_and_drink_prices`
--

CREATE TABLE `food_and_drink_prices` (
  `PriceID` int(11) NOT NULL,
  `VoucherID` int(11) NOT NULL,
  `Price` decimal(12,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_and_drink_prices`
--

INSERT INTO `food_and_drink_prices` (`PriceID`, `VoucherID`, `Price`, `CurrencyID`) VALUES
(1, 1, '6.00', 1),
(2, 1, '6.99', 2),
(3, 1, '30.00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `food_and_drink_voucher`
--

CREATE TABLE `food_and_drink_voucher` (
  `FoodAndDrinkVoucherID` int(11) NOT NULL,
  `VoucherDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_and_drink_voucher`
--

INSERT INTO `food_and_drink_voucher` (`FoodAndDrinkVoucherID`, `VoucherDescription`) VALUES
(1, 'Save 20%, buy £7.50 food and drink vouchers for £6 online');

-- --------------------------------------------------------

--
-- Table structure for table `hold_baggage`
--

CREATE TABLE `hold_baggage` (
  `HoldBagID` int(11) NOT NULL,
  `HoldBagType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hold_baggage`
--

INSERT INTO `hold_baggage` (`HoldBagID`, `HoldBagType`) VALUES
(1, '15kg hold bag'),
(2, '23kg hold bag'),
(3, '26kg hold bag'),
(4, '27kg+ hold bag');

-- --------------------------------------------------------

--
-- Table structure for table `hold_baggage_price`
--

CREATE TABLE `hold_baggage_price` (
  `HoldBagPriceID` int(11) NOT NULL,
  `HoldBagID` int(11) NOT NULL,
  `Price` decimal(12,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hold_baggage_price`
--

INSERT INTO `hold_baggage_price` (`HoldBagPriceID`, `HoldBagID`, `Price`, `CurrencyID`) VALUES
(1, 1, '20.00', 1),
(2, 1, '21.99', 2),
(3, 1, '100.00', 3),
(4, 2, '25.00', 1),
(5, 2, '125.00', 3),
(6, 2, '28.99', 2),
(7, 3, '30.00', 1),
(8, 3, '32.99', 2),
(9, 3, '150.00', 3),
(10, 4, '50.00', 1),
(11, 4, '250.00', 3),
(12, 4, '56.99', 2);

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `PassengerID` int(11) NOT NULL,
  `TitleID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `SecondName` varchar(255) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `ReasonForBookingID` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `FlightID` int(11) NOT NULL,
  `TravelInsurance` tinyint(1) NOT NULL COMMENT '0 = No Travel Insurance, 1 = Travel Insurance',
  `SeatID` int(11) NOT NULL,
  `PassengerTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`PassengerID`, `TitleID`, `FirstName`, `SecondName`, `BookingID`, `ReasonForBookingID`, `Age`, `FlightID`, `TravelInsurance`, `SeatID`, `PassengerTypeID`) VALUES
(3, 3, 'James', 'Hughes', 2, 2, 35, 1, 1, 1, 1),
(5, 5, 'Marcus', 'Rashford', 4, 1, 23, 13, 1, 109, 1),
(6, 3, 'Juan', 'Mata', 4, 1, 32, 13, 1, 110, 1),
(7, 5, 'Marcus', 'Rashford', 4, 1, 23, 14, 1, 119, 1),
(8, 3, 'Juan', 'Mata', 4, 1, 32, 14, 1, 120, 1),
(9, 3, 'James ', 'Bond', 5, 2, 35, 13, 1, 103, 1),
(10, 1, 'MoneyPenny', 'Bond', 5, 2, 30, 13, 1, 104, 1),
(11, 3, 'James ', 'Bond', 5, 2, 35, 14, 1, 113, 1),
(12, 1, 'MoneyPenny', 'Bond', 5, 2, 30, 14, 1, 114, 1),
(13, 3, 'Iain ', 'Bond', 5, 2, 14, 13, 1, 105, 2),
(14, 1, 'Sarah', 'Bond', 5, 2, 15, 13, 1, 106, 2),
(15, 3, 'Iain ', 'Bond', 5, 2, 14, 14, 1, 115, 2),
(16, 1, 'Sarah', 'Bond', 5, 2, 15, 14, 1, 116, 2),
(17, 3, 'Andy', 'Murray', 6, 1, 33, 12, 1, 85, 1),
(18, 3, 'Novak ', 'Djokovic', 6, 1, 33, 12, 1, 86, 1),
(19, 1, 'Sarah', 'Wilson', 6, 1, 15, 12, 1, 87, 2),
(20, 3, 'James ', 'Mitchell', 6, 1, 15, 12, 1, 88, 1),
(23, 3, 'Andy ', 'Murray', 6, 1, 33, 15, 1, 125, 1),
(24, 3, 'Novak ', 'Djokovic', 6, 1, 33, 15, 1, 126, 1),
(25, 2, 'Sarah ', 'Wilson', 6, 1, 15, 15, 1, 127, 2),
(26, 3, 'James ', 'Mitchell', 6, 1, 15, 15, 1, 128, 2),
(29, 3, 'Simon', 'Smith', 7, 2, 25, 1, 1, 2, 1),
(30, 3, 'Michael ', 'Smith', 7, 2, 25, 1, 1, 8, 1),
(31, 3, 'Simon', 'Smith', 7, 2, 25, 4, 1, 91, 1),
(32, 3, 'Michael ', 'Smith', 7, 2, 25, 4, 1, 92, 1),
(37, 1, 'Maria ', 'Hendricks', 8, 2, 35, 9, 1, 51, 1),
(38, 2, 'Sarah ', 'Hendricks', 8, 2, 1, 9, 0, 52, 3),
(39, 3, 'Leo', 'Messi', 9, 1, 33, 6, 1, 29, 1),
(40, 3, 'Fernando', 'Alonso', 9, 1, 39, 6, 1, 30, 1),
(41, 1, 'Emma', 'Deane', 10, 2, 25, 8, 1, 43, 1),
(42, 4, 'James', 'Deane', 10, 2, 25, 8, 1, 44, 1),
(43, 2, 'Sarah', 'Deane', 10, 2, 8, 8, 1, 45, 2),
(44, 3, 'William', 'Deane', 10, 2, 12, 8, 1, 48, 2),
(45, 3, 'James', 'Hughes', 11, 2, 35, 10, 1, 69, 1),
(46, 1, 'Emma', 'Deane', 12, 1, 25, 9, 1, 59, 1),
(65, 3, 'Homer ', 'Simpson', 16, 2, 35, 13, 1, 101, 1),
(66, 1, 'Marge ', 'Simpson', 16, 2, 35, 13, 1, 102, 1),
(67, 3, 'Bart', 'Simpson', 16, 2, 14, 13, 1, 107, 2);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_cabin_baggage`
--

CREATE TABLE `passenger_cabin_baggage` (
  `CabinBagPassengerID` int(11) NOT NULL,
  `CabingBagID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_cabin_baggage`
--

INSERT INTO `passenger_cabin_baggage` (`CabinBagPassengerID`, `CabingBagID`, `PassengerID`) VALUES
(1, 3, 3),
(2, 3, 5),
(3, 3, 6),
(4, 4, 9),
(5, 4, 11),
(6, 3, 37),
(7, 4, 37),
(8, 3, 39),
(9, 4, 40),
(10, 3, 41),
(11, 3, 46),
(12, 4, 46);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_food_and_drink_voucher`
--

CREATE TABLE `passenger_food_and_drink_voucher` (
  `FoodAndDrinkPassengerID` int(11) NOT NULL,
  `FoodAndDrinkVoucherID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_food_and_drink_voucher`
--

INSERT INTO `passenger_food_and_drink_voucher` (`FoodAndDrinkPassengerID`, `FoodAndDrinkVoucherID`, `PassengerID`) VALUES
(1, 1, 5),
(2, 1, 6),
(3, 1, 8),
(4, 1, 5),
(5, 1, 43),
(6, 1, 44),
(10, 1, 67);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_hold_baggage`
--

CREATE TABLE `passenger_hold_baggage` (
  `HoldBagPassengerID` int(11) NOT NULL,
  `HoldBagID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_hold_baggage`
--

INSERT INTO `passenger_hold_baggage` (`HoldBagPassengerID`, `HoldBagID`, `PassengerID`) VALUES
(1, 1, 3),
(2, 4, 5),
(3, 4, 8),
(4, 1, 17),
(5, 3, 18),
(6, 1, 17),
(7, 3, 18),
(8, 2, 29),
(9, 2, 31),
(10, 1, 30),
(11, 3, 32),
(12, 3, 37),
(13, 4, 39),
(14, 4, 42),
(21, 1, 65),
(22, 2, 66);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_seats`
--

CREATE TABLE `passenger_seats` (
  `SeatID` int(11) NOT NULL,
  `SeatCode` varchar(255) NOT NULL,
  `FlightID` int(11) NOT NULL,
  `SeatingTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_seats`
--

INSERT INTO `passenger_seats` (`SeatID`, `SeatCode`, `FlightID`, `SeatingTypeID`) VALUES
(1, '1A', 1, 2),
(2, '5B', 1, 1),
(3, '3A', 1, 3),
(4, '3B', 1, 3),
(5, '4A', 1, 3),
(6, '4B', 1, 3),
(7, '5A', 1, 1),
(8, '1B', 1, 2),
(9, '2A', 1, 3),
(10, '2B', 1, 3),
(11, '1A', 4, 2),
(12, '1B', 4, 2),
(13, '2A', 5, 3),
(14, '2B', 5, 3),
(15, '3A', 5, 3),
(16, '3B', 5, 3),
(17, '4A', 5, 3),
(18, '4B', 5, 3),
(19, '5A', 5, 1),
(20, '5B', 5, 1),
(21, '1A', 6, 2),
(22, '1B', 6, 2),
(23, '2A', 6, 3),
(24, '2B', 6, 3),
(25, '3A', 6, 3),
(26, '3B', 6, 3),
(27, '4A', 6, 3),
(28, '4B', 6, 3),
(29, '5A', 6, 1),
(30, '5B', 6, 1),
(31, '1A', 7, 2),
(32, '1B', 7, 2),
(33, '2A', 7, 3),
(34, '2B', 7, 3),
(35, '3A', 7, 3),
(36, '3B', 7, 3),
(37, '4A', 7, 3),
(38, '4B', 7, 3),
(39, '5A', 7, 1),
(40, '5B', 7, 1),
(41, '1A', 8, 2),
(42, '1B', 8, 2),
(43, '2A', 8, 3),
(44, '2B', 8, 3),
(45, '3A', 8, 3),
(46, '3B', 8, 3),
(47, '4A', 8, 3),
(48, '4B', 8, 3),
(49, '5A', 8, 1),
(50, '5B', 8, 1),
(51, '1A', 9, 2),
(52, '1B', 9, 2),
(53, '2A', 9, 3),
(54, '2B', 9, 3),
(55, '3A', 9, 3),
(56, '3B', 9, 3),
(57, '4A', 9, 3),
(58, '4B', 9, 3),
(59, '5A', 9, 1),
(60, '5B', 9, 1),
(61, '1A', 10, 2),
(62, '1B', 10, 2),
(63, '2A', 10, 3),
(64, '2B', 10, 3),
(65, '3A', 10, 3),
(66, '3B', 10, 3),
(67, '4A', 10, 3),
(68, '4B', 10, 3),
(69, '5A', 10, 1),
(70, '5B', 10, 1),
(71, '1A', 11, 2),
(72, '1B', 11, 2),
(73, '2A', 11, 3),
(74, '2B', 11, 3),
(75, '3A', 11, 3),
(76, '3B', 11, 3),
(77, '4A', 11, 3),
(78, '4B', 11, 3),
(79, '5A', 11, 1),
(80, '5B', 11, 1),
(81, '1A', 12, 2),
(82, '1B', 12, 2),
(83, '2A', 12, 3),
(84, '2B', 12, 3),
(85, '3A', 12, 3),
(86, '3B', 12, 3),
(87, '4A', 12, 3),
(88, '4B', 12, 3),
(89, '5A', 12, 1),
(90, '5B', 12, 1),
(91, '2A', 4, 3),
(92, '2B', 4, 3),
(93, '3A', 4, 3),
(94, '3B', 4, 3),
(95, '4A', 4, 3),
(96, '4B', 4, 3),
(97, '5A', 4, 1),
(98, '5B', 4, 1),
(99, '1A', 5, 2),
(100, '1B', 5, 2),
(101, '1A', 13, 2),
(102, '1B', 13, 2),
(103, '2A', 13, 3),
(104, '2B', 13, 3),
(105, '3A', 13, 3),
(106, '3B', 13, 3),
(107, '4A', 13, 3),
(108, '4B', 13, 3),
(109, '5A', 13, 1),
(110, '5B', 13, 1),
(111, '1A', 14, 2),
(112, '1B', 14, 2),
(113, '2A', 14, 3),
(114, '2B', 14, 3),
(115, '3A', 14, 3),
(116, '3B', 14, 3),
(117, '4A', 14, 3),
(118, '4B', 14, 3),
(119, '5A', 14, 1),
(120, '5B', 14, 2),
(121, '1A', 15, 2),
(122, '1B', 15, 2),
(123, '2A', 15, 3),
(124, '2B', 15, 3),
(125, '3A', 15, 3),
(126, '3B', 15, 3),
(127, '4A', 15, 3),
(128, '4B', 15, 3),
(129, '5A', 15, 1),
(130, '5B', 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_special_assistance`
--

CREATE TABLE `passenger_special_assistance` (
  `SpecialAssistancePassengerID` int(11) NOT NULL,
  `SpecialAssistanceID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_special_assistance`
--

INSERT INTO `passenger_special_assistance` (`SpecialAssistancePassengerID`, `SpecialAssistanceID`, `PassengerID`) VALUES
(1, 4, 20),
(2, 4, 26),
(3, 3, 19),
(4, 3, 25),
(5, 6, 29),
(6, 6, 31),
(7, 1, 37),
(8, 2, 37);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_sports_equipment`
--

CREATE TABLE `passenger_sports_equipment` (
  `SportsEquipmentPassengerID` int(11) NOT NULL,
  `SportsEquipmentID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_sports_equipment`
--

INSERT INTO `passenger_sports_equipment` (`SportsEquipmentPassengerID`, `SportsEquipmentID`, `PassengerID`) VALUES
(1, 1, 5),
(2, 1, 6),
(3, 3, 9),
(4, 4, 17),
(5, 4, 18),
(6, 8, 45);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_titles`
--

CREATE TABLE `passenger_titles` (
  `TitleID` int(11) NOT NULL,
  `TitleName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_titles`
--

INSERT INTO `passenger_titles` (`TitleID`, `TitleName`) VALUES
(1, 'Mrs'),
(2, 'Miss'),
(3, 'Mr'),
(4, 'Dr'),
(5, 'Sir');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_type`
--

CREATE TABLE `passenger_type` (
  `PassengerTypeID` int(11) NOT NULL,
  `PassengerTypeName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_type`
--

INSERT INTO `passenger_type` (`PassengerTypeID`, `PassengerTypeName`) VALUES
(1, 'Adult (16+)'),
(2, 'Child (2-15)'),
(3, 'Infant (<2)');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `CardHoldersName` varbinary(255) NOT NULL,
  `CardNumber` varbinary(255) NOT NULL,
  `CardCVV` varbinary(255) NOT NULL,
  `CardExpires` varbinary(255) NOT NULL,
  `CardProvider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `CardHoldersName`, `CardNumber`, `CardCVV`, `CardExpires`, `CardProvider`) VALUES
(2, 0x05b06e7ab1c031324a64e102cbcd7f4f, 0xb707e077e6d1290aac390b88869ca0d930883ad8d8f370949105dfe87facc389, 0x0d1898ce010f61981d5419a2effb3941, 0xb4b3ff9906bca8c5882615c8826c6b5b, 1),
(3, 0x8d31bb692197f29a30652518c809ec4f, 0xe09ba5eaf0bcbe4953065848542ac4ba, 0x5f02f40a0f0511909c213041966e5ad6, 0x55fb3580dc3d3885a25ada8f3a0aa0bd, 2),
(4, 0x953c64547f004adfa9affe44ca0d607a, 0x8e0daa2edc7213874c056d6aafb24b08, 0x1a5ae0a205bcd38d904e081f8f152ce8, 0x822d3bf14d983119b51ef18d64fbcdc2, 1),
(5, 0x3845e8175aa4c4c2523a49ed5621c8ac, 0xd77d96fbaa028c1fb666dd267bb0bfaa30883ad8d8f370949105dfe87facc389, 0xc53d48e38983c2cbcd9d9e19fbe86140, 0x8551a041701b1396e81a66050001d4ea, 1),
(6, 0x277e2cdb0cd0f965bdc10acf00d43297, 0xf142cd34a9b1acfabdc02dd998c47d8430883ad8d8f370949105dfe87facc389, 0x166adea4f0e12b0bedfcf1ab97e3e841, 0xc4bf15b6c0926aa131a89483ee3957c1, 3),
(7, 0x75e6ac175d61d7563df04bc2ffe41703, 0x21003dcc83006ef0cb0ae211fb9f23c630883ad8d8f370949105dfe87facc389, 0x3ee3a21005d67c2b3d4d95a7eb4de0f4, 0xa9e4d110c9c90e0f3b0ab6d02baac12a, 2),
(8, 0xd8016ac730b1da2e0be3868f610a46af, 0x57411a015b157903ca39e0f8a637b87c, 0x5fdd29d072a7a6315fe7a180d281811a, 0x8551a041701b1396e81a66050001d4ea, 1),
(9, 0xaa98ab064e6b6ba265097c59f4e7dcea, 0xa0a2b133e7a7981a854d21855ff7196130883ad8d8f370949105dfe87facc389, 0x1b57c285119c70b285435fd64a52a1d8, 0x676a26498d9fd64d7b10d9719f15c9d5, 1),
(10, 0xb31fabc979cd19853d032c4c6c29d5d5, 0xb707e077e6d1290aac390b88869ca0d930883ad8d8f370949105dfe87facc389, 0xbd49d1b8aef80339cad472a58a0707c3, 0xb4b3ff9906bca8c5882615c8826c6b5b, 1),
(11, 0x2c354d5084f9379b6ce5cb37ac7b2978, 0xa6dc8f4bc7e5bd0e9724137ea89f715232791db06eb1331ab7cbd82a603896ac, 0x2eeff25438ebf20a14aafae44fc76961, 0xb13abd861dee2b984efcd7120868f39d, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reason_for_booking`
--

CREATE TABLE `reason_for_booking` (
  `ReasonForBookingID` int(11) NOT NULL,
  `ReasonForBookingName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reason_for_booking`
--

INSERT INTO `reason_for_booking` (`ReasonForBookingID`, `ReasonForBookingName`) VALUES
(1, 'Business'),
(2, 'Leisure');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `RouteID` int(11) NOT NULL,
  `RouteName` varchar(255) NOT NULL,
  `DepartureAirportID` int(11) NOT NULL,
  `ArrivalAirportID` int(11) NOT NULL,
  `Duration` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`RouteID`, `RouteName`, `DepartureAirportID`, `ArrivalAirportID`, `Duration`) VALUES
(1, 'Belfast to Amsterdam', 1, 2, '1h 35m'),
(2, 'Amsterdam to Belfast', 2, 1, '1h 35m'),
(3, 'Belfast to Barcelona', 1, 3, '2h 30m'),
(4, 'Barcelona to Belfast', 3, 1, '2 h 30m'),
(5, 'Belfast to Krakow', 1, 4, '2h 45m'),
(6, 'Krakow to Belfast', 4, 1, '2h 45m'),
(7, 'Belfast to London', 1, 6, '1 h 5m'),
(9, 'London to Paris', 6, 10, '1h 20m'),
(10, 'Paris to London', 10, 6, '1h 20m'),
(11, 'Edinburgh to Lanzarote', 5, 7, '4h 15m'),
(15, 'Manchester to Paris', 9, 10, '1h 30m'),
(16, 'Paris to Manchester', 10, 9, '1h 30m'),
(17, 'Lanzarote to Edinburgh', 7, 5, '4h 15m');

-- --------------------------------------------------------

--
-- Table structure for table `seating_type`
--

CREATE TABLE `seating_type` (
  `SeatingTypeID` int(11) NOT NULL,
  `SeatingTypeName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seating_type`
--

INSERT INTO `seating_type` (`SeatingTypeID`, `SeatingTypeName`) VALUES
(1, 'Extra Legroom'),
(2, 'Up Front'),
(3, 'Standard');

-- --------------------------------------------------------

--
-- Table structure for table `seating_type_prices`
--

CREATE TABLE `seating_type_prices` (
  `SeatingTypePriceID` int(11) NOT NULL,
  `SeatingTypeID` int(11) NOT NULL,
  `Price` decimal(12,2) NOT NULL,
  `Currency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seating_type_prices`
--

INSERT INTO `seating_type_prices` (`SeatingTypePriceID`, `SeatingTypeID`, `Price`, `Currency`) VALUES
(1, 1, '21.99', 1),
(2, 1, '24.99', 2),
(3, 1, '110.00', 3),
(4, 2, '13.49', 1),
(5, 2, '15.00', 2),
(6, 2, '70.00', 3),
(9, 3, '5.99', 1),
(10, 3, '7.00', 2),
(11, 3, '30.00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `special_assistance`
--

CREATE TABLE `special_assistance` (
  `SpecialAssistanceID` int(11) NOT NULL,
  `SpecialAssistanceType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `special_assistance`
--

INSERT INTO `special_assistance` (`SpecialAssistanceID`, `SpecialAssistanceType`) VALUES
(1, 'Wheelchair Assistance'),
(2, 'Extra Hold Allowance (Mobility equipment)'),
(3, 'Airport Transport'),
(4, 'Boarding Assistance'),
(5, 'Blind/Partial sight assistance'),
(6, 'Deaf/hearing impairment assistance');

-- --------------------------------------------------------

--
-- Table structure for table `sports_equipment`
--

CREATE TABLE `sports_equipment` (
  `SportsEquipmentID` int(11) NOT NULL,
  `SportsEquipmentType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sports_equipment`
--

INSERT INTO `sports_equipment` (`SportsEquipmentID`, `SportsEquipmentType`) VALUES
(1, 'Bicycle'),
(2, 'Canoe'),
(3, 'Sporting Firearm'),
(4, 'Golf Bag'),
(5, 'Hang Glider'),
(6, 'Skis and/or boots'),
(7, 'Snowboard'),
(8, 'Windsurfing board');

-- --------------------------------------------------------

--
-- Table structure for table `sports_equipment_prices`
--

CREATE TABLE `sports_equipment_prices` (
  `SportsEquipmentIPriceD` int(11) NOT NULL,
  `SportsEquipmentID` int(11) NOT NULL,
  `Price` decimal(12,2) NOT NULL,
  `Currency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sports_equipment_prices`
--

INSERT INTO `sports_equipment_prices` (`SportsEquipmentIPriceD`, `SportsEquipmentID`, `Price`, `Currency`) VALUES
(1, 1, '45.00', 1),
(2, 1, '48.99', 2),
(3, 1, '230.00', 3),
(4, 2, '230.00', 3),
(5, 2, '45.00', 1),
(6, 2, '48.99', 2),
(7, 3, '37.00', 1),
(8, 3, '40.00', 2),
(9, 3, '180.00', 3),
(10, 4, '37.00', 1),
(11, 4, '40.00', 2),
(12, 4, '180.00', 3),
(13, 5, '45.00', 1),
(14, 5, '48.99', 2),
(15, 5, '230.00', 3),
(16, 6, '37.00', 1),
(17, 6, '40.00', 2),
(18, 6, '180.00', 3),
(19, 7, '37.00', 1),
(20, 7, '40.00', 2),
(21, 7, '180.00', 3),
(22, 8, '45.00', 1),
(23, 8, '48.99', 2),
(24, 8, '230.00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `terms_and_conditions`
--

CREATE TABLE `terms_and_conditions` (
  `TermsAndConditionsID` int(11) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms_and_conditions`
--

INSERT INTO `terms_and_conditions` (`TermsAndConditionsID`, `Status`) VALUES
(1, 'Accepted'),
(2, 'Rejected'),
(3, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `UserID` int(11) NOT NULL,
  `TitleID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `SecondName` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `MobileNumber` varchar(255) NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `UserPassword` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`UserID`, `TitleID`, `FirstName`, `SecondName`, `Age`, `AddressID`, `MobileNumber`, `EmailAddress`, `UserName`, `UserPassword`) VALUES
(1, 3, 'James', 'Hughes', 35, 1, '07495194790', 'jhughes@gmail.co.uk', 'JHuges01', 0x823bfe80eb8fcb286618356e26601510),
(2, 5, 'Marcus', 'Rashford', 23, 2, '074564169468', 'mrashford@gmail.com', 'mrashford097', 0x14e61c848cc71a5102286e85a4e85228),
(3, 3, 'James ', 'Bond', 35, 3, '0789641574', 'namesBondJamesBond@gmail.com', 'jBond007', 0x8aef9e36f62b6f98bac4170831bc0ef2),
(4, 3, 'Andy', 'Murray', 33, 4, '07446569468', 'aMurray@gmail.com', 'aMurray022', 0x46ef5f658ca7282605db62ae105d2209),
(5, 5, 'Simon', 'Smith', 25, 5, '074564745668', 'sSmith@hotmail.com', 'sMith91', 0xfc95a15e79ee0d902966e3e3af7be43c),
(6, 5, 'Maria', 'Hendricks', 35, 6, '074895169468', 'mHendy@live.co.uk', 'hendy87', 0x58e0b8c62d03aee2d50c55a1d3ec7f24),
(7, 3, 'Leo', 'Messi', 32, 7, '074512689468', 'leoMessi10@gmail.com', 'messi010', 0x6889a4ec6ce44e9654edb1c0f4856783),
(8, 1, 'Emma', 'Deane', 25, 8, '01544169468', 'eDeane@gmail.com', 'EmmaDeaners65', 0x6889a4ec6ce44e9654edb1c0f4856783),
(11, 3, 'Homer', 'Simpson', 35, 11, '07456485468', 'HomerSimpson@gmail.com', 'Homer097', 0x075a555c873d6e06357313fbb3658377);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `FK_Country` (`Country`);

--
-- Indexes for table `address_country`
--
ALTER TABLE `address_country`
  ADD PRIMARY KEY (`CountryID`);

--
-- Indexes for table `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`AircraftID`);

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`AirportID`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `FK_UserID` (`UserID`),
  ADD KEY `FK_PaymentID` (`PaymentDetails`),
  ADD KEY `FK_T_and_C` (`T&CAccepted`),
  ADD KEY `FK_Currencybooking` (`Currency`);

--
-- Indexes for table `bookings_line_items`
--
ALTER TABLE `bookings_line_items`
  ADD PRIMARY KEY (`BookingLineItemID`),
  ADD KEY `FK_BookingIDLineItem` (`BookingID`),
  ADD KEY `FK_currency` (`CurrencyID`);

--
-- Indexes for table `cabin_baggage`
--
ALTER TABLE `cabin_baggage`
  ADD PRIMARY KEY (`CabinBagID`);

--
-- Indexes for table `cabin_bag_prices`
--
ALTER TABLE `cabin_bag_prices`
  ADD PRIMARY KEY (`CabinBagPriceID`),
  ADD KEY `FK_Cabin_Bag_ID` (`CabinBagID`),
  ADD KEY `FK_Currency_Cabin` (`CurrencyID`);

--
-- Indexes for table `card_provider`
--
ALTER TABLE `card_provider`
  ADD PRIMARY KEY (`CardProviderID`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`CurrencyID`);

--
-- Indexes for table `ejplusaccount`
--
ALTER TABLE `ejplusaccount`
  ADD PRIMARY KEY (`EJPlusMembershipID`),
  ADD KEY `FK_UserIDejmembership` (`UserID`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`FlightID`),
  ADD KEY `FK_Aircraft` (`AircraftID`),
  ADD KEY `FK_Route` (`RouteID`);

--
-- Indexes for table `flight_prices`
--
ALTER TABLE `flight_prices`
  ADD PRIMARY KEY (`FlightPriceID`),
  ADD KEY `FK_Passenger_Type` (`PassengerTypeID`),
  ADD KEY `FK_Flight_ID` (`FlightID`),
  ADD KEY `FK_CurrencyFlights` (`Currency`);

--
-- Indexes for table `food_and_drink_prices`
--
ALTER TABLE `food_and_drink_prices`
  ADD PRIMARY KEY (`PriceID`),
  ADD KEY `FK_voucher_currency` (`CurrencyID`),
  ADD KEY `FK_VoucherID` (`VoucherID`);

--
-- Indexes for table `food_and_drink_voucher`
--
ALTER TABLE `food_and_drink_voucher`
  ADD PRIMARY KEY (`FoodAndDrinkVoucherID`);

--
-- Indexes for table `hold_baggage`
--
ALTER TABLE `hold_baggage`
  ADD PRIMARY KEY (`HoldBagID`);

--
-- Indexes for table `hold_baggage_price`
--
ALTER TABLE `hold_baggage_price`
  ADD PRIMARY KEY (`HoldBagPriceID`),
  ADD KEY `FK_CurrencyHoldBag` (`CurrencyID`),
  ADD KEY `FK_HoldBag_ID` (`HoldBagID`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`PassengerID`),
  ADD UNIQUE KEY `SeatID` (`SeatID`),
  ADD KEY `FK_TitleID` (`TitleID`),
  ADD KEY `FK_Flight` (`FlightID`),
  ADD KEY `FK_BookingID` (`BookingID`),
  ADD KEY `FK_ReasonForBooking` (`ReasonForBookingID`),
  ADD KEY `FK_PassengerType` (`PassengerTypeID`);

--
-- Indexes for table `passenger_cabin_baggage`
--
ALTER TABLE `passenger_cabin_baggage`
  ADD PRIMARY KEY (`CabinBagPassengerID`),
  ADD KEY `FK_PassengerIDCabinBag` (`PassengerID`),
  ADD KEY `FK_CabinBagID` (`CabingBagID`);

--
-- Indexes for table `passenger_food_and_drink_voucher`
--
ALTER TABLE `passenger_food_and_drink_voucher`
  ADD PRIMARY KEY (`FoodAndDrinkPassengerID`),
  ADD KEY `FK_PassengerIDFoodAndDrink` (`PassengerID`),
  ADD KEY `FK_FoodAndDrinkID` (`FoodAndDrinkVoucherID`);

--
-- Indexes for table `passenger_hold_baggage`
--
ALTER TABLE `passenger_hold_baggage`
  ADD PRIMARY KEY (`HoldBagPassengerID`),
  ADD KEY `FK_PassengerIDHoldBag` (`PassengerID`),
  ADD KEY `FK_HoldBagID` (`HoldBagID`);

--
-- Indexes for table `passenger_seats`
--
ALTER TABLE `passenger_seats`
  ADD PRIMARY KEY (`SeatID`),
  ADD KEY `FK_FlightIDSeat` (`FlightID`),
  ADD KEY `FK_SeatTypeID` (`SeatingTypeID`);

--
-- Indexes for table `passenger_special_assistance`
--
ALTER TABLE `passenger_special_assistance`
  ADD PRIMARY KEY (`SpecialAssistancePassengerID`),
  ADD KEY `FK_PassengerID` (`PassengerID`),
  ADD KEY `FK_SpecialAssistanceID` (`SpecialAssistanceID`);

--
-- Indexes for table `passenger_sports_equipment`
--
ALTER TABLE `passenger_sports_equipment`
  ADD PRIMARY KEY (`SportsEquipmentPassengerID`),
  ADD KEY `FK_PassengerIDSportsEquip` (`PassengerID`),
  ADD KEY `FK_SportsEquipmentID` (`SportsEquipmentID`);

--
-- Indexes for table `passenger_titles`
--
ALTER TABLE `passenger_titles`
  ADD PRIMARY KEY (`TitleID`);

--
-- Indexes for table `passenger_type`
--
ALTER TABLE `passenger_type`
  ADD PRIMARY KEY (`PassengerTypeID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `FK_CardProvider` (`CardProvider`);

--
-- Indexes for table `reason_for_booking`
--
ALTER TABLE `reason_for_booking`
  ADD PRIMARY KEY (`ReasonForBookingID`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`RouteID`),
  ADD KEY `FK_ArrivalAirport` (`ArrivalAirportID`),
  ADD KEY `FK_DepartureAirport` (`DepartureAirportID`);

--
-- Indexes for table `seating_type`
--
ALTER TABLE `seating_type`
  ADD PRIMARY KEY (`SeatingTypeID`);

--
-- Indexes for table `seating_type_prices`
--
ALTER TABLE `seating_type_prices`
  ADD PRIMARY KEY (`SeatingTypePriceID`),
  ADD KEY `FK_SeatingType` (`SeatingTypeID`),
  ADD KEY `FK_CurrencySeats` (`Currency`);

--
-- Indexes for table `special_assistance`
--
ALTER TABLE `special_assistance`
  ADD PRIMARY KEY (`SpecialAssistanceID`);

--
-- Indexes for table `sports_equipment`
--
ALTER TABLE `sports_equipment`
  ADD PRIMARY KEY (`SportsEquipmentID`);

--
-- Indexes for table `sports_equipment_prices`
--
ALTER TABLE `sports_equipment_prices`
  ADD PRIMARY KEY (`SportsEquipmentIPriceD`),
  ADD KEY `FK_CurrencySports` (`Currency`),
  ADD KEY `FK_SportsEqpID` (`SportsEquipmentID`);

--
-- Indexes for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  ADD PRIMARY KEY (`TermsAndConditionsID`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `FK_UserTitleID` (`TitleID`),
  ADD KEY `FK_AddressID` (`AddressID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `address_country`
--
ALTER TABLE `address_country`
  MODIFY `CountryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `aircraft`
--
ALTER TABLE `aircraft`
  MODIFY `AircraftID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `AirportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bookings_line_items`
--
ALTER TABLE `bookings_line_items`
  MODIFY `BookingLineItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `cabin_baggage`
--
ALTER TABLE `cabin_baggage`
  MODIFY `CabinBagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cabin_bag_prices`
--
ALTER TABLE `cabin_bag_prices`
  MODIFY `CabinBagPriceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `card_provider`
--
ALTER TABLE `card_provider`
  MODIFY `CardProviderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `CurrencyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ejplusaccount`
--
ALTER TABLE `ejplusaccount`
  MODIFY `EJPlusMembershipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `FlightID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `flight_prices`
--
ALTER TABLE `flight_prices`
  MODIFY `FlightPriceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `food_and_drink_prices`
--
ALTER TABLE `food_and_drink_prices`
  MODIFY `PriceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `food_and_drink_voucher`
--
ALTER TABLE `food_and_drink_voucher`
  MODIFY `FoodAndDrinkVoucherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hold_baggage`
--
ALTER TABLE `hold_baggage`
  MODIFY `HoldBagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hold_baggage_price`
--
ALTER TABLE `hold_baggage_price`
  MODIFY `HoldBagPriceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `PassengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `passenger_cabin_baggage`
--
ALTER TABLE `passenger_cabin_baggage`
  MODIFY `CabinBagPassengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `passenger_food_and_drink_voucher`
--
ALTER TABLE `passenger_food_and_drink_voucher`
  MODIFY `FoodAndDrinkPassengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `passenger_hold_baggage`
--
ALTER TABLE `passenger_hold_baggage`
  MODIFY `HoldBagPassengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `passenger_seats`
--
ALTER TABLE `passenger_seats`
  MODIFY `SeatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `passenger_special_assistance`
--
ALTER TABLE `passenger_special_assistance`
  MODIFY `SpecialAssistancePassengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `passenger_sports_equipment`
--
ALTER TABLE `passenger_sports_equipment`
  MODIFY `SportsEquipmentPassengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `passenger_titles`
--
ALTER TABLE `passenger_titles`
  MODIFY `TitleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `passenger_type`
--
ALTER TABLE `passenger_type`
  MODIFY `PassengerTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reason_for_booking`
--
ALTER TABLE `reason_for_booking`
  MODIFY `ReasonForBookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `RouteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `seating_type`
--
ALTER TABLE `seating_type`
  MODIFY `SeatingTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seating_type_prices`
--
ALTER TABLE `seating_type_prices`
  MODIFY `SeatingTypePriceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `special_assistance`
--
ALTER TABLE `special_assistance`
  MODIFY `SpecialAssistanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sports_equipment`
--
ALTER TABLE `sports_equipment`
  MODIFY `SportsEquipmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sports_equipment_prices`
--
ALTER TABLE `sports_equipment_prices`
  MODIFY `SportsEquipmentIPriceD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  MODIFY `TermsAndConditionsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_Country` FOREIGN KEY (`Country`) REFERENCES `address_country` (`CountryID`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `FK_Currencybooking` FOREIGN KEY (`Currency`) REFERENCES `currency` (`CurrencyID`),
  ADD CONSTRAINT `FK_PaymentID` FOREIGN KEY (`PaymentDetails`) REFERENCES `payment` (`PaymentID`),
  ADD CONSTRAINT `FK_T_and_C` FOREIGN KEY (`T&CAccepted`) REFERENCES `terms_and_conditions` (`TermsAndConditionsID`),
  ADD CONSTRAINT `FK_UserID` FOREIGN KEY (`UserID`) REFERENCES `user_account` (`UserID`);

--
-- Constraints for table `bookings_line_items`
--
ALTER TABLE `bookings_line_items`
  ADD CONSTRAINT `FK_BookingIDLineItem` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`),
  ADD CONSTRAINT `FK_currency` FOREIGN KEY (`CurrencyID`) REFERENCES `currency` (`CurrencyID`);

--
-- Constraints for table `cabin_bag_prices`
--
ALTER TABLE `cabin_bag_prices`
  ADD CONSTRAINT `FK_Cabin_Bag_ID` FOREIGN KEY (`CabinBagID`) REFERENCES `cabin_baggage` (`CabinBagID`),
  ADD CONSTRAINT `FK_Currency_Cabin` FOREIGN KEY (`CurrencyID`) REFERENCES `currency` (`CurrencyID`);

--
-- Constraints for table `ejplusaccount`
--
ALTER TABLE `ejplusaccount`
  ADD CONSTRAINT `FK_UserIDejmembership` FOREIGN KEY (`UserID`) REFERENCES `user_account` (`UserID`);

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `FK_Aircraft` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`),
  ADD CONSTRAINT `FK_Route` FOREIGN KEY (`RouteID`) REFERENCES `routes` (`RouteID`);

--
-- Constraints for table `flight_prices`
--
ALTER TABLE `flight_prices`
  ADD CONSTRAINT `FK_CurrencyFlights` FOREIGN KEY (`Currency`) REFERENCES `currency` (`CurrencyID`),
  ADD CONSTRAINT `FK_Flight_ID` FOREIGN KEY (`FlightID`) REFERENCES `flights` (`FlightID`),
  ADD CONSTRAINT `FK_Passenger_Type` FOREIGN KEY (`PassengerTypeID`) REFERENCES `passenger_type` (`PassengerTypeID`);

--
-- Constraints for table `food_and_drink_prices`
--
ALTER TABLE `food_and_drink_prices`
  ADD CONSTRAINT `FK_VoucherID` FOREIGN KEY (`VoucherID`) REFERENCES `food_and_drink_voucher` (`FoodAndDrinkVoucherID`),
  ADD CONSTRAINT `FK_voucher_currency` FOREIGN KEY (`CurrencyID`) REFERENCES `currency` (`CurrencyID`);

--
-- Constraints for table `hold_baggage_price`
--
ALTER TABLE `hold_baggage_price`
  ADD CONSTRAINT `FK_CurrencyHoldBag` FOREIGN KEY (`CurrencyID`) REFERENCES `currency` (`CurrencyID`),
  ADD CONSTRAINT `FK_HoldBag_ID` FOREIGN KEY (`HoldBagID`) REFERENCES `hold_baggage` (`HoldBagID`);

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `FK_BookingID` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`),
  ADD CONSTRAINT `FK_Flight` FOREIGN KEY (`FlightID`) REFERENCES `flights` (`FlightID`),
  ADD CONSTRAINT `FK_PassengerType` FOREIGN KEY (`PassengerTypeID`) REFERENCES `passenger_type` (`PassengerTypeID`),
  ADD CONSTRAINT `FK_ReasonForBooking` FOREIGN KEY (`ReasonForBookingID`) REFERENCES `reason_for_booking` (`ReasonForBookingID`),
  ADD CONSTRAINT `FK_SeatID` FOREIGN KEY (`SeatID`) REFERENCES `passenger_seats` (`SeatID`),
  ADD CONSTRAINT `FK_TitleID` FOREIGN KEY (`TitleID`) REFERENCES `passenger_titles` (`TitleID`);

--
-- Constraints for table `passenger_cabin_baggage`
--
ALTER TABLE `passenger_cabin_baggage`
  ADD CONSTRAINT `FK_CabinBagID` FOREIGN KEY (`CabingBagID`) REFERENCES `cabin_baggage` (`CabinBagID`),
  ADD CONSTRAINT `FK_PassengerIDCabinBag` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`);

--
-- Constraints for table `passenger_food_and_drink_voucher`
--
ALTER TABLE `passenger_food_and_drink_voucher`
  ADD CONSTRAINT `FK_FoodAndDrinkID` FOREIGN KEY (`FoodAndDrinkVoucherID`) REFERENCES `food_and_drink_voucher` (`FoodAndDrinkVoucherID`),
  ADD CONSTRAINT `FK_PassengerIDFoodAndDrink` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`);

--
-- Constraints for table `passenger_hold_baggage`
--
ALTER TABLE `passenger_hold_baggage`
  ADD CONSTRAINT `FK_HoldBagID` FOREIGN KEY (`HoldBagID`) REFERENCES `hold_baggage` (`HoldBagID`),
  ADD CONSTRAINT `FK_PassengerIDHoldBag` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`);

--
-- Constraints for table `passenger_seats`
--
ALTER TABLE `passenger_seats`
  ADD CONSTRAINT `FK_FlightIDSeat` FOREIGN KEY (`FlightID`) REFERENCES `flights` (`FlightID`),
  ADD CONSTRAINT `FK_SeatTypeID` FOREIGN KEY (`SeatingTypeID`) REFERENCES `seating_type` (`SeatingTypeID`);

--
-- Constraints for table `passenger_special_assistance`
--
ALTER TABLE `passenger_special_assistance`
  ADD CONSTRAINT `FK_PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`),
  ADD CONSTRAINT `FK_SpecialAssistanceID` FOREIGN KEY (`SpecialAssistanceID`) REFERENCES `special_assistance` (`SpecialAssistanceID`);

--
-- Constraints for table `passenger_sports_equipment`
--
ALTER TABLE `passenger_sports_equipment`
  ADD CONSTRAINT `FK_PassengerIDSportsEquip` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`),
  ADD CONSTRAINT `FK_SportsEquipmentID` FOREIGN KEY (`SportsEquipmentID`) REFERENCES `sports_equipment` (`SportsEquipmentID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_CardProvider` FOREIGN KEY (`CardProvider`) REFERENCES `card_provider` (`CardProviderID`);

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `FK_ArrivalAirport` FOREIGN KEY (`ArrivalAirportID`) REFERENCES `airports` (`AirportID`),
  ADD CONSTRAINT `FK_DepartureAirport` FOREIGN KEY (`DepartureAirportID`) REFERENCES `airports` (`AirportID`);

--
-- Constraints for table `seating_type_prices`
--
ALTER TABLE `seating_type_prices`
  ADD CONSTRAINT `FK_CurrencySeats` FOREIGN KEY (`Currency`) REFERENCES `currency` (`CurrencyID`),
  ADD CONSTRAINT `FK_SeatingType` FOREIGN KEY (`SeatingTypeID`) REFERENCES `seating_type` (`SeatingTypeID`);

--
-- Constraints for table `sports_equipment_prices`
--
ALTER TABLE `sports_equipment_prices`
  ADD CONSTRAINT `FK_CurrencySports` FOREIGN KEY (`Currency`) REFERENCES `currency` (`CurrencyID`),
  ADD CONSTRAINT `FK_SportsEqpID` FOREIGN KEY (`SportsEquipmentID`) REFERENCES `sports_equipment` (`SportsEquipmentID`);

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `FK_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  ADD CONSTRAINT `FK_UserTitleID` FOREIGN KEY (`TitleID`) REFERENCES `passenger_titles` (`TitleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
