-- phpMyAdmin SQL Dump
-- version 4.0.10.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 26, 2015 at 11:47 PM
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
DROP DATABASE IF EXISTS `jobfairdb`;
CREATE DATABASE IF NOT EXISTS `jobfairdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jobfairdb`;

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

INSERT INTO `basic_info` (`userid`, `phone`, `city`, `state`, `zip_code`, `about_me`, `hide_phone`, `allowSMS`, `validated`, `smsCode`, `tries`) VALUES
(5, NULL, 'Miami/Fort Lauderdale Area', NULL, '0', 'Attended Florida International University', NULL, NULL, NULL, NULL, 0),
(7, '7863444844', 'Miami/Fort Lauderdale Area', NULL, '0', 'JDA Support/Application Support Specialist at B/E Aerospace', NULL, 1, NULL, NULL, 0),
(8, NULL, NULL, NULL, '0', 'Laura Alonso, From: Progressive Insurance (Other)', 1, 0, 1, NULL, 0),
(9, '', 'Alaska', 'Alaska', '99676', '', NULL, 0, 0, NULL, 0),
(11, '', 'Miami', 'FL', '0', 'Just checking out your site. Yii sucks.', 0, 0, NULL, NULL, 0),
(12, '', 'Miami', 'Florida', '0', 'This is my Bio.', 0, 0, 0, NULL, 0),
(14, '', 'Columbia', 'Illinois', '65284', '', NULL, 0, 0, NULL, 0),
(15, '', 'Great Bend', 'Kansas', '67530', '', NULL, 0, 0, NULL, 0),
(16, '', 'Salt Lake City', 'Utah', '84645', '', NULL, 0, 0, NULL, 0),
(17, '', 'Oregon', 'Oregon', '97754', '', NULL, 0, 0, NULL, 0),
(18, '', 'Alaska', 'Alaska', '33125', '', NULL, 0, 0, NULL, 0),
(23, '(305) 348-2744', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
(24, NULL, 'Miami', 'Florida', NULL, 'Guest Employer Account', 1, 0, NULL, NULL, 0),
(26, NULL, 'Miami/Fort Lauderdale Area', NULL, NULL, 'Director of Professional Master of Science in Information Technology Program at Florida International University', NULL, NULL, NULL, NULL, 0),
(55, '13054955901', 'Miami/Fort Lauderdale Area', '', '33196', 'Student at Florida International University', NULL, 0, 0, NULL, 0),
(56, '', 'Miami', 'Florida', NULL, 'This is a test employer.', 0, 0, NULL, NULL, 0),
(57, '', 'Miami', 'Florida', NULL, 'This is a test employer', 0, 0, NULL, NULL, 0),
(60, '1111111111', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(61, '2222222222', 'Miami', 'Florida', NULL, 'I am a test automated recruited @ VJF', 0, 0, NULL, NULL, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`FK_userid`, `name`, `street`, `street2`, `city`, `state`, `zipcode`, `website`, `description`) VALUES
(8, 'Progressive Insurance', NULL, NULL, NULL, NULL, NULL, 'http://www.progressive.com', '<p>Join a place where you can apply your hard-earned skills, test your limits and love what you do.&nbsp;</p>\r\n\r\n<p><strong>Why Progressive?</strong>&nbsp; From day one, you&rsquo;ll contribute to projects integral to company success.&nbsp; We work hard as a team, and our employees are invested in each other&rsquo;s success as much as their own.</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(11, 'Coplat', '7131 SW 142PL', '', 'Miami', 'FL', '33183', '', 'Stuff blah blah blah'),
(12, 'asdasd', '92919', '', 'Miami', 'florida', '33125', 'employertwo.cis.fiu.edu', 'This is my company name.'),
(24, 'Posted by a Guest Employer ', '11200 SW 8th Street, University Park', NULL, 'Miami', 'Florida', '33174', 'www.cs.fiu.edu', 'This is the general company profile for the Guest Employers that post jobs in our system anonymously.'),
(56, 'FIU', '11200 SW 8th St.', '', 'Miami', 'Florida', '33199', 'www.cis.fiu.edu', 'This is FIU.'),
(57, 'FIU', '11200 SW 8th St.', '', 'Miami', 'Florida', '33199', 'www.cis.fiu.edu', 'This is FIU.'),
(61, 'Virtual Company for Testing', '123 main', '', 'Miami', 'Florida', '330178', 'www.vjf.cis.fiu.edu', 'This is a virtual company for system testing purposes');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `degree`, `major`, `graduation_date`, `FK_school_id`, `FK_user_id`, `gpa`, `additional_info`) VALUES
(1, 'Bachelor''s degree', 'Computer Science', '2014-10-04', 1, 5, NULL, ''),
(2, '', 'Computer Science', '2014-10-06', 1, 7, NULL, ''),
(3, 'Associate of Arts (AA)', 'Computer Programming', '2014-10-06', 2, 7, NULL, ''),
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
(84, 'Bachelor', 'Computer Science; Software Development', '1969-12-31', 1, 55, NULL, '');

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
(1, 7, 'B/E Aerospace', 'JDA Support/Application Support Specialist', 'Monitored non-stop running tasks and provided support to users of in house planning / forecasting tool. Built modules to help achieve better user performance. Kept documentation up to date. Worked with and was part of international team.', '2014-01-01 00:00:00', '0000-00-00 00:00:00', '', ''),
(3, 13, 'Juan', 'Manager', 'Managed People', '2014-12-17 00:00:00', '2014-12-31 00:00:00', 'Miami', 'Florida'),
(22, 26, 'Florida International University', 'Director of Professional Master of Science in', '', '2014-01-01 00:00:00', '0000-00-00 00:00:00', '', ''),
(23, 26, 'Flordia International University', 'Associate Professor', '', '2010-08-01 00:00:00', '0000-00-00 00:00:00', '', ''),
(24, 26, 'Florida International University', 'Assistant Professor', '', '2004-08-01 00:00:00', '2010-08-01 00:00:00', '', ''),
(33, 55, 'Ravenscroft Ship Management INC', 'IT Technical Support Officer', 'Supported the roll out of new servers and applications. Installed and configured computer operating systems and\napplications. Monitored and maintained corporation networks and computer systems. Supported and maintained\ncorporate databases playing a key role within the organization. Manage users creating and profiles policy scripts\nwhile dealing with passwords related issues. Provided offsite support to clients and staff to help resolve computer\nsystems issues. Tested and evaluated new technologies later used within the organization.', '2007-01-01 00:00:00', '2014-05-01 00:00:00', '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=130 ;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `type`, `title`, `FK_poster`, `post_date`, `deadline`, `description`, `compensation`, `other_requirements`, `email_notification`, `active`, `matches_found`, `posting_url`, `comp_name`, `poster_email`) VALUES
(114, 'CIS', ' The Great Minds in STEM (GMiS) 2015-16 HENAA', 8, '2015-04-08 00:00:00', '2015-05-30 00:00:00', '<p>Graduating high school seniors, undergraduate students and graduate students, who intend to or are currently pursuing a science, technology, engineering, or math (STEM) degree at an accredited college/university in the U.S. or Puerto Rico, are encouraged to apply for these merit-based scholarships. In addition, students must have an overall minimum 3.0 GPA and must be of Hispanic descent <strong><em>or </em></strong>demonstrate leadership/service within the Hispanic community.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Scholarships offered by GMiS:</strong></h3>\r\n\r\n<p><strong>Corporate / Government Sponsored Scholarships</strong> &ndash; These scholarships are made possible thanks to our dedicated scholarship sponsors from corporate America, federal agencies and affinity groups.<br />\r\n<br />\r\n<strong>Graduate Computer Science Scholarships </strong>&ndash; These highly-competitive $10,000 scholarships are awarded to qualified masters students pursuing a computer science, IT or related software development degree.<br />\r\n<br />\r\n<strong>U.S. Navy STEM Scholarship </strong>- These highly-competitive $10,000 scholarships, in partnership with NAVSEA and SSP,&nbsp;are awarded to qualified graduating high school seniors, who have a minimum 3.0 GPA, and will be pursuing a STEM degree at a Hispanic-Serving Institution (HSI). During their first semester in college, these scholars have the opportunity to apply for the Student Employment Program, which provides them a summer internship and continued funding through their undergraduate career, so long as the student maintains a competitive GPA in a STEM degree.<br />\r\n<br />\r\n<strong>In Memoriam and Personal Scholarships </strong>- Great Minds in STEM awards some very special scholarships, which have been established in the loving memory of an endeared supporter of GMiS or have been established by long-time supporters and dear friends of GMiS.</p>\r\n\r\n<p><br />\r\nTo learn more about all the various types of scholarships offered by GMiS please visit its website.</p>\r\n<p>null</p>\r\n<p>Graduating high school seniors, undergraduate students and graduate students, who intend to or are currently pursuing a science, technology, engineering, or math (STEM) degree at an accredited college/university in the U.S. or Puerto Rico, are encouraged to apply for these merit-based scholarships. In addition, students must have an overall minimum 3.0 GPA and must be of Hispanic descent <strong><em>or </em></strong>demonstrate leadership/service within the Hispanic community.&nbsp;</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$gZDkcsNJoj4Nz9rZuenzquBZA7thKW4aNKsZpG27thHzLoNfib8Vm', 'Great Minds in STEM (GMiS)', NULL),
(115, 'CIS', 'Startup Partner - User Experience Lead - Inno', 8, '2015-04-15 00:00:00', '2015-05-15 00:00:00', '<p>As a Startup Partner championing the user&#39;s point of view and desiging for their best expeirences, you will engage with entrepreneurs to cobuild ideas that change the world. You will leverage your highly creative problem solving skill set, an incomparable end-to-end vision that leverages digital and non-digital design understanding, superior oral/written communication skills, and an unquenchable thirst for building &#39;unicorn&#39; companies.&nbsp;</p>\r\n<ul>\r\n	<li>Drive UX, IA, and design from end-to-end, including use cases, wireframes, gap analyses, mock-ups, prototypes and final product delivery</li>\r\n	<li>Envision (and drive) how users will see and interact with various aspects of an idea as it is brought to life across its different stages</li>\r\n	<li>Collaborate with other startup partners and entrepreneurs within startup cells to execute the user experience vision&nbsp;</li>\r\n	<li>Take ownership at every level of startup ideas&#39; lifecycles</li>\r\n	<li>Design cross platform experiences for mobile, tablet, desktop and any other relevant device</li>\r\n	<li>Manage and develop relationships with entrepreneurs</li>\r\n	<li>Provide a highly seasoned/high-touch experience for entrepreneurs as they enter the Rokk3r Labs portfolio</li>\r\n	<li>Work to establish Rokk3r Labs as the world&#39;s most exciting brand, and help to develop it as the most sought after destination for the world&#39;s best entrepreneurs/ideas and talent.</li>\r\n</ul>\r\n<ul>\r\n	<li>Highly creative problem solving skills (analytical, technical &amp; strategic)</li>\r\n	<li>Superior ability to present to executives</li>\r\n	<li>Superior written/oral communication skills</li>\r\n	<li>Experience as a UX or concept designer&nbsp;</li>\r\n	<li>Experience developing user experiences for startup ideas</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$D5DXnHRaEOiO.abM.AewIuxjDkQxWJOG1VxvphpeXmv1IwShlrG1e', 'Rokk3r Labs', NULL),
(116, 'CIS', 'Statistical Analyst and Programmer', 8, '2015-04-01 00:00:00', '2015-05-31 00:00:00', '<p>We are looking for a smart and talented individual with skills in statistical analysis, regression, business intelligence and programming.&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Strong statistical analysis skills</li>\r\n	<li>Knowledge of statistical theorems</li>\r\n	<li>Knowledge of core technologies such as Python and REST API.</li>\r\n	<li>Knowledge of SCALA programming is a plus</li>\r\n</ul>\r\n\r\n<p>You must be:</p>\r\n\r\n<ul>\r\n	<li>Energetic</li>\r\n	<li>Detailed orientated&nbsp;</li>\r\n	<li>Goal driven</li>\r\n	<li>Fast learner&nbsp;</li>\r\n</ul>\r\n<p>The overall duties are to help us come up with statistical models to common problems and strategies that we have created in addition to observing data and finding patterns and produce and suggest reports, ideas, dashboards and other tools to help our clients.&nbsp;</p>\r\n<ul>\r\n	<li>Programming knowledge</li>\r\n	<li>Statistical analysis</li>\r\n	<li>Calculus</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$fqZ09Dckj2FMVR33lU9t1.1AUJiPf/YBAktC/NWJpBYV0mzR363Gu', 'smartBeemo LLC', NULL),
(117, 'CIS', 'Software Development Intern', 8, '2015-04-03 00:00:00', '2015-12-31 00:00:00', '<p>&bull; Are you a top-notch programmer?<br />\r\n&bull; Are your skills awe-inspiring?<br />\r\n&bull; Are you driven by solving problems that stump 99% of people?</p>\r\n\r\n<p>Then you could work for P1 Analytics!&nbsp; We are looking for great IOS, Android, and web developers to work in our offices as full-time employees or paid interns.&nbsp; Please send us your resume, including any links to interesting products you&rsquo;ve developed, to jobs@p1analytics.com.&nbsp; You have a chance to join a great tech start-up on the ground floor!</p>\r\n<p>Software development.</p>\r\n<p>Programming knowledge at an advanced level for one and at an intermediate level for two of the following: IOS, Android, Javascript, JQuery, Python, SQL, C, C++, PHP, CSS</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$T7SXgRrT3Y5Sg3KiGjazuu2eIHxhqgx1YdbG6H73qq/uZJ0CbAW.O', 'P1 Analytics', NULL),
(118, 'CIS', 'Software Developer', 8, '2015-04-07 00:00:00', '2015-05-07 00:00:00', '<p><strong>Software Developer - Front End</strong></p>\r\n\r\n<p>We are looking for software developers to work on a multi-year project in Miami. The project will involve writing a application framework and various applications that plug into the framework. &nbsp;The goal is an innovative UI/UX that is visually appealing, easy to use and a departure from &quot;the usual&quot;. The target harware will include both mobile devices and large, high-resolution, displays.</p>\r\n<ul style="list-style-type:square">\r\n	<li>Work with UI/UX designers to understand usability, design and aesthetic goals</li>\r\n	<li>Follow coding and design guidelines established by project and company managers</li>\r\n	<li>Write software and unit tests for the software</li>\r\n	<li>Identify and fix defects as needed</li>\r\n	<li>Communicate status to project management</li>\r\n	<li>Identify and recommend improvements as needed</li>\r\n</ul>\r\n<p>Required:</p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>Proficiency with JavaScript and manipulating browser DOM elements</li>\r\n	<li>Proficiency with using browser development tools (debugger, DOM inspector, etc.)</li>\r\n	<li>Knowledge of core computer science fundamentals (algorithms, data structures, etc.)</li>\r\n	<li>Ability to quick learn new ideas and techniques</li>\r\n</ul>\r\n\r\n<p>Desired:</p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>Proficiency with C# and VIsual Studio</li>\r\n	<li>Proficiency with Ajax and other asynchronous or parallel programming techniques</li>\r\n	<li>Familiarity with mobile app development (native or HTML)</li>\r\n	<li>Familiarity with OpenGL/WebGL and/or with HTML Canvas</li>\r\n	<li>Experience working in a software team environment</li>\r\n	<li>Experience with common software development practices (source control, automated builds, continuous integration, etc.)</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$bkEpNB6TaR4A0aQMS83ZieJTRVQslY/zaGAo3FT.cy62FBNzBuRaW', 'Level 11', NULL),
(119, 'CIS', 'Mobile Developer Internship', 8, '2015-04-07 00:00:00', '2015-05-07 00:00:00', '<p><strong>As part of this internship, you&rsquo;ll be learning:</strong></p>\r\n\r\n<ul>\r\n	<li>Best practices in programming.</li>\r\n	<li>Mobile development on iOS and Android.</li>\r\n	<li>How to develop and test code efficiently and effectively.</li>\r\n	<li>To interpret user requirements.</li>\r\n	<li>How to create user stories.</li>\r\n	<li>To integrate API&rsquo;s based on requirements.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n<p><strong>As an intern, you&rsquo;ll be working with our team to:</strong></p>\r\n\r\n<ul>\r\n	<li>Create scalable mobile&nbsp;applications on iOS and Android.</li>\r\n	<li>Utilize the most advanced, commercially available cloud technology available today.</li>\r\n	<li>Work with various programming languages and protocols.</li>\r\n	<li>Integrate various API&rsquo;s from Facebook to Google Maps.</li>\r\n	<li>Collaborate and iterate to create functional, working software.</li>\r\n	<li>Work on building applications for the mobile web.</li>\r\n</ul>\r\n<ul>\r\n<li>Student enrolled in Computer Science or related program&nbsp;at an accredited college or university.</li>\r\n<li>Work a minimum of 20 hours per week.</li>\r\n</ul>\r\n<p><strong>Other Details:</strong></p>\r\n<ul>\r\n<li>Hours: 20 hours per week.</li>\r\n<li>Duration of Internship: 14 weeks.</li>\r\n<li>Work at our location: 2100 Coral Way Suite 701 Miami, FL 33145.</li>\r\n<li>Must be a U.S. Citizen, Permanent Resident or eligible to work in the US.</li>\r\n</ul>\r\n\r\n<p><strong>NOTE</strong>: IT IS THE RESPONSIBILITY OF THE STUDENT TO ARRANGE FOR APPROVAL FOR ACADEMIC CREDIT FROM THE APPROPRIATE ACADEMIC DEPARTMENT PRIOR TO ACCEPTING THE INTERNSHIP FOR CREDIT.</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$KPAW9TD2RatGPJPDnw.rFuRRS39CU0tKy25s1GxKU4L3sbkqg.f/q', 'TECKpert', NULL),
(120, 'CIS', 'Web Developer Internship', 8, '2015-04-07 00:00:00', '2015-05-07 00:00:00', '<p><strong>As part of this internship, you&#39;ll be learning:</strong></p>\r\n\r\n<ul>\r\n	<li>Best practices in programming.</li>\r\n	<li>How to develop and test code efficiently and effectively.</li>\r\n	<li>To interpret user requirements.</li>\r\n	<li>How to create user stories.</li>\r\n	<li>To integrate API&#39;s based on requirements.</li>\r\n</ul>\r\n<p><strong>As an intern, you&#39;ll be working with our team to:</strong></p>\r\n\r\n<ul>\r\n	<li>Create scalable web applications across multiple platforms.</li>\r\n	<li>Build on commercial, open-source, and custom frameworks.</li>\r\n	<li>Utilize the most advanced, commercially available cloud technology available today.</li>\r\n	<li>Create front, and back-end applications.</li>\r\n	<li>Work with various programming languages and protocols.</li>\r\n	<li>Integrate various API&#39;s from Facebook to Google Maps.</li>\r\n	<li>Collaborate and iterate to create functional, working software.</li>\r\n	<li>Work on building applications for the mobile web.</li>\r\n</ul>\r\n<ul>\r\n	<li>Student enrolled in Computer Science or related program&nbsp;at an accredited college or university.</li>\r\n	<li>Work a minimum of 20 hours per week.</li>\r\n</ul>\r\n\r\n<p><strong>Other Details:</strong></p>\r\n\r\n<ul>\r\n	<li>Hours: 20 hours per week.</li>\r\n	<li>Duration of Internship: 14 weeks.</li>\r\n	<li>Work at our location: 2100 Coral Way Suite 701 Miami, FL 33145.</li>\r\n	<li>Must be a U.S. Citizen, Permanent Resident or eligible to work in the US.</li>\r\n</ul>\r\n\r\n<p><strong>NOTE</strong>: IT IS THE RESPONSIBILITY OF THE STUDENT TO ARRANGE FOR APPROVAL FOR ACADEMIC CREDIT FROM THE APPROPRIATE ACADEMIC DEPARTMENT PRIOR TO ACCEPTING THE INTERNSHIP FOR CREDIT.</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$4OcOABR.2yLwXRQ4J4PgAOmRSIi7LvGZ2DPyFmYwQ7YnQtew1YYY.', 'TECKpert', NULL),
(121, 'CIS', ' The Great Minds in STEM (GMiS) 2015-16 HENAA', 8, '2015-04-08 00:00:00', '2015-04-30 00:00:00', '<p>Graduating high school seniors, undergraduate students and graduate students, who intend to or are currently pursuing a science, technology, engineering, or math (STEM) degree at an accredited college/university in the U.S. or Puerto Rico, are encouraged to apply for these merit-based scholarships. In addition, students must have an overall minimum 3.0 GPA and must be of Hispanic descent <strong><em>or </em></strong>demonstrate leadership/service within the Hispanic community.&nbsp;</p>\r\n\r\n<p><em>Here is a small sample of some of the numerous scholarships offered by GMiS:</em></p>\r\n\r\n<p><strong>Corporate / Government Sponsored Scholarships</strong> &ndash; These scholarships are made possible thanks to our dedicated scholarship sponsors from corporate America, federal agencies and affinity groups.<br />\r\n<br />\r\n<strong>Graduate Computer Science Scholarships </strong>&ndash; These highly-competitive $10,000 scholarships are awarded to qualified masters students pursuing a computer science, IT or related software development degree.<br />\r\n<br />\r\n<strong>U.S. Navy STEM Scholarship </strong>- These highly-competitive $10,000 scholarships, in partnership with NAVSEA and SSP,&nbsp;are awarded to qualified graduating high school seniors, who have a minimum 3.0 GPA, and will be pursuing a STEM degree at a Hispanic-Serving Institution (HSI). During their first semester in college, these scholars have the opportunity to apply for the Student Employment Program, which provides them a summer internship and continued funding through their undergraduate career, so long as the student maintains a competitive GPA in a STEM degree.<br />\r\n<br />\r\n<strong>In Memoriam and Personal Scholarships </strong>- Great Minds in STEM awards some very special scholarships, which have been established in the loving memory of an endeared supporter of GMiS or have been established by long-time supporters and dear friends of GMiS.<br />\r\n<br />\r\nTo learn more about all the various types of scholarships offered by GMiS please visit its website.</p>\r\n<p>null</p>\r\n<p>Graduating high school seniors, undergraduate students and graduate students, who intend to or are currently pursuing a science, technology, engineering, or math (STEM) degree at an accredited college/university in the U.S. or Puerto Rico, are encouraged to apply for these merit-based scholarships. In addition, students must have an overall minimum 3.0 GPA and must be of Hispanic descent <strong><em>or </em></strong>demonstrate leadership/service within the Hispanic community.&nbsp;</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$zQASXlbajExbz6fNtc8fAeHEm4.U1ETcVcdez7EWUOt0JZaPnHiCu', 'Great Minds in STEM (GMiS)', NULL),
(122, 'CIS', 'Perl-SQL developer / Linux SysAdmin', 8, '2015-04-09 00:00:00', '2015-06-01 00:00:00', '<p><span style="line-height:1.6em">There are two positions being hired for: a dev job (job #1) and an ops job (job #2).</span></p>\r\n\r\n<p>The developer job seeks candidates familiar with Object Oriented Programming, SQL, and GUI event based programming. &nbsp;We are a perl/postgres/gtk shop so experience with any of those technologies is a plus.</p>\r\n\r\n<p>The operations job requires some travel and on-call duty, and seeks candidates familiar with Unix administration, database administration, and webserver administration. &nbsp;The technologies we use are Linux/Apache/mod_perl/PostgreSQL so experience with any of those technologies is a plus.</p>\r\n\r\n<p>&nbsp;</p>\r\n<p><span style="line-height:1.6em">For the developer job you will be working directly under the CIO on the core product as well as any supplementary products around that codebase.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>For the operations job you will work under my direction primarily servicing the contractual obligations of each state regulatory body we do business with.</p>\r\n<p>Bachelor&#39;s degree, preferably in STEM.</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$Xt5extWQHpDtx1tElTQS2.WK9UQm6LsoSwhOjMX.rVdpZ3IONU98S', 'Bio-Tech Medical Software, Inc.', NULL),
(123, 'CIS', 'Part-Time Opportunity for Student on Webpage ', 8, '2015-04-10 00:00:00', '2015-05-15 00:00:00', '<p>The Physical Oceanography Division is seeking one degree-seeking student in a local College or University to work part-time in web page development.</p>\r\n\r\n<p>This part-time position will require a maximum of 15 hours of work per week and can be partly done remotely. The hourly pay will depend on qualifications. It ranges between $20 and $30.</p>\r\n\r\n<p>The candidate should be legally eligible to take this part-time job.</p>\r\n<p>The selected candidate will maintain and improve the divisional web pages in collaboration with scientists from the Laboratory.</p>\r\n<p>The candidates are expected to have strong knowledge in web page development and design (e.g., php, html, css, java, etc) with general interest in science and very good English writing skills.</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$ZBD4fa0BH09B6mfFIMKkUOZpkEiSyWtyJjDmHP./G/XwpepLYuJbG', 'NOAA Atlantic Oceanographic and Meteorological Laboratory', NULL),
(124, 'CIS', 'Startup Partner - Strategist &amp; Dreamer', 8, '2015-04-15 00:00:00', '2015-05-15 00:00:00', '<p>As a Startup Partner that focuses on bringing ideas to life through the use of development platforms, you will engage with entrepreneurs to cobuild ideas that change the world. You will leverage your insight and experience leveraging mobile and web technologies, a highly creative problem solving skill set, superior oral/written communication skills, and an unquenchable thirst for building &#39;unicorn&#39; companies.</p>\r\n<ul>\r\n	<li>Command technologies to build platforms &amp; products&nbsp;</li>\r\n	<li>Manage and lead the strategic evaluation of startup ideas that enter the Rokk3r Labs ideas pipeline</li>\r\n	<li>Manage and develop relationships with entrepreneurs&nbsp;</li>\r\n	<li>Provide a highly seasoned/high-touch experience for entrepreneurs as they enter the Rokk3r Labs portfolio&nbsp;</li>\r\n	<li>Lead the strategic vision of a startup idea as part of &#39;startup cells&#39; in the pre-launch and post-launch phases</li>\r\n	<li>Work to establish Rokk3r Labs as the world&#39;s most exciting brand, and help to develop it as the most sought after destination for the world&#39;s best entrepreneurs/ideas and talent.&nbsp;</li>\r\n	<li>Think big and fast to enable entrepreneurs to change the world</li>\r\n</ul>\r\n<ul>\r\n	<li>Know you programming stuff!&nbsp;</li>\r\n	<li>Highly creative problem solving skills (analytical, technical &amp; strategic)</li>\r\n	<li>Superior ability to present to executives</li>\r\n	<li>Superior written/oral communication skills</li>\r\n	<li>Ability to recognize business risks and execute pivots</li>\r\n	<li>Think BIG &amp; be fearless!</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$hJKSS2lplAba.4bqhPXSu.dD6xcX/H1wlPIFf6Leznhlix.8oiGTm', 'Rokk3r Labs', NULL),
(125, 'CIS', 'Database Developer', 8, '2015-04-16 00:00:00', '2015-05-16 00:00:00', '<p>The database developer will create a new databse.</p>\r\n<p>We presently have an old database created with Clarion, and need to develop a new one. The new database can be created with any software adequate for rthe job. It will require multiple tables that can merge and combine with one another. Other requirements are: creating reports, extracting reports to a CSV format, creating custom queries, and merging documents with Microsoft Word and Excel.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>The applicant should be an existing student seeking for a paid intership or a graduate interested in freelance work.</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$rbkIQgCdLOErHiSmvoKOq.ws/4jzcTPIwV8iEN7pNWWSmsIF7ijfW', 'Property Tax Specialist Inc', NULL),
(126, 'CIS', 'iOS Developer', 8, '2015-04-21 00:00:00', '2015-07-31 00:00:00', '<p>Fortytwo Sports is looking for an exceptional iOS developer who will assist in the overall developmental process for new products. Our team will strive to use innovative technologies that change how millions of users connect, explore, and interact with information and one another. As an iOS Developer, you will be responsible for implementing front-end and back-end technologies for building a mobile application. You will work with a small team and can switch projects as our fast-paced business grows and evolves. The ideal candidate will be a self-motivated, out-of-the-box thinker, with a &lsquo;can-do, will do&rsquo; attitude with excellent communication skills and an ability to quickly ramp-up skills in new technologies.</p>\r\n\r\n<p>As a key member of a small and versatile team, you will design, test, deploy and maintain software solutions. Our ambitions reach far beyond a small startup company. You have the opportunity to become a principal member in a company looking to accomplish extraordinary measures.</p>\r\n<p><strong>Responsibilities:</strong></p>\r\n\r\n<ul>\r\n	<li>Lead the developmental process for building an iOS application.</li>\r\n	<li>Support the testing and launching efforts of new internet-based applications.</li>\r\n	<li>Serve as a key technical resource in programming applications.</li>\r\n	<li>Assist in developing an optimized back-end codebase.</li>\r\n	<li>Design and improve an ever-expanding database.</li>\r\n</ul>\r\n<p><strong>Preferred Qualifications:</strong></p>\r\n\r\n<ul>\r\n	<li>Fluent in Objective-C or C++.</li>\r\n	<li>Knowledgeable in database and web application development.</li>\r\n	<li>Pursuing or accomplished a BS in Computer Science or related field.</li>\r\n	<li>Interest in user interface design.</li>\r\n	<li>Knowledge of UI frameworks, MVP application design and complex, reactive touch based UI.</li>\r\n	<li>Deep technical knowledge of mobile application development (iOS).</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$cdY1o/w6AeuJis/lNUgxXu47L0J6nIq8Dw837.4/sWn1UNOXjtuZa', 'Fortytwo Sports', NULL),
(127, 'CIS', 'Java Developer', 8, '2015-04-21 00:00:00', '2015-07-31 00:00:00', '<p>Fortytwo Sports is looking for an exceptional java developer who will assist in the overall developmental process for new products. Our team will strive to use innovative technologies that change how millions of users connect, explore, and interact with information and one another. As a Java Developer, you will be responsible for implementing front-end and back-end technologies for building a web application. You will work with a small team and can switch projects as our fast-paced business grows and evolves. The ideal candidate will be a self-motivated, out-of-the-box thinker, with a &lsquo;can-do, will do&rsquo; attitude with excellent communication skills and an ability to quickly ramp-up skills in new technologies. &nbsp;</p>\r\n\r\n<p>As a key member of a small and versatile team, you will design, test, deploy and maintain software solutions. Our ambitions reach far beyond a small startup company. You have the opportunity to become a principal member in a company looking to accomplish extraordinary measures.</p>\r\n<p><strong>Responsibilities:</strong></p>\r\n\r\n<ul>\r\n	<li>Assist in the developmental process for building a web application.</li>\r\n	<li>Support the testing and launching efforts of new internet-based applications.</li>\r\n	<li>Serve as a key technical resource in programming applications.</li>\r\n	<li>Develop an optimized back-end codebase.</li>\r\n	<li>Design and improve an ever-expanding database.</li>\r\n</ul>\r\n<p><strong>Preferred Qualifications:</strong></p>\r\n\r\n<ul>\r\n	<li>Fluent in Java.</li>\r\n	<li>Knowledgeable in database and web application development.</li>\r\n	<li>Pursuing or accomplished a BS in Computer Science or related field.</li>\r\n	<li>Interest in user interface design.</li>\r\n	<li>Strong written and oral communication skills.</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$4naEtknm8m0NBAsaqdmNFu/EqkK1UdbaPPSC22vxNJ/OCIBcBpKa2', 'Fortytwo Sports', NULL),
(128, 'CIS', 'QA Engineer', 8, '2015-04-22 00:00:00', '2015-05-22 00:00:00', '<p><strong>Basic Purpose</strong></p>\r\n\r\n<p>Performs complex testing tasks requiring planning, scheduling, and testing to assure that developed products meet design specifications and are within total quality management limits and standards. Develops and executes test plans, and reviews the product from a user perspective to ensure that all functional requirements are met. Communicates with product developers and technical support specialists on product issues. Operates under minimal supervision.</p>\r\n\r\n<p>&nbsp;</p>\r\n<p><strong>Responsibilities</strong></p>\r\n\r\n<ul>\r\n	<li>Participate in project design sessions from a usability perspective and/or as a domain expert</li>\r\n	<li>Interface with Developers and Business Analysts to develop and implement test plans, test cases and maintain an audit trail</li>\r\n	<li>Participate in review of test cases written by other testers</li>\r\n	<li>Perform functional, installation, integration, stress, load, performance, system, and documentation testing</li>\r\n	<li>Test user interfaces and APIs if applicable</li>\r\n	<li>Identify and prioritize important program defects and enter into defect-tracking tool; track status of reported defects and take appropriate action for timely resolution of outstanding problems</li>\r\n	<li>Contribute to development estimates and schedule</li>\r\n	<li>Demonstrate/encourage teamwork among Aderant, clients, and other parties</li>\r\n	<li>Continual self development in technical, business and analytic areas</li>\r\n	<li>&nbsp;</li>\r\n</ul>\r\n<p><strong>Skills &amp; Requirements</strong></p>\r\n\r\n<ul>\r\n	<li>Bachelor degree in business or computer science is preferred</li>\r\n	<li>Strong communication, writing and editing skills</li>\r\n	<li>Ability to manage multiple projects</li>\r\n	<li>Proficiency in problem recognition and solving skills</li>\r\n	<li>Be able to work well as part of a team and to form liaisons with other groups in order to achieve a desired objective</li>\r\n	<li>Be a self-starter and have an ability to work with little direct supervision on projects</li>\r\n	<li>Dedication to producing quality work and completing tasks within specified time frames</li>\r\n	<li>Some proficiency in testing methodologies, testing products, UI best practices, and design</li>\r\n	<li>Demonstrates troubleshooting and issue resolution skills</li>\r\n	<li>Desire/initiative/ability to learn more advanced technical and design concepts</li>\r\n	<li>Operational understanding of MS Office Applications: Word, Excel, Access, PowerPoint, Visio</li>\r\n	<li>Microsoft Outlook experience</li>\r\n	<li>Microsoft SQL Server experience</li>\r\n	<li>Microsoft Windows experience, all versions and editions</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$zgjqPabN90kNMF4tFFkXqOeHh4Mylg3MfDZUQABJIrrKB/MDsKIxy', 'Aderant', NULL),
(129, 'CIS', 'Software Engineer', 8, '2015-04-22 00:00:00', '2015-05-22 00:00:00', '<p>This is a great opportunity to launch your IT career, and put your strong problem solving and technical skills to good use. As part of our succession and growth plans we&rsquo;re excited about adding a group of highly capable and enthusiastic graduate engineers to our Tallahassee operations.<br />\r\n<br />\r\nYou&rsquo;ll be joining a talented development team working on the latest Aderant Expert application. The team is utilizing some of the most up to date MS technologies, and though you may not have used these in the past, you&rsquo;ll be provided with excellent guidance and support to grow your skills and knowledge.</p>\r\n\r\n<p><br />\r\nWe work in a very team centric environment &ndash; so we&rsquo;re expecting an unusually high level of general communication and relating skills so that you work effectively with your peers and clients.<br />\r\n<br />\r\nThis is a fantastic opportunity for the right people to start and grow a career within the software industry.</p>\r\n<p>After your initial induction period you&rsquo;ll be working on the following duties alongside your team:</p>\r\n\r\n<ul>\r\n	<li>Deliver quality, commercially robust applications, written in .Net and C# and other relevant tools and languages.</li>\r\n	<li>Adopt agile philosophies and contribute towards improving methodology implementation.<br />\r\n	Participate in source code and design reviews as required.</li>\r\n	<li>Work collaboratively with your team to ensure the Project/Development manager is aware of any problems or potential problems that may impact scheduled deadlines to projects.</li>\r\n	<li>Conduct research; prepare models, prototypes, requirement documents and other appropriate documentation to enhance the functional and technical aspects of our products.</li>\r\n</ul>\r\n\r\n<p>We expect that you&rsquo;ll have recently completed an appropriate tertiary qualification. Though this may not be in the computer science field, you are passionate about software development, and looking for your first opportunity to get into a serious software development role. You&rsquo;ll have a real interest in technology and be very proactive solving problems and using your initiative.</p>\r\n<ul>\r\n	<li>4 year degree in Computer Science, Software Engineering or related major</li>\r\n	<li>Experience with .NET and C# is preferred</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$wH7WcTtuUDauWhfAx2.fHeLETQKlqmjx3xbuE52dTFWDMZADrbe3y', 'Aderant', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2280 ;

--
-- Dumping data for table `job_skill_map`
--

INSERT INTO `job_skill_map` (`id`, `jobid`, `skillid`, `level`, `ordering`) VALUES
(1983, 114, 58, NULL, 0),
(1984, 114, 58, NULL, 1),
(1985, 114, 58, NULL, 2),
(1986, 114, 58, NULL, 3),
(1987, 114, 58, NULL, 4),
(1988, 114, 58, NULL, 5),
(1989, 114, 58, NULL, 6),
(1990, 114, 58, NULL, 7),
(1991, 114, 58, NULL, 8),
(1992, 114, 58, NULL, 9),
(1993, 114, 58, NULL, 10),
(1994, 114, 58, NULL, 11),
(1995, 114, 58, NULL, 12),
(1996, 114, 58, NULL, 13),
(1997, 114, 58, NULL, 14),
(1998, 114, 58, NULL, 15),
(1999, 114, 58, NULL, 16),
(2000, 114, 58, NULL, 17),
(2001, 114, 58, NULL, 18),
(2002, 114, 58, NULL, 19),
(2003, 114, 58, NULL, 20),
(2004, 114, 58, NULL, 21),
(2005, 114, 58, NULL, 22),
(2006, 114, 58, NULL, 23),
(2007, 114, 58, NULL, 24),
(2008, 114, 58, NULL, 25),
(2009, 114, 58, NULL, 26),
(2010, 114, 58, NULL, 27),
(2011, 114, 58, NULL, 28),
(2012, 114, 58, NULL, 29),
(2013, 114, 58, NULL, 30),
(2014, 114, 58, NULL, 31),
(2015, 114, 58, NULL, 32),
(2016, 114, 58, NULL, 33),
(2017, 114, 58, NULL, 34),
(2018, 114, 58, NULL, 35),
(2019, 114, 58, NULL, 36),
(2020, 114, 58, NULL, 37),
(2021, 115, 58, NULL, 0),
(2022, 115, 58, NULL, 1),
(2023, 115, 58, NULL, 2),
(2024, 115, 58, NULL, 3),
(2025, 115, 58, NULL, 4),
(2026, 115, 58, NULL, 5),
(2027, 115, 58, NULL, 6),
(2028, 115, 58, NULL, 7),
(2029, 115, 58, NULL, 8),
(2030, 115, 58, NULL, 9),
(2031, 115, 58, NULL, 10),
(2032, 115, 58, NULL, 11),
(2033, 115, 58, NULL, 12),
(2034, 115, 58, NULL, 13),
(2035, 115, 58, NULL, 14),
(2036, 115, 58, NULL, 15),
(2037, 116, 58, NULL, 0),
(2038, 116, 58, NULL, 1),
(2039, 116, 54, NULL, 2),
(2040, 116, 99, NULL, 3),
(2041, 116, 76, NULL, 4),
(2042, 116, 54, NULL, 5),
(2043, 116, 58, NULL, 6),
(2044, 116, 58, NULL, 7),
(2045, 117, 58, NULL, 0),
(2046, 117, 58, NULL, 1),
(2047, 117, 58, NULL, 2),
(2048, 117, 58, NULL, 3),
(2049, 117, 58, NULL, 4),
(2050, 117, 58, NULL, 5),
(2051, 117, 58, NULL, 6),
(2052, 117, 58, NULL, 7),
(2053, 117, 16, NULL, 8),
(2054, 117, 58, NULL, 9),
(2055, 117, 27, NULL, 10),
(2056, 117, 58, NULL, 11),
(2057, 117, 99, NULL, 12),
(2058, 117, 58, NULL, 13),
(2059, 117, 2, NULL, 14),
(2060, 117, 58, NULL, 15),
(2061, 117, 33, NULL, 16),
(2062, 117, 58, NULL, 17),
(2063, 117, 50, NULL, 18),
(2064, 117, 58, NULL, 19),
(2065, 117, 3, NULL, 20),
(2066, 117, 58, NULL, 21),
(2067, 118, 58, NULL, 0),
(2068, 118, 58, NULL, 1),
(2069, 118, 58, NULL, 2),
(2070, 118, 58, NULL, 3),
(2071, 118, 58, NULL, 4),
(2072, 118, 58, NULL, 5),
(2073, 118, 58, NULL, 6),
(2074, 118, 16, NULL, 7),
(2075, 118, 58, NULL, 8),
(2076, 118, 58, NULL, 9),
(2077, 118, 58, NULL, 10),
(2078, 118, 58, NULL, 11),
(2079, 118, 25, NULL, 12),
(2080, 118, 54, NULL, 13),
(2081, 118, 8, NULL, 14),
(2082, 118, 58, NULL, 15),
(2083, 118, 58, NULL, 16),
(2084, 118, 58, NULL, 17),
(2085, 119, 58, NULL, 0),
(2086, 119, 54, NULL, 1),
(2087, 119, 58, NULL, 2),
(2088, 119, 58, NULL, 3),
(2089, 119, 54, NULL, 4),
(2090, 119, 58, NULL, 5),
(2091, 119, 58, NULL, 6),
(2092, 119, 58, NULL, 7),
(2093, 119, 58, NULL, 8),
(2094, 120, 58, NULL, 0),
(2095, 120, 54, NULL, 1),
(2096, 120, 58, NULL, 2),
(2097, 120, 58, NULL, 3),
(2098, 120, 58, NULL, 4),
(2099, 120, 58, NULL, 5),
(2100, 120, 58, NULL, 6),
(2101, 120, 54, NULL, 7),
(2102, 120, 58, NULL, 8),
(2103, 120, 58, NULL, 9),
(2104, 120, 58, NULL, 10),
(2105, 120, 58, NULL, 11),
(2106, 121, 58, NULL, 0),
(2107, 121, 58, NULL, 1),
(2108, 121, 58, NULL, 2),
(2109, 121, 58, NULL, 3),
(2110, 121, 58, NULL, 4),
(2111, 121, 58, NULL, 5),
(2112, 121, 58, NULL, 6),
(2113, 121, 58, NULL, 7),
(2114, 121, 58, NULL, 8),
(2115, 121, 58, NULL, 9),
(2116, 121, 58, NULL, 10),
(2117, 121, 58, NULL, 11),
(2118, 121, 58, NULL, 12),
(2119, 121, 58, NULL, 13),
(2120, 121, 58, NULL, 14),
(2121, 121, 58, NULL, 15),
(2122, 121, 58, NULL, 16),
(2123, 121, 58, NULL, 17),
(2124, 121, 58, NULL, 18),
(2125, 121, 58, NULL, 19),
(2126, 121, 58, NULL, 20),
(2127, 121, 58, NULL, 21),
(2128, 121, 58, NULL, 22),
(2129, 121, 58, NULL, 23),
(2130, 121, 58, NULL, 24),
(2131, 121, 58, NULL, 25),
(2132, 121, 58, NULL, 26),
(2133, 121, 58, NULL, 27),
(2134, 121, 58, NULL, 28),
(2135, 121, 58, NULL, 29),
(2136, 121, 58, NULL, 30),
(2137, 121, 58, NULL, 31),
(2138, 121, 58, NULL, 32),
(2139, 121, 58, NULL, 33),
(2140, 121, 58, NULL, 34),
(2141, 121, 58, NULL, 35),
(2142, 121, 58, NULL, 36),
(2143, 121, 58, NULL, 37),
(2144, 121, 58, NULL, 38),
(2145, 122, 54, NULL, 0),
(2146, 122, 58, NULL, 1),
(2147, 122, 2, NULL, 2),
(2148, 122, 58, NULL, 3),
(2149, 122, 54, NULL, 4),
(2150, 122, 58, NULL, 5),
(2151, 122, 101, NULL, 6),
(2152, 122, 58, NULL, 7),
(2153, 122, 24, NULL, 8),
(2154, 122, 58, NULL, 9),
(2155, 122, 58, NULL, 10),
(2156, 122, 58, NULL, 11),
(2157, 122, 20, NULL, 12),
(2158, 122, 70, NULL, 13),
(2159, 122, 21, NULL, 14),
(2160, 122, 58, NULL, 15),
(2161, 123, 58, NULL, 0),
(2162, 123, 58, NULL, 1),
(2163, 123, 58, NULL, 2),
(2164, 123, 58, NULL, 3),
(2165, 123, 3, NULL, 4),
(2166, 123, 58, NULL, 5),
(2167, 123, 8, NULL, 6),
(2168, 123, 58, NULL, 7),
(2169, 123, 17, NULL, 8),
(2170, 123, 58, NULL, 9),
(2171, 123, 1, NULL, 10),
(2172, 123, 58, NULL, 11),
(2173, 124, 58, NULL, 0),
(2174, 124, 58, NULL, 1),
(2175, 124, 58, NULL, 2),
(2176, 124, 58, NULL, 3),
(2177, 124, 58, NULL, 4),
(2178, 124, 58, NULL, 5),
(2179, 124, 54, NULL, 6),
(2180, 124, 58, NULL, 7),
(2181, 125, 58, NULL, 0),
(2182, 125, 58, NULL, 1),
(2183, 125, 58, NULL, 2),
(2184, 125, 58, NULL, 3),
(2185, 125, 58, NULL, 4),
(2186, 125, 58, NULL, 5),
(2187, 125, 58, NULL, 6),
(2188, 126, 58, NULL, 0),
(2189, 126, 58, NULL, 1),
(2190, 126, 58, NULL, 2),
(2191, 126, 58, NULL, 3),
(2192, 126, 58, NULL, 4),
(2193, 126, 58, NULL, 5),
(2194, 126, 58, NULL, 6),
(2195, 126, 58, NULL, 7),
(2196, 126, 58, NULL, 8),
(2197, 126, 58, NULL, 9),
(2198, 126, 58, NULL, 10),
(2199, 126, 58, NULL, 11),
(2200, 126, 58, NULL, 12),
(2201, 126, 58, NULL, 13),
(2202, 126, 58, NULL, 14),
(2203, 126, 54, NULL, 15),
(2204, 126, 39, NULL, 16),
(2205, 126, 50, NULL, 17),
(2206, 126, 58, NULL, 18),
(2207, 126, 58, NULL, 19),
(2208, 127, 1, NULL, 0),
(2209, 127, 58, NULL, 1),
(2210, 127, 58, NULL, 2),
(2211, 127, 58, NULL, 3),
(2212, 127, 58, NULL, 4),
(2213, 127, 1, NULL, 5),
(2214, 127, 58, NULL, 6),
(2215, 127, 58, NULL, 7),
(2216, 127, 58, NULL, 8),
(2217, 127, 58, NULL, 9),
(2218, 127, 58, NULL, 10),
(2219, 127, 58, NULL, 11),
(2220, 127, 58, NULL, 12),
(2221, 127, 58, NULL, 13),
(2222, 127, 58, NULL, 14),
(2223, 127, 58, NULL, 15),
(2224, 127, 58, NULL, 16),
(2225, 127, 58, NULL, 17),
(2226, 127, 54, NULL, 18),
(2227, 127, 1, NULL, 19),
(2228, 128, 58, NULL, 0),
(2229, 128, 58, NULL, 1),
(2230, 128, 58, NULL, 2),
(2231, 128, 58, NULL, 3),
(2232, 128, 58, NULL, 4),
(2233, 128, 58, NULL, 5),
(2234, 128, 58, NULL, 6),
(2235, 128, 58, NULL, 7),
(2236, 128, 58, NULL, 8),
(2237, 128, 58, NULL, 9),
(2238, 128, 58, NULL, 10),
(2239, 128, 58, NULL, 11),
(2240, 128, 58, NULL, 12),
(2241, 128, 58, NULL, 13),
(2242, 128, 48, NULL, 14),
(2243, 128, 58, NULL, 15),
(2244, 128, 58, NULL, 16),
(2245, 128, 58, NULL, 17),
(2246, 128, 58, NULL, 18),
(2247, 128, 58, NULL, 19),
(2248, 128, 58, NULL, 20),
(2249, 128, 58, NULL, 21),
(2250, 128, 58, NULL, 22),
(2251, 128, 58, NULL, 23),
(2252, 128, 58, NULL, 24),
(2253, 128, 44, NULL, 25),
(2254, 128, 58, NULL, 26),
(2255, 128, 2, NULL, 27),
(2256, 128, 7, NULL, 28),
(2257, 128, 58, NULL, 29),
(2258, 129, 58, NULL, 0),
(2259, 129, 58, NULL, 1),
(2260, 129, 58, NULL, 2),
(2261, 129, 58, NULL, 3),
(2262, 129, 58, NULL, 4),
(2263, 129, 58, NULL, 5),
(2264, 129, 58, NULL, 6),
(2265, 129, 58, NULL, 7),
(2266, 129, 58, NULL, 8),
(2267, 129, 58, NULL, 9),
(2268, 129, 58, NULL, 10),
(2269, 129, 58, NULL, 11),
(2270, 129, 58, NULL, 12),
(2271, 129, 58, NULL, 13),
(2272, 129, 58, NULL, 14),
(2273, 129, 58, NULL, 15),
(2274, 129, 58, NULL, 16),
(2275, 129, 58, NULL, 17),
(2276, 129, 58, NULL, 18),
(2277, 129, 58, NULL, 19),
(2278, 129, 58, NULL, 20),
(2279, 129, 58, NULL, 21);

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
(2, 1, '2014-12-11 15:58:33');

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
  `sender_deleted` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_FK_receiver` (`FK_receiver`),
  KEY `idx_FK_sender` (`FK_sender`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=912 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `sender_id`, `receiver_id`, `datetime`, `been_read`, `message`, `link`, `importancy`) VALUES
(2, 6, 4, '18:55:32', 0, 'asdasd just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/asdasd', 1),
(3, 6, 5, '18:55:32', 0, 'asdasd just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/asdasd', 1),
(4, 6, 2, '18:55:32', 0, 'There is a new employer named asdasd that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/asdasd', 1),
(5, 3, 1, '19:02:55', 1, 'employer1 just posted a new job: Software Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/1', 1),
(6, 3, 4, '19:02:55', 0, 'employer1 just posted a new job: Software Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/1', 1),
(7, 3, 5, '19:02:55', 0, 'employer1 just posted a new job: Software Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/1', 1),
(8, 3, 1, '19:04:39', 1, 'employer1 just posted a new job: asda. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/2', 1),
(9, 3, 4, '19:04:39', 0, 'employer1 just posted a new job: asda. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/2', 1),
(10, 3, 5, '19:04:39', 0, 'employer1 just posted a new job: asda. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/2', 1),
(11, 3, 5, '19:04:39', 0, 'Hi earen003@fiu.edu, the company employer1 just posted a job asda that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/2', 2),
(12, 3, 5, '19:04:48', 0, 'employer1 is interested in you for the following job post: asda Click here to view the post and consider applying.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/2', 2),
(13, 3, 7, '13:48:24', 1, 'employer1 scheduled a video interview with you on: 2014-10-08 at: 1:50 Good Luck!', 'employer1', 4),
(14, 7, 3, '13:48:24', 1, 'You scheduled an interview with artiom37 at 1:50 on 2014-10-08 Click here to go to the interview page.', 'artiom37', 4),
(15, 3, 1, '14:38:18', 1, 'employer1 just posted a new job: abc. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/3', 1),
(16, 3, 4, '14:38:18', 0, 'employer1 just posted a new job: abc. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/3', 1),
(17, 3, 5, '14:38:18', 0, 'employer1 just posted a new job: abc. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/3', 1),
(18, 3, 7, '14:38:18', 0, 'employer1 just posted a new job: abc. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/3', 1),
(19, 3, 1, '14:38:46', 1, 'employer1 just posted a new job: abc. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/4', 1),
(20, 3, 4, '14:38:46', 0, 'employer1 just posted a new job: abc. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/4', 1),
(21, 3, 5, '14:38:46', 0, 'employer1 just posted a new job: abc. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/4', 1),
(22, 3, 7, '14:38:46', 0, 'employer1 just posted a new job: abc. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/4', 1),
(23, 3, 5, '14:38:46', 0, 'Hi earen003@fiu.edu, the company employer1 just posted a job abc that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/4', 2),
(24, 3, 7, '14:38:46', 0, 'Hi artiom37, the company employer1 just posted a job abc that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/4', 2),
(25, 11, 1, '13:10:33', 0, 'nmad43 just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/nmad43', 1),
(26, 11, 4, '13:10:33', 0, 'nmad43 just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/nmad43', 1),
(27, 11, 5, '13:10:33', 0, 'nmad43 just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/nmad43', 1),
(28, 11, 7, '13:10:33', 0, 'nmad43 just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/nmad43', 1),
(29, 11, 9, '13:10:33', 0, 'nmad43 just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/nmad43', 1),
(30, 11, 10, '13:10:33', 0, 'nmad43 just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/nmad43', 1),
(31, 11, 2, '13:10:33', 0, 'There is a new employer named nmad43 that is waiting for acctivation', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/nmad43', 1),
(32, 3, 1, '14:15:27', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/31', 1),
(33, 3, 4, '14:15:27', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/31', 1),
(34, 3, 5, '14:15:27', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/31', 1),
(35, 3, 7, '14:15:27', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/31', 1),
(36, 3, 9, '14:15:27', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/31', 1),
(37, 3, 10, '14:15:27', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/31', 1),
(38, 3, 1, '14:15:47', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/32', 1),
(39, 3, 4, '14:15:47', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/32', 1),
(40, 3, 5, '14:15:47', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/32', 1),
(41, 3, 7, '14:15:47', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/32', 1),
(42, 3, 9, '14:15:47', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/32', 1),
(43, 3, 10, '14:15:47', 0, 'employer1 just posted a new job: Thing. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/32', 1),
(44, 3, 1, '14:15:47', 0, 'Hi student1, the company employer1 just posted a job Thing that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/32', 2),
(45, 3, 7, '14:15:47', 0, 'Hi artiom37, the company employer1 just posted a job Thing that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/32', 2),
(46, 3, 5, '14:15:47', 0, 'Hi earen003@fiu.edu, the company employer1 just posted a job Thing that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/32', 2),
(47, 12, 1, '17:33:16', 0, 'employer10 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/employer10', 1),
(48, 12, 4, '17:33:16', 0, 'employer10 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/employer10', 1),
(49, 12, 5, '17:33:16', 0, 'employer10 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/employer10', 1),
(50, 12, 7, '17:33:16', 0, 'employer10 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/employer10', 1),
(51, 12, 9, '17:33:16', 0, 'employer10 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/employer10', 1),
(52, 12, 10, '17:33:16', 0, 'employer10 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/employer10', 1),
(53, 12, 2, '17:33:16', 0, 'There is a new employer named employer10 that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/employer10', 1),
(55, 12, 4, '17:36:49', 0, 'employer10 just posted a new job: the job of ur life. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/33', 1),
(56, 12, 5, '17:36:49', 0, 'employer10 just posted a new job: the job of ur life. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/33', 1),
(57, 12, 7, '17:36:49', 0, 'employer10 just posted a new job: the job of ur life. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/33', 1),
(58, 12, 9, '17:36:49', 0, 'employer10 just posted a new job: the job of ur life. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/33', 1),
(59, 12, 10, '17:36:49', 0, 'employer10 just posted a new job: the job of ur life. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/33', 1),
(60, 12, 5, '17:36:49', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job the job of ur life that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/33', 2),
(61, 12, 7, '17:36:49', 0, 'Hi artiom37, the company employer10 just posted a job the job of ur life that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/33', 2),
(62, 12, 1, '17:36:49', 1, 'Hi student1, the company employer10 just posted a job the job of ur life that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/33', 2),
(63, 12, 1, '21:00:13', 0, 'employer10 just posted a new job: Software Tester. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/39', 1),
(64, 12, 5, '21:00:13', 0, 'employer10 just posted a new job: Software Tester. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/39', 1),
(65, 12, 7, '21:00:13', 0, 'employer10 just posted a new job: Software Tester. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/39', 1),
(66, 12, 9, '21:00:13', 0, 'employer10 just posted a new job: Software Tester. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/39', 1),
(67, 12, 13, '21:00:13', 0, 'employer10 just posted a new job: Software Tester. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/39', 1),
(68, 12, 14, '21:00:13', 0, 'employer10 just posted a new job: Software Tester. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/39', 1),
(69, 12, 15, '21:00:13', 0, 'employer10 just posted a new job: Software Tester. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/39', 1),
(70, 12, 16, '21:00:13', 0, 'employer10 just posted a new job: Software Tester. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/39', 1),
(71, 12, 17, '21:00:13', 0, 'employer10 just posted a new job: Software Tester. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/39', 1),
(72, 12, 18, '21:00:13', 0, 'employer10 just posted a new job: Software Tester. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/39', 1),
(73, 12, 19, '21:00:13', 0, 'employer10 just posted a new job: Software Tester. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/39', 1),
(74, 12, 1, '21:02:33', 0, 'employer10 just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 1),
(75, 12, 5, '21:02:33', 0, 'employer10 just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 1),
(76, 12, 7, '21:02:33', 0, 'employer10 just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 1),
(77, 12, 9, '21:02:33', 0, 'employer10 just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 1),
(78, 12, 13, '21:02:33', 0, 'employer10 just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 1),
(79, 12, 14, '21:02:33', 0, 'employer10 just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 1),
(80, 12, 15, '21:02:33', 0, 'employer10 just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 1),
(81, 12, 16, '21:02:33', 0, 'employer10 just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 1),
(82, 12, 17, '21:02:33', 0, 'employer10 just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 1),
(83, 12, 18, '21:02:33', 0, 'employer10 just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 1),
(84, 12, 19, '21:02:33', 0, 'employer10 just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 1),
(85, 12, 7, '21:02:33', 0, 'Hi artiom37, the company employer10 just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 2),
(86, 12, 5, '21:02:33', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/40', 2),
(87, 21, 1, '16:01:50', 0, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(88, 21, 5, '16:01:50', 0, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(89, 21, 7, '16:01:50', 0, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(90, 21, 9, '16:01:50', 0, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(91, 21, 13, '16:01:50', 0, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(92, 21, 14, '16:01:50', 0, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(93, 21, 15, '16:01:50', 0, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(94, 21, 16, '16:01:50', 0, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(95, 21, 17, '16:01:50', 0, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(96, 21, 18, '16:01:50', 0, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(97, 21, 19, '16:01:50', 0, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(98, 21, 20, '16:01:50', 1, 'RogerEMP just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(99, 21, 2, '16:01:50', 0, 'There is a new employer named RogerEMP that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEMP', 1),
(100, 24, 1, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(101, 24, 5, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(102, 24, 7, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(103, 24, 9, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(104, 24, 13, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(105, 24, 14, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(106, 24, 15, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(107, 24, 16, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(108, 24, 17, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(109, 24, 18, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(110, 24, 19, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(111, 24, 20, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(112, 24, 22, '19:18:29', 0, 'GuestEmployer just posted a new job: C++ DEVELOPER. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/47', 1),
(113, 24, 1, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(114, 24, 5, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(115, 24, 7, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(116, 24, 9, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(117, 24, 13, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(118, 24, 14, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(119, 24, 15, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(120, 24, 16, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(121, 24, 17, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(122, 24, 18, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(123, 24, 19, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(124, 24, 20, '19:34:27', 1, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(125, 24, 22, '19:34:27', 0, 'GuestEmployer just posted a new job: F # Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/48', 1),
(126, 24, 1, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(127, 24, 5, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(128, 24, 7, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(129, 24, 9, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(130, 24, 13, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(131, 24, 14, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(132, 24, 15, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(133, 24, 16, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(134, 24, 17, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(135, 24, 18, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(136, 24, 19, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(137, 24, 20, '20:08:11', 1, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(138, 24, 22, '20:08:11', 0, 'GuestEmployer just posted a new job: http://vjf-dev.cis.fiu.edu/JobFair/index.php/site/login. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/49', 1),
(139, 28, 1, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(140, 28, 5, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(141, 28, 7, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(142, 28, 9, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(143, 28, 13, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(144, 28, 14, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(145, 28, 15, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(146, 28, 16, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(147, 28, 17, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(148, 28, 18, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(149, 28, 19, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(150, 28, 20, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(151, 28, 22, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(152, 28, 25, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(153, 28, 26, '16:38:29', 0, 'RogerEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(154, 28, 2, '16:38:29', 0, 'There is a new employer named RogerEmp that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(155, 28, 27, '16:38:29', 0, 'There is a new employer named RogerEmp that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmp', 1),
(156, 36, 1, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(157, 36, 5, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(158, 36, 7, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(159, 36, 9, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(160, 36, 13, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(161, 36, 14, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(162, 36, 15, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(163, 36, 16, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(164, 36, 17, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(165, 36, 18, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(166, 36, 19, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(167, 36, 20, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(168, 36, 22, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(169, 36, 25, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(170, 36, 26, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(171, 36, 29, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(172, 36, 30, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(173, 36, 31, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(174, 36, 32, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(175, 36, 33, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(176, 36, 34, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(177, 36, 35, '00:43:43', 0, 'rogemp001 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(178, 36, 2, '00:43:43', 0, 'There is a new employer named rogemp001 that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(179, 36, 27, '00:43:43', 0, 'There is a new employer named rogemp001 that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/rogemp001', 1),
(180, 36, 1, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(181, 36, 5, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(182, 36, 7, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(183, 36, 9, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(184, 36, 13, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(185, 36, 14, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(186, 36, 15, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(187, 36, 16, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(188, 36, 17, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(189, 36, 18, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(190, 36, 19, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(191, 36, 20, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(192, 36, 22, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(193, 36, 25, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(194, 36, 26, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(195, 36, 29, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(196, 36, 30, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(197, 36, 31, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(198, 36, 32, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(199, 36, 33, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(200, 36, 34, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(201, 36, 35, '01:16:09', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 1),
(202, 36, 1, '01:16:09', 0, 'Hi student1, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 2),
(203, 36, 20, '01:16:09', 0, 'Hi ralon039@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 2),
(204, 36, 7, '01:16:09', 0, 'Hi artiom37, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 2),
(205, 36, 5, '01:16:09', 0, 'Hi earen003@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/50', 2),
(206, 24, 1, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(207, 24, 5, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(208, 24, 7, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(209, 24, 9, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(210, 24, 13, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(211, 24, 14, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(212, 24, 15, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(213, 24, 16, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(214, 24, 17, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(215, 24, 18, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(216, 24, 19, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(217, 24, 20, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(218, 24, 22, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(219, 24, 25, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(220, 24, 26, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(221, 24, 32, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(222, 24, 33, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(223, 24, 34, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(224, 24, 35, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(225, 24, 47, '16:01:52', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 1),
(226, 24, 20, '16:01:52', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 2),
(227, 24, 5, '16:01:52', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 2),
(228, 24, 7, '16:01:52', 0, 'Hi artiom37, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 2),
(229, 24, 18, '16:01:52', 0, 'Hi student7, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 2),
(230, 24, 16, '16:01:52', 0, 'Hi student5, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/55', 2),
(231, 24, 1, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(232, 24, 5, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(233, 24, 7, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(234, 24, 9, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(235, 24, 13, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(236, 24, 14, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(237, 24, 15, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(238, 24, 16, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(239, 24, 17, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(240, 24, 18, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(241, 24, 19, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(242, 24, 20, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(243, 24, 22, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(244, 24, 25, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(245, 24, 26, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(246, 24, 32, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(247, 24, 33, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(248, 24, 34, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(249, 24, 35, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(250, 24, 47, '16:13:21', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/56', 1),
(251, 24, 1, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(252, 24, 5, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(253, 24, 7, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(254, 24, 9, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(255, 24, 13, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(256, 24, 14, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(257, 24, 15, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(258, 24, 16, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(259, 24, 17, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(260, 24, 18, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(261, 24, 19, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(262, 24, 20, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(263, 24, 22, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(264, 24, 25, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(265, 24, 26, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(266, 24, 32, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(267, 24, 33, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(268, 24, 34, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(269, 24, 35, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(270, 24, 47, '16:21:35', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 1),
(271, 24, 14, '16:21:35', 0, 'Hi student3, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 2);
INSERT INTO `notification` (`id`, `sender_id`, `receiver_id`, `datetime`, `been_read`, `message`, `link`, `importancy`) VALUES
(272, 24, 20, '16:21:35', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 2),
(273, 24, 1, '16:21:35', 0, 'Hi student1, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 2),
(274, 24, 5, '16:21:35', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/57', 2),
(275, 24, 1, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(276, 24, 5, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(277, 24, 7, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(278, 24, 9, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(279, 24, 13, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(280, 24, 14, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(281, 24, 15, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(282, 24, 16, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(283, 24, 17, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(284, 24, 18, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(285, 24, 19, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(286, 24, 20, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(287, 24, 22, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(288, 24, 25, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(289, 24, 26, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(290, 24, 32, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(291, 24, 33, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(292, 24, 34, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(293, 24, 35, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(294, 24, 47, '16:25:11', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 1),
(295, 24, 7, '16:25:11', 0, 'Hi artiom37, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 2),
(296, 24, 5, '16:25:11', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 2),
(297, 24, 20, '16:25:11', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 2),
(298, 24, 16, '16:25:11', 0, 'Hi student5, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/58', 2),
(299, 24, 1, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(300, 24, 5, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(301, 24, 7, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(302, 24, 9, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(303, 24, 13, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(304, 24, 14, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(305, 24, 15, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(306, 24, 16, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(307, 24, 17, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(308, 24, 18, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(309, 24, 19, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(310, 24, 20, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(311, 24, 22, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(312, 24, 25, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(313, 24, 26, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(314, 24, 32, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(315, 24, 33, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(316, 24, 34, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(317, 24, 35, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(318, 24, 47, '16:32:22', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 1),
(319, 24, 20, '16:32:22', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 2),
(320, 24, 5, '16:32:22', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 2),
(321, 24, 7, '16:32:22', 0, 'Hi artiom37, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 2),
(322, 24, 18, '16:32:22', 0, 'Hi student7, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 2),
(323, 24, 16, '16:32:22', 0, 'Hi student5, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/59', 2),
(324, 24, 1, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(325, 24, 5, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(326, 24, 7, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(327, 24, 9, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(328, 24, 13, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(329, 24, 14, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(330, 24, 15, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(331, 24, 16, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(332, 24, 17, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(333, 24, 18, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(334, 24, 19, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(335, 24, 20, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(336, 24, 22, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(337, 24, 25, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(338, 24, 26, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(339, 24, 32, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(340, 24, 33, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(341, 24, 34, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(342, 24, 35, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(343, 24, 47, '16:35:17', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 1),
(344, 24, 20, '16:35:18', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 2),
(345, 24, 5, '16:35:18', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 2),
(346, 24, 7, '16:35:18', 0, 'Hi artiom37, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 2),
(347, 24, 18, '16:35:18', 0, 'Hi student7, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 2),
(348, 24, 16, '16:35:18', 0, 'Hi student5, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/60', 2),
(349, 24, 1, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(350, 24, 5, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(351, 24, 7, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(352, 24, 9, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(353, 24, 13, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(354, 24, 14, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(355, 24, 15, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(356, 24, 16, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(357, 24, 17, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(358, 24, 18, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(359, 24, 19, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(360, 24, 20, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(361, 24, 22, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(362, 24, 25, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(363, 24, 26, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(364, 24, 32, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(365, 24, 33, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(366, 24, 34, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(367, 24, 35, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(368, 24, 47, '16:41:02', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 1),
(369, 24, 20, '16:41:02', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 2),
(370, 24, 5, '16:41:02', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 2),
(371, 24, 7, '16:41:02', 0, 'Hi artiom37, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 2),
(372, 24, 18, '16:41:02', 0, 'Hi student7, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 2),
(373, 24, 16, '16:41:02', 0, 'Hi student5, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/61', 2),
(374, 24, 1, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(375, 24, 5, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(376, 24, 7, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(377, 24, 9, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(378, 24, 13, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(379, 24, 14, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(380, 24, 15, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(381, 24, 16, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(382, 24, 17, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(383, 24, 18, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(384, 24, 19, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(385, 24, 20, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(386, 24, 22, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(387, 24, 25, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(388, 24, 26, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(389, 24, 32, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(390, 24, 33, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(391, 24, 34, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(392, 24, 35, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(393, 24, 47, '16:43:03', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 1),
(394, 24, 20, '16:43:03', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 2),
(395, 24, 5, '16:43:03', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 2),
(396, 24, 7, '16:43:03', 0, 'Hi artiom37, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 2),
(397, 24, 18, '16:43:03', 0, 'Hi student7, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 2),
(398, 24, 16, '16:43:03', 0, 'Hi student5, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/62', 2),
(399, 24, 1, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(400, 24, 5, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(401, 24, 7, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(402, 24, 9, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(403, 24, 13, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(404, 24, 14, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(405, 24, 15, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(406, 24, 16, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(407, 24, 17, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(408, 24, 18, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(409, 24, 19, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(410, 24, 20, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(411, 24, 22, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(412, 24, 25, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(413, 24, 26, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(414, 24, 32, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(415, 24, 33, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(416, 24, 34, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(417, 24, 35, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(418, 24, 47, '16:45:58', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 1),
(419, 24, 20, '16:45:58', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 2),
(420, 24, 5, '16:45:58', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 2),
(421, 24, 7, '16:45:58', 0, 'Hi artiom37, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 2),
(422, 24, 18, '16:45:58', 0, 'Hi student7, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 2),
(423, 24, 16, '16:45:58', 0, 'Hi student5, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/63', 2),
(424, 36, 1, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(425, 36, 5, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(426, 36, 7, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(427, 36, 9, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(428, 36, 13, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(429, 36, 14, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(430, 36, 15, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(431, 36, 16, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(432, 36, 17, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(433, 36, 18, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(434, 36, 19, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(435, 36, 20, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(436, 36, 22, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(437, 36, 25, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(438, 36, 26, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(439, 36, 32, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(440, 36, 33, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(441, 36, 34, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(442, 36, 35, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(443, 36, 49, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(444, 36, 50, '19:00:43', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 1),
(445, 36, 1, '19:00:43', 0, 'Hi student1, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 2),
(446, 36, 20, '19:00:43', 0, 'Hi ralon039@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 2),
(447, 36, 7, '19:00:43', 0, 'Hi artiom37, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 2),
(448, 36, 5, '19:00:43', 0, 'Hi earen003@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/64', 2),
(449, 24, 1, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(450, 24, 5, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(451, 24, 7, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(452, 24, 9, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(453, 24, 13, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(454, 24, 14, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(455, 24, 15, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(456, 24, 16, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(457, 24, 17, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(458, 24, 18, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(459, 24, 19, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(460, 24, 20, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(461, 24, 22, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(462, 24, 25, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(463, 24, 26, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(464, 24, 32, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(465, 24, 33, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(466, 24, 34, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(467, 24, 35, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(468, 24, 51, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(469, 24, 52, '19:41:54', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 1),
(470, 24, 20, '19:41:55', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 2),
(471, 24, 5, '19:41:55', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 2),
(472, 24, 7, '19:41:55', 0, 'Hi artiom37, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 2),
(473, 24, 18, '19:41:55', 0, 'Hi student7, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 2),
(474, 24, 16, '19:41:55', 0, 'Hi student5, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/65', 2),
(475, 24, 1, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(476, 24, 5, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(477, 24, 7, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(478, 24, 9, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(479, 24, 13, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(480, 24, 14, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(481, 24, 15, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(482, 24, 16, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(483, 24, 17, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(484, 24, 18, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(485, 24, 19, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(486, 24, 20, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(487, 24, 22, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(488, 24, 25, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(489, 24, 26, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(490, 24, 32, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(491, 24, 33, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(492, 24, 34, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(493, 24, 35, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(494, 24, 51, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(495, 24, 52, '19:59:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 1),
(496, 24, 20, '19:59:14', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 2),
(497, 24, 5, '19:59:14', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 2),
(498, 24, 7, '19:59:14', 0, 'Hi artiom37, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 2),
(499, 24, 18, '19:59:14', 0, 'Hi student7, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 2),
(500, 24, 16, '19:59:14', 0, 'Hi student5, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/66', 2),
(501, 24, 1, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(502, 24, 5, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(503, 24, 7, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(504, 24, 9, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(505, 24, 13, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(506, 24, 14, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(507, 24, 15, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(508, 24, 16, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(509, 24, 17, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(510, 24, 18, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(511, 24, 19, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(512, 24, 20, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(513, 24, 22, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(514, 24, 25, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(515, 24, 26, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(516, 24, 32, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(517, 24, 33, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(518, 24, 34, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(519, 24, 35, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(520, 24, 51, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1),
(521, 24, 52, '20:28:14', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 1);
INSERT INTO `notification` (`id`, `sender_id`, `receiver_id`, `datetime`, `been_read`, `message`, `link`, `importancy`) VALUES
(522, 24, 20, '20:28:15', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 2),
(523, 24, 5, '20:28:15', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 2),
(524, 24, 7, '20:28:15', 0, 'Hi artiom37, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 2),
(525, 24, 18, '20:28:15', 0, 'Hi student7, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 2),
(526, 24, 16, '20:28:15', 0, 'Hi student5, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/67', 2),
(527, 24, 1, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(528, 24, 5, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(529, 24, 7, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(530, 24, 9, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(531, 24, 13, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(532, 24, 14, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(533, 24, 15, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(534, 24, 16, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(535, 24, 17, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(536, 24, 18, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(537, 24, 19, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(538, 24, 20, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(539, 24, 22, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(540, 24, 25, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(541, 24, 26, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(542, 24, 32, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(543, 24, 33, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(544, 24, 34, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(545, 24, 35, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(546, 24, 51, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(547, 24, 52, '22:08:01', 0, 'GuestEmployer just posted a new job: Software Developer JavaScript. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 1),
(548, 24, 20, '22:08:01', 0, 'Hi ralon039@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 2),
(549, 24, 5, '22:08:01', 0, 'Hi earen003@fiu.edu, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 2),
(550, 24, 7, '22:08:01', 0, 'Hi artiom37, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 2),
(551, 24, 18, '22:08:01', 0, 'Hi student7, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 2),
(552, 24, 16, '22:08:01', 0, 'Hi student5, the company GuestEmployer just posted a job Software Developer JavaScript that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/68', 2),
(553, 36, 1, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(554, 36, 5, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(555, 36, 7, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(556, 36, 9, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(557, 36, 13, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(558, 36, 14, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(559, 36, 15, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(560, 36, 16, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(561, 36, 17, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(562, 36, 18, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(563, 36, 19, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(564, 36, 20, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(565, 36, 22, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(566, 36, 25, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(567, 36, 26, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(568, 36, 32, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(569, 36, 33, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(570, 36, 34, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(571, 36, 35, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(572, 36, 51, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(573, 36, 52, '12:20:06', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 1),
(574, 36, 1, '12:20:06', 0, 'Hi student1, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 2),
(575, 36, 20, '12:20:06', 0, 'Hi ralon039@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 2),
(576, 36, 7, '12:20:06', 0, 'Hi artiom37, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 2),
(577, 36, 5, '12:20:06', 0, 'Hi earen003@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/69', 2),
(578, 36, 1, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(579, 36, 5, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(580, 36, 7, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(581, 36, 9, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(582, 36, 13, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(583, 36, 14, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(584, 36, 15, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(585, 36, 16, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(586, 36, 17, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(587, 36, 18, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(588, 36, 19, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(589, 36, 20, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(590, 36, 22, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(591, 36, 25, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(592, 36, 26, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(593, 36, 32, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(594, 36, 33, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(595, 36, 34, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(596, 36, 35, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(597, 36, 51, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(598, 36, 52, '12:31:16', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 1),
(599, 36, 1, '12:31:16', 0, 'Hi student1, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 2),
(600, 36, 20, '12:31:16', 0, 'Hi ralon039@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 2),
(601, 36, 7, '12:31:16', 0, 'Hi artiom37, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 2),
(602, 36, 5, '12:31:16', 0, 'Hi earen003@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/70', 2),
(603, 36, 1, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(604, 36, 5, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(605, 36, 7, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(606, 36, 9, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(607, 36, 13, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(608, 36, 14, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(609, 36, 15, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(610, 36, 16, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(611, 36, 17, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(612, 36, 18, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(613, 36, 19, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(614, 36, 20, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(615, 36, 22, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(616, 36, 25, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(617, 36, 26, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(618, 36, 32, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(619, 36, 33, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(620, 36, 34, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(621, 36, 35, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(622, 36, 51, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(623, 36, 52, '13:40:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 1),
(624, 36, 1, '13:40:10', 0, 'Hi student1, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 2),
(625, 36, 20, '13:40:10', 0, 'Hi ralon039@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 2),
(626, 36, 7, '13:40:10', 0, 'Hi artiom37, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 2),
(627, 36, 5, '13:40:10', 0, 'Hi earen003@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/71', 2),
(628, 36, 1, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(629, 36, 5, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(630, 36, 7, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(631, 36, 9, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(632, 36, 13, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(633, 36, 14, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(634, 36, 15, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(635, 36, 16, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(636, 36, 17, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(637, 36, 18, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(638, 36, 19, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(639, 36, 20, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(640, 36, 22, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(641, 36, 25, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(642, 36, 26, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(643, 36, 32, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(644, 36, 33, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(645, 36, 34, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(646, 36, 35, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(647, 36, 51, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(648, 36, 52, '13:48:05', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 1),
(649, 36, 1, '13:48:06', 0, 'Hi student1, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 2),
(650, 36, 20, '13:48:06', 0, 'Hi ralon039@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 2),
(651, 36, 7, '13:48:06', 0, 'Hi artiom37, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 2),
(652, 36, 5, '13:48:06', 0, 'Hi earen003@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/72', 2),
(653, 36, 1, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(654, 36, 5, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(655, 36, 7, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(656, 36, 9, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(657, 36, 13, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(658, 36, 14, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(659, 36, 15, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(660, 36, 16, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(661, 36, 17, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(662, 36, 18, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(663, 36, 19, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(664, 36, 20, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(665, 36, 22, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(666, 36, 25, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(667, 36, 26, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(668, 36, 32, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(669, 36, 33, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(670, 36, 34, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(671, 36, 35, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(672, 36, 51, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(673, 36, 52, '13:57:10', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 1),
(674, 36, 1, '13:57:10', 0, 'Hi student1, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 2),
(675, 36, 20, '13:57:10', 0, 'Hi ralon039@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 2),
(676, 36, 7, '13:57:10', 0, 'Hi artiom37, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 2),
(677, 36, 5, '13:57:10', 0, 'Hi earen003@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/73', 2),
(678, 36, 1, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(679, 36, 5, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(680, 36, 7, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(681, 36, 9, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(682, 36, 13, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(683, 36, 14, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(684, 36, 15, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(685, 36, 16, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(686, 36, 17, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(687, 36, 18, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(688, 36, 19, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(689, 36, 20, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(690, 36, 22, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(691, 36, 25, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(692, 36, 26, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(693, 36, 32, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(694, 36, 33, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(695, 36, 34, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(696, 36, 35, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(697, 36, 51, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(698, 36, 52, '13:58:55', 0, 'rogemp001 just posted a new job: Java Developer III. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 1),
(699, 36, 1, '13:58:55', 0, 'Hi student1, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 2),
(700, 36, 20, '13:58:55', 0, 'Hi ralon039@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 2),
(701, 36, 7, '13:58:55', 0, 'Hi artiom37, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 2),
(702, 36, 5, '13:58:55', 0, 'Hi earen003@fiu.edu, the company rogemp001 just posted a job Java Developer III that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/74', 2),
(703, 36, 1, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(704, 36, 5, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(705, 36, 7, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(706, 36, 9, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(707, 36, 13, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(708, 36, 14, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(709, 36, 15, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(710, 36, 16, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(711, 36, 17, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(712, 36, 18, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(713, 36, 19, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(714, 36, 20, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(715, 36, 22, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(716, 36, 25, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(717, 36, 26, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(718, 36, 32, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(719, 36, 33, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(720, 36, 34, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(721, 36, 35, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(722, 36, 51, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(723, 36, 52, '22:37:21', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/75', 1),
(724, 36, 1, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(725, 36, 5, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(726, 36, 7, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(727, 36, 9, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(728, 36, 13, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(729, 36, 14, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(730, 36, 15, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(731, 36, 16, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(732, 36, 17, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(733, 36, 18, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(734, 36, 19, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(735, 36, 20, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(736, 36, 22, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(737, 36, 25, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(738, 36, 26, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(739, 36, 32, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(740, 36, 33, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(741, 36, 34, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(742, 36, 35, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(743, 36, 51, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(744, 36, 52, '00:01:30', 0, 'rogemp001 just posted a new job: Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/76', 1),
(745, 36, 1, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(746, 36, 5, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(747, 36, 7, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(748, 36, 9, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(749, 36, 13, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(750, 36, 14, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(751, 36, 15, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(752, 36, 16, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(753, 36, 17, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(754, 36, 18, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(755, 36, 19, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(756, 36, 20, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(757, 36, 22, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(758, 36, 25, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(759, 36, 26, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(760, 36, 32, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(761, 36, 33, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(762, 36, 34, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(763, 36, 35, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(764, 36, 51, '00:14:47', 1, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(765, 36, 52, '00:14:47', 0, 'rogemp001 just posted a new job: ORACLE. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 1),
(766, 36, 51, '00:14:47', 0, 'Hi RogerTest1, the company rogemp001 just posted a job ORACLE that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/77', 2),
(767, 36, 1, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(768, 36, 5, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(769, 36, 7, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(770, 36, 9, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(771, 36, 13, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(772, 36, 14, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(773, 36, 15, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(774, 36, 16, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(775, 36, 17, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(776, 36, 18, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(777, 36, 19, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(778, 36, 20, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(779, 36, 22, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(780, 36, 25, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(781, 36, 26, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(782, 36, 32, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(783, 36, 33, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(784, 36, 34, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(785, 36, 35, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(786, 36, 51, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(787, 36, 52, '00:25:48', 0, 'rogemp001 just posted a new job: REST. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 1),
(788, 36, 20, '00:25:48', 0, 'Hi ralon039@fiu.edu, the company rogemp001 just posted a job REST that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/78', 2),
(789, 36, 1, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(790, 36, 5, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(791, 36, 7, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(792, 36, 9, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1);
INSERT INTO `notification` (`id`, `sender_id`, `receiver_id`, `datetime`, `been_read`, `message`, `link`, `importancy`) VALUES
(793, 36, 13, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(794, 36, 14, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(795, 36, 15, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(796, 36, 16, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(797, 36, 17, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(798, 36, 18, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(799, 36, 19, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(800, 36, 20, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(801, 36, 22, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(802, 36, 25, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(803, 36, 26, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(804, 36, 32, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(805, 36, 33, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(806, 36, 34, '11:51:29', 1, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(807, 36, 35, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(808, 36, 51, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(809, 36, 52, '11:51:29', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/79', 1),
(810, 36, 1, '11:56:36', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(811, 36, 5, '11:56:36', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(812, 36, 7, '11:56:36', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(813, 36, 9, '11:56:36', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(814, 36, 13, '11:56:36', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(815, 36, 14, '11:56:36', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(816, 36, 15, '11:56:36', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(817, 36, 16, '11:56:36', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(818, 36, 17, '11:56:36', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(819, 36, 18, '11:56:36', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(820, 36, 19, '11:56:37', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(821, 36, 20, '11:56:37', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(822, 36, 22, '11:56:37', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(823, 36, 25, '11:56:37', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(824, 36, 26, '11:56:37', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(825, 36, 32, '11:56:37', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(826, 36, 33, '11:56:37', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(827, 36, 34, '11:56:37', 1, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(828, 36, 35, '11:56:37', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(829, 36, 51, '11:56:37', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(830, 36, 52, '11:56:37', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1),
(831, 56, 1, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(832, 56, 5, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(833, 56, 7, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(834, 56, 9, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(835, 56, 13, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(836, 56, 14, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(837, 56, 15, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(838, 56, 16, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(839, 56, 17, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(840, 56, 18, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(841, 56, 19, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(842, 56, 20, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(843, 56, 22, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(844, 56, 26, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(845, 56, 55, '12:05:40', 0, 'testemployer just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(846, 56, 2, '12:05:40', 0, 'There is a new employer named testemployer that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer', 1),
(847, 57, 1, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(848, 57, 5, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(849, 57, 7, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(850, 57, 9, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(851, 57, 13, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(852, 57, 14, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(853, 57, 15, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(854, 57, 16, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(855, 57, 17, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(856, 57, 18, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(857, 57, 19, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(858, 57, 20, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(859, 57, 22, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(860, 57, 26, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(861, 57, 55, '12:08:41', 0, 'testemployer1 just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(862, 57, 2, '12:08:41', 0, 'There is a new employer named testemployer1 that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/testemployer1', 1),
(863, 58, 1, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(864, 58, 5, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(865, 58, 7, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(866, 58, 9, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(867, 58, 13, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(868, 58, 14, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(869, 58, 15, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(870, 58, 16, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(871, 58, 17, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(872, 58, 18, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(873, 58, 19, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(874, 58, 20, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(875, 58, 22, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(876, 58, 26, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(877, 58, 55, '12:13:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(878, 58, 2, '12:13:17', 0, 'There is a new employer named RogerEmpTest that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(879, 59, 1, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(880, 59, 5, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(881, 59, 7, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(882, 59, 9, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(883, 59, 13, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(884, 59, 14, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(885, 59, 15, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(886, 59, 16, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(887, 59, 17, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(888, 59, 18, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(889, 59, 19, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(890, 59, 20, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(891, 59, 22, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(892, 59, 26, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(893, 59, 55, '12:16:56', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(894, 59, 2, '12:16:56', 0, 'There is a new employer named RogerEmpTest that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(895, 61, 1, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(896, 61, 5, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(897, 61, 7, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(898, 61, 9, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(899, 61, 13, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(900, 61, 14, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(901, 61, 15, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(902, 61, 16, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(903, 61, 17, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(904, 61, 18, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(905, 61, 19, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(906, 61, 20, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(907, 61, 22, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(908, 61, 26, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(909, 61, 55, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(910, 61, 60, '12:18:17', 0, 'RogerEmpTest just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1),
(911, 61, 2, '12:18:17', 0, 'There is a new employer named RogerEmpTest that is waiting for acctivation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RogerEmpTest', 1);

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
(60, '/JobFair/resumes/60-Student.pdf');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `saved_queries`
--

INSERT INTO `saved_queries` (`id`, `FK_userid`, `query_tag`, `query`, `location`, `active`) VALUES
(6, 5, 'hello', '+java ', '', 0),
(7, 9, 'thequery', '+java ', '', 0),
(21, 12, '', '~skills:Javascript +php +iPhone Application Development ', '', 0),
(23, 12, '', '~city:Alaska ', '', 0),
(25, 12, '', '~position:Application Support Specialist ', '', 0),
(27, 12, '', '~experience:Manage ', '', 0),
(28, 12, '', '~skills:java ~school:Florida International University ~graduation:2014-10 ', '', 0),
(29, 12, '', '~ZIPcode:true ~major:Computer Science ', '', 0),
(31, 12, '', '~school:Florida International University ', '', 0),
(50, 24, 'Java', '+Java ', '', 0),
(51, 24, 'PHP', '+PHP ', '', 0),
(52, 26, 'JavaWeb', 'Java + Web ', 'Miami, Florida', 0),
(53, 23, 'JavaWeb', 'Java + Web ', 'Miami, Florida', 0);

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email_string` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

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
(13, 'University of Tehran', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skillset`
--

CREATE TABLE IF NOT EXISTS `skillset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `FK_general_skills` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=123 ;

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
(122, 'Bioinformatics', 0);

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
(30, 7, 66, NULL, 18),
(36, 14, 3, NULL, 1),
(37, 14, 16, NULL, 2),
(38, 14, 2, NULL, 3),
(39, 14, 56, NULL, 4),
(40, 14, 40, NULL, 5),
(41, 14, 32, NULL, 6),
(42, 16, 8, NULL, 1),
(43, 16, 21, NULL, 2),
(44, 16, 11, NULL, 3),
(45, 16, 6, NULL, 4),
(46, 16, 10, NULL, 5),
(47, 16, 67, NULL, 6),
(48, 17, 6, NULL, 1),
(49, 17, 27, NULL, 2),
(50, 17, 30, NULL, 3),
(52, 17, 13, NULL, 5),
(53, 9, 6, NULL, 1),
(54, 9, 18, NULL, 2),
(55, 9, 52, NULL, 3),
(56, 9, 49, NULL, 4),
(57, 9, 18, NULL, 5),
(58, 18, 2, NULL, 1),
(59, 18, 7, NULL, 2),
(60, 18, 12, NULL, 3),
(61, 18, 51, NULL, 4),
(62, 18, 33, NULL, 5),
(63, 18, 17, NULL, 6),
(64, 18, 39, NULL, 7),
(65, 18, 28, NULL, 8),
(66, 18, 49, NULL, 9),
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
(263, 55, 77, NULL, 19);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `FK_usertype`, `email`, `registration_date`, `activation_string`, `activated`, `image_url`, `first_name`, `last_name`, `disable`, `has_viewed_profile`, `linkedinid`, `googleid`, `fiucsid`, `hide_email`, `job_notification`, `fiu_account_id`, `looking_for_job`, `job_int_date`) VALUES
(2, 'admin', '$2a$08$uIjjONcbol5mPr0sa.kzY.6JWHRU3GoKmhKUNzjNaA./oQEfFzmpy', 3, 'admin@mail.com', '2014-06-10 06:57:27', '', 1, '/JobFair/images/profileimages/user-default.png', 'Admin', 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(5, 'earen003@fiu.edu', '$2a$08$.wTFdqjfaVSAekwumRTumOHdMmMcaantOW2SVefl8Od1gCgOTmA/u', 1, 'earen003123@fiu.edu', '2014-10-04 15:37:55', 'google', 1, 'https://media.licdn.com/mpr/mprx/0_Gj0mWYPz0DWq_3q5iYr8oxrMUpvN6Cq5iaTi70GUveqBC_QITDYCDzvdlhm', 'Erick', 'Arenas', 0, 1, 'DywORbIHTc', '107193070609153671555', NULL, NULL, 1, NULL, 1, 5),
(7, 'artiom37', '$2a$08$AnOw/C8vz5U/3QTW2jyTiO9kdd4xx/XM/HyHRn2tviFgQ0p7jDUhW', 1, 'atiur001123@fiu.edu', '2014-10-06 11:44:55', '0gs57hx6lh', 1, 'https://media.licdn.com/mpr/mprx/0_tBVQ93TSwFf0RgF1NQVerhfSdBO0R7F1vnkIr8l7FixpxmvgcbUEtoRtLEM', 'Artiom', 'Tiurin', 0, 1, '0r-jQ-XO_s', '117155167080414996997', '3615727', NULL, 1, '117155167080414996997', 1, 0),
(8, 'test_cis_fiu_edu', '$2a$08$0L3h//kusVHOdsX1.63B5.eZsXumUFCzudt1EVJCEGFTowlIyRIIG', 2, 'test@cis.fiu.edu', '2014-10-11 20:36:39', NULL, 1, '/JobFair/images/profileimages/user-default.png', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(9, 'student8', '$2a$08$lc0rNoh.imE0DMCJPjqyGObn3m4ztqECqE2kKbmBgkX9oudrg0dHi', 1, 'arenaserick123@yahoo.com', '2014-11-06 13:30:00', '3vlsgjawyq', 1, '/JobFair/images/profileimages/user-default.png', 'erickkk', 'arenass', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 5),
(11, 'nmad43', '$2a$08$41tQbGBVPNnLRY5pQxUicOqtmLy2t/SqbMuzJ4z7DAHdt3QfJtosK', 2, 'nmada002@fiu.edu', '2014-11-13 13:10:32', 'vihzwtsplq', NULL, '/JobFair/images/profileimages/user-default.png', 'Nicholas', 'Madariaga', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 0),
(12, 'employer10', '$2a$08$oLylkwLN2eMvx.B9AtLVhu4dSoLvAvVc7oWTSTGhKt2pDlZY8uBB.', 2, 'employertwo@mail.com', '2014-11-23 17:33:16', '5qjanjsv5n', 1, '/JobFair/images/profileimages/employer10avatar.jpg', 'emp', 'two', 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 5),
(13, 'student2', '$2a$08$izZhSzK.r/0Hrz4kulXGfuKlNiVAc041UZeztYJNdLVvQjMFFcYVu', 1, 'student2@mail.com', '2014-12-08 12:10:02', '4a618ii724', 1, '/JobFair/images/profileimages/user-default.png', 'student', 'two', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(14, 'student3', '$2a$08$oPt5manAQUtYPPwKBzEtW.Bjn4OXGYJvHqSfoLQ1neU4xn3sNcy5e', 1, 'student3@mail.com', '2014-12-08 12:10:29', '0dm6r4sm8x', 1, '/JobFair/images/profileimages/user-default.png', 'student', 'three', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(15, 'student4', '$2a$08$8xq3xBBtnCpBbfQLGWrdauhr6TUbUSMR8r59BxkBUresi8j9vyha2', 1, 'student4@mail.com', '2014-12-08 12:10:56', 'civrojoyt8', 1, '/JobFair/images/profileimages/user-default.png', 'student', 'four', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(16, 'student5', '$2a$08$1RtOrIfXEZFZEKF72IaKOewYIZodUdPaR7.uvjJ6ijwM3L6gv96nu', 1, 'student5@mail.com', '2014-12-08 12:11:33', 'yjupo61fkh', 1, '/JobFair/images/profileimages/user-default.png', 'student', 'five', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(17, 'student6', '$2a$08$IMOemea88AkVFg9DyR8Luuh7LQ1Z7GV1T7x3iSr.ad6piQanEeq66', 1, 'student6@mail.com', '2014-12-08 12:11:54', 's85trcxv1p', 1, '/JobFair/images/profileimages/user-default.png', 'student', 'six', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(18, 'student7', '$2a$08$5Q1dX6zQSfwlfsEINQx9WeuwMxLKIfQE3SPQOmR80TSWNYvac27CS', 1, 'student7@mail.com', '2014-12-08 12:12:27', '7kai06xc65', 1, '/JobFair/images/profileimages/user-default.png', 'student', 'seven', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(19, 'student10', '$2a$08$vwEAweAqJJMnewbed.YVZOycFb4nvS9UdRGcWYcwPfg1RTE8dp2aG', 1, 'student10@mail.com', '2014-12-11 10:06:13', 'bosv3vqir3', NULL, '/JobFair/images/profileimages/user-default.png', 'student', 'ten', 0, NULL, NULL, NULL, NULL, 0, 1, NULL, 1, 0),
(22, 'jtrav029@fiu.edu', '$2a$08$igvNQYv.yFI.3JrqELQXte2srqEr0sytDBPrfaNLQpkSRZCO/G9di', 1, 'jtrav029@fiu.edu', '2015-02-01 04:43:13', 'fiu', 1, 'https://lh3.googleusercontent.com/-xjXKxJLmagc/AAAAAAAAAAI/AAAAAAAAACI/8JbHCPrKBYM/photo.jpg', 'Jorge', 'Travieso', 0, NULL, NULL, NULL, NULL, NULL, 1, '116231147857551021368', 1, 0),
(23, 'GuestStudent', '$2a$08$8PspUXq1ggIuTn8.92.qG.rbCwv55mh9irvpfrQY2JiWy4r44k6Pe', 4, 'gueststudent@cs.fiu.edu', '2015-02-07 16:51:19', 'h6c5hy7r70', 1, '/JobFair/images/profileimages/user-default.png', 'Guest', 'Student', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(24, 'GuestEmployer', '$2a$08$gWRjrpq9Xsd.XJmuWWc9.Ot/S/iP3MkrcyYewl7BXaknLNQupxKA6', 5, 'guestemployer@cs.fiu.edu', '2015-02-05 22:47:06', 'yekce5xo6s', 1, '/JobFair/images/profileimages/user-default.png', 'Guest', 'Employer', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 0),
(26, 'sadjadis@gmail.com', '$2a$08$czIQv8g6mh2xH/m/UlpPFOfJv1ksBHaFA4XIe1XgEcGtZ3/HvYy4W', 1, 'sadjadi@cs.fiu.edu', '2015-02-18 09:19:11', 'google', 1, 'https://lh3.googleusercontent.com/-QnmiMU0SQEQ/AAAAAAAAAAI/AAAAAAAAMtw/6TS6oscVgj8/photo.jpg', 'Masoud', 'Sadjadi', 0, 1, '-q_utmm44e', '110291442056614091691', NULL, NULL, 1, NULL, 1, 0),
(55, 'RogerSTU', '$2a$08$NG1FTRUINW7fwsajTe06/eGjJ9uvKLIJAFGoUEMq78TJkrkXlX50m', 1, 'ralon038@fiu.edu', '2015-03-03 00:07:12', 'srxnpcjlcz', 1, '/JobFair/images/profileimages/RogerSTUavatar.JPG', 'Rogelio', 'Alonso', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(56, 'testemployer', '$2a$08$A0EViiZBj42D2UfBAhMxyOXy/BxulKDLuQR3HntZfkt9P/3XO32sC', 2, 'sadjadi@cis.fiu.edu', '2015-03-04 12:05:40', 'nt0tjgeiv3', 1, '/JobFair/images/profileimages/user-default.png', 'Test', 'Employer', 0, NULL, NULL, NULL, NULL, 0, 1, NULL, 1, 0),
(57, 'testemployer1', '$2a$08$dGfD0MmHskr6esTPXYx1m.w2L0p1f0U48UGWwP8bITiYoeZMEY4Ey', 2, 'sadjadi@fiu.edu', '2015-03-04 12:08:41', '2qxr3xbbb4', 1, '/JobFair/images/profileimages/user-default.png', 'Test', 'Employer', 0, NULL, NULL, NULL, NULL, 0, 1, NULL, 1, 0),
(60, 'RogerStuTest1', '$2a$08$xRtI.tW7PieXx/zuVdKVhOMlmNZ2FfQhtozopEJdgE0trTT6t/rJ.', 1, 'rog.stu.001@gmail.com', '2015-03-04 12:18:09', 'la4k5nqbbv', 1, '/JobFair/images/profileimages/RogerStuTest1avatar.JPG', 'RogerTest', 'StudentTest', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(61, 'RogerEmpTest', '$2a$08$7JQwicSIr3u9kl.IwlZ.X.DWboOqTvuNLbe6VqsoyH/xUlUPLwDAy', 2, 'rog.emp.001@gmail.com', '2015-03-04 12:18:17', 'hgk9neax66', 1, '/JobFair/images/profileimages/user-default.png', 'RogerTest', 'EmployerTest', 0, NULL, NULL, NULL, NULL, 0, 1, NULL, 1, 0),
(63, 'hgutierrez.jobs@gmail.com', '$2a$08$HYwdV8.ws5pUCgnL0RUh0ONXun0Km2gH5ihMMsreTW6rKps8972OK', 1, 'hgutierrez.jobs@gmail.com', '2015-04-06 23:27:15', 'google', 1, 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', 'Heidy', 'Gutierrez', 0, NULL, NULL, '105478010618083573451', NULL, NULL, 1, NULL, 1, 0);

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

--
-- Dumping data for table `video_resume`
--

INSERT INTO `video_resume` (`id`, `video_path`) VALUES
(34, '/JobFair/resumes/v34-'),
(55, '/JobFair/resumes/v55-WIN_20150315_165607.MP4'),
(60, '/JobFair/resumes/v60-Video Resume.MP4');

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

CREATE ALGORITHM=UNDEFINED DEFINER=`vjfuser`@`localhost` SQL SECURITY DEFINER VIEW `solr` AS select concat(`user`.`id`,`job`.`id`) AS `id`,`user`.`username` AS `username`,`user`.`email` AS `email`,`user`.`registration_date` AS `registration_date`,`user`.`first_name` AS `first_name`,`user`.`last_name` AS `last_name`,`user`.`image_url` AS `image_url`,`job`.`type` AS `type`,`job`.`title` AS `title`,`job`.`post_date` AS `post_date`,`job`.`deadline` AS `deadline`,`job`.`description` AS `description`,`job`.`compensation` AS `compensation`,`job`.`other_requirements` AS `other_requirements`,`job`.`email_notification` AS `email_notification`,`job`.`matches_found` AS `matches_found`,`job`.`posting_url` AS `posting_url`,`job`.`comp_name` AS `comp_name`,`job`.`poster_email` AS `poster_email` from (`user` join `job`) where (`user`.`id` = `job`.`FK_poster`);

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
