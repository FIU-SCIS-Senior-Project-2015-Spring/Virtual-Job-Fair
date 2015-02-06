-- phpMyAdmin SQL Dump
-- version 4.0.10.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 06, 2014 at 07:38 PM
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `api_status`
--

CREATE TABLE IF NOT EXISTS `api_status` (
  `date_modified` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `basic_info`
--

CREATE TABLE IF NOT EXISTS `basic_info` (
  `userid` int(11) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `about_me` text,
  `hide_phone` int(11) DEFAULT NULL,
  `allowSMS` int(11) DEFAULT NULL,
  `validated` int(11) DEFAULT NULL,
  `smsCode` int(11) DEFAULT NULL,
  `tries` int(11) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `idx_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basic_info`
--

INSERT INTO `basic_info` (`userid`, `phone`, `city`, `state`, `about_me`, `hide_phone`, `allowSMS`, `validated`, `smsCode`, `tries`) VALUES
(1, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
(3, '', 'Miami', 'FL', 'Employer one account', 0, 0, NULL, NULL, 0),
(5, NULL, 'Miami/Fort Lauderdale Area', NULL, 'Attended Florida International University', NULL, NULL, NULL, NULL, 0),
(6, '', 'asd', 'FL', 'asdfasdgaSFASD', 0, 0, NULL, NULL, 0),
(7, '7863444844', 'Miami/Fort Lauderdale Area', NULL, 'JDA Support/Application Support Specialist at B/E Aerospace', NULL, 1, NULL, NULL, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`FK_userid`, `name`, `street`, `street2`, `city`, `state`, `zipcode`, `website`, `description`) VALUES
(3, 'Company', 'Some Street', '', 'Miami', 'FL', '33148', 'http://www.google.com', 'Some company in Miami, FL'),
(6, 'asd', 'asd', 'asd', 'asd', 'FL', '33125', '', 'asdasddaas');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `degree`, `major`, `graduation_date`, `FK_school_id`, `FK_user_id`, `gpa`, `additional_info`) VALUES
(1, 'Bachelor''s degree', 'Computer Science', '2014-10-04', 1, 5, NULL, ''),
(2, '', 'Computer Science', '2014-10-06', 1, 7, NULL, ''),
(3, 'Associate of Arts (AA)', 'Computer Programming', '2014-10-06', 2, 7, NULL, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`id`, `FK_userid`, `company_name`, `job_title`, `job_description`, `startdate`, `enddate`, `city`, `state`) VALUES
(1, 7, 'B/E Aerospace', 'JDA Support/Application Support Specialist', 'Monitored non-stop running tasks and provided support to users of in house planning / forecasting tool. Built modules to help achieve better user performance. Kept documentation up to date. Worked with and was part of international team.', '2014-01-01 00:00:00', '0000-00-00 00:00:00', '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `handshake`
--

INSERT INTO `handshake` (`id`, `jobid`, `employerid`, `studentid`) VALUES
(1, 2, 3, 5);

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
  PRIMARY KEY (`id`),
  KEY `idx_FK_poster` (`FK_poster`),
  FULLTEXT KEY `type` (`type`,`title`,`description`,`comp_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `type`, `title`, `FK_poster`, `post_date`, `deadline`, `description`, `compensation`, `other_requirements`, `email_notification`, `active`, `matches_found`, `posting_url`, `comp_name`) VALUES
(1, 'Part Time', 'Software Developer', 3, '2014-10-04 19:02:55', '2014-10-15 00:00:00', '......', '23134', NULL, NULL, 0, NULL, NULL, 'Company'),
(2, 'Full Time', 'asda', 3, '2014-10-04 19:04:39', '2014-10-22 00:00:00', 'sdasfasd', '1235123', NULL, NULL, 1, NULL, NULL, 'Company');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `job_skill_map`
--

INSERT INTO `job_skill_map` (`id`, `jobid`, `skillid`, `level`, `ordering`) VALUES
(1, 2, 58, NULL, 1),
(2, 2, 1, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `match_notification`
--

CREATE TABLE IF NOT EXISTS `match_notification` (
  `userid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `been_read` int(11) DEFAULT NULL,
  `been_deleted` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_FK_receiver` (`FK_receiver`),
  KEY `idx_FK_sender` (`FK_sender`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `sender_id`, `receiver_id`, `datetime`, `been_read`, `message`, `link`, `importancy`) VALUES
(1, 6, 1, '18:55:32', 0, 'asdasd just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/asdasd', 1),
(2, 6, 4, '18:55:32', 0, 'asdasd just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/asdasd', 1),
(3, 6, 5, '18:55:32', 0, 'asdasd just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/asdasd', 1),
(4, 6, 2, '18:55:32', 0, 'There is a new employer named asdasd that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/asdasd', 1),
(5, 3, 1, '19:02:55', 0, 'employer1 just posted a new job: Software Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/1', 1),
(6, 3, 4, '19:02:55', 0, 'employer1 just posted a new job: Software Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/1', 1),
(7, 3, 5, '19:02:55', 0, 'employer1 just posted a new job: Software Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/1', 1),
(8, 3, 1, '19:04:39', 0, 'employer1 just posted a new job: asda. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/2', 1),
(9, 3, 4, '19:04:39', 0, 'employer1 just posted a new job: asda. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/2', 1),
(10, 3, 5, '19:04:39', 0, 'employer1 just posted a new job: asda. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/2', 1),
(11, 3, 5, '19:04:39', 0, 'Hi earen003@fiu.edu, the company employer1 just posted a job asda that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/2', 2),
(12, 3, 5, '19:04:48', 0, 'employer1 is interested in you for the following job post: asda Click here to view the post and consider applying.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/2', 2),
(13, 3, 7, '13:48:24', 1, 'employer1 scheduled a video interview with you on: 2014-10-08 at: 1:50 Good Luck!', 'employer1', 4),
(14, 7, 3, '13:48:24', 1, 'You scheduled an interview with artiom37 at 1:50 on 2014-10-08 Click here to go to the interview page.', 'artiom37', 4);

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

CREATE TABLE IF NOT EXISTS `resume` (
  `id` int(11) NOT NULL,
  `resume` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email_string` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `name`, `email_string`) VALUES
(1, 'Florida International University', NULL),
(2, 'Miami-Dade College', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skillset`
--

CREATE TABLE IF NOT EXISTS `skillset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `skillset`
--

INSERT INTO `skillset` (`id`, `name`) VALUES
(1, 'Java'),
(2, 'SQL'),
(3, 'PHP'),
(6, 'High Availability'),
(7, 'Windows'),
(8, 'HTML'),
(9, 'OS X'),
(10, 'Team Leadership'),
(11, 'Customer Service'),
(12, 'Microsoft Office'),
(13, 'Customer Satisfaction'),
(14, 'MySQL'),
(15, 'PL/SQL'),
(16, 'JavaScript'),
(17, 'CSS'),
(18, 'Web Page Automation'),
(19, 'Selenium'),
(20, 'Linux'),
(21, 'PostgreSQL'),
(24, 'Unix'),
(25, 'AJAX'),
(27, 'jQuery'),
(28, 'MVC'),
(29, 'Web Development'),
(30, 'Yii'),
(31, 'Wordpress'),
(32, 'Android Development'),
(33, 'C'),
(34, 'LAMP'),
(36, 'Database Design'),
(37, 'Relational Databases'),
(38, 'JSP'),
(39, 'Objective-C'),
(40, 'iPhone Application Development'),
(41, 'iOS Development'),
(42, 'Microsoft Excel'),
(43, 'Microsoft Word'),
(44, 'PowerPoint'),
(45, 'Research'),
(46, 'Photoshop'),
(47, 'Social Media'),
(48, 'Teamwork'),
(49, 'Public Speaking'),
(50, 'C++'),
(51, 'Ruby on Rails'),
(52, 'c socket programing'),
(53, 'F#'),
(54, 'Programming'),
(55, 'Managing Database'),
(56, 'Linux Kernel'),
(57, 'Software Engineering'),
(58, ''),
(59, 'Software Development'),
(60, 'Microsoft Visual Studio C++'),
(61, 'Microsoft SQL Server'),
(62, 'NetBeans'),
(63, 'Android SDK'),
(64, 'XML'),
(65, 'Maven'),
(66, 'JUnit');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `student_skill_map`
--

INSERT INTO `student_skill_map` (`id`, `userid`, `skillid`, `level`, `ordering`) VALUES
(1, 5, 54, NULL, 1),
(2, 5, 55, NULL, 2),
(3, 5, 56, NULL, 3),
(4, 5, 57, NULL, 4),
(5, 5, 1, NULL, 5),
(6, 5, 16, NULL, 6),
(7, 5, 3, NULL, 7),
(8, 5, 8, NULL, 8),
(9, 5, 17, NULL, 9),
(10, 5, 53, NULL, 10),
(11, 5, 33, NULL, 11),
(12, 5, 14, NULL, 12),
(13, 7, 59, NULL, 1),
(14, 7, 57, NULL, 2),
(15, 7, 1, NULL, 3),
(16, 7, 8, NULL, 4),
(17, 7, 2, NULL, 5),
(18, 7, 50, NULL, 6),
(19, 7, 16, NULL, 7),
(20, 7, 33, NULL, 8),
(21, 7, 51, NULL, 9),
(22, 7, 60, NULL, 10),
(23, 7, 61, NULL, 11),
(24, 7, 12, NULL, 12),
(25, 7, 62, NULL, 13),
(26, 7, 63, NULL, 14),
(27, 7, 64, NULL, 15),
(28, 7, 65, NULL, 16),
(29, 7, 7, NULL, 17),
(30, 7, 66, NULL, 18);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `FK_usertype`, `email`, `registration_date`, `activation_string`, `activated`, `image_url`, `first_name`, `last_name`, `disable`, `has_viewed_profile`, `linkedinid`, `googleid`, `fiucsid`, `hide_email`, `job_notification`, `fiu_account_id`, `looking_for_job`, `job_int_date`) VALUES
(1, 'student1', '$2a$08$uIjjONcbol5mPr0sa.kzY.6JWHRU3GoKmhKUNzjNaA./oQEfFzmpy', 1, 'student1@mail.com', '2014-06-10 06:57:27', '', 1, '/JobFair/images/profileimages/user-default.png', 'Student', 'One', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(2, 'admin', '$2a$08$uIjjONcbol5mPr0sa.kzY.6JWHRU3GoKmhKUNzjNaA./oQEfFzmpy', 3, 'admin@mail.com', '2014-06-10 06:57:27', '', 1, '/JobFair/images/profileimages/user-default.png', 'Admin', 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(3, 'employer1', '$2a$08$8lGICd9kmq7vnjBaTM6HzOlRVzmzuvDxjkxHNSd7IyU9KRJfEUkry', 2, 'employer1@mail.com', '2014-06-10 07:12:37', '', 1, '/JobFair/images/profileimages/user-default.png', 'Employer', 'One', 0, NULL, NULL, NULL, NULL, 0, 1, NULL, 1, 0),
(4, 'atiur001@fiu.edu', '$2a$08$us0A9mCW6taWL8ceschEt.jrwcepyKJTd/o9/TR0MObFJBRu8/TVC', 1, 'atiur001@fiu.edu', '2014-10-02 11:15:15', 'fiu', 1, 'https://lh6.googleusercontent.com/-UuuYWJqvZFg/AAAAAAAAAAI/AAAAAAAAAL8/LKzTDfl43MI/photo.jpg', 'Artiom', 'Tiurin', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(5, 'earen003@fiu.edu', '$2a$08$.wTFdqjfaVSAekwumRTumOHdMmMcaantOW2SVefl8Od1gCgOTmA/u', 1, 'earen003@fiu.edu', '2014-10-04 15:37:55', 'google', 1, 'https://media.licdn.com/mpr/mprx/0_Gj0mWYPz0DWq_3q5iYr8oxrMUpvN6Cq5iaTi70GUveqBC_QITDYCDzvdlhm', 'Erick', 'Arenas', 0, 1, 'DywORbIHTc', '107193070609153671555', NULL, NULL, 1, NULL, 1, 0),
(6, 'asdasd', '$2a$08$C0uQgg1PHgcwHBnyr0tvzOuuxzJi1LXXbg0UrkGJwDizZc5kdAPFS', 2, 'arenaserick@yahoo.com', '2014-10-04 18:55:32', 'p5hdeidnav', NULL, '/JobFair/images/profileimages/user-default.png', 'asdasd', 'asdasd', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 0),
(7, 'artiom37', '$2a$08$AnOw/C8vz5U/3QTW2jyTiO9kdd4xx/XM/HyHRn2tviFgQ0p7jDUhW', 1, 'atiur001@fiu.edu', '2014-10-06 11:44:55', '0gs57hx6lh', 1, 'https://media.licdn.com/mpr/mprx/0_tBVQ93TSwFf0RgF1NQVerhfSdBO0R7F1vnkIr8l7FixpxmvgcbUEtoRtLEM', 'Artiom', 'Tiurin', 0, 1, '0r-jQ-XO_s', '117155167080414996997', '3615727', NULL, 1, '117155167080414996997', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE IF NOT EXISTS `usertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `type`) VALUES
(1, 'Student'),
(2, 'Employer'),
(3, 'admin');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `video_interview`
--

INSERT INTO `video_interview` (`id`, `FK_employer`, `FK_student`, `date`, `time`, `session_key`, `notification_id`, `ScreenShareView`, `sharingscreen`) VALUES
(1, 3, 7, '2014-10-08', '01:50:00', '1VJFID7010597', '14', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `video_resume`
--

CREATE TABLE IF NOT EXISTS `video_resume` (
  `id` int(11) NOT NULL,
  `video_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD CONSTRAINT `fk_education_user_FK_user_id` FOREIGN KEY (`FK_user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_education_school_FK_school_id` FOREIGN KEY (`FK_school_id`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `fk_experience_user_FK_userid` FOREIGN KEY (`FK_userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `handshake`
--
ALTER TABLE `handshake`
  ADD CONSTRAINT `fk_handshake_user_studentid` FOREIGN KEY (`studentid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_handshake_job_jobid` FOREIGN KEY (`jobid`) REFERENCES `job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_handshake_user_employerid` FOREIGN KEY (`employerid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `fk_job_user_FK_poster` FOREIGN KEY (`FK_poster`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job_skill_map`
--
ALTER TABLE `job_skill_map`
  ADD CONSTRAINT `fk_job_skill_map_skillset_skillid` FOREIGN KEY (`skillid`) REFERENCES `skillset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_job_skill_map_job_jobid` FOREIGN KEY (`jobid`) REFERENCES `job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_user_FK_sender` FOREIGN KEY (`FK_sender`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_message_user_FK_receiver` FOREIGN KEY (`FK_receiver`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `saved_queries`
--
ALTER TABLE `saved_queries`
  ADD CONSTRAINT `saved_queries_ibfk_1` FOREIGN KEY (`FK_userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `SMS`
--
ALTER TABLE `SMS`
  ADD CONSTRAINT `fk_SMS_user_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SMS_user_receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_skill_map`
--
ALTER TABLE `student_skill_map`
  ADD CONSTRAINT `fk_student_skill_map_user_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_skill_map_skillset_skillid` FOREIGN KEY (`skillid`) REFERENCES `skillset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_usertype_FK_usertype` FOREIGN KEY (`FK_usertype`) REFERENCES `usertype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO `jobfairdb`.`usertype` (`id`, `type`) VALUES ('4', 'Guest_Student'), ('5', 'Guest_Employer');