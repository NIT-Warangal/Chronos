-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2014 at 01:38 PM
-- Server version: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Timetable`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `Class_ID` varchar(10) NOT NULL,
  `Class_Name` varchar(128) NOT NULL,
  UNIQUE KEY `Class_ID` (`Class_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes_assigned`
--

CREATE TABLE IF NOT EXISTS `classes_assigned` (
  `Faculty_ID` varchar(10) NOT NULL,
  `Class_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_timetable`
--

CREATE TABLE IF NOT EXISTS `class_timetable` (
  `class_id` varchar(10) NOT NULL,
  `8-9` varchar(10) NOT NULL,
  `9-10` varchar(10) NOT NULL,
  `10-11` varchar(10) NOT NULL,
  `11-12` varchar(10) NOT NULL,
  `12-1` varchar(10) NOT NULL,
  `2-3` varchar(10) NOT NULL,
  `3-4` varchar(10) NOT NULL,
  `4-5` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `Course_ID` varchar(10) NOT NULL,
  `Course_Name` varchar(128) NOT NULL,
  `Credits` int(11) NOT NULL,
  `Department` varchar(128) NOT NULL,
  `Category` varchar(128) NOT NULL,
  UNIQUE KEY `Course_ID` (`Course_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courses_assigned`
--

CREATE TABLE IF NOT EXISTS `courses_assigned` (
  `Faculty_ID` varchar(10) NOT NULL,
  `Course_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE IF NOT EXISTS `faculty` (
  `Faculty_ID` varchar(10) NOT NULL,
  `Faculty_Name` varchar(128) NOT NULL,
  `Role` int(11) NOT NULL,
  UNIQUE KEY `Faculty_ID` (`Faculty_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_timetable`
--

CREATE TABLE IF NOT EXISTS `faculty_timetable` (
  `course_id` varchar(10) NOT NULL,
  `faculty_id` varchar(10) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  `mon` varchar(10) NOT NULL,
  `tue` varchar(10) NOT NULL,
  `wed` varchar(10) NOT NULL,
  `thu` varchar(10) NOT NULL,
  `fri` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
