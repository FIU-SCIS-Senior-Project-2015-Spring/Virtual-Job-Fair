-- phpMyAdmin SQL Dump
-- version 4.0.10.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2015 at 03:52 AM
-- Server version: 5.6.19
-- PHP Version: 5.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jobfairdb`
--

CREATE DATABASE IF NOT EXISTS jobfairdb;
USE jobfairdb;

-- --------------------------------------------------------

--
-- Table structure for table `api_auth`
--

CREATE TABLE IF NOT EXISTS `api_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valid_key` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_UNIQUE` (`valid_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `api_auth`
--

INSERT INTO `api_auth` (`id`, `valid_key`, `description`) VALUES
(2, 'WDHP5VP681NXND0YFBCW', 'cbapi'),
(3, '5595740829812660', 'indeed');

-- --------------------------------------------------------

--
-- Table structure for table `api_status`
--

CREATE TABLE IF NOT EXISTS `api_status` (
  `date_modified` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_status`
--

INSERT INTO `api_status` (`date_modified`, `status`) VALUES
('2014-10-11 20:36:35', 1),
('2014-12-11 10:08:13', 0),
('2014-12-11 10:08:15', 1),
('2014-12-11 10:36:14', 0),
('2014-12-11 10:36:15', 1),
('2014-12-11 10:58:16', 0),
('2014-12-11 10:58:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE IF NOT EXISTS `application` (
  `jobid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `application_date` varchar(45) NOT NULL,
  `coverletter` text,
  PRIMARY KEY (`jobid`,`userid`),
  KEY `idx_userid` (`userid`),
  KEY `idx_jobid` (`jobid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`jobid`, `userid`, `application_date`, `coverletter`) VALUES
(157, 71, '2015-07-10 17:03:50', NULL),
(158, 15, '2015-07-28 00:40:36', NULL),
(158, 16, '2015-07-28 00:41:07', NULL),
(158, 71, '2015-07-28 00:44:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `basic_info`
--

CREATE TABLE IF NOT EXISTS `basic_info` (
  `userid` int(11) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip_code` varchar(15) DEFAULT NULL,
  `about_me` text,
  `hide_phone` int(11) DEFAULT NULL,
  `allowSMS` int(11) DEFAULT '0',
  `validated` int(11) DEFAULT NULL,
  `smsCode` int(11) DEFAULT NULL,
  `tries` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `idx_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basic_info`
--

INSERT INTO `basic_info` (`userid`, `phone`, `city`, `state`, `zip_code`, `about_me`, `hide_phone`, `allowSMS`, `validated`, `smsCode`, `tries`) VALUES
(5, NULL, 'Miami/Fort Lauderdale Area', NULL, '0', 'Attended Florida International University', NULL, NULL, NULL, NULL, 0),
(9, '', 'Alaska', 'Alaska', '99676', '', NULL, 0, 0, NULL, 0),
(11, '', 'Miami', 'FL', '0', 'Just checking out your site. Yii sucks.', 0, 0, NULL, NULL, 0),
(12, '', 'Miami', 'Florida', '0', 'This is my Bio.', 0, 0, 0, NULL, 0),
(14, '3053334444', 'Columbia', 'Illinois', '65284', '', NULL, 0, 0, 3785, 0),
(15, '', 'Great Bend', 'Kansas', '67530', '', NULL, 0, 0, NULL, 0),
(16, '', 'Salt Lake City', 'Utah', '84645', '', NULL, 0, 0, NULL, 0),
(17, '', 'Oregon', 'Oregon', '97754', '', NULL, 0, 0, NULL, 0),
(18, '', 'Alaska', 'Alaska', '33125', '', NULL, 0, 0, NULL, 0),
(23, '(305) 348-2744', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
(26, NULL, 'Miami/Fort Lauderdale Area', NULL, NULL, 'Director of Professional Master of Science in Information Technology Program at Florida International University', NULL, NULL, NULL, NULL, 0),
(55, '13054955901', 'Miami/Fort Lauderdale Area', '', '33196', 'Student at Florida International University', NULL, 0, 0, NULL, 0),
(71, '305-333-4444', 'Miami', 'FL', '33172', 'I am a Computer Science student.', 1, 1, 0, 6349, 0),
(72, '3055554444', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(74, '3053334444', 'Miami', 'FL', NULL, 'We are interested in offering students a wonderful opportunity in the field of Android APP development.', 1, 1, 0, NULL, 0),
(99, '3053054848', 'Miami', 'Florida', NULL, 'Human Resources Manager at VJF', 1, 0, NULL, NULL, 0),
(111, '3333333333', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
(112, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
(118, NULL, '\n\n  \n    Miami/Fort Lauderdale Area\n  \n\n', '', NULL, 'Director of Professional Master of Science in Information Technology Program at Florida International University', NULL, 0, NULL, NULL, 0),
(120, NULL, '\n\n  \n    Miami/Fort Lauderdale Area\n  \n\n', '', NULL, 'Student at Florida International University', NULL, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

CREATE TABLE IF NOT EXISTS `company_info` (
  `FK_userid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `street2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`FK_userid`),
  KEY `idx_FK_userid` (`FK_userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`FK_userid`, `name`, `street`, `street2`, `city`, `state`, `zipcode`, `website`, `description`) VALUES
(11, 'Coplat', '7131 SW 142PL', '', 'Miami', 'FL', '33183', '', 'Stuff blah blah blah'),
(12, 'asdasd', '92919', '', 'Miami', 'florida', '33125', 'employertwo.cis.fiu.edu', 'This is my company name.'),
(74, 'Android Fake Studio', '123 Main Street', '', 'Miami', 'FL', '33174', 'www.google.com', 'Hello.'),
(99, 'VJF', '1234 NW', '22nd Ave', 'Miami', 'Florida', '33172', 'http://vjf-dev.cs.fiu.edu', 'Virtual Job Fair is an efficient way to make a connection between employers and job seeking students. Recruiting high quality employees or finding the perfect job is no easy task; Virtual Job Fair provides a simple and efficient solution to this.');

-- --------------------------------------------------------

--
-- Table structure for table `cover_letter`
--

CREATE TABLE IF NOT EXISTS `cover_letter` (
  `id` int(11) NOT NULL,
  `file_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cover_letter`
--

INSERT INTO `cover_letter` (`id`, `file_path`) VALUES
(71, '/JobFair/coverletters/71-StudentCoverLetter.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE IF NOT EXISTS `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree` varchar(45) NOT NULL,
  `major` varchar(45) NOT NULL,
  `graduation_date` date NOT NULL,
  `FK_school_id` int(11) DEFAULT NULL,
  `FK_user_id` int(11) DEFAULT NULL,
  `gpa` float DEFAULT NULL,
  `additional_info` text,
  PRIMARY KEY (`id`),
  KEY `idx_FK_school_id` (`FK_school_id`),
  KEY `idx_FK_user_id` (`FK_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=89 ;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `degree`, `major`, `graduation_date`, `FK_school_id`, `FK_user_id`, `gpa`, `additional_info`) VALUES
(1, 'Bachelor''s degree', 'Computer Science', '2014-10-04', 1, 5, NULL, ''),
(4, 'Bachelor in Science', 'Computer Science', '2014-11-18', 3, 9, NULL, ''),
(8, 'Bachelor in Science', 'Computer Science', '2014-12-17', 3, 14, NULL, ''),
(9, 'Bachelor in Science', 'Information Technology', '2014-12-12', 7, 15, NULL, ''),
(10, 'Master in Science', 'Information Technology', '2014-12-25', 8, 16, NULL, ''),
(11, 'Master in Science', 'Computer Science', '2014-12-26', 9, 17, NULL, ''),
(12, 'Bachelor in Science', 'Computer Science', '2014-12-19', 3, 18, NULL, ''),
(56, 'Ph.D.', 'Computer Science', '2015-03-04', 12, 26, NULL, ''),
(57, 'Bachelor of Science (BS)', 'Computer Engineering', '1995-03-04', 13, 26, NULL, ''),
(82, '', '', '2015-03-30', 1, 55, NULL, ''),
(83, 'N+', 'Information Technology', '2015-03-30', 10, 55, NULL, ''),
(84, 'Bachelor', 'Computer Science; Software Development', '1969-12-31', 1, 55, NULL, ''),
(88, 'BS', 'Computer Science', '2015-07-31', 11, 71, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE IF NOT EXISTS `experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FK_userid` int(11) DEFAULT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `job_title` varchar(45) DEFAULT NULL,
  `job_description` text,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_FK_userid` (`FK_userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`id`, `FK_userid`, `company_name`, `job_title`, `job_description`, `startdate`, `enddate`, `city`, `state`) VALUES
(22, 26, 'Florida International University', 'Director of Professional Master of Science in', '', '2014-01-01 00:00:00', '0000-00-00 00:00:00', '', ''),
(23, 26, 'Flordia International University', 'Associate Professor', '', '2010-08-01 00:00:00', '0000-00-00 00:00:00', '', ''),
(24, 26, 'Florida International University', 'Assistant Professor', '', '2004-08-01 00:00:00', '2010-08-01 00:00:00', '', ''),
(33, 55, 'Ravenscroft Ship Management INC', 'IT Technical Support Officer', 'Supported the roll out of new servers and applications. Installed and configured computer operating systems and\napplications. Monitored and maintained corporation networks and computer systems. Supported and maintained\ncorporate databases playing a key role within the organization. Manage users creating and profiles policy scripts\nwhile dealing with passwords related issues. Provided offsite support to clients and staff to help resolve computer\nsystems issues. Tested and evaluated new technologies later used within the organization.', '2007-01-01 00:00:00', '2014-05-01 00:00:00', '', ''),
(37, 71, 'FIU', 'Software Engineer', 'Developer', '2015-07-01 00:00:00', '2015-07-31 00:00:00', 'Miami', 'FL');

-- --------------------------------------------------------

--
-- Table structure for table `general_skills`
--

CREATE TABLE IF NOT EXISTS `general_skills` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_skills`
--

INSERT INTO `general_skills` (`id`, `name`) VALUES
(1, 'Programming'),
(2, 'Web'),
(3, 'Mobile'),
(4, 'Database'),
(5, 'Testing');

-- --------------------------------------------------------

--
-- Table structure for table `handshake`
--

CREATE TABLE IF NOT EXISTS `handshake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` int(11) DEFAULT NULL,
  `employerid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_employerid` (`employerid`),
  KEY `idx_jobid` (`jobid`),
  KEY `idx_studentid` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `FK_poster` int(11) NOT NULL,
  `post_date` datetime NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `description` longtext NOT NULL,
  `compensation` varchar(45) DEFAULT NULL,
  `other_requirements` text,
  `email_notification` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `matches_found` int(11) DEFAULT NULL,
  `posting_url` text,
  `comp_name` varchar(255) DEFAULT NULL,
  `poster_email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_FK_poster` (`FK_poster`),
  FULLTEXT KEY `type` (`type`,`title`,`description`,`comp_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=163 ;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `type`, `title`, `FK_poster`, `post_date`, `deadline`, `description`, `compensation`, `other_requirements`, `email_notification`, `active`, `matches_found`, `posting_url`, `comp_name`, `poster_email`) VALUES
(157, 'Full Time', 'Software Engineer', 74, '2015-07-01 22:08:23', '2015-08-31 00:00:00', 'If you are a Android Developer with experience, please read on!<br /><br />Based in Miami, we are a mobile application start up that has been gaining some newsworthy attention. Our flagship photo-editing app has seen a lot of commercial success and we''re looking to expand our portfolio. We currently have a need for a developer that can help us expand on the Android platform.<br /><br />Top Reasons to Work with Us<br />-Great tight-knit team<br />-Be on the ground floor of a growing startup<br />-Competitive salary<br /><br />What You Need for this Position<br />At Least 1 Year of experience and knowledge of:<br /><br />- Android SDK<br />- Java<br />- API<br /><br />So, if you are a Android Developer with experience, please apply today!', '80000', NULL, NULL, 1, NULL, NULL, 'Android Fake Studio', NULL),
(158, 'Full Time', 'Experience Yii Developer', 12, '2015-07-28 00:38:46', '2015-08-07 00:00:00', 'We are looking for a senior Yii developer. Candidate must have at least 5 years of experince working with  PHP, JavaScript and MySql.', '54,000', NULL, NULL, 1, NULL, NULL, 'asdasd', NULL),
(159, 'Full Time', 'Web Developer', 99, '2015-07-28 01:16:46', '2015-08-25 00:00:00', 'Sql, Php ', '62,000', NULL, NULL, 1, NULL, NULL, 'VJF', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_match`
--

CREATE TABLE IF NOT EXISTS `job_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jobid` (`jobID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `job_match`
--

INSERT INTO `job_match` (`id`, `jobID`, `studentID`) VALUES
(25, 157, 71),
(26, 157, 26),
(27, 157, 55),
(28, 157, 14),
(29, 158, 55),
(30, 158, 14),
(31, 158, 15),
(32, 158, 17),
(33, 159, 15),
(34, 159, 14),
(35, 159, 26),
(36, 159, 55),
(37, 160, 14),
(38, 160, 55),
(39, 160, 16),
(40, 160, 17),
(41, 161, 16),
(42, 161, 14),
(43, 161, 17),
(44, 161, 15),
(45, 162, 15),
(46, 162, 55),
(47, 162, 16),
(48, 162, 71);

-- --------------------------------------------------------

--
-- Table structure for table `job_skill_map`
--

CREATE TABLE IF NOT EXISTS `job_skill_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` int(11) NOT NULL,
  `skillid` int(11) NOT NULL,
  `level` varchar(45) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jobid` (`jobid`),
  KEY `idx_skillid` (`skillid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2377 ;

--
-- Dumping data for table `job_skill_map`
--

INSERT INTO `job_skill_map` (`id`, `jobid`, `skillid`, `level`, `ordering`) VALUES
(2352, 157, 124, NULL, 1),
(2353, 157, 123, NULL, 2),
(2354, 157, 1, NULL, 3),
(2355, 157, 57, NULL, 4),
(2356, 157, 32, NULL, 5),
(2357, 157, 63, NULL, 6),
(2358, 158, 30, NULL, 1),
(2359, 158, 3, NULL, 2),
(2360, 158, 16, NULL, 3),
(2361, 158, 14, NULL, 4),
(2362, 159, 2, NULL, 1),
(2363, 159, 3, NULL, 2),
(2364, 159, 50, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `match_notification`
--

CREATE TABLE IF NOT EXISTS `match_notification` (
  `userid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `match_notification`
--

INSERT INTO `match_notification` (`userid`, `status`, `date_modified`) VALUES
(2, 1, '2014-10-26 23:56:47'),
(2, 0, '2014-12-11 15:08:31'),
(2, 1, '2014-12-11 15:08:32'),
(2, 0, '2014-12-11 15:36:35'),
(2, 1, '2014-12-11 15:36:35'),
(2, 0, '2014-12-11 15:58:32'),
(2, 1, '2014-12-11 15:58:33'),
(2, 0, '2015-07-28 09:19:51'),
(2, 1, '2015-07-28 09:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FK_receiver` varchar(45) NOT NULL,
  `FK_sender` varchar(45) NOT NULL,
  `message` text,
  `date` datetime DEFAULT NULL,
  `been_read` int(11) DEFAULT '0',
  `been_deleted` int(11) NOT NULL DEFAULT '0',
  `sender_deleted` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_FK_receiver` (`FK_receiver`),
  KEY `idx_FK_sender` (`FK_sender`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `datetime` time NOT NULL,
  `been_read` int(11) NOT NULL,
  `message` varchar(5000) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `importancy` int(11) NOT NULL,
  `msgID` int(11) DEFAULT NULL,
  `jobMatchID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1245 ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_sites`
--

CREATE TABLE IF NOT EXISTS `portal_sites` (
  `name` varchar(50) NOT NULL,
  `url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

CREATE TABLE IF NOT EXISTS `resume` (
  `id` int(11) NOT NULL,
  `resume` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resume`
--

INSERT INTO `resume` (`id`, `resume`) VALUES
(55, '/JobFair/resumes/55-Rogelio Alonso Resume.pdf'),
(71, '/JobFair/resumes/71-StudentResume.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `saved_queries`
--

CREATE TABLE IF NOT EXISTS `saved_queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FK_userid` int(11) NOT NULL,
  `query_tag` varchar(25) NOT NULL,
  `query` text NOT NULL,
  `location` varchar(25) DEFAULT '',
  `active` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_userid` (`FK_userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `saved_queries`
--

INSERT INTO `saved_queries` (`id`, `FK_userid`, `query_tag`, `query`, `location`, `active`) VALUES
(6, 5, 'hello', '+java ', '', 0),
(7, 9, 'thequery', '+java ', '', 0),
(21, 12, '', '~skills:Javascript +php +iPhone Application Development ', '', 0),
(25, 12, '', '~position:Application Support Specialist ', '', 0),
(27, 12, '', '~experience:Manage ', '', 0),
(28, 12, '', '~skills:java ~school:Florida International University ~graduation:2014-10 ', '', 0),
(29, 12, '', '~ZIPcode:true ~major:Computer Science ', '', 0),
(31, 12, '', '~school:Florida International University ', '', 0),
(52, 26, 'JavaWeb', 'Java + Web ', 'Miami, Florida', 0),
(53, 23, 'JavaWeb', 'Java + Web ', 'Miami, Florida', 0),
(55, 99, '', '~skills:Html ', '', 0),
(56, 99, '', '~skills:MySQL ', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email_string` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `name`, `email_string`) VALUES
(1, 'Florida International University', NULL),
(2, 'Miami-Dade College', NULL),
(3, 'Harvard', NULL),
(4, 'Miami Dade', NULL),
(5, 'Stanford University', NULL),
(6, 'Hardvard', NULL),
(7, 'University of Kansas', NULL),
(8, 'University of Utah', NULL),
(9, 'University of Oregon', NULL),
(10, 'Pearson VUE Testing Center', NULL),
(11, 'FIU', NULL),
(12, 'Michigan State University', NULL),
(13, 'University of Tehran', NULL),
(14, 'h', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skillset`
--

CREATE TABLE IF NOT EXISTS `skillset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `FK_general_skills` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=127 ;

--
-- Dumping data for table `skillset`
--

INSERT INTO `skillset` (`id`, `name`, `FK_general_skills`) VALUES
(1, 'Java', 1),
(2, 'SQL', 4),
(3, 'PHP', 2),
(6, 'High Availability', 1),
(7, 'Windows', 1),
(8, 'HTML', 2),
(9, 'OS X', 1),
(10, 'Team Leadership', 1),
(11, 'Customer Service', 1),
(12, 'Microsoft Office', 1),
(13, 'Customer Satisfaction', 1),
(14, 'MySQL', 4),
(15, 'PL/SQL', 4),
(16, 'JavaScript', 2),
(17, 'CSS', 2),
(18, 'Web Page Automation', 2),
(19, 'Selenium', 5),
(20, 'Linux', 1),
(21, 'PostgreSQL', 4),
(24, 'Unix', 1),
(25, 'AJAX', 2),
(27, 'jQuery', 2),
(28, 'MVC', 1),
(29, 'Web Development', 2),
(30, 'Yii', 2),
(31, 'Wordpress', 2),
(32, 'Android Development', 3),
(33, 'C', 1),
(34, 'LAMP', 2),
(36, 'Database Design', 4),
(37, 'Relational Databases', 4),
(38, 'JSP', 2),
(39, 'Objective-C', 1),
(40, 'iPhone Application Development', 3),
(41, 'iOS Development', 1),
(42, 'Microsoft Excel', 1),
(43, 'Microsoft Word', 1),
(44, 'PowerPoint', 1),
(45, 'Research', 1),
(46, 'Photoshop', 1),
(47, 'Social Media', 1),
(48, 'Teamwork', 1),
(49, 'Public Speaking', 1),
(50, 'C++', 1),
(51, 'Ruby on Rails', 1),
(52, 'c socket programing', 1),
(53, 'F#', 1),
(54, 'Programming', 1),
(55, 'Managing Database', 4),
(56, 'Linux Kernel', 1),
(57, 'Software Engineering', 1),
(58, '', 1),
(59, 'Software Development', 1),
(60, 'Microsoft Visual Studio C++', 1),
(61, 'Microsoft SQL Server', 4),
(62, 'NetBeans', 1),
(63, 'Android SDK', 3),
(64, 'XML', 2),
(65, 'Maven', 1),
(66, 'JUnit', 5),
(67, 'F', 0),
(68, 'Recording', 0),
(69, 'Bootstrap', 0),
(70, 'Apache', 0),
(71, 'HTML5', 0),
(72, 'PhpMyAdmin', 0),
(73, 'ESB', 0),
(74, 'BizTalk', 0),
(75, 'Web Services', 0),
(76, 'REST', 0),
(77, 'SOAP', 0),
(80, 'Skill A', 0),
(81, 'XPATH', 0),
(82, 'ORACLE', 0),
(83, 'Hadoop', 0),
(84, 'Computer Science', 0),
(85, 'Communications Audits', 0),
(86, 'Academic Writing', 0),
(87, 'Machine Learning', 0),
(88, 'Algorithms', 0),
(89, 'R', 0),
(90, 'Distributed Systems', 0),
(91, 'LaTeX', 0),
(92, 'Simulations', 0),
(93, 'Parallel Computing', 0),
(94, 'Databases', 0),
(95, 'MPI', 0),
(96, 'Data Mining', 0),
(97, 'High Performance Computing', 0),
(98, 'Parallel Programming', 0),
(99, 'Python', 0),
(100, 'Pattern Recognition', 0),
(101, 'Perl', 0),
(102, 'Image Processing', 0),
(103, 'Computer Architecture', 0),
(104, 'Mathematical Modeling', 0),
(105, 'Signal Processing', 0),
(106, 'Matlab', 0),
(107, 'Artificial Intelligence', 0),
(108, 'Scientific Computing', 0),
(109, 'Fortran', 0),
(110, 'Optimization', 0),
(111, 'Mathematica', 0),
(112, 'Numerical Analysis', 0),
(113, 'Computer Vision', 0),
(114, 'Wireless Sensor Networks', 0),
(115, 'Information Retrieval', 0),
(116, 'Statistics', 0),
(117, 'Theory', 0),
(118, 'University Teaching', 0),
(119, 'Eclipse', 0),
(120, 'Simulink', 0),
(121, 'Bash', 0),
(122, 'Bioinformatics', 0),
(123, 'C#', 0),
(124, 'Design Patterns', 0),
(125, 'Testing', 0);

-- --------------------------------------------------------

--
-- Table structure for table `SMS`
--

CREATE TABLE IF NOT EXISTS `SMS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `Message` text,
  PRIMARY KEY (`id`),
  KEY `idx_receiver_id` (`receiver_id`),
  KEY `idx_sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `solr`
--
CREATE TABLE IF NOT EXISTS `solr` (
`id` varchar(22)
,`username` varchar(45)
,`email` varchar(45)
,`registration_date` datetime
,`first_name` varchar(45)
,`last_name` varchar(45)
,`image_url` varchar(255)
,`type` varchar(45)
,`title` varchar(45)
,`post_date` datetime
,`deadline` datetime
,`description` longtext
,`compensation` varchar(45)
,`other_requirements` text
,`email_notification` int(11)
,`matches_found` int(11)
,`posting_url` text
,`comp_name` varchar(255)
,`poster_email` varchar(40)
);
-- --------------------------------------------------------

--
-- Table structure for table `student_skill_map`
--

CREATE TABLE IF NOT EXISTS `student_skill_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `skillid` int(11) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_skillid` (`skillid`),
  KEY `idx_userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=336 ;

--
-- Dumping data for table `student_skill_map`
--

INSERT INTO `student_skill_map` (`id`, `userid`, `skillid`, `level`, `ordering`) VALUES
(36, 14, 3, NULL, 1),
(37, 14, 16, NULL, 2),
(38, 14, 2, NULL, 3),
(39, 14, 56, NULL, 4),
(40, 14, 40, NULL, 5),
(41, 14, 32, NULL, 6),
(48, 17, 6, NULL, 1),
(49, 17, 27, NULL, 2),
(50, 17, 30, NULL, 3),
(52, 17, 13, NULL, 5),
(53, 9, 6, NULL, 1),
(54, 9, 18, NULL, 2),
(55, 9, 52, NULL, 3),
(56, 9, 49, NULL, 4),
(57, 9, 18, NULL, 5),
(194, 26, 83, NULL, 1),
(195, 26, 84, NULL, 2),
(196, 26, 85, NULL, 3),
(197, 26, 86, NULL, 4),
(198, 26, 87, NULL, 5),
(199, 26, 88, NULL, 6),
(200, 26, 57, NULL, 7),
(201, 26, 20, NULL, 8),
(202, 26, 89, NULL, 9),
(203, 26, 90, NULL, 10),
(204, 26, 91, NULL, 11),
(205, 26, 3, NULL, 12),
(206, 26, 45, NULL, 13),
(207, 26, 1, NULL, 14),
(208, 26, 33, NULL, 15),
(209, 26, 92, NULL, 16),
(210, 26, 93, NULL, 17),
(211, 26, 94, NULL, 18),
(212, 26, 2, NULL, 19),
(213, 26, 95, NULL, 20),
(214, 26, 96, NULL, 21),
(215, 26, 97, NULL, 22),
(216, 26, 98, NULL, 23),
(217, 26, 50, NULL, 24),
(218, 26, 99, NULL, 25),
(219, 26, 100, NULL, 26),
(220, 26, 14, NULL, 27),
(221, 26, 54, NULL, 28),
(222, 26, 101, NULL, 29),
(223, 26, 102, NULL, 30),
(224, 26, 103, NULL, 31),
(225, 26, 104, NULL, 32),
(226, 26, 105, NULL, 33),
(227, 26, 106, NULL, 34),
(228, 26, 107, NULL, 35),
(229, 26, 108, NULL, 36),
(230, 26, 109, NULL, 37),
(231, 26, 110, NULL, 38),
(232, 26, 111, NULL, 39),
(233, 26, 112, NULL, 40),
(234, 26, 113, NULL, 41),
(235, 26, 114, NULL, 42),
(236, 26, 115, NULL, 43),
(237, 26, 116, NULL, 44),
(238, 26, 117, NULL, 45),
(239, 26, 118, NULL, 46),
(240, 26, 119, NULL, 47),
(241, 26, 120, NULL, 48),
(242, 26, 121, NULL, 49),
(243, 26, 122, NULL, 50),
(245, 55, 3, NULL, 1),
(246, 55, 1, NULL, 2),
(247, 55, 16, NULL, 3),
(248, 55, 27, NULL, 4),
(249, 55, 17, NULL, 5),
(250, 55, 69, NULL, 6),
(251, 55, 70, NULL, 7),
(252, 55, 62, NULL, 8),
(253, 55, 20, NULL, 9),
(254, 55, 14, NULL, 10),
(255, 55, 71, NULL, 11),
(256, 55, 8, NULL, 12),
(257, 55, 72, NULL, 13),
(258, 55, 29, NULL, 14),
(259, 55, 73, NULL, 15),
(260, 55, 74, NULL, 16),
(261, 55, 75, NULL, 17),
(262, 55, 76, NULL, 18),
(263, 55, 77, NULL, 19),
(264, 16, 8, NULL, 1),
(265, 16, 21, NULL, 2),
(266, 16, 11, NULL, 3),
(267, 16, 6, NULL, 4),
(268, 16, 10, NULL, 5),
(269, 16, 67, NULL, 6),
(270, 16, 3, NULL, 7),
(285, 15, 3, NULL, 1),
(286, 15, 53, NULL, 2),
(287, 15, 50, NULL, 3),
(288, 15, 30, NULL, 4),
(334, 71, 123, NULL, 1),
(335, 71, 1, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migration`
--

CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_migration`
--

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1412113298),
('m140601_035609_initial', 1412113302),
('m140607_063219_create_match_notification_table', 1412113302),
('m140610_182901_careerpath_sync', 1412113302),
('m140617_034311_alter_user_table', 1412113302),
('m140622_223610_alter_user_table_add_column_looking_for_job', 1412113302),
('m140624_000947_fiu_account_id', 1412113302),
('m140624_020245_company_name_column', 1412113303),
('m140701_040841_api_status', 1412113303),
('m140707_183328_alter_user_table_job_interest', 1412113303),
('m140714_221600_create_table_saved_queries', 1412113303),
('m140721_070311_api_auth_description', 1412113303);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `FK_usertype` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `registration_date` datetime DEFAULT NULL,
  `activation_string` varchar(45) DEFAULT NULL,
  `activated` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `disable` int(11) NOT NULL DEFAULT '0',
  `has_viewed_profile` int(11) DEFAULT NULL,
  `linkedinid` varchar(45) DEFAULT NULL,
  `googleid` varchar(45) DEFAULT NULL,
  `fiucsid` varchar(45) DEFAULT NULL,
  `hide_email` int(11) DEFAULT NULL,
  `job_notification` tinyint(1) NOT NULL DEFAULT '1',
  `fiu_account_id` varchar(45) DEFAULT NULL,
  `looking_for_job` tinyint(1) NOT NULL DEFAULT '1',
  `job_int_date` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_FK_usertype` (`FK_usertype`),
  KEY `idx_FK_username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `FK_usertype`, `email`, `registration_date`, `activation_string`, `activated`, `image_url`, `first_name`, `last_name`, `disable`, `has_viewed_profile`, `linkedinid`, `googleid`, `fiucsid`, `hide_email`, `job_notification`, `fiu_account_id`, `looking_for_job`, `job_int_date`) VALUES
(2, 'admin', '$2a$08$aNHFJKJRwmcX6F0KRJZf5uxIxdlbpxMIubKGTgSFec95uVWFKoVBi', 3, 'admin@mail.com', '2014-06-10 06:57:27', '', 1, '/JobFair/images/profileimages/user-default.png', 'Admin', 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(5, 'earen003@fiu.edu', '$2a$08$UovPrdGi/NfiYryxCAbEAeS3XvScYmkEx51QeTxNE6N2tXm7HWwBq', 1, 'earen003123@fiu.edu', '2014-10-04 15:37:55', 'google', 1, 'https://media.licdn.com/mpr/mprx/0_Gj0mWYPz0DWq_3q5iYr8oxrMUpvN6Cq5iaTi70GUveqBC_QITDYCDzvdlhm', 'Erick', 'Arenas', 0, 1, 'DywORbIHTc', '107193070609153671555', NULL, NULL, 1, NULL, 1, 5),
(9, 'student8', '$2a$08$lc0rNoh.imE0DMCJPjqyGObn3m4ztqECqE2kKbmBgkX9oudrg0dHi', 1, 'arenaserick123@yahoo.com', '2014-11-06 13:30:00', '3vlsgjawyq', 1, '/JobFair/images/profileimages/user-default.png', 'erickkk', 'arenass', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 5),
(11, 'nmad43', '$2a$08$41tQbGBVPNnLRY5pQxUicOqtmLy2t/SqbMuzJ4z7DAHdt3QfJtosK', 2, 'nmada002@fiu.edu', '2014-11-13 13:10:32', 'vihzwtsplq', NULL, '/JobFair/images/profileimages/user-default.png', 'Nicholas', 'Madariaga', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 0),
(12, 'employer10', '$2a$08$oLylkwLN2eMvx.B9AtLVhu4dSoLvAvVc7oWTSTGhKt2pDlZY8uBB.', 2, 'employertwo@mail.com', '2014-11-23 17:33:16', '5qjanjsv5n', 1, '/JobFair/images/profileimages/user-default.png', 'emp', 'two', 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 5),
(14, 'student3', '$2a$08$oPt5manAQUtYPPwKBzEtW.Bjn4OXGYJvHqSfoLQ1neU4xn3sNcy5e', 1, 'student3@mail.com', '2014-12-08 12:10:29', '0dm6r4sm8x', 1, '/JobFair/images/profileimages/user-default.png', 'student', 'three', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(15, 'student4', '$2a$08$CdHaBhoQniFWjXQxIztgX.BGeH0m2ApEjd4U.Hl11P9EUHtZi9c/i', 1, 'student4@mail.com', '2014-12-08 12:10:56', 'civrojoyt8', 1, '/JobFair/images/profileimages/student4avatar.jpg', 'student', 'four', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(16, 'student5', '$2a$08$1RtOrIfXEZFZEKF72IaKOewYIZodUdPaR7.uvjJ6ijwM3L6gv96nu', 1, 'student5@mail.com', '2014-12-08 12:11:33', 'yjupo61fkh', 1, '/JobFair/images/profileimages/user-default.png', 'student', 'five', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(17, 'student6', '$2a$08$IMOemea88AkVFg9DyR8Luuh7LQ1Z7GV1T7x3iSr.ad6piQanEeq66', 1, 'student6@mail.com', '2014-12-08 12:11:54', 's85trcxv1p', 1, '/JobFair/images/profileimages/user-default.png', 'student', 'six', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(18, 'student7', '$2a$08$5Q1dX6zQSfwlfsEINQx9WeuwMxLKIfQE3SPQOmR80TSWNYvac27CS', 1, 'student7@mail.com', '2014-12-08 12:12:27', '7kai06xc65', 1, '/JobFair/images/profileimages/user-default.png', 'student', 'seven', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(19, 'student10', '$2a$08$vwEAweAqJJMnewbed.YVZOycFb4nvS9UdRGcWYcwPfg1RTE8dp2aG', 1, 'student10@mail.com', '2014-12-11 10:06:13', 'bosv3vqir3', NULL, '/JobFair/images/profileimages/user-default.png', 'student', 'ten', 0, NULL, NULL, NULL, NULL, 0, 1, NULL, 1, 0),
(22, 'jtrav029@fiu.edu', '$2a$08$igvNQYv.yFI.3JrqELQXte2srqEr0sytDBPrfaNLQpkSRZCO/G9di', 1, 'jtrav029@fiu.edu', '2015-02-01 04:43:13', 'fiu', 1, 'https://lh3.googleusercontent.com/-xjXKxJLmagc/AAAAAAAAAAI/AAAAAAAAACI/8JbHCPrKBYM/photo.jpg', 'Jorge', 'Travieso', 0, NULL, NULL, NULL, NULL, NULL, 1, '116231147857551021368', 1, 0),
(23, 'Guest', '$2a$08$8PspUXq1ggIuTn8.92.qG.rbCwv55mh9irvpfrQY2JiWy4r44k6Pe', 4, 'gueststudent@cs.fiu.edu', '2015-02-07 16:51:19', 'h6c5hy7r70', 1, '/JobFair/images/profileimages/user-default.png', 'Guest', 'Account', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(26, 'sadjadis@gmail.com', '$2a$08$czIQv8g6mh2xH/m/UlpPFOfJv1ksBHaFA4XIe1XgEcGtZ3/HvYy4W', 1, 'sadjadi@cs.fiu.edu', '2015-02-18 09:19:11', 'google', 1, 'https://lh3.googleusercontent.com/-QnmiMU0SQEQ/AAAAAAAAAAI/AAAAAAAAMtw/6TS6oscVgj8/photo.jpg', 'Masoud', 'Sadjadi', 0, 1, 'YZQfQDmyus', '110291442056614091691', NULL, NULL, 1, NULL, 1, 0),
(55, 'RogerSTU', '$2a$08$NG1FTRUINW7fwsajTe06/eGjJ9uvKLIJAFGoUEMq78TJkrkXlX50m', 1, 'ralon038@fiu.edu', '2015-03-03 00:07:12', 'srxnpcjlcz', 1, '/JobFair/images/profileimages/RogerSTUavatar.JPG', 'Rogelio', 'Alonso', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(63, 'hgutierrez.jobs@gmail.com', '$2a$08$HYwdV8.ws5pUCgnL0RUh0ONXun0Km2gH5ihMMsreTW6rKps8972OK', 1, 'hgutierrez.jobs@gmail.com', '2015-04-06 23:27:15', 'google', 1, 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', 'Heidy', 'Gutierrez', 0, NULL, NULL, '105478010618083573451', NULL, NULL, 1, NULL, 1, 0),
(71, 'ralfo028', '$2a$08$ReLLS5nRliHeJ3aaPPFVJ.8OSliAq8b2AdT4llPo8PR97WUhZ5/QW', 1, 'ralfo028@fiu.edu', '2015-06-12 00:28:58', '0mztifdaxz', 1, '/JobFair/images/profileimages/ralfo028avatar.jpg', 'Rene', 'Alfonso', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 1),
(72, 'student15', '$2a$08$XoClsAqz7SUAWGP70Ho2yu9dlls6dIs41e45jkZ3yk5EX0FJZVREe', 1, 'student15@mail.com', '2015-06-12 00:38:37', '70luwuk0hc', NULL, '/JobFair/images/profileimages/user-default.png', 'Student', 'Fifteen', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(74, 'android', '$2a$08$HcWWf.a.A81YQwmrwlCb4eUsl/Vyn9vXIKAN/AD1KaXtq/g/QywDK', 2, 'androidfake@mail.com', '2015-06-12 04:54:18', '54d847sv48', 1, '/JobFair/images/profileimages/androidavatar.png', 'Android', 'Employer', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 1),
(99, 'ymalagon', '$2a$08$E.RAuhaKtoUeT7Dz03ieuOytb3mZLt4063TGBk7Bv1wryS2xmjRtW', 2, 'vjftester@gmail.com', '2015-07-28 01:10:15', '37sjn2yrg9', 1, '/JobFair/images/profileimages/user-default.png', 'Yanniel', 'Malagon', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 0),
(111, 'RogerStuTest', '$2a$08$8YjRNjm.NVqLzPLtT/m2oeiKK1tMqXuwlHXxkLpqwcUELG3ZeGE9q', 1, 'rog.stu.001@gmail.com', '2015-09-25 01:28:48', 'xiquvcp4ws', NULL, '/JobFair/images/profileimages/user-default.png', 'RogerTest', 'StudentTest', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(112, 'Rogelio', '$2a$08$oAH6OSHgszPBqw8srM7Pc.izsXeO7zdglA1q62ZHxK5V9K.hs5FL2', 1, 'rogeloco@gmail.com', '2015-09-25 01:29:12', 'p8lrs4ej6y', NULL, '/JobFair/images/profileimages/user-default.png', 'Rogelio', 'Alonso', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(118, 'sadjadi@cs.fiu.edu', '$2a$08$dmuHiTM5ITbTP7KSNodBlutZX8Dh6jpd7RsVHxT6tQd.442PINVZG', 1, 'sadjadi@cs.fiu.edu', '2015-11-01 10:09:05', 'linkedin', 1, 'https://media.licdn.com/mpr/mprx/0_-FJjC-f7MxFYZ_BcK8UGClSKJyA14_BcrhDCClpr6MLGFF8BY3dA2AeOc-lDUknR1XRiS9atTudB', 'Masoud', 'Sadjadi', 0, 1, 'YZQfQDmyus', NULL, NULL, NULL, 1, NULL, 1, 0),
(120, 'cjone089@fiu.edu', '$2a$08$yNbZHWojF11gvOdmyCKSd.G5vhP5XyLEdszGcPWI8oYADesc6Vlre', 1, 'cjone089@fiu.edu', '2015-11-06 13:40:12', 'linkedin', 1, 'https://media.licdn.com/mpr/mprx/0_abYbNeif2B96MEV_F96F1ZTa2vXR0enaFbHblyuf2Bps0ZXtk9k60yTaoXvQpE9Gb9odKfGm3qBVyugabqUUyyiCkqBUyu8GGqUkBg977zCcnsUYm5Docd4YXTSwzuc1wB0wr7aUtLq', 'Christopher', 'Jones', 0, 1, 'xfuI8MnBZm', '108592330065703210200', NULL, NULL, 1, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE IF NOT EXISTS `usertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `type`) VALUES
(1, 'Student'),
(2, 'Employer'),
(3, 'admin'),
(4, 'Guest_Student'),
(5, 'Guest_Employer');

-- --------------------------------------------------------

--
-- Table structure for table `user_document`
--

CREATE TABLE IF NOT EXISTS `user_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active_status` tinyint(1) NOT NULL,
  `document_id` varchar(256) NOT NULL,
  `local_user_id` int(11) NOT NULL,
  `remote_user_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `document_path` varchar(256) NOT NULL,
  `document_name` varchar(256) NOT NULL,
  `owner_url` varchar(256) NOT NULL,
  `viewer_url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `video_interview`
--

CREATE TABLE IF NOT EXISTS `video_interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FK_employer` int(11) NOT NULL,
  `FK_student` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `session_key` varchar(45) NOT NULL,
  `notification_id` varchar(45) NOT NULL,
  `ScreenShareView` varchar(90) NOT NULL,
  `sharingscreen` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `video_interview`
--

INSERT INTO `video_interview` (`id`, `FK_employer`, `FK_student`, `date`, `time`, `session_key`, `notification_id`, `ScreenShareView`, `sharingscreen`) VALUES
(1, 3, 7, '2014-10-08', '01:50:00', '1VJFID7010597', '14', '', 0),
(2, 12, 15, '2015-07-03', '08:45:00', '2VJFID4159950', '1035', '', 0),
(3, 74, 71, '2015-07-07', '08:45:00', '3VJFID9969094', '1037', '', 0),
(4, 12, 15, '2015-07-18', '08:25:00', '4VJFID3321554', '1041', '', 0),
(5, 74, 71, '2015-07-31', '08:45:00', '5VJFID4812780', '1049', '', 0),
(6, 74, 71, '2015-08-05', '09:00:00', '6VJFID5241908', '1093', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `video_resume`
--

CREATE TABLE IF NOT EXISTS `video_resume` (
  `id` int(11) NOT NULL,
  `video_path` varchar(100) DEFAULT NULL,
  `publish_video` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_resume`
--

INSERT INTO `video_resume` (`id`, `video_path`, `publish_video`) VALUES
(18, '0Ac0SLRZ8ic', 0),
(71, '4ccDCq0YW-w', 1);

-- --------------------------------------------------------

--
-- Table structure for table `whiteboard_sessions`
--

CREATE TABLE IF NOT EXISTS `whiteboard_sessions` (
  `user1` varchar(15) DEFAULT NULL,
  `user2` varchar(15) DEFAULT NULL,
  `interview_id` varchar(20) DEFAULT NULL,
  `image_name` varchar(50) DEFAULT 'none',
  `tmpstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `solr`
--
DROP TABLE IF EXISTS `solr`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `solr` AS select concat(`user`.`id`,`job`.`id`) AS `id`,`user`.`username` AS `username`,`user`.`email` AS `email`,`user`.`registration_date` AS `registration_date`,`user`.`first_name` AS `first_name`,`user`.`last_name` AS `last_name`,`user`.`image_url` AS `image_url`,`job`.`type` AS `type`,`job`.`title` AS `title`,`job`.`post_date` AS `post_date`,`job`.`deadline` AS `deadline`,`job`.`description` AS `description`,`job`.`compensation` AS `compensation`,`job`.`other_requirements` AS `other_requirements`,`job`.`email_notification` AS `email_notification`,`job`.`matches_found` AS `matches_found`,`job`.`posting_url` AS `posting_url`,`job`.`comp_name` AS `comp_name`,`job`.`poster_email` AS `poster_email` from (`user` join `job`) where (`user`.`id` = `job`.`FK_poster`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `fk_application_job_jobid` FOREIGN KEY (`jobid`) REFERENCES `job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_application_user_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `basic_info`
--
ALTER TABLE `basic_info`
  ADD CONSTRAINT `fk_basic_info_user_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `company_info`
--
ALTER TABLE `company_info`
  ADD CONSTRAINT `fk_company_info_user_FK_userid` FOREIGN KEY (`FK_userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `fk_education_school_FK_school_id` FOREIGN KEY (`FK_school_id`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_education_user_FK_user_id` FOREIGN KEY (`FK_user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `fk_experience_user_FK_userid` FOREIGN KEY (`FK_userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `handshake`
--
ALTER TABLE `handshake`
  ADD CONSTRAINT `fk_handshake_job_jobid` FOREIGN KEY (`jobid`) REFERENCES `job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_handshake_user_employerid` FOREIGN KEY (`employerid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_handshake_user_studentid` FOREIGN KEY (`studentid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `fk_job_user_FK_poster` FOREIGN KEY (`FK_poster`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job_skill_map`
--
ALTER TABLE `job_skill_map`
  ADD CONSTRAINT `fk_job_skill_map_job_jobid` FOREIGN KEY (`jobid`) REFERENCES `job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_job_skill_map_skillset_skillid` FOREIGN KEY (`skillid`) REFERENCES `skillset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_user_FK_receiver` FOREIGN KEY (`FK_receiver`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_message_user_FK_sender` FOREIGN KEY (`FK_sender`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `saved_queries`
--
ALTER TABLE `saved_queries`
  ADD CONSTRAINT `saved_queries_ibfk_1` FOREIGN KEY (`FK_userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `SMS`
--
ALTER TABLE `SMS`
  ADD CONSTRAINT `fk_SMS_user_receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SMS_user_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_skill_map`
--
ALTER TABLE `student_skill_map`
  ADD CONSTRAINT `fk_student_skill_map_skillset_skillid` FOREIGN KEY (`skillid`) REFERENCES `skillset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_skill_map_user_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_usertype_FK_usertype` FOREIGN KEY (`FK_usertype`) REFERENCES `usertype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
