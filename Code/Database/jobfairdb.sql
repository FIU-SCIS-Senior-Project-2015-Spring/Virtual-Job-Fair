-- phpMyAdmin SQL Dump
-- version 4.0.10.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 17, 2015 at 01:46 AM
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
  `tries` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `idx_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basic_info`
--

INSERT INTO `basic_info` (`userid`, `phone`, `city`, `state`, `zip_code`, `about_me`, `hide_phone`, `allowSMS`, `validated`, `smsCode`, `tries`) VALUES
(5, NULL, 'Miami/Fort Lauderdale Area', NULL, '0', 'Attended Florida International University', NULL, NULL, NULL, NULL, 0),
(8, NULL, NULL, NULL, '0', 'Laura Alonso, From: Progressive Insurance (Other)', 1, 0, 1, NULL, 0),
(9, '', 'Alaska', 'Alaska', '99676', '', NULL, 0, 0, NULL, 0),
(11, '', 'Miami', 'FL', '0', 'Just checking out your site. Yii sucks.', 0, 0, NULL, NULL, 0),
(12, '', 'Miami', 'Florida', '0', 'This is my Bio.', 0, 0, 0, NULL, 0),
(14, '3052224444', 'Columbia', 'Illinois', '65284', '', NULL, 0, 0, NULL, 0),
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
(61, '2222222222', 'Miami', 'Florida', NULL, 'I am a test automated recruited @ VJF', 0, 0, NULL, NULL, 0),
(71, '3055554444', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(72, '3055554444', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(73, '3052224444', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(74, '', 'Miami', 'FL', NULL, 'Hello', 1, 1, NULL, NULL, 0),
(75, '9545873232', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

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
(61, 'Virtual Company for Testing', '123 main', '', 'Miami', 'Florida', '330178', 'www.vjf.cis.fiu.edu', 'This is a virtual company for system testing purposes'),
(74, 'Android Fake Studio', '123 Main Street', '', 'Miami', 'FL', '33174', '', 'Hello');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`id`, `FK_userid`, `company_name`, `job_title`, `job_description`, `startdate`, `enddate`, `city`, `state`) VALUES
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=140 ;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `type`, `title`, `FK_poster`, `post_date`, `deadline`, `description`, `compensation`, `other_requirements`, `email_notification`, `active`, `matches_found`, `posting_url`, `comp_name`, `poster_email`) VALUES
(114, 'CIS', ' The Great Minds in STEM (GMiS) 2015-16 HENAA', 8, '2015-04-08 00:00:00', '2015-05-30 00:00:00', '<p>Graduating high school seniors, undergraduate students and graduate students, who intend to or are currently pursuing a science, technology, engineering, or math (STEM) degree at an accredited college/university in the U.S. or Puerto Rico, are encouraged to apply for these merit-based scholarships. In addition, students must have an overall minimum 3.0 GPA and must be of Hispanic descent <strong><em>or </em></strong>demonstrate leadership/service within the Hispanic community.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Scholarships offered by GMiS:</strong></h3>\r\n\r\n<p><strong>Corporate / Government Sponsored Scholarships</strong> &ndash; These scholarships are made possible thanks to our dedicated scholarship sponsors from corporate America, federal agencies and affinity groups.<br />\r\n<br />\r\n<strong>Graduate Computer Science Scholarships </strong>&ndash; These highly-competitive $10,000 scholarships are awarded to qualified masters students pursuing a computer science, IT or related software development degree.<br />\r\n<br />\r\n<strong>U.S. Navy STEM Scholarship </strong>- These highly-competitive $10,000 scholarships, in partnership with NAVSEA and SSP,&nbsp;are awarded to qualified graduating high school seniors, who have a minimum 3.0 GPA, and will be pursuing a STEM degree at a Hispanic-Serving Institution (HSI). During their first semester in college, these scholars have the opportunity to apply for the Student Employment Program, which provides them a summer internship and continued funding through their undergraduate career, so long as the student maintains a competitive GPA in a STEM degree.<br />\r\n<br />\r\n<strong>In Memoriam and Personal Scholarships </strong>- Great Minds in STEM awards some very special scholarships, which have been established in the loving memory of an endeared supporter of GMiS or have been established by long-time supporters and dear friends of GMiS.</p>\r\n\r\n<p><br />\r\nTo learn more about all the various types of scholarships offered by GMiS please visit its website.</p>\r\n<p>null</p>\r\n<p>Graduating high school seniors, undergraduate students and graduate students, who intend to or are currently pursuing a science, technology, engineering, or math (STEM) degree at an accredited college/university in the U.S. or Puerto Rico, are encouraged to apply for these merit-based scholarships. In addition, students must have an overall minimum 3.0 GPA and must be of Hispanic descent <strong><em>or </em></strong>demonstrate leadership/service within the Hispanic community.&nbsp;</p>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$gZDkcsNJoj4Nz9rZuenzquBZA7thKW4aNKsZpG27thHzLoNfib8Vm', 'Great Minds in STEM (GMiS)', NULL),
(115, 'CIS', 'Startup Partner - User Experience Lead - Inno', 8, '2015-04-15 00:00:00', '2015-05-15 00:00:00', '<p>As a Startup Partner championing the user&#39;s point of view and desiging for their best expeirences, you will engage with entrepreneurs to cobuild ideas that change the world. You will leverage your highly creative problem solving skill set, an incomparable end-to-end vision that leverages digital and non-digital design understanding, superior oral/written communication skills, and an unquenchable thirst for building &#39;unicorn&#39; companies.&nbsp;</p>\r\n<ul>\r\n	<li>Drive UX, IA, and design from end-to-end, including use cases, wireframes, gap analyses, mock-ups, prototypes and final product delivery</li>\r\n	<li>Envision (and drive) how users will see and interact with various aspects of an idea as it is brought to life across its different stages</li>\r\n	<li>Collaborate with other startup partners and entrepreneurs within startup cells to execute the user experience vision&nbsp;</li>\r\n	<li>Take ownership at every level of startup ideas&#39; lifecycles</li>\r\n	<li>Design cross platform experiences for mobile, tablet, desktop and any other relevant device</li>\r\n	<li>Manage and develop relationships with entrepreneurs</li>\r\n	<li>Provide a highly seasoned/high-touch experience for entrepreneurs as they enter the Rokk3r Labs portfolio</li>\r\n	<li>Work to establish Rokk3r Labs as the world&#39;s most exciting brand, and help to develop it as the most sought after destination for the world&#39;s best entrepreneurs/ideas and talent.</li>\r\n</ul>\r\n<ul>\r\n	<li>Highly creative problem solving skills (analytical, technical &amp; strategic)</li>\r\n	<li>Superior ability to present to executives</li>\r\n	<li>Superior written/oral communication skills</li>\r\n	<li>Experience as a UX or concept designer&nbsp;</li>\r\n	<li>Experience developing user experiences for startup ideas</li>\r\n</ul>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$D5DXnHRaEOiO.abM.AewIuxjDkQxWJOG1VxvphpeXmv1IwShlrG1e', 'Rokk3r Labs', NULL),
(116, 'CIS', 'Statistical Analyst and Programmer', 8, '2015-04-01 00:00:00', '2015-05-31 00:00:00', '<p>We are looking for a smart and talented individual with skills in statistical analysis, regression, business intelligence and programming.&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Strong statistical analysis skills</li>\r\n	<li>Knowledge of statistical theorems</li>\r\n	<li>Knowledge of core technologies such as Python and REST API.</li>\r\n	<li>Knowledge of SCALA programming is a plus</li>\r\n</ul>\r\n\r\n<p>You must be:</p>\r\n\r\n<ul>\r\n	<li>Energetic</li>\r\n	<li>Detailed orientated&nbsp;</li>\r\n	<li>Goal driven</li>\r\n	<li>Fast learner&nbsp;</li>\r\n</ul>\r\n<p>The overall duties are to help us come up with statistical models to common problems and strategies that we have created in addition to observing data and finding patterns and produce and suggest reports, ideas, dashboards and other tools to help our clients.&nbsp;</p>\r\n<ul>\r\n	<li>Programming knowledge</li>\r\n	<li>Statistical analysis</li>\r\n	<li>Calculus</li>\r\n</ul>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$fqZ09Dckj2FMVR33lU9t1.1AUJiPf/YBAktC/NWJpBYV0mzR363Gu', 'smartBeemo LLC', NULL),
(117, 'CIS', 'Software Development Intern', 8, '2015-04-03 00:00:00', '2015-12-31 00:00:00', '<p>&bull; Are you a top-notch programmer?<br />\r\n&bull; Are your skills awe-inspiring?<br />\r\n&bull; Are you driven by solving problems that stump 99% of people?</p>\r\n\r\n<p>Then you could work for P1 Analytics!&nbsp; We are looking for great IOS, Android, and web developers to work in our offices as full-time employees or paid interns.&nbsp; Please send us your resume, including any links to interesting products you&rsquo;ve developed, to jobs@p1analytics.com.&nbsp; You have a chance to join a great tech start-up on the ground floor!</p>\r\n<p>Software development.</p>\r\n<p>Programming knowledge at an advanced level for one and at an intermediate level for two of the following: IOS, Android, Javascript, JQuery, Python, SQL, C, C++, PHP, CSS</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$T7SXgRrT3Y5Sg3KiGjazuu2eIHxhqgx1YdbG6H73qq/uZJ0CbAW.O', 'P1 Analytics', NULL),
(118, 'CIS', 'Software Developer', 8, '2015-04-07 00:00:00', '2015-05-07 00:00:00', '<p><strong>Software Developer - Front End</strong></p>\r\n\r\n<p>We are looking for software developers to work on a multi-year project in Miami. The project will involve writing a application framework and various applications that plug into the framework. &nbsp;The goal is an innovative UI/UX that is visually appealing, easy to use and a departure from &quot;the usual&quot;. The target harware will include both mobile devices and large, high-resolution, displays.</p>\r\n<ul style="list-style-type:square">\r\n	<li>Work with UI/UX designers to understand usability, design and aesthetic goals</li>\r\n	<li>Follow coding and design guidelines established by project and company managers</li>\r\n	<li>Write software and unit tests for the software</li>\r\n	<li>Identify and fix defects as needed</li>\r\n	<li>Communicate status to project management</li>\r\n	<li>Identify and recommend improvements as needed</li>\r\n</ul>\r\n<p>Required:</p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>Proficiency with JavaScript and manipulating browser DOM elements</li>\r\n	<li>Proficiency with using browser development tools (debugger, DOM inspector, etc.)</li>\r\n	<li>Knowledge of core computer science fundamentals (algorithms, data structures, etc.)</li>\r\n	<li>Ability to quick learn new ideas and techniques</li>\r\n</ul>\r\n\r\n<p>Desired:</p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>Proficiency with C# and VIsual Studio</li>\r\n	<li>Proficiency with Ajax and other asynchronous or parallel programming techniques</li>\r\n	<li>Familiarity with mobile app development (native or HTML)</li>\r\n	<li>Familiarity with OpenGL/WebGL and/or with HTML Canvas</li>\r\n	<li>Experience working in a software team environment</li>\r\n	<li>Experience with common software development practices (source control, automated builds, continuous integration, etc.)</li>\r\n</ul>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$bkEpNB6TaR4A0aQMS83ZieJTRVQslY/zaGAo3FT.cy62FBNzBuRaW', 'Level 11', NULL),
(119, 'CIS', 'Mobile Developer Internship', 8, '2015-04-07 00:00:00', '2015-05-07 00:00:00', '<p><strong>As part of this internship, you&rsquo;ll be learning:</strong></p>\r\n\r\n<ul>\r\n	<li>Best practices in programming.</li>\r\n	<li>Mobile development on iOS and Android.</li>\r\n	<li>How to develop and test code efficiently and effectively.</li>\r\n	<li>To interpret user requirements.</li>\r\n	<li>How to create user stories.</li>\r\n	<li>To integrate API&rsquo;s based on requirements.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n<p><strong>As an intern, you&rsquo;ll be working with our team to:</strong></p>\r\n\r\n<ul>\r\n	<li>Create scalable mobile&nbsp;applications on iOS and Android.</li>\r\n	<li>Utilize the most advanced, commercially available cloud technology available today.</li>\r\n	<li>Work with various programming languages and protocols.</li>\r\n	<li>Integrate various API&rsquo;s from Facebook to Google Maps.</li>\r\n	<li>Collaborate and iterate to create functional, working software.</li>\r\n	<li>Work on building applications for the mobile web.</li>\r\n</ul>\r\n<ul>\r\n<li>Student enrolled in Computer Science or related program&nbsp;at an accredited college or university.</li>\r\n<li>Work a minimum of 20 hours per week.</li>\r\n</ul>\r\n<p><strong>Other Details:</strong></p>\r\n<ul>\r\n<li>Hours: 20 hours per week.</li>\r\n<li>Duration of Internship: 14 weeks.</li>\r\n<li>Work at our location: 2100 Coral Way Suite 701 Miami, FL 33145.</li>\r\n<li>Must be a U.S. Citizen, Permanent Resident or eligible to work in the US.</li>\r\n</ul>\r\n\r\n<p><strong>NOTE</strong>: IT IS THE RESPONSIBILITY OF THE STUDENT TO ARRANGE FOR APPROVAL FOR ACADEMIC CREDIT FROM THE APPROPRIATE ACADEMIC DEPARTMENT PRIOR TO ACCEPTING THE INTERNSHIP FOR CREDIT.</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$KPAW9TD2RatGPJPDnw.rFuRRS39CU0tKy25s1GxKU4L3sbkqg.f/q', 'TECKpert', NULL),
(120, 'CIS', 'Web Developer Internship', 8, '2015-04-07 00:00:00', '2015-05-07 00:00:00', '<p><strong>As part of this internship, you&#39;ll be learning:</strong></p>\r\n\r\n<ul>\r\n	<li>Best practices in programming.</li>\r\n	<li>How to develop and test code efficiently and effectively.</li>\r\n	<li>To interpret user requirements.</li>\r\n	<li>How to create user stories.</li>\r\n	<li>To integrate API&#39;s based on requirements.</li>\r\n</ul>\r\n<p><strong>As an intern, you&#39;ll be working with our team to:</strong></p>\r\n\r\n<ul>\r\n	<li>Create scalable web applications across multiple platforms.</li>\r\n	<li>Build on commercial, open-source, and custom frameworks.</li>\r\n	<li>Utilize the most advanced, commercially available cloud technology available today.</li>\r\n	<li>Create front, and back-end applications.</li>\r\n	<li>Work with various programming languages and protocols.</li>\r\n	<li>Integrate various API&#39;s from Facebook to Google Maps.</li>\r\n	<li>Collaborate and iterate to create functional, working software.</li>\r\n	<li>Work on building applications for the mobile web.</li>\r\n</ul>\r\n<ul>\r\n	<li>Student enrolled in Computer Science or related program&nbsp;at an accredited college or university.</li>\r\n	<li>Work a minimum of 20 hours per week.</li>\r\n</ul>\r\n\r\n<p><strong>Other Details:</strong></p>\r\n\r\n<ul>\r\n	<li>Hours: 20 hours per week.</li>\r\n	<li>Duration of Internship: 14 weeks.</li>\r\n	<li>Work at our location: 2100 Coral Way Suite 701 Miami, FL 33145.</li>\r\n	<li>Must be a U.S. Citizen, Permanent Resident or eligible to work in the US.</li>\r\n</ul>\r\n\r\n<p><strong>NOTE</strong>: IT IS THE RESPONSIBILITY OF THE STUDENT TO ARRANGE FOR APPROVAL FOR ACADEMIC CREDIT FROM THE APPROPRIATE ACADEMIC DEPARTMENT PRIOR TO ACCEPTING THE INTERNSHIP FOR CREDIT.</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$4OcOABR.2yLwXRQ4J4PgAOmRSIi7LvGZ2DPyFmYwQ7YnQtew1YYY.', 'TECKpert', NULL),
(121, 'CIS', ' The Great Minds in STEM (GMiS) 2015-16 HENAA', 8, '2015-04-08 00:00:00', '2015-04-30 00:00:00', '<p>Graduating high school seniors, undergraduate students and graduate students, who intend to or are currently pursuing a science, technology, engineering, or math (STEM) degree at an accredited college/university in the U.S. or Puerto Rico, are encouraged to apply for these merit-based scholarships. In addition, students must have an overall minimum 3.0 GPA and must be of Hispanic descent <strong><em>or </em></strong>demonstrate leadership/service within the Hispanic community.&nbsp;</p>\r\n\r\n<p><em>Here is a small sample of some of the numerous scholarships offered by GMiS:</em></p>\r\n\r\n<p><strong>Corporate / Government Sponsored Scholarships</strong> &ndash; These scholarships are made possible thanks to our dedicated scholarship sponsors from corporate America, federal agencies and affinity groups.<br />\r\n<br />\r\n<strong>Graduate Computer Science Scholarships </strong>&ndash; These highly-competitive $10,000 scholarships are awarded to qualified masters students pursuing a computer science, IT or related software development degree.<br />\r\n<br />\r\n<strong>U.S. Navy STEM Scholarship </strong>- These highly-competitive $10,000 scholarships, in partnership with NAVSEA and SSP,&nbsp;are awarded to qualified graduating high school seniors, who have a minimum 3.0 GPA, and will be pursuing a STEM degree at a Hispanic-Serving Institution (HSI). During their first semester in college, these scholars have the opportunity to apply for the Student Employment Program, which provides them a summer internship and continued funding through their undergraduate career, so long as the student maintains a competitive GPA in a STEM degree.<br />\r\n<br />\r\n<strong>In Memoriam and Personal Scholarships </strong>- Great Minds in STEM awards some very special scholarships, which have been established in the loving memory of an endeared supporter of GMiS or have been established by long-time supporters and dear friends of GMiS.<br />\r\n<br />\r\nTo learn more about all the various types of scholarships offered by GMiS please visit its website.</p>\r\n<p>null</p>\r\n<p>Graduating high school seniors, undergraduate students and graduate students, who intend to or are currently pursuing a science, technology, engineering, or math (STEM) degree at an accredited college/university in the U.S. or Puerto Rico, are encouraged to apply for these merit-based scholarships. In addition, students must have an overall minimum 3.0 GPA and must be of Hispanic descent <strong><em>or </em></strong>demonstrate leadership/service within the Hispanic community.&nbsp;</p>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$zQASXlbajExbz6fNtc8fAeHEm4.U1ETcVcdez7EWUOt0JZaPnHiCu', 'Great Minds in STEM (GMiS)', NULL),
(122, 'CIS', 'Perl-SQL developer / Linux SysAdmin', 8, '2015-04-09 00:00:00', '2015-06-01 00:00:00', '<p><span style="line-height:1.6em">There are two positions being hired for: a dev job (job #1) and an ops job (job #2).</span></p>\r\n\r\n<p>The developer job seeks candidates familiar with Object Oriented Programming, SQL, and GUI event based programming. &nbsp;We are a perl/postgres/gtk shop so experience with any of those technologies is a plus.</p>\r\n\r\n<p>The operations job requires some travel and on-call duty, and seeks candidates familiar with Unix administration, database administration, and webserver administration. &nbsp;The technologies we use are Linux/Apache/mod_perl/PostgreSQL so experience with any of those technologies is a plus.</p>\r\n\r\n<p>&nbsp;</p>\r\n<p><span style="line-height:1.6em">For the developer job you will be working directly under the CIO on the core product as well as any supplementary products around that codebase.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>For the operations job you will work under my direction primarily servicing the contractual obligations of each state regulatory body we do business with.</p>\r\n<p>Bachelor&#39;s degree, preferably in STEM.</p>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$Xt5extWQHpDtx1tElTQS2.WK9UQm6LsoSwhOjMX.rVdpZ3IONU98S', 'Bio-Tech Medical Software, Inc.', NULL),
(123, 'CIS', 'Part-Time Opportunity for Student on Webpage ', 8, '2015-04-10 00:00:00', '2015-05-15 00:00:00', '<p>The Physical Oceanography Division is seeking one degree-seeking student in a local College or University to work part-time in web page development.</p>\r\n\r\n<p>This part-time position will require a maximum of 15 hours of work per week and can be partly done remotely. The hourly pay will depend on qualifications. It ranges between $20 and $30.</p>\r\n\r\n<p>The candidate should be legally eligible to take this part-time job.</p>\r\n<p>The selected candidate will maintain and improve the divisional web pages in collaboration with scientists from the Laboratory.</p>\r\n<p>The candidates are expected to have strong knowledge in web page development and design (e.g., php, html, css, java, etc) with general interest in science and very good English writing skills.</p>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$ZBD4fa0BH09B6mfFIMKkUOZpkEiSyWtyJjDmHP./G/XwpepLYuJbG', 'NOAA Atlantic Oceanographic and Meteorological Laboratory', NULL),
(124, 'CIS', 'Startup Partner - Strategist &amp; Dreamer', 8, '2015-04-15 00:00:00', '2015-05-15 00:00:00', '<p>As a Startup Partner that focuses on bringing ideas to life through the use of development platforms, you will engage with entrepreneurs to cobuild ideas that change the world. You will leverage your insight and experience leveraging mobile and web technologies, a highly creative problem solving skill set, superior oral/written communication skills, and an unquenchable thirst for building &#39;unicorn&#39; companies.</p>\r\n<ul>\r\n	<li>Command technologies to build platforms &amp; products&nbsp;</li>\r\n	<li>Manage and lead the strategic evaluation of startup ideas that enter the Rokk3r Labs ideas pipeline</li>\r\n	<li>Manage and develop relationships with entrepreneurs&nbsp;</li>\r\n	<li>Provide a highly seasoned/high-touch experience for entrepreneurs as they enter the Rokk3r Labs portfolio&nbsp;</li>\r\n	<li>Lead the strategic vision of a startup idea as part of &#39;startup cells&#39; in the pre-launch and post-launch phases</li>\r\n	<li>Work to establish Rokk3r Labs as the world&#39;s most exciting brand, and help to develop it as the most sought after destination for the world&#39;s best entrepreneurs/ideas and talent.&nbsp;</li>\r\n	<li>Think big and fast to enable entrepreneurs to change the world</li>\r\n</ul>\r\n<ul>\r\n	<li>Know you programming stuff!&nbsp;</li>\r\n	<li>Highly creative problem solving skills (analytical, technical &amp; strategic)</li>\r\n	<li>Superior ability to present to executives</li>\r\n	<li>Superior written/oral communication skills</li>\r\n	<li>Ability to recognize business risks and execute pivots</li>\r\n	<li>Think BIG &amp; be fearless!</li>\r\n</ul>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$hJKSS2lplAba.4bqhPXSu.dD6xcX/H1wlPIFf6Leznhlix.8oiGTm', 'Rokk3r Labs', NULL),
(125, 'CIS', 'Database Developer', 8, '2015-04-16 00:00:00', '2015-05-16 00:00:00', '<p>The database developer will create a new databse.</p>\r\n<p>We presently have an old database created with Clarion, and need to develop a new one. The new database can be created with any software adequate for rthe job. It will require multiple tables that can merge and combine with one another. Other requirements are: creating reports, extracting reports to a CSV format, creating custom queries, and merging documents with Microsoft Word and Excel.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>The applicant should be an existing student seeking for a paid intership or a graduate interested in freelance work.</p>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$rbkIQgCdLOErHiSmvoKOq.ws/4jzcTPIwV8iEN7pNWWSmsIF7ijfW', 'Property Tax Specialist Inc', NULL),
(126, 'CIS', 'iOS Developer', 8, '2015-04-21 00:00:00', '2015-07-31 00:00:00', '<p>Fortytwo Sports is looking for an exceptional iOS developer who will assist in the overall developmental process for new products. Our team will strive to use innovative technologies that change how millions of users connect, explore, and interact with information and one another. As an iOS Developer, you will be responsible for implementing front-end and back-end technologies for building a mobile application. You will work with a small team and can switch projects as our fast-paced business grows and evolves. The ideal candidate will be a self-motivated, out-of-the-box thinker, with a &lsquo;can-do, will do&rsquo; attitude with excellent communication skills and an ability to quickly ramp-up skills in new technologies.</p>\r\n\r\n<p>As a key member of a small and versatile team, you will design, test, deploy and maintain software solutions. Our ambitions reach far beyond a small startup company. You have the opportunity to become a principal member in a company looking to accomplish extraordinary measures.</p>\r\n<p><strong>Responsibilities:</strong></p>\r\n\r\n<ul>\r\n	<li>Lead the developmental process for building an iOS application.</li>\r\n	<li>Support the testing and launching efforts of new internet-based applications.</li>\r\n	<li>Serve as a key technical resource in programming applications.</li>\r\n	<li>Assist in developing an optimized back-end codebase.</li>\r\n	<li>Design and improve an ever-expanding database.</li>\r\n</ul>\r\n<p><strong>Preferred Qualifications:</strong></p>\r\n\r\n<ul>\r\n	<li>Fluent in Objective-C or C++.</li>\r\n	<li>Knowledgeable in database and web application development.</li>\r\n	<li>Pursuing or accomplished a BS in Computer Science or related field.</li>\r\n	<li>Interest in user interface design.</li>\r\n	<li>Knowledge of UI frameworks, MVP application design and complex, reactive touch based UI.</li>\r\n	<li>Deep technical knowledge of mobile application development (iOS).</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$cdY1o/w6AeuJis/lNUgxXu47L0J6nIq8Dw837.4/sWn1UNOXjtuZa', 'Fortytwo Sports', NULL),
(127, 'CIS', 'Java Developer', 8, '2015-04-21 00:00:00', '2015-07-31 00:00:00', '<p>Fortytwo Sports is looking for an exceptional java developer who will assist in the overall developmental process for new products. Our team will strive to use innovative technologies that change how millions of users connect, explore, and interact with information and one another. As a Java Developer, you will be responsible for implementing front-end and back-end technologies for building a web application. You will work with a small team and can switch projects as our fast-paced business grows and evolves. The ideal candidate will be a self-motivated, out-of-the-box thinker, with a &lsquo;can-do, will do&rsquo; attitude with excellent communication skills and an ability to quickly ramp-up skills in new technologies. &nbsp;</p>\r\n\r\n<p>As a key member of a small and versatile team, you will design, test, deploy and maintain software solutions. Our ambitions reach far beyond a small startup company. You have the opportunity to become a principal member in a company looking to accomplish extraordinary measures.</p>\r\n<p><strong>Responsibilities:</strong></p>\r\n\r\n<ul>\r\n	<li>Assist in the developmental process for building a web application.</li>\r\n	<li>Support the testing and launching efforts of new internet-based applications.</li>\r\n	<li>Serve as a key technical resource in programming applications.</li>\r\n	<li>Develop an optimized back-end codebase.</li>\r\n	<li>Design and improve an ever-expanding database.</li>\r\n</ul>\r\n<p><strong>Preferred Qualifications:</strong></p>\r\n\r\n<ul>\r\n	<li>Fluent in Java.</li>\r\n	<li>Knowledgeable in database and web application development.</li>\r\n	<li>Pursuing or accomplished a BS in Computer Science or related field.</li>\r\n	<li>Interest in user interface design.</li>\r\n	<li>Strong written and oral communication skills.</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$4naEtknm8m0NBAsaqdmNFu/EqkK1UdbaPPSC22vxNJ/OCIBcBpKa2', 'Fortytwo Sports', NULL),
(128, 'CIS', 'QA Engineer', 8, '2015-04-22 00:00:00', '2015-05-22 00:00:00', '<p><strong>Basic Purpose</strong></p>\r\n\r\n<p>Performs complex testing tasks requiring planning, scheduling, and testing to assure that developed products meet design specifications and are within total quality management limits and standards. Develops and executes test plans, and reviews the product from a user perspective to ensure that all functional requirements are met. Communicates with product developers and technical support specialists on product issues. Operates under minimal supervision.</p>\r\n\r\n<p>&nbsp;</p>\r\n<p><strong>Responsibilities</strong></p>\r\n\r\n<ul>\r\n	<li>Participate in project design sessions from a usability perspective and/or as a domain expert</li>\r\n	<li>Interface with Developers and Business Analysts to develop and implement test plans, test cases and maintain an audit trail</li>\r\n	<li>Participate in review of test cases written by other testers</li>\r\n	<li>Perform functional, installation, integration, stress, load, performance, system, and documentation testing</li>\r\n	<li>Test user interfaces and APIs if applicable</li>\r\n	<li>Identify and prioritize important program defects and enter into defect-tracking tool; track status of reported defects and take appropriate action for timely resolution of outstanding problems</li>\r\n	<li>Contribute to development estimates and schedule</li>\r\n	<li>Demonstrate/encourage teamwork among Aderant, clients, and other parties</li>\r\n	<li>Continual self development in technical, business and analytic areas</li>\r\n	<li>&nbsp;</li>\r\n</ul>\r\n<p><strong>Skills &amp; Requirements</strong></p>\r\n\r\n<ul>\r\n	<li>Bachelor degree in business or computer science is preferred</li>\r\n	<li>Strong communication, writing and editing skills</li>\r\n	<li>Ability to manage multiple projects</li>\r\n	<li>Proficiency in problem recognition and solving skills</li>\r\n	<li>Be able to work well as part of a team and to form liaisons with other groups in order to achieve a desired objective</li>\r\n	<li>Be a self-starter and have an ability to work with little direct supervision on projects</li>\r\n	<li>Dedication to producing quality work and completing tasks within specified time frames</li>\r\n	<li>Some proficiency in testing methodologies, testing products, UI best practices, and design</li>\r\n	<li>Demonstrates troubleshooting and issue resolution skills</li>\r\n	<li>Desire/initiative/ability to learn more advanced technical and design concepts</li>\r\n	<li>Operational understanding of MS Office Applications: Word, Excel, Access, PowerPoint, Visio</li>\r\n	<li>Microsoft Outlook experience</li>\r\n	<li>Microsoft SQL Server experience</li>\r\n	<li>Microsoft Windows experience, all versions and editions</li>\r\n</ul>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$zgjqPabN90kNMF4tFFkXqOeHh4Mylg3MfDZUQABJIrrKB/MDsKIxy', 'Aderant', NULL),
(129, 'CIS', 'Software Engineer', 8, '2015-04-22 00:00:00', '2015-05-22 00:00:00', '<p>This is a great opportunity to launch your IT career, and put your strong problem solving and technical skills to good use. As part of our succession and growth plans we&rsquo;re excited about adding a group of highly capable and enthusiastic graduate engineers to our Tallahassee operations.<br />\r\n<br />\r\nYou&rsquo;ll be joining a talented development team working on the latest Aderant Expert application. The team is utilizing some of the most up to date MS technologies, and though you may not have used these in the past, you&rsquo;ll be provided with excellent guidance and support to grow your skills and knowledge.</p>\r\n\r\n<p><br />\r\nWe work in a very team centric environment &ndash; so we&rsquo;re expecting an unusually high level of general communication and relating skills so that you work effectively with your peers and clients.<br />\r\n<br />\r\nThis is a fantastic opportunity for the right people to start and grow a career within the software industry.</p>\r\n<p>After your initial induction period you&rsquo;ll be working on the following duties alongside your team:</p>\r\n\r\n<ul>\r\n	<li>Deliver quality, commercially robust applications, written in .Net and C# and other relevant tools and languages.</li>\r\n	<li>Adopt agile philosophies and contribute towards improving methodology implementation.<br />\r\n	Participate in source code and design reviews as required.</li>\r\n	<li>Work collaboratively with your team to ensure the Project/Development manager is aware of any problems or potential problems that may impact scheduled deadlines to projects.</li>\r\n	<li>Conduct research; prepare models, prototypes, requirement documents and other appropriate documentation to enhance the functional and technical aspects of our products.</li>\r\n</ul>\r\n\r\n<p>We expect that you&rsquo;ll have recently completed an appropriate tertiary qualification. Though this may not be in the computer science field, you are passionate about software development, and looking for your first opportunity to get into a serious software development role. You&rsquo;ll have a real interest in technology and be very proactive solving problems and using your initiative.</p>\r\n<ul>\r\n	<li>4 year degree in Computer Science, Software Engineering or related major</li>\r\n	<li>Experience with .NET and C# is preferred</li>\r\n</ul>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$wH7WcTtuUDauWhfAx2.fHeLETQKlqmjx3xbuE52dTFWDMZADrbe3y', 'Aderant', NULL),
(130, 'Part Time', 'Yii Developer', 12, '2015-06-04 00:37:15', '2015-06-30 00:00:00', 'We are looking for a Senior Web Developer with more than 5 years of experience working with Yii framework. Html, Css and Javascript is also required for this position.', '65,000', NULL, NULL, 0, NULL, NULL, 'asdasd', NULL),
(131, 'Full Time', 'Software Engineer ', 12, '2015-06-12 03:31:06', '2015-06-12 00:00:00', 'Excellent job opportunity for Software Engineers with knowledge of Design Patterns.', '80000', NULL, NULL, 0, NULL, NULL, 'asdasd', NULL),
(132, 'Full Time', 'Software Engineer', 74, '2015-06-12 04:56:36', '2015-06-30 00:00:00', 'Wonderful job opportunity for Android developers.', '80000', NULL, NULL, 1, NULL, NULL, 'Android Fake Studio', NULL),
(133, 'Internship', 'Intership for VJF', 74, '2015-06-12 19:11:06', '2015-06-30 00:00:00', 'Test', '10', NULL, NULL, 1, NULL, NULL, 'Android Fake Studio', NULL),
(134, 'Full Time', 'System Administrator', 12, '2015-06-16 21:07:48', '2015-07-31 00:00:00', 'We are looking for an experienced system administrator for a full time position at out company. Some of the requirements are: SQL, Windows 2012 Server and MS Exchange 2008. ', '45,000', NULL, NULL, 0, NULL, NULL, 'asdasd', NULL),
(138, 'Part Time', 'Senior Web Developer', 12, '2015-06-16 21:34:02', '2015-07-31 00:00:00', 'PHP, HTML and JavaScript.', '45000', NULL, NULL, 0, NULL, NULL, 'asdasd', NULL),
(139, 'Full Time', 'System Administrator', 12, '2015-06-16 21:39:36', '2015-07-31 00:00:00', 'We are looking for an experienced system administrator for a full time position at out company. Some of the requirements are: SQL, Windows 2012 Server and MS Exchange 2008. ', '45,000', NULL, NULL, 1, NULL, NULL, 'asdasd', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2320 ;

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
(2279, 129, 58, NULL, 21),
(2280, 130, 30, NULL, 1),
(2281, 130, 2, NULL, 2),
(2282, 130, 1, NULL, 3),
(2283, 130, 8, NULL, 4),
(2284, 130, 17, NULL, 5),
(2285, 130, 16, NULL, 6),
(2286, 130, 58, NULL, 7),
(2287, 131, 124, NULL, 1),
(2288, 131, 1, NULL, 2),
(2289, 131, 32, NULL, 3),
(2290, 132, 57, NULL, 1),
(2291, 132, 124, NULL, 2),
(2292, 132, 1, NULL, 3),
(2293, 132, 32, NULL, 4),
(2294, 133, 3, NULL, 1),
(2295, 133, 30, NULL, 2),
(2296, 133, 48, NULL, 3),
(2297, 134, 2, NULL, 1),
(2298, 134, 7, NULL, 2),
(2299, 134, 58, NULL, 3),
(2314, 138, 3, NULL, 1),
(2315, 138, 8, NULL, 2),
(2316, 138, 16, NULL, 3),
(2317, 139, 2, NULL, 1),
(2318, 139, 7, NULL, 2),
(2319, 139, 58, NULL, 3);

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
  `been_deleted` int(11) NOT NULL DEFAULT '0',
  `sender_deleted` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_FK_receiver` (`FK_receiver`),
  KEY `idx_FK_sender` (`FK_sender`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `FK_receiver`, `FK_sender`, `message`, `date`, `been_read`, `been_deleted`, `sender_deleted`, `subject`, `userImage`) VALUES
(5, 'student4', 'student4', '', '2015-06-11 23:58:17', 1, 1, 1, 'Hello', '/JobFair/images/profileimages/user-default.png'),
(6, 'student3', 'student4', 'There is a new Job Posting for a Developer positions.\r\n\r\nRegards,\r\n\r\nStudent 4', '2015-06-12 00:20:09', 1, 0, 0, 'Important message', '/JobFair/images/profileimages/user-default.png'),
(7, 'student4', 'student3', 'Thank you so much for the info. See you in class tomorrow.\r\n\r\nOn 2015-06-12 00:20:09, student4 wrote:\r\nThere is a new Job Posting for a Developer positions.\r\n\r\nRegards,\r\n\r\nStudent 4', '2015-06-12 00:23:19', 1, 0, 0, 'Re: Important message', '/JobFair/images/profileimages/user-default.png'),
(8, 'student3', 'student4', 'No problem my friend.\r\n\r\nOn 2015-06-12 00:23:19, student3 wrote:\r\nThank you so much for the info. See you in class tomorrow.\r\n\r\nOn 2015-06-12 00:20:09, student4 wrote:\r\nThere is a new Job Posting for a Developer positions.\r\n\r\nRegards,\r\n\r\nStudent 4', '2015-06-12 00:26:28', 1, 0, 1, 'Re: Re: Important message', '/JobFair/images/profileimages/student4avatar.jpg'),
(10, 'ralfo028', 'android', '', '2015-06-12 06:16:01', 1, 1, -1, 'Hello', '/JobFair/images/profileimages/androidavatar.png'),
(14, 'android', 'admin', '', '2015-06-12 17:04:51', NULL, -1, 0, 'Hello', '/JobFair/images/profileimages/user-default.png'),
(15, 'ralfo028', 'android', '', '2015-06-12 18:16:46', NULL, 0, -1, 'Hello', '/JobFair/images/profileimages/androidavatar.png'),
(17, 'ralfo028', 'android', '', '2015-06-12 19:12:48', 1, 0, 1, 'Hello Rene', '/JobFair/images/profileimages/androidavatar.png'),
(18, 'ralfo028', 'android', '', '2015-06-12 19:37:54', 1, -1, 1, 'Hello', '/JobFair/images/profileimages/androidavatar.png'),
(19, 'android', 'admin', '', '2015-06-12 19:38:51', NULL, 1, 0, 'Hello', '/JobFair/images/profileimages/user-default.png'),
(20, 'admin', 'admin', '', '2015-06-12 19:55:45', NULL, 1, 1, 'Delete Me', '/JobFair/images/profileimages/user-default.png');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=507 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `sender_id`, `receiver_id`, `datetime`, `been_read`, `message`, `link`, `importancy`, `msgID`) VALUES
(8, 12, 55, '23:41:32', 0, 'Hi RogerSTU, the company employer10 just posted a job Yii Developer that matches your skills', 'http://localhost/JobFair/index.php/job/view/jobid/130', 2, NULL),
(9, 12, 5, '23:41:32', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Yii Developer that matches your skills', 'http://localhost/JobFair/index.php/job/view/jobid/130', 2, NULL),
(10, 12, 14, '23:41:32', 1, 'Hi student3, the company employer10 just posted a job Yii Developer that matches your skills', 'http://localhost/JobFair/index.php/job/view/jobid/130', 2, NULL),
(12, 12, 55, '23:42:35', 0, 'Hi RogerSTU, the company employer10 just posted a job Yii Developer that matches your skills', 'http://localhost/JobFair/index.php/job/view/jobid/130', 2, NULL),
(13, 12, 5, '23:42:35', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Yii Developer that matches your skills', 'http://localhost/JobFair/index.php/job/view/jobid/130', 2, NULL),
(14, 12, 14, '23:42:35', 1, 'Hi student3, the company employer10 just posted a job Yii Developer that matches your skills', 'http://localhost/JobFair/index.php/job/view/jobid/130', 2, NULL),
(19, 15, 15, '23:58:17', 1, 'You have a new message from student4', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/message', 3, 5),
(20, 15, 14, '00:20:09', 1, 'You have a new message from student4', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/message', 3, 6),
(21, 14, 15, '00:23:19', 1, 'You have a new message from student3', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/message', 3, 7),
(22, 15, 14, '00:26:28', 1, 'You have a new message from student4', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/message', 3, 8),
(23, 12, 55, '00:36:21', 0, 'Hi RogerSTU, the company employer10 just posted a job Yii Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/130', 2, NULL),
(24, 12, 5, '00:36:21', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Yii Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/130', 2, NULL),
(25, 12, 14, '00:36:21', 0, 'Hi student3, the company employer10 just posted a job Yii Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/130', 2, NULL),
(26, 12, 18, '00:36:21', 0, 'Hi student7, the company employer10 just posted a job Yii Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/130', 2, NULL),
(27, 12, 5, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(28, 12, 9, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(29, 12, 14, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(30, 12, 15, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(31, 12, 16, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(32, 12, 17, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(33, 12, 18, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(34, 12, 19, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(35, 12, 22, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(36, 12, 26, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(37, 12, 55, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(38, 12, 60, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(39, 12, 63, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(40, 12, 64, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(41, 12, 66, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(42, 12, 71, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(43, 12, 72, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(44, 12, 73, '03:31:06', 0, 'employer10 just posted a new job: Software Engineer . Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 1, NULL),
(46, 12, 55, '03:31:06', 0, 'Hi RogerSTU, the company employer10 just posted a job Software Engineer  that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 2, NULL),
(47, 12, 5, '03:31:06', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Software Engineer  that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 2, NULL),
(48, 12, 14, '03:31:06', 0, 'Hi student3, the company employer10 just posted a job Software Engineer  that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/131', 2, NULL),
(49, 74, 5, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(50, 74, 9, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(51, 74, 14, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(52, 74, 15, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(53, 74, 16, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(54, 74, 17, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(55, 74, 18, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(56, 74, 19, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(57, 74, 22, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(58, 74, 26, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(59, 74, 55, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(60, 74, 60, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(61, 74, 63, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(62, 74, 64, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(63, 74, 66, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(64, 74, 71, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(65, 74, 72, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(66, 74, 73, '04:54:18', 0, 'android just joined VJF, click here to view their profile.', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(67, 74, 2, '04:54:18', 0, 'There is a new employer named android that is waiting for acctivation', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/profile/employer/user/android', 1, NULL),
(68, 74, 5, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(69, 74, 9, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(70, 74, 14, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(71, 74, 15, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(72, 74, 16, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(73, 74, 17, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(74, 74, 18, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(75, 74, 19, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(76, 74, 22, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(77, 74, 26, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(78, 74, 55, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(79, 74, 60, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(80, 74, 63, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(81, 74, 64, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(82, 74, 66, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(83, 74, 71, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(84, 74, 72, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(85, 74, 73, '04:56:36', 0, 'android just posted a new job: Software Engineer. Click here to view the post. ', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 1, NULL),
(87, 74, 5, '04:56:37', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(88, 74, 26, '04:56:37', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(89, 74, 55, '04:56:37', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(90, 74, 71, '04:58:58', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(91, 74, 5, '04:58:58', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(92, 74, 26, '04:58:58', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(93, 74, 55, '04:58:58', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(94, 74, 71, '04:59:38', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(95, 74, 5, '04:59:38', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(96, 74, 26, '04:59:38', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(97, 74, 55, '04:59:38', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(98, 74, 71, '05:00:54', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(99, 74, 5, '05:00:54', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(100, 74, 26, '05:00:54', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(101, 74, 55, '05:00:54', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(102, 74, 71, '05:01:01', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(103, 74, 5, '05:01:01', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(104, 74, 26, '05:01:01', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(105, 74, 55, '05:01:01', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(106, 74, 71, '05:51:40', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(107, 74, 5, '05:51:40', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(108, 74, 26, '05:51:40', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(109, 74, 55, '05:51:40', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(110, 74, 71, '05:52:19', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(111, 74, 5, '05:52:19', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(112, 74, 26, '05:52:19', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(113, 74, 55, '05:52:19', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(114, 74, 71, '05:52:36', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(115, 74, 5, '05:52:36', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(116, 74, 26, '05:52:36', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(117, 74, 55, '05:52:36', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(118, 74, 71, '05:53:13', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(119, 74, 5, '05:53:13', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(120, 74, 26, '05:53:13', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(121, 74, 55, '05:53:13', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(122, 74, 71, '05:53:17', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(123, 74, 5, '05:53:17', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(124, 74, 26, '05:53:17', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(125, 74, 55, '05:53:17', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(126, 74, 71, '05:53:28', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(127, 74, 5, '05:53:28', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(128, 74, 26, '05:53:28', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(129, 74, 55, '05:53:28', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(130, 74, 71, '05:54:05', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(131, 74, 5, '05:54:05', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(132, 74, 26, '05:54:05', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(133, 74, 55, '05:54:05', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(134, 74, 71, '05:54:35', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(135, 74, 5, '05:54:35', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(136, 74, 26, '05:54:35', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(137, 74, 55, '05:54:35', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(138, 74, 71, '05:56:25', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(139, 74, 5, '05:56:25', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(140, 74, 26, '05:56:25', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(141, 74, 55, '05:56:25', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(148, 74, 71, '18:05:16', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(149, 74, 5, '18:05:16', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(150, 74, 26, '18:05:16', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(151, 74, 55, '18:05:16', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(152, 74, 71, '18:06:06', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(153, 74, 5, '18:06:06', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(154, 74, 26, '18:06:06', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(155, 74, 55, '18:06:06', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(156, 74, 71, '18:06:28', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(157, 74, 5, '18:06:28', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(158, 74, 26, '18:06:28', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(159, 74, 55, '18:06:28', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(160, 74, 71, '18:10:39', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(161, 74, 5, '18:10:39', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(162, 74, 26, '18:10:39', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(163, 74, 55, '18:10:39', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(164, 74, 71, '18:10:49', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(165, 74, 5, '18:10:49', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(166, 74, 26, '18:10:49', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(167, 74, 55, '18:10:49', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(168, 74, 71, '18:11:46', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(169, 74, 5, '18:11:46', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(170, 74, 26, '18:11:46', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(171, 74, 55, '18:11:46', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cs.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(172, 74, 71, '18:12:00', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(173, 74, 5, '18:12:00', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(174, 74, 26, '18:12:00', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(175, 74, 55, '18:12:00', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(176, 74, 71, '18:12:05', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(177, 74, 5, '18:12:05', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(178, 74, 26, '18:12:05', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(179, 74, 55, '18:12:05', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(180, 74, 71, '18:15:20', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(181, 74, 5, '18:15:20', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(182, 74, 26, '18:15:20', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(183, 74, 55, '18:15:20', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(184, 74, 71, '18:15:39', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(185, 74, 5, '18:15:39', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(186, 74, 26, '18:15:39', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(187, 74, 55, '18:15:39', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(188, 74, 71, '18:15:57', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(189, 74, 5, '18:15:57', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(190, 74, 26, '18:15:57', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(191, 74, 55, '18:15:57', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(192, 74, 71, '18:16:10', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(193, 74, 5, '18:16:10', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(194, 74, 26, '18:16:10', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(195, 74, 55, '18:16:10', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(198, 74, 5, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(199, 74, 9, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(200, 74, 14, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(201, 74, 15, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(202, 74, 16, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(203, 74, 17, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(204, 74, 18, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(205, 74, 19, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(206, 74, 22, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(207, 74, 26, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(208, 74, 55, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(209, 74, 60, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(210, 74, 63, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(211, 74, 64, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(212, 74, 66, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(213, 74, 71, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(214, 74, 72, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(215, 74, 73, '19:11:06', 0, 'android just posted a new job: Intership for VJF. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 1, NULL),
(216, 74, 55, '19:11:06', 0, 'Hi RogerSTU, the company android just posted a job Intership for VJF that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 2, NULL),
(217, 74, 14, '19:11:06', 0, 'Hi student3, the company android just posted a job Intership for VJF that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 2, NULL),
(218, 74, 17, '19:11:06', 0, 'Hi student6, the company android just posted a job Intership for VJF that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 2, NULL),
(219, 74, 16, '19:11:06', 0, 'Hi student5, the company android just posted a job Intership for VJF that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 2, NULL),
(220, 74, 5, '19:11:06', 0, 'Hi earen003@fiu.edu, the company android just posted a job Intership for VJF that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/133', 2, NULL),
(221, 74, 71, '19:11:30', 1, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(222, 74, 5, '19:11:30', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(223, 74, 26, '19:11:30', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(224, 74, 55, '19:11:30', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(225, 74, 71, '19:12:48', 1, 'You have a new message from android', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/message', 3, 17),
(226, 74, 71, '19:36:34', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(227, 74, 5, '19:36:34', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(228, 74, 26, '19:36:34', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(229, 74, 55, '19:36:34', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(230, 74, 71, '19:36:51', 0, 'Hi ralfo028, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(231, 74, 5, '19:36:51', 0, 'Hi earen003@fiu.edu, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(232, 74, 26, '19:36:51', 0, 'Hi sadjadis@gmail.com, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(233, 74, 55, '19:36:51', 0, 'Hi RogerSTU, the company android just posted a job Software Engineer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/132', 2, NULL),
(236, 2, 2, '19:55:45', 1, 'You have a new message from admin', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/message', 3, 20),
(237, 77, 5, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(238, 77, 9, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(239, 77, 14, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(240, 77, 15, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(241, 77, 16, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(242, 77, 17, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(243, 77, 18, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(244, 77, 19, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(245, 77, 22, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(246, 77, 26, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(247, 77, 55, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(248, 77, 60, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(249, 77, 63, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(250, 77, 64, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(251, 77, 66, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(252, 77, 71, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(253, 77, 72, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(254, 77, 73, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(255, 77, 75, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(256, 77, 76, '20:47:28', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(257, 77, 2, '20:47:28', 0, 'There is a new employer named RFakeEmp that is waiting for activation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(258, 78, 5, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(259, 78, 9, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(260, 78, 14, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(261, 78, 15, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(262, 78, 16, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(263, 78, 17, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(264, 78, 18, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(265, 78, 19, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(266, 78, 22, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(267, 78, 26, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(268, 78, 55, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(269, 78, 60, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(270, 78, 63, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(271, 78, 64, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(272, 78, 66, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(273, 78, 71, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(274, 78, 72, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(275, 78, 73, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(276, 78, 75, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(277, 78, 76, '20:59:08', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(278, 78, 2, '20:59:08', 0, 'There is a new employer named RFakeEmp that is waiting for activation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(279, 79, 5, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(280, 79, 9, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(281, 79, 14, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(282, 79, 15, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(283, 79, 16, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL);
INSERT INTO `notification` (`id`, `sender_id`, `receiver_id`, `datetime`, `been_read`, `message`, `link`, `importancy`, `msgID`) VALUES
(284, 79, 17, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(285, 79, 18, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(286, 79, 19, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(287, 79, 22, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(288, 79, 26, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(289, 79, 55, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(290, 79, 60, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(291, 79, 63, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(292, 79, 64, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(293, 79, 66, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(294, 79, 71, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(295, 79, 72, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(296, 79, 73, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(297, 79, 75, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(298, 79, 76, '21:01:37', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(299, 79, 2, '21:01:37', 0, 'There is a new employer named RFakeEmp that is waiting for activation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(300, 80, 5, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(301, 80, 9, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(302, 80, 14, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(303, 80, 15, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(304, 80, 16, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(305, 80, 17, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(306, 80, 18, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(307, 80, 19, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(308, 80, 22, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(309, 80, 26, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(310, 80, 55, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(311, 80, 60, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(312, 80, 63, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(313, 80, 64, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(314, 80, 66, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(315, 80, 71, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(316, 80, 72, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(317, 80, 73, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(318, 80, 75, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(319, 80, 76, '21:02:31', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(320, 80, 2, '21:02:31', 0, 'There is a new employer named RFakeEmp that is waiting for activation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(321, 81, 5, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(322, 81, 9, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(323, 81, 14, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(324, 81, 15, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(325, 81, 16, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(326, 81, 17, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(327, 81, 18, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(328, 81, 19, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(329, 81, 22, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(330, 81, 26, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(331, 81, 55, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(332, 81, 60, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(333, 81, 63, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(334, 81, 64, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(335, 81, 66, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(336, 81, 71, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(337, 81, 72, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(338, 81, 73, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(339, 81, 75, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(340, 81, 76, '21:03:11', 0, 'RFakeEmp just joined VJF, click here to view their profile.', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(341, 81, 2, '21:03:11', 0, 'There is a new employer named RFakeEmp that is waiting for activation', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/profile/employer/user/RFakeEmp', 1, NULL),
(342, 12, 5, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(343, 12, 9, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(344, 12, 14, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(345, 12, 15, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(346, 12, 16, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(347, 12, 17, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(348, 12, 18, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(349, 12, 19, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(350, 12, 22, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(351, 12, 26, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(352, 12, 55, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(353, 12, 60, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(354, 12, 63, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(355, 12, 64, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(356, 12, 66, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(357, 12, 71, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(358, 12, 72, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(359, 12, 73, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(360, 12, 75, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(361, 12, 76, '21:07:48', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 1, NULL),
(362, 12, 18, '21:07:48', 0, 'Hi student7, the company employer10 just posted a job System Administrator that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 2, NULL),
(363, 12, 14, '21:07:48', 0, 'Hi student3, the company employer10 just posted a job System Administrator that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 2, NULL),
(364, 12, 26, '21:07:48', 0, 'Hi sadjadis@gmail.com, the company employer10 just posted a job System Administrator that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/134', 2, NULL),
(365, 12, 5, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(366, 12, 9, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(367, 12, 14, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(368, 12, 15, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(369, 12, 16, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(370, 12, 17, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(371, 12, 18, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(372, 12, 19, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(373, 12, 22, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(374, 12, 26, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(375, 12, 55, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(376, 12, 60, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(377, 12, 63, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(378, 12, 64, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(379, 12, 66, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(380, 12, 71, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(381, 12, 72, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(382, 12, 73, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(383, 12, 75, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(384, 12, 76, '21:09:07', 0, 'employer10 just posted a new job: Junior System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 1, NULL),
(385, 12, 18, '21:09:07', 0, 'Hi student7, the company employer10 just posted a job Junior System Administrator that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 2, NULL),
(386, 12, 14, '21:09:07', 0, 'Hi student3, the company employer10 just posted a job Junior System Administrator that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 2, NULL),
(387, 12, 26, '21:09:07', 0, 'Hi sadjadis@gmail.com, the company employer10 just posted a job Junior System Administrator that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/135', 2, NULL),
(388, 12, 5, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(389, 12, 9, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(390, 12, 14, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(391, 12, 15, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(392, 12, 16, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(393, 12, 17, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(394, 12, 18, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(395, 12, 19, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(396, 12, 22, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(397, 12, 26, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(398, 12, 55, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(399, 12, 60, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(400, 12, 63, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(401, 12, 64, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(402, 12, 66, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(403, 12, 71, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(404, 12, 72, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(405, 12, 73, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(406, 12, 75, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(407, 12, 76, '21:17:24', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 1, NULL),
(408, 12, 55, '21:17:24', 0, 'Hi RogerSTU, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 2, NULL),
(409, 12, 5, '21:17:24', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 2, NULL),
(410, 12, 14, '21:17:24', 0, 'Hi student3, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 2, NULL),
(411, 12, 16, '21:17:24', 0, 'Hi student5, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/136', 2, NULL),
(412, 12, 5, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(413, 12, 9, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(414, 12, 14, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(415, 12, 15, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(416, 12, 16, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(417, 12, 17, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(418, 12, 18, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(419, 12, 19, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(420, 12, 22, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(421, 12, 26, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(422, 12, 55, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(423, 12, 60, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(424, 12, 63, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(425, 12, 64, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(426, 12, 66, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(427, 12, 71, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(428, 12, 72, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(429, 12, 73, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(430, 12, 75, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(431, 12, 76, '21:18:20', 0, 'employer10 just posted a new job: Junior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 1, NULL),
(432, 12, 55, '21:18:20', 0, 'Hi RogerSTU, the company employer10 just posted a job Junior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 2, NULL),
(433, 12, 5, '21:18:20', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Junior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 2, NULL),
(434, 12, 14, '21:18:20', 0, 'Hi student3, the company employer10 just posted a job Junior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 2, NULL),
(435, 12, 16, '21:18:20', 0, 'Hi student5, the company employer10 just posted a job Junior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/137', 2, NULL),
(436, 12, 5, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(437, 12, 9, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(438, 12, 14, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(439, 12, 15, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(440, 12, 16, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(441, 12, 17, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(442, 12, 18, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(443, 12, 19, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(444, 12, 22, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(445, 12, 26, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(446, 12, 55, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(447, 12, 60, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(448, 12, 63, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(449, 12, 64, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(450, 12, 66, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(451, 12, 71, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(452, 12, 72, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(453, 12, 73, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(454, 12, 75, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(455, 12, 76, '21:34:02', 0, 'employer10 just posted a new job: Senior Web Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 1, NULL),
(456, 12, 55, '21:34:02', 0, 'Hi RogerSTU, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(457, 12, 5, '21:34:02', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(458, 12, 14, '21:34:02', 0, 'Hi student3, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(459, 12, 16, '21:34:02', 0, 'Hi student5, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(460, 12, 55, '21:35:08', 0, 'Hi RogerSTU, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(461, 12, 5, '21:35:08', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(462, 12, 14, '21:35:08', 0, 'Hi student3, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(463, 12, 16, '21:35:08', 0, 'Hi student5, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(464, 12, 55, '21:36:37', 0, 'Hi RogerSTU, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(465, 12, 5, '21:36:37', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(466, 12, 14, '21:36:37', 0, 'Hi student3, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(467, 12, 16, '21:36:37', 0, 'Hi student5, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(468, 12, 55, '21:37:44', 0, 'Hi RogerSTU, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(469, 12, 5, '21:37:44', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(470, 12, 14, '21:37:44', 0, 'Hi student3, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(471, 12, 16, '21:37:44', 0, 'Hi student5, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(472, 12, 55, '21:37:45', 0, 'Hi RogerSTU, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(473, 12, 5, '21:37:45', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(474, 12, 14, '21:37:45', 0, 'Hi student3, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(475, 12, 16, '21:37:45', 0, 'Hi student5, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(476, 12, 55, '21:37:46', 0, 'Hi RogerSTU, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(477, 12, 5, '21:37:46', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(478, 12, 14, '21:37:46', 0, 'Hi student3, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(479, 12, 16, '21:37:46', 0, 'Hi student5, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(480, 12, 55, '21:38:07', 0, 'Hi RogerSTU, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(481, 12, 5, '21:38:07', 0, 'Hi earen003@fiu.edu, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(482, 12, 14, '21:38:07', 0, 'Hi student3, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(483, 12, 16, '21:38:07', 0, 'Hi student5, the company employer10 just posted a job Senior Web Developer that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/138', 2, NULL),
(484, 12, 5, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(485, 12, 9, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(486, 12, 14, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(487, 12, 15, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(488, 12, 16, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(489, 12, 17, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(490, 12, 18, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(491, 12, 19, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(492, 12, 22, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(493, 12, 26, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(494, 12, 55, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(495, 12, 60, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(496, 12, 63, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(497, 12, 64, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(498, 12, 66, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(499, 12, 71, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(500, 12, 72, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(501, 12, 73, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(502, 12, 75, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(503, 12, 76, '21:39:36', 0, 'employer10 just posted a new job: System Administrator. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 1, NULL),
(504, 12, 18, '21:39:36', 0, 'Hi student7, the company employer10 just posted a job System Administrator that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 2, NULL),
(505, 12, 14, '21:39:36', 0, 'Hi student3, the company employer10 just posted a job System Administrator that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 2, NULL),
(506, 12, 26, '21:39:36', 0, 'Hi sadjadis@gmail.com, the company employer10 just posted a job System Administrator that matches your skills', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/139', 2, NULL);

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
(60, '/JobFair/resumes/60-Student.pdf'),
(71, '/JobFair/resumes/71-Business Resume.pdf');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=126 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=295 ;

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
(289, 71, 123, NULL, 1),
(290, 71, 1, NULL, 2),
(291, 71, 124, NULL, 3),
(292, 76, 3, NULL, 1),
(293, 76, 30, NULL, 2),
(294, 76, 125, NULL, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `FK_usertype`, `email`, `registration_date`, `activation_string`, `activated`, `image_url`, `first_name`, `last_name`, `disable`, `has_viewed_profile`, `linkedinid`, `googleid`, `fiucsid`, `hide_email`, `job_notification`, `fiu_account_id`, `looking_for_job`, `job_int_date`) VALUES
(2, 'admin', '$2a$08$UovPrdGi/NfiYryxCAbEAeS3XvScYmkEx51QeTxNE6N2tXm7HWwBq', 3, 'admin@mail.com', '2014-06-10 06:57:27', '', 1, '/JobFair/images/profileimages/user-default.png', 'Admin', 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(5, 'earen003@fiu.edu', '$2a$08$.wTFdqjfaVSAekwumRTumOHdMmMcaantOW2SVefl8Od1gCgOTmA/u', 1, 'earen003123@fiu.edu', '2014-10-04 15:37:55', 'google', 1, 'https://media.licdn.com/mpr/mprx/0_Gj0mWYPz0DWq_3q5iYr8oxrMUpvN6Cq5iaTi70GUveqBC_QITDYCDzvdlhm', 'Erick', 'Arenas', 0, 1, 'DywORbIHTc', '107193070609153671555', NULL, NULL, 1, NULL, 1, 5),
(8, 'test_cis_fiu_edu', '$2a$08$0L3h//kusVHOdsX1.63B5.eZsXumUFCzudt1EVJCEGFTowlIyRIIG', 2, 'test@cis.fiu.edu', '2014-10-11 20:36:39', NULL, 1, '/JobFair/images/profileimages/user-default.png', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(9, 'student8', '$2a$08$lc0rNoh.imE0DMCJPjqyGObn3m4ztqECqE2kKbmBgkX9oudrg0dHi', 1, 'arenaserick123@yahoo.com', '2014-11-06 13:30:00', '3vlsgjawyq', 1, '/JobFair/images/profileimages/user-default.png', 'erickkk', 'arenass', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 5),
(11, 'nmad43', '$2a$08$41tQbGBVPNnLRY5pQxUicOqtmLy2t/SqbMuzJ4z7DAHdt3QfJtosK', 2, 'nmada002@fiu.edu', '2014-11-13 13:10:32', 'vihzwtsplq', NULL, '/JobFair/images/profileimages/user-default.png', 'Nicholas', 'Madariaga', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 0),
(12, 'employer10', '$2a$08$oLylkwLN2eMvx.B9AtLVhu4dSoLvAvVc7oWTSTGhKt2pDlZY8uBB.', 2, 'employertwo@mail.com', '2014-11-23 17:33:16', '5qjanjsv5n', 1, '/JobFair/images/profileimages/user-default.png', 'emp', 'two', 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 5),
(14, 'student3', '$2a$08$oPt5manAQUtYPPwKBzEtW.Bjn4OXGYJvHqSfoLQ1neU4xn3sNcy5e', 1, 'student3@mail.com', '2014-12-08 12:10:29', '0dm6r4sm8x', 1, '/JobFair/images/profileimages/user-default.png', 'student', 'three', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(15, 'student4', '$2a$08$CdHaBhoQniFWjXQxIztgX.BGeH0m2ApEjd4U.Hl11P9EUHtZi9c/i', 1, 'student4@mail.com', '2014-12-08 12:10:56', 'civrojoyt8', 0, '/JobFair/images/profileimages/student4avatar.jpg', 'student', 'four', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
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
(63, 'hgutierrez.jobs@gmail.com', '$2a$08$HYwdV8.ws5pUCgnL0RUh0ONXun0Km2gH5ihMMsreTW6rKps8972OK', 1, 'hgutierrez.jobs@gmail.com', '2015-04-06 23:27:15', 'google', 1, 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', 'Heidy', 'Gutierrez', 0, NULL, NULL, '105478010618083573451', NULL, NULL, 1, NULL, 1, 0),
(71, 'ralfo028', '$2a$08$3A7HpQcR8uNaCtbY7ERp..TLmrXBqgtOXOVUpcifnZyZyhJy5cbfW', 1, 'renefakeemail@mail.com', '2015-06-12 00:28:58', '0mztifdaxz', 1, '/JobFair/images/profileimages/ralfo028avatar.jpg', 'Rene', 'Alfonso', 0, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(72, 'student15', '$2a$08$XoClsAqz7SUAWGP70Ho2yu9dlls6dIs41e45jkZ3yk5EX0FJZVREe', 1, 'student15@mail.com', '2015-06-12 00:38:37', '70luwuk0hc', NULL, '/JobFair/images/profileimages/user-default.png', 'Student', 'Fifteen', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(73, 'newstudent', '$2a$08$3AEZmYlRVVrVmxYSC5QQ1u8G8Hj8R9DnSipD3byrm5tB4YiJNXM52', 1, 'newstu@mail.com', '2015-06-12 01:10:56', '0fnx8phdcs', 0, '/JobFair/images/profileimages/user-default.png', 'NewStudent', 'DeleteMe', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(74, 'android', '$2a$08$HcWWf.a.A81YQwmrwlCb4eUsl/Vyn9vXIKAN/AD1KaXtq/g/QywDK', 2, 'androidfake@mail.com', '2015-06-12 04:54:18', '54d847sv48', 1, '/JobFair/images/profileimages/androidavatar.png', 'Android', 'Employer', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 0),
(75, 'vjftester', '$2a$08$7jh2RaCJTSthoO4EGcSTeeRo.ZEip.zupEyAwdxbbb78FV.utFweK', 1, 'vjftester@gmail.com', '2015-06-12 19:48:33', 'jtcah42uk6', NULL, '/JobFair/images/profileimages/user-default.png', 'Virtual', 'Tester', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(76, 'ralon039@fiu.edu', '$2a$08$7jh2RaCJTSthoO4EGcSTeeRo.ZEip.zupEyAwdxbbb78FV.utFweK', 1, 'ralon039@fiu.edu', '2015-06-16 11:08:31', 'google', 1, 'https://lh3.googleusercontent.com/-Zq5RD96xaCU/AAAAAAAAAAI/AAAAAAAAAJM/JCnXPK3VeUo/photo.jpg', 'Rogelio', 'Alonso', 0, 1, NULL, '111259815576282894477', NULL, NULL, 1, NULL, 1, 0);

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
  `publish_video` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_resume`
--

INSERT INTO `video_resume` (`id`, `video_path`, `publish_video`) VALUES
(15, 'dJjg2_7PnYA', 0),
(71, 'qM9i_MoaZiM', 1);

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
