-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 17, 2021 at 01:00 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `pwd`) VALUES
(1, 'admin', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `views` varchar(255) NOT NULL DEFAULT '0',
  `added_by` int(11) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `video` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `thread_id`, `title`, `description`, `views`, `added_by`, `add_time`, `video`) VALUES
(22, 8, 'Fast run', 'really good run', '11', 4, '2021-09-17 09:47:04', 'https://www.youtube.com/watch?v=zLphAlLQNiE'),
(24, 9, 'Sonic Riders Run', 'Great run', '3', 5, '2021-09-17 10:06:43', 'https://www.youtube.com/watch?v=AmrqqEpalWg');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `reply_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `added_by` varchar(255) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`reply_id`, `post_id`, `title`, `description`, `added_by`, `add_time`) VALUES
(18, 20, 'Hey nice', 'asdadsdadsads', '2', '2021-09-02 00:10:22'),
(19, 20, 'qsada', 'asdsaddasd', '2', '2021-09-02 00:11:18'),
(20, 23, 'wow ', 'amazing run my friend', '5', '2021-09-17 10:02:59'),
(21, 23, 'great', 'amazing work my friend', '5', '2021-09-17 10:03:12'),
(22, 24, 'great run', 'great video', '5', '2021-09-17 10:06:24'),
(23, 24, 'amazing run friend!', 'amazing indeed', '5', '2021-09-17 10:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `thread_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `views` varchar(255) NOT NULL DEFAULT '0',
  `added_by` int(11) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`thread_id`, `topic_id`, `title`, `description`, `views`, `added_by`, `add_time`) VALUES
(5, 8, 'Sonic Riders Run', 'I beat this in a pretty fast time If i do say so myself!', '102', 1, '2021-09-17 09:15:57'),
(6, 8, 'Mario Bros', 'Quick run', '11', 2, '2021-09-17 09:15:59'),
(7, 9, 'asa', 'asdads', '2', 2, '2021-09-02 00:12:18'),
(8, 8, 'Super Mario 64 Runs', 'This is for all super mario 64 runs', '3', 4, '2021-09-17 09:42:59'),
(9, 10, 'Sonic Riders World Record Run', 'A really great run', '8', 5, '2021-09-17 10:06:10');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topic_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `added_by` varchar(255) NOT NULL DEFAULT '0',
  `add_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `title`, `description`, `added_by`, `add_time`) VALUES
(8, 'Any%', '<p>This is dedicated to posts regarding beating a game as fast as possible</p>', '0', '2021-09-01 05:12:01'),
(9, '100%', '<p>Dedicated for post finishing a game as fast as possible while still beating the entire game</p>', '0', '2021-09-01 05:13:37'),
(10, 'World Records', '<p>Dedicated for runs that hold the world record for that game</p>', '0', '2021-09-01 05:14:02'),
(11, 'General', '<p>Funny clips, gameplay, you name it!</p>', '0', '2021-09-01 05:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `reg_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fname`, `username`, `img`, `email`, `pwd`, `address`, `reg_time`) VALUES
(3, 'Nicholas Wisdom', 'root', '', 'nwmaster6@gmail.com', 'root', 'I love to speed run sonic games', '2021-09-17 09:00:31'),
(4, 'Nicholas Wisdom', 'root1', '', 'nwmaster6@gmail.com', 'root1', 'I love to speed run mario games', '2021-09-17 09:40:58'),
(5, 'Nicholas Wisdom', 'root2', '', 'nwmaster6@gmail.com', 'root2', 'I love to speed run sonic games and mario games', '2021-09-17 10:07:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`thread_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
