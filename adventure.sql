-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2016 at 05:20 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `adventure`
--

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `target_question` int(11) DEFAULT NULL,
  `change_life` int(11) DEFAULT NULL,
  `change_money` int(100) DEFAULT NULL,
  `opt_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `question_id`, `target_question`, `change_life`, `change_money`, `opt_text`) VALUES
(1, 0, 5, 0, 0, 'You join him without hesitation'),
(2, 0, 6, 0, 0, 'You refuse and tell him that you prefer to party in the main city'),
(3, 0, 7, 10, -20, 'You first visit te local Dr. and get all the proper meds'),
(4, 0, 8, 0, -5, 'You prefer to stay in your hotel room and watch a good movie'),
(5, 5, 9, -30, 0, 'You ask your friend suck the poison out of your bite'),
(6, 5, 10, -5, -10, 'You call the local authority to evacuate you to the nearest hospital without hesitation'),
(7, 5, 11, -30, 0, 'You ignore and keep walking, thinking it is not a dangerous snake'),
(8, 5, 12, -50, 0, 'You decide to cut your leg off to avoid the infection'),
(9, 9, 101, 0, -3, 'You call the police'),
(10, 9, 102, 20, 0, 'You pray to God'),
(11, 9, 103, 10, 0, 'You call your mom immediately'),
(12, 9, 104, 15, -10, 'You go for a drink'),
(13, 10, 105, 0, -20, 'You give him some money, and he takes you to the hosital'),
(14, 10, 106, -35, 0, 'You refuse, and he leaves you to die'),
(15, 10, 107, 0, 50, 'Your friend knocks the cop out and steals the helicopter, taking you to the hospital'),
(16, 10, 108, -20, 0, 'The python is passing by a second time, and bites your genital parts'),
(17, 11, 109, 0, 100, 'a haunted house'),
(18, 11, 110, -30, 0, 'a candy house'),
(19, 11, 111, 10, 60, 'a Casino'),
(20, 11, 112, 0, 10, 'back to the hotel'),
(21, 12, 101, 0, -5, 'You call the police'),
(22, 12, 102, 20, -3, 'You pray to God'),
(23, 12, 103, 15, -3, 'You call your mom immediately'),
(24, 12, 104, 20, -18, 'You go for a drink'),
(25, 6, 13, 15, -10, 'Full-moon party'),
(26, 6, 14, 10, -20, 'Most renown club in Bangkok'),
(27, 6, 14, 15, -5, 'Rev party'),
(28, 6, 13, 15, 0, 'Nature party in the jungle'),
(29, 13, 113, 10, 0, 'Go for a romantic night swim with her'),
(30, 13, 114, 10, 0, 'You invite her to have dinner together'),
(31, 13, 115, 10, 0, 'You buy her a popsicle'),
(32, 13, 105, 20, 0, 'You got crazy in love and got her a diamond ring'),
(33, 14, 116, 10, 0, 'Free ecstasy'),
(34, 14, 117, 5, 0, 'Free prostitute'),
(35, 14, 118, 20, 0, 'Introduction to a nice girl'),
(36, 14, 104, 10, 0, 'All you can drink'),
(37, 7, 5, 10, -10, 'You wait for the doctor and join your friend'),
(38, 7, 5, 0, 0, 'You are impatient and join your friend'),
(39, 7, 13, 10, 0, 'You meet a girl in the clinic'),
(40, 7, 14, 5, -5, 'You decide to go clubbing instead'),
(41, 8, 15, -10, 0, 'You get angry and break the TV'),
(42, 8, 13, 5, 0, 'You go for a swim and meet a girl'),
(43, 8, 5, 0, 0, 'You join your friend in the jungle'),
(44, 8, 16, 10, 0, 'You take a nap'),
(45, 15, 119, 0, -25, 'You pay a fine'),
(46, 15, 120, -5, 0, 'You run away'),
(47, 15, 106, -20, 0, 'You refuse to pay and end in jail'),
(48, 15, 101, 20, 0, 'The cops falls in love with you'),
(49, 16, 121, -5, 0, 'You are hallucinating'),
(50, 16, 121, -7, 0, 'Who is this god you are talking about?'),
(51, 16, 102, 20, 0, 'You are a true believer and you obey'),
(52, 16, 103, 15, -3, 'You call your mum immediatly');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `image`, `question`) VALUES
(0, '0.jpg', 'You are on vacation in Thailand with your friend. He asks you to join him for a trip in the Jungle. '),
(1, '1.jpg', 'You switched on your cable TV but it is not working'),
(2, '2.jpg', 'The hotel manager hears the noise and calls the police'),
(3, 'bribe.jpg', ''),
(4, 'bribe.jpg', '4th question '),
(5, 'pythonAttack.jpg', 'You just entered the jungle and you get bitten by a python snake. What do you do?'),
(6, 'club.jpg', 'You refuse your friend proposal and you go clubbing, which party do you go to?'),
(7, 'doc.jpg', 'You go to the local clinic to get medecine and have to wait for 2 hours. What do you decide?'),
(8, '1.jpg', 'You switched on your cable TV but it is not working, what do you do?'),
(9, 'deadfriend.jpg', 'You are feeling amazing, but unfortunately your friend drops dead'),
(10, 'bribe.jpg', 'The cop came to rescue you, but asks you for all of your money. what do you do?'),
(11, 'junction.jpg', 'You arrive to a junction in the middle of the jungle, what path do you follow?'),
(12, 'infection.jpg', 'Your leg begin to infect, what do you do?'),
(13, 'girl.jpg', 'You met a girl and want to find a quiet spot, where do you go?'),
(14, 'vip.jpg', 'A guy offers you four option fot the VIP ticket, which one do you buy?'),
(15, '2.jpg', 'The hotel manager heards the noise and call the police'),
(16, 'god.jpg', 'God is magically appearing in front of you and tells you to leave the country. What do you do?'),
(101, 'lovecop.jpg', 'Your fall in love with the policeman and you build a family in Thailand'),
(102, 'priest.jpg', 'You leave and you become a priest'),
(103, 'supermum.png', 'Your mum come and save your lives'),
(104, 'paris.jpg', 'You wake up naked in the center of Paris, broke'),
(105, 'brokehappy.jpg', 'You broke with no money but happy as can be'),
(106, 'jail.gif', 'You spend the rest of your life in jail'),
(107, 'helicopter_crash.png', 'He does not know how to drive the helicopter and you both die in a crash'),
(108, 'intercourse.jpg', 'You cannot have intercourse anymore'),
(109, 'rich_thailand.jpg', 'You find a buyer for this house and become the richest man in Thailand'),
(110, 'obese.jpg', 'You eat all of the house and die of diabete'),
(111, 'happy_meal.png', 'You gamble and win one million Thai baht. You can now buy a happy meal in Mac Donalds'),
(112, 'back_home.png', 'It was a nice vacation, you are now back home'),
(113, 'drown.jpg', 'Too bad you drowned and die'),
(114, 'food_poisoning.jpg', 'The food was bad and you got sick'),
(115, 'diarrhea.png', 'The water of the popsicle was bad and you got diarhea'),
(116, 'mental.gif', 'The ectasy was made in Afghanistan and you finish in a mental hospital'),
(117, 'STD.jpg', 'You slept with the prostitue and got an STD'),
(118, 'family_thailand.jpg', 'You spend the night together and build a family in Thailand'),
(119, 'alive.jpg', 'Congrats, you stay alive but need to shorten you vacation'),
(120, 'brokehappy.jpg', 'You take a plane ticket to go back home but leave the country with no money'),
(121, 'earthquake.jpg', 'You die in an earthquake');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `last_current_question` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `life` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=351 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_current_question`, `money`, `life`) VALUES
(321, 'papa', 104, 50, 100),
(322, 'hilloush', 106, 50, 100),
(323, 'hello', 106, 50, 100),
(324, 'pedrolito', 0, 50, 100),
(325, 'frank', 5, 50, 100),
(326, 'lili', 13, 50, 100),
(327, 'papliyo', 10, 50, 100),
(328, 'poil', 2, 50, 100),
(329, 'poiuyujik', 104, 50, 100),
(330, 'yo', 5, 50, 100),
(331, 'polki', 108, 50, 100),
(332, 'buboui', 114, 50, 100),
(333, 'gdkhsfgjks', 113, 50, 100),
(334, 'dan', 103, 57, 117),
(335, 'asdf', 10, 45, 90),
(336, 'Dan''s mom', 0, 50, 100),
(337, 'Dan''s mom', 0, 50, 100),
(338, 'Benji', 104, 115, 10),
(339, 'Ijneb', 115, 120, 40),
(340, 'dlkjh', 106, 80, 35),
(341, 'ijkujgttt', 119, 100, 10),
(342, 'huy6hnu7jn', 116, 90, 60),
(343, 'gjyftf', 116, 90, 60),
(344, 'hkfehkv', 116, 105, 65),
(345, 'gkdzf', 1, NULL, NULL),
(346, 'fdkjhgfdsg', 0, 50, 100),
(347, 'hilloushg', 104, 50, 100),
(348, 'plolito', 115, 100, 65),
(349, 'hillyuyhhuiiuhuhyu', 105, 90, 25),
(350, 'hillypo', 114, 110, 65);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
