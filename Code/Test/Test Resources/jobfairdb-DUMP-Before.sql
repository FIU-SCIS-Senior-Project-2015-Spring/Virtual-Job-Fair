-- phpMyAdmin SQL Dump
-- version 4.0.10.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2015 at 04:43 AM
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

DROP TABLE IF EXISTS `api_auth`;
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

DROP TABLE IF EXISTS `api_status`;
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

DROP TABLE IF EXISTS `application`;
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

DROP TABLE IF EXISTS `basic_info`;
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
(1, '', 'Virginia', 'Virginia', '33137', '', NULL, 0, 0, NULL, 0),
(3, '305-111-1111', 'Miami', 'FL', '0', 'Employer one account', 0, 0, 0, 6263, 0),
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
(20, '305495901', 'Miami/Fort Lauderdale Area', 'Florida', '33196', 'Student at Florida International University', NULL, NULL, 0, 7198, 0),
(23, '(305) 348-2744', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
(24, NULL, 'Miami', 'Florida', NULL, 'Guest Employer Account', 1, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

DROP TABLE IF EXISTS `company_info`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`FK_userid`, `name`, `street`, `street2`, `city`, `state`, `zipcode`, `website`, `description`) VALUES
(3, 'Company', 'Some Street', '', 'Miami', 'FL', '33125', 'http://www.google.com', 'Some company in Miami, FL'),
(8, 'Progressive Insurance', NULL, NULL, NULL, NULL, NULL, 'http://www.progressive.com', '<p>Join a place where you can apply your hard-earned skills, test your limits and love what you do.&nbsp;</p>\r\n\r\n<p><strong>Why Progressive?</strong>&nbsp; From day one, you&rsquo;ll contribute to projects integral to company success.&nbsp; We work hard as a team, and our employees are invested in each other&rsquo;s success as much as their own.</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(11, 'Coplat', '7131 SW 142PL', '', 'Miami', 'FL', '33183', '', 'Stuff blah blah blah'),
(12, 'asdasd', '92919', '', 'Miami', 'florida', '33125', 'employertwo.cis.fiu.edu', 'This is my company name.'),
(24, 'Posted by a Guest Employer ', '11200 SW 8th Street, University Park', NULL, 'Miami', 'Florida', '33174', 'www.cs.fiu.edu', 'This is the general company profile for the Guest Employers that post jobs in our system anonymously.');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `degree`, `major`, `graduation_date`, `FK_school_id`, `FK_user_id`, `gpa`, `additional_info`) VALUES
(1, 'Bachelor''s degree', 'Computer Science', '2014-10-04', 1, 5, NULL, ''),
(2, '', 'Computer Science', '2014-10-06', 1, 7, NULL, ''),
(3, 'Associate of Arts (AA)', 'Computer Programming', '2014-10-06', 2, 7, NULL, ''),
(4, 'Bachelor in Science', 'Computer Science', '2014-11-18', 3, 9, NULL, ''),
(5, 'Bachelor in Science', 'Computer Science', '2014-11-15', 4, 1, NULL, ''),
(8, 'Bachelor in Science', 'Computer Science', '2014-12-17', 3, 14, NULL, ''),
(9, 'Bachelor in Science', 'Information Technology', '2014-12-12', 7, 15, NULL, ''),
(10, 'Master in Science', 'Information Technology', '2014-12-25', 8, 16, NULL, ''),
(11, 'Master in Science', 'Computer Science', '2014-12-26', 9, 17, NULL, ''),
(12, 'Bachelor in Science', 'Computer Science', '2014-12-19', 3, 18, NULL, ''),
(51, '', '', '2015-02-23', 1, 20, NULL, ''),
(52, 'N+', 'Information Technology', '2015-02-23', 10, 20, NULL, ''),
(53, 'Bachelor', 'Computer Science; Software Development', '1969-12-31', 1, 20, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`id`, `FK_userid`, `company_name`, `job_title`, `job_description`, `startdate`, `enddate`, `city`, `state`) VALUES
(1, 7, 'B/E Aerospace', 'JDA Support/Application Support Specialist', 'Monitored non-stop running tasks and provided support to users of in house planning / forecasting tool. Built modules to help achieve better user performance. Kept documentation up to date. Worked with and was part of international team.', '2014-01-01 00:00:00', '0000-00-00 00:00:00', '', ''),
(3, 13, 'Juan', 'Manager', 'Managed People', '2014-12-17 00:00:00', '2014-12-31 00:00:00', 'Miami', 'Florida'),
(19, 20, 'Ravenscroft Ship Management INC', 'IT Technical Support Officer', 'Supported the roll out of new servers and applications. Installed and configured computer operating systems and\napplications. Monitored and maintained corporation networks and computer systems. Supported and maintained\ncorporate databases playing a key role within the organization. Manage users creating and profiles policy scripts\nwhile dealing with passwords related issues. Provided offsite support to clients and staff to help resolve computer\nsystems issues. Tested and evaluated new technologies later used within the organization.', '2007-01-01 00:00:00', '2014-05-01 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `general_skills`
--

DROP TABLE IF EXISTS `general_skills`;
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

DROP TABLE IF EXISTS `handshake`;
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

DROP TABLE IF EXISTS `job`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `type`, `title`, `FK_poster`, `post_date`, `deadline`, `description`, `compensation`, `other_requirements`, `email_notification`, `active`, `matches_found`, `posting_url`, `comp_name`, `poster_email`) VALUES
(1, 'Part Time', 'Software Developer', 3, '2014-10-04 19:02:55', '2014-10-15 00:00:00', '......', '23134', NULL, NULL, 0, NULL, NULL, 'Company', NULL),
(5, 'CIS', 'IT Systems Engineer', 8, '2014-09-12 00:00:00', '2014-10-12 00:00:00', '<p><strong>IT Systems Engineer</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n<p>As a Systems Engineer, you&rsquo;ll continue to develop your technical and communication skills by working closely with vendors and internal IT partners to troubleshoot and resolve hardware and software issues.&nbsp; You&rsquo;ll ensure the health and 100% availability of our systems by resolving any outages in our voice and data network, service, client, PC and mainframe environments.&nbsp; Working in a 24X7 environment, you&rsquo;ll be handling a wide range of IT responsibilities while maintaining a high level of attention to detail.&nbsp; In addition, you&rsquo;ll have the opportunity to participate in the planning and execution of Enterprise-wide projects and work closely with a mentor to further your development.</p>\r\n<ul>\r\n	<li>Associate&#39;s degree and/or Bachelor&#39;s degree in an Information Technology, or related discipline (Telecommunications, Computer Science, Software Engineering, or Math); in lieu of a degree, 2 years of related work experience (operating system hardware and/or software and components. Could include exposure to designing, implementing, and/or maintaining national telecommunication networks)</li>\r\n	<li>1 year of additional related work and/or internship experience with exposure to operating system hardware and/or software and components in a large IT environment with many categories of devices, infrastructures, and operating system (experience could include mainframe and/or distributed environments or telecommunications)</li>\r\n	<li>Strong technical aptitude and some knowledge of all areas in an IT environment, with the technical capability to use standard computer interfaces, operating system components, utilities, production schedulers, scripting programming languages, application programming languages, and large system environment hardware components (i.e., CPU, disk, and tape technologies)</li>\r\n	<li>Must become aware of corporate design standards, including security compliance</li>\r\n	<li>Understands the impact of system designs on the infrastructure</li>\r\n	<li>Good interpersonal and communication skills with the ability to interact effectively with others</li>\r\n	<li>Ability to work in a team-oriented environment</li>\r\n	<li>Good organization skills with the ability to work on multiple projects and/or assignment simultaneously</li>\r\n	<li>Ability to support department goals that align with current and future Company objectives and initiatives</li>\r\n	<li>Good negotiation skills with the ability to find successful resolutions for issues of basic complexity, escalating those that require management involvement, when necessary</li>\r\n	<li>Able to work under general supervision in a fast-paced environment with tight deadlines and changing priorities</li>\r\n	<li>The ability to pay close attention to details</li>\r\n</ul>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$n62/yo3r9l6UtiBg8UKnqOdqbKaC6U2npHKUeeBAhLAAAPSRk9/ju', 'Progressive Insurance', NULL),
(6, 'CIS', 'Systems Engineer', 8, '2014-09-12 00:00:00', '2014-10-31 00:00:00', '<p><strong>IT Intern &ndash; Systems Engineer</strong></p>\r\n<p>As a Systems Engineer Intern, you&rsquo;ll get hands on experience by working closely with vendors and internal IT partners to troubleshoot and resolve hardware and software issues.&nbsp; You&rsquo;ll ensure the health and 100% availability of our systems by resolving any outages in our voice and data network, service, client PC and mainframe environments.</p>\r\n\r\n<p>This internship gives you the chance to further develop your technical and communication skills by handling a wide range of responsibilities, maintaining a high level attention to detail and working in a 24X7 environment.&nbsp; You&rsquo;ll participate in the planning and execution of Enterprise-wide projects with our award-winning IT group, known for our innovative approach to technology.&nbsp; You&rsquo;ll also work closely with an experienced mentor, who will guide you through your development.&nbsp; This is a full time, paid internship.</p>\r\n\r\n<p><strong>When: </strong>Summer 2015, 12 weeks with flexible start and end dates based on student&rsquo;s school schedule</p>\r\n<ul>\r\n	<li>Pursuing a Bachelor&rsquo;s degree in Applied Network and Systems Administration, Information Science and Technology, Information and Telecommunications Systems, Management Information Systems, or related IT major</li>\r\n	<li>Effective teamwork, written and verbal communication skills, analytical and customer service skills</li>\r\n	<li>Ability to relay technical information to non-technical people</li>\r\n	<li>Demonstrated leadership capabilities</li>\r\n	<li>Cumulative GPA of 3.0 (preferred)</li>\r\n</ul>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$aJMLyM1EOA8UbXrktcWCZuTRjSzkrNTbkQcilX.6j8bXm0xXr4dJS', 'Progressive Insurance', NULL),
(7, 'CIS', 'Web Site Development', 8, '2014-09-14 00:00:00', '2014-10-14 00:00:00', '<p>This is a temporary position that could be recurring but will pay well for your work.</p>\r\n<p>Work with owner to develop new page design - nothing complicated as we know exactly what we want. Should be an easy job for someone who knows web development.&nbsp;</p>\r\n<p>Thorough understanding of website development. Need to redo existing main page, blog page and a few other minor details. Will pay well for this task.</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$GMxJ1VHouCxaEHC67RVJ5.v8yTrYZ8bJt51hQgScG5sleUf.ccQi6', 'BigandFamous.com', NULL),
(8, 'CIS', 'Assistant programer', 8, '2014-09-15 00:00:00', '2014-10-15 00:00:00', '<p>We are looking for a talented and motivated programer student to assist our web developer in his daily tasks described below. Goal is to keep developing and improving our E &amp; M commerce site. It is a great opportunity to learn and bring your ideas and efforts to life in a dynamic start-up, here in Miami.</p>\r\n\r\n<p><span style="line-height:1.6em">If all goes well, it will lead to a full time position.&nbsp;</span></p>\r\n<p>- Maintain E commerce site up to date</p>\r\n\r\n<p>- Work on all upgrades to improve it, new features, plug ins</p>\r\n\r\n<p>- Download new products, new brands</p>\r\n\r\n<p>- Update products inventory</p>\r\n\r\n<p>- Benchmark against the competition</p>\r\n\r\n<p>- Bring your energy, passion and ideas!</p>\r\n<p>Student should have some knowledge in PHP, My SQL, AJAX, Java Script, XML, Frame Works (Zend or Symfony),&nbsp;Magento,&nbsp;Dreamweavere.</p>\r\n\r\n<p>Fireworks or is a plus.&nbsp;</p>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$a1.yBu0ey8gRdNyJp/cw7OCGh/2V8iLEWpACQ7SCrBZWG/yiwDWXS', 'Atheli LLC', NULL),
(9, 'CIS', 'Volunteer Web Developer (Short Assignment)', 8, '2014-09-15 00:00:00', '2014-10-15 00:00:00', '<p><strong>Volunteer Web Developer (18 Day Assignment)</strong></p>\r\n\r\n<p>Winrock seeks a high level web developer to travel to Senegal, Africa to work with and provide training to the Ministry of Agriculture Bureau of Professional Agricultural Training on the management and maintenance of a website. &nbsp;This is a volunteer project, no salary is paid,&nbsp;however, the program covers all travel, lodging, meals, and incidental expenses. A travel advance is provided to all volunteers. &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>Winrock seeks a high level web developer to work with and provide training to the Ministry of Agriculture Bureau of Professional Agricultural Training on the management and maintenance of a website.</p>\r\n\r\n<p>The Bureau is in charge of coordinating formal agricultural education and training (AET) institutions within the country. As an important part of their mandate, the Bureau seeks to identify affordable hosting services and maintain a website to provide relevant information to the institutions.</p>\r\n\r\n<p>The assignment requires a volunteer with good knowledge of hosting sites and related issues, and with prior experience and skills in training on the management and maintenance of websites.</p>\r\n<ul>\r\n	<li>HTML/XHTML, CSS, JavaScript</li>\r\n	<li>Server/Client side architecture</li>\r\n	<li>Programming/Coding/Scripting in one of the many server-side frameworks (at least one of , Java, ASP, .NET, .NET MVC)</li>\r\n	<li>Ability to utilize a database</li>\r\n	<li>Experienced high level web developer</li>\r\n	<li>Bilingual preferred French/English</li>\r\n	<li>Training capacity in website management and maintenance</li>\r\n	<li>University degree</li>\r\n	<li>US Citizenship (required)</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$Ul7KGDRuphyeS4TXi0B2ZeUXYddMv4/a7TXk9zI803R8jcwHSxea.', 'Winrock International', NULL),
(10, 'CIS', 'Social Media Intern', 8, '2014-09-15 00:00:00', '2014-10-15 00:00:00', '<p>We are looking for a talented and motivated copywriter who is passionate about women active lifestyle and social media.&nbsp;</p>\r\n\r\n<p>It is a great opportunity to learn and bring your ideas and efforts to life into a dynamic start-up, here in Miami.</p>\r\n\r\n<p>If all goes well, it will lead to a full time position.&nbsp;</p>\r\n<p>Goal is to create and feed daily our social media platform using the classic tools, Facebook, Google, Twitter, Instagram, Pinterest and more importantly, our Blog.&nbsp;</p>\r\n\r\n<p>Atheli is all about women and sports. Copywriter will be telling stories about our brands, benefits about our products. The idea is to create excitment and loyalty in the active female community and help Atheli.com become the reference when it comes to buy sports gear and apparel for women.&nbsp;</p>\r\n<p>- Talented copy writer interested in women active lifestyle</p>\r\n\r\n<p>- Knowledge in social media tools and strategy: Facebook, Google, Twitter, Pinterest and Instagram to create brand awareness and to improve ROI (return on investment)</p>\r\n\r\n<p>- Bring your energy, passion and ideas!</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$q.BEs6SSP4r3BcAN7GFNseygKvyOJNY2rvjq0vbx8p1H9aw4WjvVe', 'Atheli LLC', NULL),
(11, 'CIS', 'IT Solutions Consultant / Sales Executive', 8, '2014-09-19 00:00:00', '2014-12-31 00:00:00', '<p><span style="line-height:1.6">The </span><strong style="line-height:1.6">IT Services Consultant (ITSC)</strong><span style="line-height:1.6"> role is market-based sales and business development position. An ITSC may cover a single large market or multiple smaller markets within the region. The primary responsibilities of the role are to help grow All Covered sales through presenting and closing:</span></p>\r\n\r\n<ul>\r\n	<li>- Recurring professional, managed and cloud service solutions or All Covered Care (ACC).</li>\r\n	<br />\r\n	<li>- Strategic and complex IT project and procurement opportunities to prospects and existing clients.</li>\r\n	<br />\r\n	<li>These sales are consultative to our prospects and customers and collaborative internally. ITSC&rsquo;s rely on operations, delivery, relationship management, executive and other sales resources throughout various stages of an opportunity&rsquo;s progression.<br />\r\n	<br />\r\n	ITSC&rsquo;s will work closely with the local Konica Minolta Business Solutions sales team and their customers to cross-sell our services for the mutual benefit of each division.<br />\r\n	<br />\r\n	Additionally, ITSC&rsquo;s develop their territories through business development initiatives and networking activities such as mixers, tradeshows, Better Business Bureau and Chamber of Commerce initiatives, etc. as well as by soliciting references from existing All Covered customers.<br />\r\n	&nbsp;</li>\r\n</ul>\r\n<p><strong>Duties and Essential Job Functions: </strong></p>\r\n\r\n<ul>\r\n	<li>- Apply an in-depth understanding of All Covered services, programs, and sales methodology to address complex and strategic ACC, project and procurement opportunities.</li>\r\n	<br />\r\n	<li>- Work with regional engineering project resources, regional relationship management resources, sales and management resources to achieve and exceed quota.</li>\r\n	<br />\r\n	<li>- Work with Konica Minolta local offices to cross-sell IT Services to their client and prospect base.</li>\r\n	<br />\r\n	<li>- Provide thorough and accurate insight into the financial results and forecast of sales of strategic and complex ACC, project and procurement services.</li>\r\n	<br />\r\n	<li>- With support from marketing &amp; channel strategy resources, present special programs to prospects and All Covered Care clients.</li>\r\n	<br />\r\n	<li>- Develop a thorough understanding of how All Covered services create value for customers.</li>\r\n	<br />\r\n	<li>- Develop a thorough understanding of technology services and trends.<br />\r\n	<br />\r\n	<strong>Key Performance Metrics:</strong></li>\r\n	<br />\r\n	<li>- Sales Activities.</li>\r\n	<br />\r\n	<li>- Managed Services Quota Attainment.</li>\r\n	<br />\r\n	<li>- Project Services Quota Attainment.</li>\r\n	<br />\r\n	<li>- Project Procurement Quota Attainment.</li>\r\n	<br />\r\n	<li>- Client Retention.<br />\r\n	<br />\r\n	<strong>Internal/External Contacts:</strong><br />\r\n	Daily interaction with team members and a variety of clients. The ITSC works closely with the Vice President, Relationship Managers, Manager of Strategic Solutions and Solutions Architects to create and sell appropriate solutions to prospects.</li>\r\n</ul>\r\n<p><strong>REQUIREMENTS:</strong></p>\r\n\r\n<ul>\r\n	<li>- 3-5 years of experience in the Managed IT Services, or IT Services industry.</li>\r\n	<br />\r\n	<li>- 4-year college degree or equivalent industry experience.</li>\r\n	<br />\r\n	<li>- Sales/business development experience, with a record of meeting and exceeding quota.</li>\r\n	<br />\r\n	<li>- High level of financial acumen, in order to have &ldquo;business discussions with business people.&rdquo;</li>\r\n	<br />\r\n	<li>- Strong communication, presentation, listening skills.</li>\r\n	<br />\r\n	<li>- Ability to effectively deliver difficult messages while emphasizing positive, future-oriented perspectives.</li>\r\n	<br />\r\n	<li>- Technical aptitude, with the ability to appropriately apply technical service base to individual customer needs.</li>\r\n	<br />\r\n	<li>- Highly adaptable to changes in business direction, services, and needs from a prospect, client and All Covered perspective.</li>\r\n	<br />\r\n	<li>- Possess the ability to influence vs. control others.</li>\r\n	<br />\r\n	<li>- Successful track record of sales and relationship management with notable accomplishments.</li>\r\n	<br />\r\n	<li>- Strong analytical and strategic thinking skills.</li>\r\n	<br />\r\n	<li>- Ability to coordinate multiple sales activities.</li>\r\n	<br />\r\n	<li>- Exceptional interpersonal, oral and written communication skills.</li>\r\n	<br />\r\n	<li>- Exception planning, organization and time management skills; self-starter.</li>\r\n	<br />\r\n	<li>- High level of professionalism and integrity; good judgment.</li>\r\n	<br />\r\n	<li>- Good negotiating skills.</li>\r\n	<br />\r\n	<li>- Superior work ethic and high energy level.</li>\r\n	<br />\r\n	<li>- Ability to work with all levels of the organization.</li>\r\n	<br />\r\n	<li>- Computer skills (including Word, Excel, SalesForce contact management).<br />\r\n	<br />\r\n	<strong>KONICA MINOLTA OFFERS:</strong></li>\r\n	<br />\r\n	<li>- Competitive salary.</li>\r\n	<br />\r\n	<li>- Outstanding benefits package (incl. medical, dental, life insurance).</li>\r\n	<br />\r\n	<li>- 401(k) plan with matching company contribution</li>\r\n	<br />\r\n	<li>- Excellent holiday/vacation plans.</li>\r\n	<br />\r\n	<li>- Tuition Reimbursement Program.</li>\r\n	<br />\r\n	<li>- Employee Referral Bonus Program.</li>\r\n	<br />\r\n	<li>- Ongoing professional development training.</li>\r\n	<br />\r\n	<li>- Visible, exciting work supporting the sales of cutting edge technology and workflow solutions.<br />\r\n	<br />\r\n	<strong>Konica Minolta is Proud to be an Equal Opportunity Employer M/F/V/D Committed to Affirmative Action.</strong><br />\r\n	&nbsp;</li>\r\n</ul>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$8CzD9yJZqkgarWuqXZ44Yu43akMP7Q/IyxoqgmBisRDwP230r/TRe', 'All Covered', NULL),
(12, 'CIS', 'Engineer  / Consultant - 1, 2 or 3', 8, '2014-09-19 00:00:00', '2014-12-31 00:00:00', '<p>The priority focus of the <strong>Engineeer</strong> is on delivering excellent service to our Client. By applying deep technical skills, ensure successful rollout of client projects involving development and analysis of technology environmen</p>\r\n\r\n<p>Engineer 1 - Helpdesk and basic Server administration</p>\r\n\r\n<p>Engineer 2 - Helpdesk Escalation and more complex Server or Network Administration</p>\r\n\r\n<p>Engineer 3 - Emergency Escalation, Project Delivery, Subject Matter Experts</p>\r\n\r\n<p>&nbsp;</p>\r\n<ul>\r\n	<li>- Participate in successful completion of project work including analysis, design, development, documentation, and testing of client network operations.</li>\r\n	<br />\r\n	<li>- Perform quality assurance activities to ensure standardization of best practices.</li>\r\n	<br />\r\n	<li>- Assist in the design and deployment of IT infrastructures and protection strategies to support client business plans.</li>\r\n	<br />\r\n	<li>- Act as technical escalation point for Support Specialists and Systems Engineers within market team.</li>\r\n	<br />\r\n	<li>- Implement network infrastructure and security policies that promote client&rsquo;s objectives.</li>\r\n	<br />\r\n	<li>- Maintain 74% overall utilization</li>\r\n</ul>\r\n<ul>\r\n	<li>- 2-5 years network administration experience.</li>\r\n	<br />\r\n	<li>- 2-&nbsp;5 years operating systems experience (Windows, and/or Unix or Linux).</li>\r\n	<br />\r\n	<li>- Cisco Call Manager with Unity experience (2 years); ability to manage, maintain, troubleshoot and support Call Manager 5.0 and Unity</li>\r\n	<br />\r\n	<li>- Successful experience designing, installing and supporting networks in multiple environments for multiple clients.</li>\r\n	<br />\r\n	<li>- MCSE preferred.</li>\r\n	<br />\r\n	<li>- Strong proficiency in configuring, deploying and troubleshooting all of the following networking services: HTTP, DNS, TCP/IP, VPNs, VLANs, VIPs, ACLs, Routing, Switching.</li>\r\n	<br />\r\n	<li>- Advanced knowledge of Microsoft Office applications</li>\r\n	<br />\r\n	<li>- Demonstrated experience implementing IT projects.</li>\r\n	<br />\r\n	<li>- Strong computer analysis and diagnostic skills with the ability to implement quick and effective solutions to network problems.</li>\r\n	<br />\r\n	<li>- Proven dedication to enabling continuous operations.</li>\r\n	<br />\r\n	<li>- Strong interpersonal and relationship-building skills, conducive to team development.</li>\r\n	<br />\r\n	<li>- Excellent verbal and written communication skills.</li>\r\n	<br />\r\n	<li>- Possess valid and clear drivers&rsquo; license.<br />\r\n	<br />\r\n	<strong>Internal/External Contacts:</strong></li>\r\n	<br />\r\n	<li>- Daily interaction with multiple clients pertaining to technical issues.<br />\r\n	<br />\r\n	<strong>Working Conditions:</strong></li>\r\n	<br />\r\n	<li>- The majority of work will be performed at client locations which may vary in terms of quality of workspace. Must be able to lift, carry, and reposition all parts of user workstations, network appliances, and printers. Consecutive hours spent at a time sitting in front of computer monitor and using keyboard and mouse.<br />\r\n	<br />\r\n	<strong>KONICA MINOLTA OFFERS:</strong></li>\r\n	<br />\r\n	<li>- Competitive salary.</li>\r\n	<br />\r\n	<li>- Outstanding benefits package (incl. medical, dental, life insurance)</li>\r\n	<br />\r\n	<li>- 401(k) plan with matching company contribution</li>\r\n	<br />\r\n	<li>- Excellent holiday/vacation plans.</li>\r\n	<br />\r\n	<li>- Tuition Reimbursement Program.</li>\r\n	<br />\r\n	<li>- Employee Referral Bonus Program.</li>\r\n	<br />\r\n	<li>- Ongoing professional development training.</li>\r\n	<br />\r\n	<li>- State-of-the-art office products.</li>\r\n	<br />\r\n	<li>- Visible, exciting work supporting the sales of cutting edge technology and workflow solutions.<br />\r\n	<br />\r\n	All Covered is a Gold Certified Microsoft Partner.</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$pc2D.gaX/bUBEcnOiwsbE.DJQbuuxAmjdXdbx0ldnNN8AmZGyIeYq', 'All Covered', NULL),
(13, 'CIS', 'Software Engineer', 8, '2014-09-23 00:00:00', '2014-10-23 00:00:00', '<p>LifeWallet is looking for passionate, talented developers to join our development team and build the next generation of products and services. We&rsquo;re looking for passionate individuals that love solving problems, can rise up to see the forest and dive deep into the trees when needed. Become part of a world-class team of technology innovators and passionate engineers responsible for creating a paradigm shift in the insurance industry.</p>\r\n\r\n<p>You will work closely with a smart, energetic team to design, develop, and test new products and services using cutting-edge technologies that our customers will love. You will participate in the full development process from beginning to end and talented team will absolutely push your limits as a developer.&nbsp;</p>\r\n<p>Scraping and crawling websites using JS&nbsp;scripts that normalize data and create complex objects out of web data.&nbsp;</p>\r\n<ul>\r\n	<li>\r\n	<p>Deep understanding of Javascript, HTML, CSS, DOM</p>\r\n	</li>\r\n	<li>\r\n	<p>Object oriented programming/design skills</p>\r\n	</li>\r\n	<li>\r\n	<p>Drive for delivering quality products in a timely manner</p>\r\n	</li>\r\n	<li>\r\n	<p>Excellent communication and collaborative skills</p>\r\n	</li>\r\n	<li>\r\n	<p>Passion for product quality and attention to detail</p>\r\n	</li>\r\n	<li>\r\n	<p>Comfortable with rapid development cycles, tight schedules</p>\r\n	</li>\r\n	<li>\r\n	<p>Good team player and self independent</p>\r\n	</li>\r\n	<li>\r\n	<p>Hard working, quick learner&nbsp;</p>\r\n	</li>\r\n</ul>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$1DYXiRE.q69Xeh.MLe4TjeegAckL4cgn7R9ksbeqJdkWN1iBjxxkS', 'LifeWallet', NULL),
(14, 'CIS', 'Digital Marketing Intern', 8, '2014-09-24 00:00:00', '2014-10-24 00:00:00', '<p>The Intern will provide assistance and support to the CEO in the following key areas:</p>\r\n<p>&nbsp; &nbsp; * Help write case studies, blog entries, presentations, web copy and other marketing material</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; * Support the creation and execution of email marketing campaigns.</p>\r\n\r\n<p>&nbsp; &nbsp; *Convert marketing materials to a form viewable online and ready for market distribution.</p>\r\n\r\n<p>&nbsp; &nbsp; *Assists with updating the website and uploading information.&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; *Support the creation and execution of Newsletters.&nbsp;</p>\r\n<p>&nbsp; &nbsp; * Third or Fourth year student obtaining a degree in Information Technology, Marketing, or Business</p>\r\n\r\n<p><span style="line-height:1.6em">&nbsp; &nbsp; * Attention to details, accuracy and deadlines</span></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; * Excellent communication skills, both written and verbal<br />\r\n&nbsp;&nbsp;&nbsp; * Outstanding research skills<br />\r\n&nbsp;&nbsp;&nbsp; * Ability to work effectively in a fast-paced team environment<br />\r\n&nbsp;&nbsp;&nbsp; * Interest in new business start-ups<br />\r\n&nbsp;&nbsp;&nbsp; * Organized and able to manage multiple projects and priorities<br />\r\n&nbsp;&nbsp;&nbsp; * Available to work at least 10 to 15 hours a week</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$d3n.kGjwD5pKqMwKA.oNb.S1BkyLxQTEkum8VYIz6zt8PzpLkJ3hK', 'De Novo Review', NULL),
(15, 'CIS', 'iOS/Objective C developer', 8, '2014-09-24 00:00:00', '2014-10-24 00:00:00', '<p>We are looking to hire an iOS/Objective C developer to work alongside our current engineering team (either in-office or remotely) in both iPhone and iPad products. The current engineering team is entirely South Florida based, and this role provides the engineer to work directly with our CTO.</p>\r\n\r\n<p>The position would intially be on a part-time, hourly basis, with a liklihood of full-time employment should all parties be satisfied with the progress being made.&nbsp;</p>\r\n<p>Engineer will work alongside CTO to assist with ad hoc projects and requests. This will primarily be focused on:</p>\r\n\r\n<p>- Order processing and payment processing on iPhone (user-facing) and iPad (merchant-facing)</p>\r\n\r\n<p>- Integration of 3rd party applications</p>\r\n\r\n<p>- Ability to have input across all business aspects - marketing, product, design, etc.&nbsp;</p>\r\n<p>- Strong knowledge of and experience with Objective C (portfolio and code sample is helpful) and a strong understanding of web services</p>\r\n\r\n<p>- Great communication skills and ability to work with a team</p>\r\n\r\n<p>- Strong eye for design and UI/UX concepts</p>\r\n\r\n<p>- Desire to build awesome stuff</p>\r\n\r\n<p>- Experience with e-commerce, payment processing, BLE a plus</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$BkQwnSGs.NQA0PLLJ8lAj.7UOYJ..uJ20A/B9rUc/KMldUmD63BWO', 'SpeedETab', NULL),
(16, 'CIS', 'Software Developer Internship', 8, '2014-09-25 00:00:00', '2014-10-25 00:00:00', '<p><strong>LEAPFACTOR INTERNSHIP - SOFTWARE DEVELOPER&nbsp;&nbsp;- JOB DESCRITPION</strong></p>\r\n\r\n<p>Leapfactor, Inc., located in Miami, Florida is seeking Intern Software Developers to join Leapfactor, Inc. an agile multidisciplinary team in Miami while working at our headquarters and/or remotely from your own geographic location. &nbsp;This unique opportunity is targeted to create an innovative pool of part-time and/or full-time talent while expanding your technical expertise and supporting our business endeavors when creating software applications for our clients at large.</p>\r\n\r\n<p>In joining our team you can enjoy a variety of great and competitive benefits and become part of an innovative start up software development enterprise.</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>As an Intern Software Developer the individual will be responsible for the design and development of the company&acute;s flagship product for mobile applications. The successful candidate will be building software that targets multiple mobile platforms, such as iOS, IPhone, Android and Windows Phone. If you are hungry for learning the latest mobile technologies and enjoy working with a team of developers in the US and Latin America, this is the right place for you!</p>\r\n<p><strong>Desired Qualifications, Skills and Experience</strong></p>\r\n\r\n<p><strong>Work Experience</strong>: &nbsp;Two years of college coursework in Computer Science or an equivalent combination of work experience and/or training.&nbsp;Proven experience developing relevant apps for IPhone, iOS, Blackberry, and Android.&nbsp;Passionate about low-level programming and hacking culture.&nbsp;Knowledge of iOS Frameworks and Android SDKs.&nbsp;Vocational software engineer with a taste for simplicity and seek for excellence.&nbsp;Demonstrated good communication skills in English and Spanish.</p>\r\n\r\n<p><strong>Desired Qualifications: &nbsp;</strong>A minimum of&nbsp; two (2) to three (3) years of App development experience on other mobile platforms (e.g. IPhone, Blackberry, Windows Phone).&nbsp;Solid knowledge of TCP/IP networking and mobile networks (GSM/UMTS/LTE).&nbsp;Experience with SCRUM or other agile software development practices.&nbsp;Active open source contributor.&nbsp;Demonstrated working knowledge of coding specifications. &nbsp;Able to work well independently and in a team environment.&nbsp;Able to work well under pressure and handle multiple projects at the same time.&nbsp;Must be able to exercise independent judgement and deliver targeted assigned project specifications in a timely manner.&nbsp;Must be able to communicate effectively in English and Spanish.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$oIP6Rxa6brRFvvCx/8tyBOKobWK0vIwZ/Z2iSNVyGl.lMQwRm7JMO', 'Leapfactor, Inc.', NULL),
(17, 'CIS', 'Junior SSRS Developer / Report Writer', 8, '2014-10-08 00:00:00', '2014-11-07 00:00:00', '<p>Seeking recent college grads with beginner to moderate experience working with SSRS (SQL Server Reporting Services) and SQL.&nbsp;</p>\r\n<ul>\r\n	<li>Create and Design simple to complex SSRS Reports and ad-hoc SQL scripts&nbsp;</li>\r\n	<li>writing&nbsp;SQL&nbsp;queries and stored procedures</li>\r\n</ul>\r\n<ul>\r\n	<li>Beginner to Moderate experience/knowledge of SSRS (SQL Server Report Services)</li>\r\n	<li>Beginner to Moderate experience/knowledge of SQL</li>\r\n	<li>Quick to pick up concepts</li>\r\n	<li>Good communication skills</li>\r\n	<li>Motivated and self-driven</li>\r\n	<li>Able to take ownership and work in a fast pace environment</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$oiDyLkOmiLQeJe7yQbeHJuAGIsxOzxA8VAKcYOuS7Kf25sj/bbNBu', 'Synergy', NULL),
(18, 'CIS', 'Java Developer', 8, '2014-10-17 00:00:00', '2014-11-16 00:00:00', '<p>We are located in Miami Beach, FL and we are a startup building an electronic trading application. We are looking for a Java developer with 1-3 years of experience to join our team. Internship or full time job based on experience.</p>\r\n<p>Creating, maintaining and implementing the source code that makes up our application. Responsible for designing the prototype application, indicate program unit structure, and coordinate application plans with the development team.</p>\r\n<p>BS/MS in computer science or related field (Ok to contact if you&#39;re still in school)<br />\r\n1-3 years experience in Java development (server / client side)<br />\r\nRESTful application design (JAX-RS)<br />\r\nRDBMS development and management (Hibernate / MySQL)<br />\r\nUnit testing methodology and frameworks (JUnit, TestNG)<br />\r\nJava build and continuous integration systems (Maven / Jenkins)</p>\r\n\r\n<p><em><strong>PLUSES:</strong></em></p>\r\n\r\n<p>Linux system administration (Ubuntu)<br />\r\nWeb application design and debugging (TCP, SSL, load balancing, sharding, etc)</p>\r\n\r\n<p>&nbsp;</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$xF6i9dG6hPnxETMoQN0C3.5N2K0QOyqEHrakKfiP9rS3anPE1wutG', 'OpenBondX, LLC.', NULL),
(19, 'CIS', 'Associate Software Engineering Intern', 8, '2014-10-13 00:00:00', '2014-11-12 00:00:00', '<table border="0" cellpadding="0" cellspacing="1">\r\n	<tbody>\r\n		<tr>\r\n			<td><strong>Job ID</strong></td>\r\n			<td>ENP-00004481</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Emerson Company</strong></td>\r\n			<td>Avocent</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Country</strong></td>\r\n			<td>United States</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>State/Province</strong></td>\r\n			<td>Florida</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>City</strong></td>\r\n			<td>Sunrise</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Publish Start Date</strong></td>\r\n			<td>Sep 23 2014</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Job Level</strong></td>\r\n			<td>Entry Level</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>The Associate Software Engineering Intern is a position for a college student or recent graduate majoring in engineering or computer science. This intern student will assist in everyday software engineering activities.&nbsp;<br />\r\nReporting Relationships&nbsp;<br />\r\nReports to Engineering Manager</p>\r\n<p>Job Responsibilities<br />\r\n.<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Assist in everyday engineering activities while working with engineers at all levels&nbsp;<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Assist in product development and testing<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Assist in lab work related to environments or by working on prototypes<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Assist in development area by re-creating field issues or customer environments&nbsp;<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Tracking data for analysis and performing basic troubleshooting<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Assist in development of solutions or workarounds for unre</p>\r\n<p>Basic Qualifications<br />\r\n&nbsp;&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Must know one or more programming language: C++, Java, Python, Objective-C&nbsp;<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Knowledge of networking technologies, TCP/IP, Security concepts are desired&nbsp;<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Relational database concepts are desired&nbsp;<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Knowledge of latest Web browser technologies<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Good written and verbal communication skills&nbsp;<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Good interpersonal skills&nbsp;<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Good understanding of software development fundamentals<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Capacity for learning new technologies and skills rapidly is key<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; High level of creativity, quick problem solving capabilities and strong analytical skills</p>\r\n\r\n<p>Education and Experience&nbsp;<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Bachelor of Science in Engineering or Related Technical Field Preferred&nbsp;<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Up to 2 years of related experience preferred&nbsp;<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Desired: JavaScript, CSS, HTML, SQL, J2EE Frameworks, Apache Tomcat, ANT,&nbsp;<br />\r\n&bull; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Bonuses: NoSQL, Hadoop, MySQL, Oracle, Google Analytics</p>\r\n\r\n<p>Work Authorization<br />\r\n&nbsp;No calls or agencies please. Emerson will only employ those who are legally authorized to work in the United States. This is not a position for which sponsorship will be provided. Individuals with temporary visas such as E, F-1, H-1, H-2, L, B, J, or TN or who need sponsorship for work authorization now or in the future, are not eligible for hire.</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$Vn6rYEj.KNhIBWbvxbnQPeMrSnk4ai16UwG8l.lo6OeTsobvmNoAa', 'Emerson/Avocent', NULL),
(20, 'CIS', 'Apprentice Software Engineer', 8, '2014-10-14 00:00:00', '2014-11-13 00:00:00', '<p>Reporting To: &nbsp;CTO/Co-Founder</p>\r\n\r\n<p>Job Location: Miami, FL</p>\r\n\r\n<p>Time Commitment: Full time or part time. Contract/1099 position.</p>\r\n\r\n<p>Start Date: As soon as possible</p>\r\n\r\n<p>Venture Hive is looking for a smart engineering-oriented person to be part&nbsp;of its software development / IT team. We are looking for someone that is&nbsp;willing to learn and follow best practices to design and implement solutions&nbsp;to help meet the internal needs of Venture Hive along with the needs of the&nbsp;entrepreneurs and ventures in its growing network. This person would report&nbsp;directly to and work alongside the co-founder/CTO to support and extend&nbsp;on-going design, development, and maintenance of current and new projects&nbsp;alongside the CTO.</p>\r\n\r\n<p>The applicant doesn&rsquo;t have to have all the required skills and experience&nbsp;under their belt, but should be willing and able to learn them. Some Object&nbsp;Oriented software development experience is a plus. The person would be&nbsp;working as part of a small team (2 people at first). The primary job would&nbsp;be to communicate with other team members and ensure delivery (implementation and testing) of daily development, testing, and design tasks, and to ensure all day-to-day tasks are managed effectively.</p>\r\n<p>Organizing and managing day-to-day tasks effectively and efficiently</p>\r\n\r\n<ul>\r\n	<li>Assisting with research and work on new projects.</li>\r\n	<li>Assisting with maintaining and updating existing projects.</li>\r\n	<li>Meeting agreed deadlines.</li>\r\n</ul>\r\n\r\n<p>Please note that this list is not exhaustive and you may be required to undertake&nbsp;additional duties of a similar or greater responsibility level as and when required&nbsp;and appropriate.</p>\r\n<p>We are looking for someone who has a keen interest in software design and development. We want someone who has experience using computers and websites alike. We need someone with excellent communication skills and the desire to work hard, learn new things and develop their skill sets.</p>\r\n\r\n<p>Technologies currently used:</p>\r\n\r\n<ul>\r\n	<li>Grails, Java/Groovy</li>\r\n	<li>NGinx, Tomcat</li>\r\n	<li>AWS, Azure</li>\r\n	<li>Linux</li>\r\n	<li>GIT</li>\r\n	<li>Jenkins</li>\r\n	<li>Many more to come&hellip;</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$V5kJKxpww.oTOtmoQKkLFOfM4GKv9M5eERLUSXCfDoexvs0Ie3nrK', 'Venture Hive', NULL),
(21, 'CIS', 'Senior Mobile Developer - JavaScript, Java, C', 8, '2014-10-15 00:00:00', '2014-11-14 00:00:00', '<p><strong>The High Performance Database Research Center (HPDRC) is seeking a skillful Senior Developer (Master or PhD student) to join a major software development project. The Informed Traveler Program and Applications (ITPA) software will be an advanced traffic management package, currently being developed at the HPDRC. It will provide customized realtime and predictive information about multimodal and intermodal traffic in the UniversityCity region to individual customers. It also makes available innovative decision support for transportation providers. ITPA will enable the individual user to make optimum route and mode choices, and also enable the service provider to manage individual traffic, transit and parking more effectively.</strong><br />\r\n&nbsp;</p>\r\n<p><br />\r\nThe senior experienced software developer will join a research and development team and help us design, implement and test unique and innovative functions and features for users of smartphones and traffic management operations centers from the ground up.&nbsp; You will work as a member of the ITPA agile scrum&nbsp;team delivering phase 1 features for customers and users in the UniversityCity region.&nbsp; This will include design, coding, testing and other tasks as are deemed necessary by the scrum team.</p>\r\n<p><br />\r\n<strong>- A Master or PhD student with a computer science background, with strong<br />\r\n&nbsp; &nbsp;problem solving abilities, insight into complex algorithm and data<br />\r\n&nbsp; &nbsp;structure design</strong></p>\r\n\r\n<p><strong>- a good understanding in object oriented development and design patterns,<br />\r\n<br />\r\n- strong verbal and written communication skills in English.<br />\r\n<br />\r\nMust have:<br />\r\n<br />\r\n- Significant experience in mobile application development and web<br />\r\n&nbsp; &nbsp;development,<br />\r\n<br />\r\n- knowledge and experience in JavaScript, CSS3, HTML5, and Java.<br />\r\n<br />\r\n- Candidates with experience with the IBM WorkLight development system<br />\r\n&nbsp; &nbsp; and the OpenLayer mapping library are preferred.</strong><br />\r\n&nbsp;</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$mhPLmr.6aYw0qZOPf1qtl.UDL8NuJfEai/09O3MZ04Di5VVg/JdrK', 'Florida International University', NULL),
(22, 'CIS', 'Web Developer', 8, '2014-10-20 00:00:00', '2014-11-19 00:00:00', '<p>The Web Developer is responsible for developing and maintaining various aspects of Peer 1&rsquo;s web presence. The position will be situated within the software development team, and will be working closely with IT and Marketing, to develop our growing web presence. You will be expected to take the development of our web-based projects to the next phase, which require both web development and Drupal CMS skills. You will also be responsible for ongoing support and maintenance engagements of our web presence. &nbsp;This is a fantastic opportunity to make a direct impact to Peer 1&rsquo;s business and customers.</p>\r\n<p>This is an excellent opportunity for a Junior Web Developer to join the core development team of a Hosting Company, who are constantly developing exciting new software products for a hosting global business. You will be regularly experimenting with brand new technologies; developing and maintaining a variety of applications (mobile, web etc.) - being innovative, adding new features, solving issues and assisting with the future strategy and development of the products.&nbsp;</p>\r\n<p>-1 - 2 years commercial experience of writing great code<br />\r\n-Backend development experience (personal projects will be considered)<br />\r\n-Knowledge using PHP, HTML, CSS, Javascript &amp; MySQL to build web applications<br />\r\n-JavaScript<br />\r\n-Understanding of OOP<br />\r\n&nbsp;<br />\r\nDesirable Skills:&nbsp;</p>\r\n\r\n<p>-Experience of MVC frameworks would be an advantage but NOT ESSENTIAL (i.e. Laravel &amp; Composer tools)<br />\r\n-Strong front-end JavaScript skills<br />\r\n-Server knowledge</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$e04xGJ4iVgEO/hq9NnRSJO5H5uPNH/X.peJGv9y11jGNtemoPQvyC', 'Peer 1 Hosting', NULL),
(23, 'CIS', 'Lead Mobile Developer', 8, '2014-10-20 00:00:00', '2014-11-19 00:00:00', '<p>As Lead Developer of Mobile Development, you will be responsible for the RDI Platform, extend its design and implement new features on the client and server. You will also bestow your wisdom on junior developers as they create new games and port existing games from various languages and platforms, including C, C++, Java and Flash to our Corona/NodeJS platform. This position reports directly to the CTO.</p>\r\n<ul>\r\n	<li>6+ years experience in software development.</li>\r\n	<li>Optimistic and positive attitude.</li>\r\n	<li>Excellent verbal and written communication skills.</li>\r\n	<li>Ability to work with little oversight.</li>\r\n	<li>Ability to write software according to specified designs.</li>\r\n	<li>Technology agnostic. Must be able to quickly learn and work with multiple programming languages and platforms.</li>\r\n</ul>\r\n<p>The prospective candidate should be experienced with some of these, familiar with most and possess ability to quickly learn them all.</p>\r\n\r\n<p>Systems: Ubuntu Linux, Mac OS X</p>\r\n\r\n<p>Platforms: Corona (Enterprise/Pro), NodeJS (Google V8), Adobe Flash</p>\r\n\r\n<p>SDKs: Apple iOS, Google Android, Amazon SDK, Facebook SDK, Chartboost, Kochava</p>\r\n\r\n<p>APIs: Restify, Memcache, MySQL, Sequelize, AWS</p>\r\n\r\n<p>Product Languages: JavaScript, Lua, <a name="__DdeLink__0_210980683"></a>ActionScript</p>\r\n\r\n<p>Porting Languages: C, C++, Java, ActionScript, Others</p>\r\n\r\n<p>Development Tools: Emacs, XCode, Ant, Git, SSH</p>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$79KL/kgfhsUlpix7JBe6neiwWJfAC6jP1uWinNJHHiK.bfBIam1qG', 'Real Deal Interactive', NULL),
(24, 'CIS', 'Rich Media Ad Developer', 8, '2014-10-20 00:00:00', '2014-12-20 00:00:00', '<p>Within the Ad Creative Technology group, the Rich Media Developer is responsible for developing and executing high impact Premium Display Advertising campaigns throughout the LATAM &amp; US Hispanic sites. This person will interface with creative agencies and sales people in the Latin America region on a day-to-day basis, in order to facilitate a smooth execution, by combining knowledge of the advertising business with highly technical programming skills. This person should have the technical skills to thrive in a highly advanced internet corporation, but also have an understanding of how the advertising business works as a whole.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>Responsibilities Include:</p>\r\n\r\n<ul>\r\n	<li>Building and executing high impact Premium Displays Ads using Yahoo&#39;s custom JavaScript &amp; Flash libraries</li>\r\n	<li>Working with account managers &amp; agencies to help them understand Yahoo Ad Specs</li>\r\n	<li>Developing templates for new Ad Formats</li>\r\n	<li>Building tools that help streamline operations</li>\r\n</ul>\r\n<ul>\r\n	<li>Bachelor&#39;s Degree in Computer Science, Design, or a Software Development related field</li>\r\n	<li>Minor or Concentration in Advertising is a plus (in addition to the technical degree mentioned above)</li>\r\n	<li>Basic to Intermediate skills in HTML/CSS, JavaScript/JQuery and related JS frameworks</li>\r\n	<li>Basic Flash knowledge</li>\r\n	<li>Ability to thrive in a fast-paced, revenue driven environment</li>\r\n	<li>Adaptable team player with ability to function independently and provide creative problem-solving mindset</li>\r\n	<li>Fluent English speaker - Required</li>\r\n	<li>Fluent Spanish speaker - Required</li>\r\n	<li>Fluent Portuguese speaker - Not required but a plus</li>\r\n	<li>Ability to work in a fast-paced revenue driven environment, with very short deadlines</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$5hs.orLhbd.PT3fvg5/l9.KPGtuqDCltJUah1uF.DRxg8lmRJ31.O', 'Yahoo', NULL),
(25, 'CIS', 'IT Quality Assurance Intern', 8, '2014-10-20 00:00:00', '2014-11-19 00:00:00', '<p>INTERNSHIP DESCRIPTION:</p>\r\n\r\n<p>- Work closely with Senior IT professionals<br />\r\n- Assist the Quality Assurance team with the testing of business applications<br />\r\n- Create test scripts and test cases alongside the Quality Assurance team<br />\r\n- Assist with the creation of training manuals, technical announcements, webpages using SharePoint Designer, and other job aids<br />\r\n- Assist the Quality Assurance team with various QA/training functions</p>\r\n\r\n<p><br />\r\nLEARNING OUTCOMES:<br />\r\n- Learn how to effectively interface with technical and non-technical personnel within and across agencies<br />\r\n- Learn how to create and sustain quality of information and product in a large organizational setting.<br />\r\n- Learn various employee training methods and how to create user guides that are user-friendly, to increase agency efficiency.<br />\r\n- Learn ways to optimize the business processes through the utilization of technologies and process improvement instruments.<br />\r\n- Learn ways to ensure information meets a high standard of quality</p>\r\n<p>- Work closely with Senior IT professionals<br />\r\n- Assist the Quality Assurance team with the testing of business applications<br />\r\n- Create test scripts and test cases alongside the Quality Assurance team<br />\r\n- Assist with the creation of training manuals, technical announcements, webpages using SharePoint Designer, and other job aids<br />\r\n- Assist the Quality Assurance team with various QA/training functions</p>\r\n<p>Helpful: Some knowledge of HTML, CSS, and/or JavaScript<br />\r\nSuperb attention to detail with ability to organize, prioritize and work under tight deadlines<br />\r\nGood analytical and problem solving skills and ability to multi-task<br />\r\nFamiliarity with writing and executing test cases - helpful</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$EAryEQLTy2Jte5DYicLi1e6QoYTm4.H3fpq6wNfyjEYFw8ylNySSK', 'Broward County Government', NULL),
(26, 'CIS', 'IT Security Internship', 8, '2014-10-20 00:00:00', '2014-11-19 00:00:00', '<p>INTERNSHIP DESCRIPTION:<br />\r\n- Work closely with Senior IT professionals</p>\r\n\r\n<p>- Research information security projects such as Security Threats, Vulnerabilities, and New Technologies</p>\r\n\r\n<p>- Assist with monitoring and identifying threats through log analysis</p>\r\n\r\n<p>- Help with research and development of security policies to be implemented at the County level</p>\r\n\r\n<p>- Assist with agency metric reporting</p>\r\n\r\n<p>- Prepare project reports for research and IT procurement programs</p>\r\n\r\n<p>- This is a support and research internship that will give the intern a foundation for pursuing a career in information security</p>\r\n<p>LEARNING OUTCOMES:<br />\r\n- Learn how large organizations reduce numerous security threats and vulnerabilities, to maintain computer operations and integrity<br />\r\n- Learn the procedures and critical thinking used to maintaining the integrity of large IT networks<br />\r\n- Learn how to effectively interface with technical and non-technical personnel within and across agencies<br />\r\n- Learn how to use log analysis to lessen or eliminate security breaches<br />\r\n- Learn to develop and successfully implement technology policies that have County-wide influences</p>\r\n<p>Ability to apply technical and analytic skills against the information security problems faced within the organization.<br />\r\nUnderstanding and interest in evolving cybersecurity landscape.<br />\r\nMulti-platform knowledge across Windows, Mac&nbsp; and/or Unix-based systems.<br />\r\nAbility to script or code is helpful.</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$OngmbOa5Jy.J6YfIMJCY4O5Ayo8qLV3W/XnqvmBPfYJxbCS7rkqUO', 'Broward County Government', NULL);
INSERT INTO `job` (`id`, `type`, `title`, `FK_poster`, `post_date`, `deadline`, `description`, `compensation`, `other_requirements`, `email_notification`, `active`, `matches_found`, `posting_url`, `comp_name`, `poster_email`) VALUES
(27, 'CIS', 'Technology Services/IT Internship', 8, '2014-10-20 00:00:00', '2014-11-19 00:00:00', '<p>Internship Description:</p>\r\n\r\n<p>- Mentoring by the Assistant Chief Information Officer of Broward County and Senior IT Professionals</p>\r\n\r\n<p>- Assist with current agency projects, including research and analysis.</p>\r\n\r\n<p>- Assist with Business Analysis through documentation, testing, and requirement validation</p>\r\n\r\n<p>- Assist with writing technical user guides for technologies such as Apple Television and video conference equipment, to be used throughout the County.</p>\r\n\r\n<p>- Help with research and development of new Technology Policies to be implemented at the County level.</p>\r\n\r\n<p>- Assist with the documentation of project portfolio metrics and IT operational metrics to assist agencies.</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>Learning Outcomes:<br />\r\n-Opportunity to learn in real time the Project processes used for the Broward County Network<br />\r\n- Learn to develop and implement technology policies that have County-wide influences.<br />\r\n- Learn various employee training methods and how to create user guides that are user-friendly, to increase agency efficiency.<br />\r\n- Learn how to appropriately develop project portfolio and IT operational metrics to be presented to customers.<br />\r\n- Learn ways to optimize the business processes through the utilization of technologies and process improvement instruments.<br />\r\n- Gain experience with communications hardware for a large IT agency such as routers, switches, VOIP and monitoring tools</p>\r\n<p>Knowledge using Microsoft Office Suite<br />\r\nAbility to assist in research and make recommendations<br />\r\nknowledge of the principles of management, organization, and administration.</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$fPBCCPAwbQ8JqWGGn2dLVeZCrUpbrBfbgQAWxcSd6o9amD.ZqF3MG', 'Broward County Government', NULL),
(28, 'CIS', 'Application Developer I', 8, '2014-10-21 00:00:00', '2014-12-31 00:00:00', '<p>&nbsp;The Application Developer I:</p>\r\n\r\n<ul>\r\n	<li>Supports one of the following applications: Campus Solutions, Financials, Human ResourcesBusiness Intelligence, Portal, CRM or equivalent enterprise system.</li>\r\n	<li>Develops data management scripts.</li>\r\n	<li>Analyzes, designs and creates specifications for PeopleSoft application functionalities and/or requirements.</li>\r\n	<li>Analyzes and understands vendor interfaces and related business processes.</li>\r\n	<li>Develops, customizes, reports, and interfaces new processes using PeopleSoft tools and other 3rd party tools.</li>\r\n	<li>Provides assistance to all phases in the project set up &amp; prototyping, design, development, conversion, testing, deployment.</li>\r\n	<li>Assists with providing proof of concept through extensive prototyping project stakeholders and end users, and proposes technical solutions.</li>\r\n	<li>Assists with technical expert addressing problems related to systems integration, and compatibility and multiple platform integration. This includes guidance related to general and portal-specific software design, development processes, security, infrastructure, migration paths, and deployment best practices.</li>\r\n</ul>\r\n<p>&nbsp;The Application Developer I:</p>\r\n\r\n<ul>\r\n	<li>Supports one of the following applications: Campus Solutions, Financials, Human ResourcesBusiness Intelligence, Portal, CRM or equivalent enterprise system.</li>\r\n	<li>Develops data management scripts.</li>\r\n	<li>Analyzes, designs and creates specifications for PeopleSoft application functionalities and/or requirements.</li>\r\n	<li>Analyzes and understands vendor interfaces and related business processes.</li>\r\n	<li>Develops, customizes, reports, and interfaces new processes using PeopleSoft tools and other 3rd party tools.</li>\r\n	<li>Provides assistance to all phases in the project set up &amp; prototyping, design, development, conversion, testing, deployment.</li>\r\n	<li>Assists with providing proof of concept through extensive prototyping project stakeholders and end users, and proposes technical solutions.</li>\r\n	<li>Assists with technical expert addressing problems related to systems integration, and compatibility and multiple platform integration. This includes guidance related to general and portal-specific software design, development processes, security, infrastructure, migration paths, and deployment best practices.</li>\r\n</ul>\r\n<ul>\r\n	<li>Computer Science/IT related 4 year degree.</li>\r\n	<li>Object Oriented Programming experience.</li>\r\n	<li>Data Structures and Database Administration classes.</li>\r\n	<li>Web application development experience</li>\r\n	<li>SQL development experience</li>\r\n</ul>\r\n\r\n<p>Please apply here:&nbsp;<a href="http://go.fiu.edu/ApplicationDeveloper">http://go.fiu.edu/ApplicationDeveloper</a></p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$Ffd0jeg3D1AcZoL4WbNDQ.hlZ/PySs7WvarQh8RMhCapbr3QdL4/e', 'PantherSoft (FIU)', NULL),
(29, 'CIS', 'Senior Mobile Developer - JavaScript, Java, C', 8, '2014-10-15 00:00:00', '2014-11-14 00:00:00', '<p><strong>The High Performance Database Research Center (HPDRC) is seeking a skillful Senior Developer (Master or PhD student) to join a major software development project. The Informed Traveler Program and Applications (ITPA) software will be an advanced traffic management package, currently being developed at the HPDRC. It will provide customized realtime and predictive information about multimodal and intermodal traffic in the UniversityCity region to individual customers. It also makes available innovative decision support for transportation providers. ITPA will enable the individual user to make optimum route and mode choices, and also enable the service provider to manage individual traffic, transit and parking more effectively.</strong><br />\r\n&nbsp;</p>\r\n<p><br />\r\nThe senior experienced software developer will join a research and development team and help us design, implement and test unique and innovative functions and features for users of smartphones and traffic management operations centers from the ground up.&nbsp; You will work as a member of the ITPA agile scrum&nbsp;team delivering phase 1 features for customers and users in the UniversityCity region.&nbsp; This will include design, coding, testing and other tasks as are deemed necessary by the scrum team.</p>\r\n<p><br />\r\n<strong>- A Master or PhD student with a computer science background, with strong<br />\r\n&nbsp; &nbsp;problem solving abilities, insight into complex algorithm and data<br />\r\n&nbsp; &nbsp;structure design</strong></p>\r\n\r\n<p><strong>- a good understanding in object oriented development and design patterns,<br />\r\n<br />\r\n- strong verbal and written communication skills in English.<br />\r\n<br />\r\nMust have:<br />\r\n<br />\r\n- Significant experience in mobile application development and web<br />\r\n&nbsp; &nbsp;development,<br />\r\n<br />\r\n- knowledge and experience in JavaScript, CSS3, HTML5, and Java.<br />\r\n<br />\r\n- Candidates with experience with the IBM WorkLight development system<br />\r\n&nbsp; &nbsp; and the OpenLayer mapping library are preferred.</strong><br />\r\n&nbsp;</p>\r\n', '', NULL, NULL, 0, NULL, '$2a$08$2ogOoALq3UBYaMPtOA.AIeuxW9G8Zc98zzwQsI1B/HZgxH4IiUiv6', 'Florida International University', NULL),
(30, 'CIS', 'Senior Mobile Developer - JavaScript, Java, C', 8, '2014-10-15 00:00:00', '2014-11-14 00:00:00', '<p><strong>The High Performance Database Research Center (HPDRC) is seeking a skillful Senior Developer (Master or PhD student) to join a major software development project. The Informed Traveler Program and Applications (ITPA) software will be an advanced traffic management package, currently being developed at the HPDRC. It will provide customized realtime and predictive information about multimodal and intermodal traffic in the UniversityCity region to individual customers. It also makes available innovative decision support for transportation providers. ITPA will enable the individual user to make optimum route and mode choices, and also enable the service provider to manage individual traffic, transit and parking more effectively.</strong><br />\r\n&nbsp;</p>\r\n<p><br />\r\nThe senior experienced software developer will join a research and development team and help us design, implement and test unique and innovative functions and features for users of smartphones and traffic management operations centers from the ground up.&nbsp; You will work as a member of the ITPA agile scrum&nbsp;team delivering phase 1 features for customers and users in the UniversityCity region.&nbsp; This will include design, coding, testing and other tasks as are deemed necessary by the scrum team.</p>\r\n<p><br />\r\n<strong>- A Master or PhD student with a computer science background, with strong<br />\r\n&nbsp; &nbsp;problem solving abilities, insight into complex algorithm and data<br />\r\n&nbsp; &nbsp;structure design</strong></p>\r\n\r\n<p><strong>- a good understanding in object oriented development and design patterns,<br />\r\n<br />\r\n- strong verbal and written communication skills in English.<br />\r\n<br />\r\nMust have:<br />\r\n<br />\r\n- Significant experience in mobile application development and web<br />\r\n&nbsp; &nbsp;development,<br />\r\n<br />\r\n- knowledge and experience in JavaScript, CSS3, HTML5, and Java.<br />\r\n<br />\r\n- Candidates with experience with the IBM WorkLight development system<br />\r\n&nbsp; &nbsp; and the OpenLayer mapping library are preferred.</strong><br />\r\n&nbsp;</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$6NDHPfZ5iiTY2MsK3IYwDut4gY7WN8pONMzJNQyRQDCdvTa/TLOgq', 'Florida International University', NULL),
(31, 'Full Time', 'Thing', 3, '2014-11-13 14:15:27', '2014-12-31 00:00:00', 'Demo', '', NULL, NULL, 0, NULL, NULL, 'Company', NULL),
(32, 'Full Time', 'Thing', 3, '2014-11-13 14:15:47', '2014-12-31 00:00:00', 'Demo', '', NULL, NULL, 0, NULL, NULL, 'Company', NULL),
(33, 'Full Time', 'the job of ur life', 12, '2014-11-23 17:36:49', '2014-11-30 00:00:00', 'java, php, javascript this is some random stuff.', '100000', NULL, NULL, 0, NULL, NULL, 'asdasd', NULL),
(34, 'CIS', 'Devoloper', 8, '2014-11-26 00:00:00', '2014-12-26 00:00:00', '<ul>\r\n	<li>Part-time</li>\r\n	<li>Office hours are M-F 9:00 AM - 5:30 PM</li>\r\n	<li>Possible Full-time opportunity</li>\r\n</ul>\r\n<p>To particate in development projects with state of the art companies as&nbsp;a software devoloper and or analyst</p>\r\n<ul>\r\n	<li>Programming skills: PHP, Javascript (JQuery), HTML, CSS, Boostrap</li>\r\n	<li>Knowledge in Methologies for software development</li>\r\n	<li>Spanish&nbsp;a plus</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$05T.pUS/nSkHsn0PlyWhNe8RXokuoEVZBxY9fErCMno9/9gb297FS', 'OASYS SOFT', NULL),
(35, 'CIS', 'Software Developer', 8, '2014-12-01 00:00:00', '2014-12-31 00:00:00', '<p>GoToITSolutions is looking for a computer science student or recent graduate for a part-time position. He or she will be working as a team and be involved in many areas of the company. The main responsibility will be software development, but other duties will include support for clients, social media marketing, and other various tasks.</p>\r\n<ul>\r\n	<li>Part-time position.</li>\r\n	<li>Very flexible schedule.</li>\r\n	<li>Will work and learn technologies such as SQL, Ruby, YAML, .NET, and WPF.</li>\r\n	<li>Active throughout entire software development process, from gathering requirements from clients to development, production, refinements, and support.</li>\r\n	<li>Create reports, tools, and build upon an existing custom library.</li>\r\n	<li>Debug and fix custom processes for clients and offer solutions.</li>\r\n</ul>\r\n<ul>\r\n	<li>Positive attitude under pressure, and honest about depth of technical knowledge.</li>\r\n	<li><span style="line-height:1.6em">Good troubleshooting, problem solving, and analytical skills.</span></li>\r\n	<li><span style="line-height:1.6em">Knowledge of object-oriented programming.</span></li>\r\n	<li><span style="line-height:1.6em">Must be a quick learner not afraid to learn new tools.</span></li>\r\n	<li><span style="line-height:1.6em">Skills pref</span><span style="line-height:1.6em">erred but not necessary: SQL, Ruby, HTML, JavaScript.</span></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$UQMl8JLwbBPr.bOBfWml6O6JKo7Gsqh70ZxezGP5hbT2II7Uf1xVG', 'GoToITSolutions', NULL),
(36, 'CIS', 'Product Owner', 8, '2014-11-13 00:00:00', '2014-12-13 00:00:00', '<p>The product owner must work together with key venture stakeholders and the development team to lead product deployment and improvement in multiple countries. We expect a hands-on, ownership approach to the role - you are a key member of the startup and accountable for a fast, successful expansion.</p>\r\n\r\n<p>Clickbus is a fast, fun and challenging environment. You will work in a place full of entrepreneurs from various very successful ventures. Still, the startup environment is not for everyone and we understand that - thus we expect candidates to demonstrate a good degree of self-knowledge.</p>\r\n<p>The Product Owner at Clickbus will be responsible for:</p>\r\n\r\n<ul>\r\n	<li>Maintenance and prioritization of the product backlog, together with the Product Manager, major stakeholders and development team.</li>\r\n	<li>Sorting the sprints and release plans</li>\r\n	<li>Writing user stories and establishing acceptance criteria in the backlog.</li>\r\n	<li>&quot;Translation&quot; of technical terms to customers, and customer requirements into technical specifications</li>\r\n	<li>Responsible for the Product Roadmap</li>\r\n	<li>Understanding the consumer and business needs to create new features in the roadmap</li>\r\n</ul>\r\n<ul>\r\n	<li>Solid experience with agile methodologies (Scrum and Kanban)</li>\r\n	<li>Written and oral fluency in English</li>\r\n	<li>Good communication skills</li>\r\n	<li>Flexibility in dealing with different types of customers inside and outside the company</li>\r\n	<li>Ability to delegate tasks</li>\r\n	<li>Experience in working with UX and UI teams</li>\r\n	<li>Experience in any of the following project management tools: Pivotal, Active Colab, TFS, Teamwork, specially Jira</li>\r\n	<li>Ability to work with teams in a fast-paced environment</li>\r\n	<li>Knowledge of all phases of product development, from its conception, creation, testing, planning and maintenance releases</li>\r\n	<li>Ability to understand customer requirements and articulate in a development plan.</li>\r\n</ul>\r\n\r\n<h3>Diferentials:</h3>\r\n\r\n<ul>\r\n	<li>Wireframing capability</li>\r\n	<li>Have one of the following certifications:\r\n	<ul>\r\n		<li>Certified Scrum Product Owner (CSPO)</li>\r\n		<li>Certified Scrum Master (CSM)</li>\r\n	</ul>\r\n	</li>\r\n	<li>Web Analytics Knowledge: Crazy Egg, Google Analytics, Session Cam, Webtrends</li>\r\n	<li>A/B and multivariate testing</li>\r\n	<li>Basic or Intermediate programming knowledge (Php, Angular, Javascript, Node)</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$ybhO3BoxdQkQZh5WRilTiOZ4I4QQm/YxPe/YntYVtWb138pKxNAIS', 'Clickbus', NULL),
(37, 'CIS', 'Software Architect', 8, '2014-11-13 00:00:00', '2014-12-13 00:00:00', '<p># Requirements</p>\r\n\r\n<p>- TDD (really)<br />\r\n- Project orientation<br />\r\n- Knowledge in Software Architect<br />\r\n- Data Modeling<br />\r\n- Analitic Vision<br />\r\n- Excelent logic reasoning and problem - resolution ability<br />\r\n- PHP 5<br />\r\n- Javascript<br />\r\n- Project standards in general<br />\r\n- Restful applications<br />\r\n- Good practices<br />\r\n- Team play<br />\r\n- Memcached<br />\r\n- Agile Development<br />\r\n- 6 years or more than it of experience</p>\r\n<p>We&#39;re looking for good developers that can code with commitment and ownership that not only execute his/her job but also help the team to think, to evolve and to improve themselves.</p>\r\n<p># Desirable</p>\r\n\r\n<p>- Symfony2<br />\r\n- Doctrine2<br />\r\n- Sockets<br />\r\n- DDD<br />\r\n- Phalcon php<br />\r\n- BDD<br />\r\n- HHVM<br />\r\n- SCRUM<br />\r\n- AngularJS<br />\r\n- Silex<br />\r\n- Redis<br />\r\n- RabitMQ<br />\r\n- Gearman<br />\r\n- People and little projects management</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$ZhqzpETk7gVmC9XcICS51ezcBkjXwvEmqrg6vT01Vg5E.NXszw2sW', 'Clickbus', NULL),
(38, 'CIS', 'International Internship- Big Data', 8, '2014-11-18 00:00:00', '2015-02-02 00:00:00', '<p><strong>6-8-week summer funded fellowships </strong>at collaborator sites for graduate students to participate in sophisticated international research collaborations.&nbsp; Teams will be developing and doing research in cloud-based services &amp; applications.</p>\r\n<p>See the&nbsp;<a href="http://pire.opensciencedatacloud.org/fellowships/faqs">Frequently Asked Questions</a>&nbsp;page.</p>\r\n<p>&bull;&nbsp;&nbsp; &nbsp;You must be a US Resident or Citizen in order to participate<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Complete application at:&nbsp;<br />\r\nhttp://pire.opensciencedatacloud.org/apply/<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Must be a graduate student, senior undergrad, postdoc, early career faculty&nbsp;<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Must be actively conducting research in Computer Science, Engineering, or Genetics related topic to benefit from a summer research experience consistent with the goals of the OSDC PIRE project&nbsp;<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Must have strong academic qualifications 3.0 GPA or better<br />\r\n&bull;&nbsp;&nbsp; &nbsp;Curriculum Vitae of applicant submitted with online application, 2 page limit<br />\r\n&bull;&nbsp;&nbsp; &nbsp;A 1 page statement indicating how the research abroad experience will enhance the applicant&rsquo;s future educational and professional plans submitted with online application&nbsp;<br />\r\n&bull;&nbsp;&nbsp; &nbsp;A letter of recommendation from the applicant&rsquo;s advisor emailed directly to &nbsp;pire@opensciencedatacloud.org</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$GMV7bYW08nxL.NJnw1M8ZeEQfy1sFy6Y5cyBqJhQ8QW2gtVxMk0K2', 'FIU CIARA', NULL),
(39, 'Full Time', 'Software Tester', 12, '2014-12-11 21:00:13', '2014-12-31 00:00:00', 'This is a position as a software tester for my company. You will be doing unit testing using phpunit.', '40,000', NULL, NULL, 1, NULL, NULL, 'asdasd', NULL),
(40, 'Internship', 'Software Engineer', 12, '2014-12-11 21:02:33', '2014-12-19 00:00:00', 'In this internship you will learn how to do sequence diagrams.', '20,000', NULL, NULL, 1, NULL, NULL, 'asdasd', NULL),
(41, 'CIS', 'db Dev', 8, '2015-01-06 00:00:00', '2015-02-05 00:00:00', '<h2>Job Description</h2>\r\n\r\n<p>If you are interested in a fast paced startup environment with a high degree of creativity and flexibility and want expand your personal strengths and abilities, please keep reading.</p>\r\n\r\n<p>URBAN4M is growing and we are looking to add to our diverse team and set of skills. &nbsp;We have several positions open - db developer being one of them. &nbsp;The main responsibilities include advanced data mining and database design for structured/licensed data and unstructured spatial and temporal data.</p>\r\n\r\n<p>An ideal candidate for the position can think beyond the immediate task at hand and be part of the overall development of services and company growth.</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>The individual will be hired for a full-time position for&nbsp;maintaining and improving a sophisticated and innovative spatial database - requires wearing multiple development and related hats.</p>\r\n<h2>Skills &amp; Requirements</h2>\r\n\r\n<p>Databases:&nbsp;PostgreSQL (with solid schema-design experience), ElasticSearch implementation experience a plus</p>\r\n\r\n<p>Languages:&nbsp;Go (or C, C++, or Java with a strong will/desire to learn Go)</p>\r\n\r\n<p>Knowledge of:&nbsp;RESTful services, Amazon Web Services/DevOps, GIS, Agile environments</p>\r\n\r\n<p>Preferred Education:&nbsp;Bachelor - Computer Science or better</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$hdLRT7Fn7MbxBUevLhRhLOHPRzR8pRMDmdEQjrTkCkwv8L9T4iqWm', 'Urban4M', NULL),
(42, 'CIS', 'Senior Mobile Developer', 8, '2015-01-27 00:00:00', '2015-02-26 00:00:00', '<p>The Florida International University High Performance Database Research Center (HPDRC) is seeking skillful Senior Smart Phone Developer to join a major software development project. The Informed Traveler Program and Applications (ITPA) software will be an advanced traffic management package, currently being developed at the HPDRC. It will provide customized real-time and predictive information about multimodal and intermodal traffic in congested urban centers to individual customers. It also makes available innovative decision support for transportation providers. ITPA will enable the individual user to make optimum route and mode choices, and also enable the service provider to manage individual traffic, transit and parking more effectively.</p>\r\n<p>The role of the successful candidate will be to be the lead technical developer of smart phone and web applications supporting a large number of customers.&nbsp; The lead is responsible to work in an agile&nbsp;scrum team with other developers and provide technical expertise on the front end development of the ITPA project as well as coding, testing, and demonstrating ITPA functionality.&nbsp; This position includes interfacing with research developers to introduce new and innovative solutions to dynamic computational traffic and parking problems</p>\r\n<ul>\r\n	<li>Bachelor degree in computer science with significant experience in mobile phone application and web development (minimum 2 years),</li>\r\n	<li>Knowledge and experience in JavaScript, CSS3, HTML5, and Java.</li>\r\n	<li>Strong problem solving abilities, insight into complex algorithm and data structure design.</li>\r\n	<li>A good understanding in object oriented development and design patterns,</li>\r\n	<li>Strong verbal and written communication skills in English.</li>\r\n	<li>Agile experience is a plus.</li>\r\n	<li>Candidates with experience with the IBM WorkLight development system are preferred.</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$SmOf.axezTovvQ.6QT5i..UI20IbdzlbW77feSUDzihqgP6mXlxV6', 'Florida International University', NULL),
(43, 'CIS', 'Mobile App QA Engineer Intern', 8, '2015-01-13 00:00:00', '2015-03-12 00:00:00', '<p><strong>Are you interested in Mobile Application development for Android and iOS?</strong></p>\r\n\r\n<p>Moocho&#39;s Mobile Application Development Team is looking for an intern to assist with:</p>\r\n\r\n<ul>\r\n	<li>Mobile Application Testing</li>\r\n	<li>Documenting Test Cases</li>\r\n	<li>Investigating and Troubleshooting Bug Reports</li>\r\n	<li>Testing Automation</li>\r\n</ul>\r\n\r\n<p>We&#39;re looking for someone that is in a technical major with knowledge of software development.</p>\r\n\r\n<p>Someone interested in mobile application development on iOS and Android would be a great fit, as there may be opportunities to assist with application development for the right candidate.</p>\r\n<ul>\r\n	<li>Mobile Application Testing</li>\r\n	<li>Documenting Test Cases</li>\r\n	<li>Investigating and Troubleshooting Bug Reports</li>\r\n	<li>Testing Automation</li>\r\n</ul>\r\n\r\n<p>Possible mobile app development for the right candidate</p>\r\n<ul>\r\n	<li>Strong interest in mobile apps (Android / iPhone)</li>\r\n	<li>Technical major and/or some knowledge of software development</li>\r\n	<li>Detail oriented</li>\r\n	<li>Critical thinking skills</li>\r\n	<li>Any mobile app dev experience will be a plus but not required</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$XMqFEEe/pbhqW8a5HB/FLeKVLzbJC3HyoI4gh9.5JY0Za.DTUT19K', 'Moocho', NULL),
(44, 'CIS', 'Junior Mobile Developer', 8, '2015-01-27 00:00:00', '2015-02-26 00:00:00', '<p>The Florida International University High Performance Database Research Center (HPDRC) is seeking skillful Junior Smart Phone Developer to join a major software development project. The Informed Traveler Program and Applications (ITPA) software will be an advanced traffic management package, currently being developed at the HPDRC. It will provide customized real-time and predictive information about multimodal and intermodal traffic in congested urban centers to individual customers. It also makes available innovative decision support for transportation providers. ITPA will enable the individual user to make optimum route and mode choices, and also enable the service provider to manage individual traffic, transit and parking more effectively</p>\r\n<p>The role of the successful candidate will be to provide coding and testing of smart phone and web applications supporting a large number of customers.&nbsp; The candidate is responsible to work in a scrum team with other developers and provide coding and testing on the front end development of the ITPA project and demonstrating ITPA functionality.&nbsp; This position requires a team oriented individual who is willing to stretch his capabilities to help the team.</p>\r\n<ul>\r\n	<li>Knowledge and experience in JavaScript, CSS3, HTML5, and Java.</li>\r\n	<li>Some experience developing smart phone Apps</li>\r\n	<li>Strong problem solving abilities</li>\r\n	<li>A good understanding in object oriented development and design patterns,</li>\r\n	<li>Strong verbal and written communication skills in English.</li>\r\n	<li>Agile experience is a plus but not essential</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$xByj8HGD925tfWfrCwWbC.ohwFRCAZHPsG9ARj8l9Usu0sf3Ikx96', 'Florida International University', NULL),
(51, 'CIS', 'Senior Mobile Developer', 8, '2015-01-27 00:00:00', '2015-03-28 00:00:00', '<p>The Florida International University High Performance Database Research Center (HPDRC) is seeking skillful Senior Smart Phone Developer to join a major software development project. The Informed Traveler Program and Applications (ITPA) software will be an advanced traffic management package, currently being developed at the HPDRC. It will provide customized real-time and predictive information about multimodal and intermodal traffic in congested urban centers to individual customers. It also makes available innovative decision support for transportation providers. ITPA will enable the individual user to make optimum route and mode choices, and also enable the service provider to manage individual traffic, transit and parking more effectively.</p>\r\n<p>The role of the successful candidate will be to be the lead technical developer of smart phone and web applications supporting a large number of customers.&nbsp; The lead is responsible to work in an agile&nbsp;scrum team with other developers and provide technical expertise on the front end development of the ITPA project as well as coding, testing, and demonstrating ITPA functionality.&nbsp; This position includes interfacing with research developers to introduce new and innovative solutions to dynamic computational traffic and parking problems</p>\r\n<ul>\r\n	<li>Bachelor degree in computer science with significant experience in mobile phone application and web development (minimum 2 years),</li>\r\n	<li>Knowledge and experience in JavaScript, CSS3, HTML5, and Java.</li>\r\n	<li>Strong problem solving abilities, insight into complex algorithm and data structure design.</li>\r\n	<li>A good understanding in object oriented development and design patterns,</li>\r\n	<li>Strong verbal and written communication skills in English.</li>\r\n	<li>Agile experience is a plus.</li>\r\n	<li>Candidates with experience with the IBM WorkLight development system are preferred.</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$uyrcGiywUeCAxHg7p0iWrOWNBiRgm3kPuyz1tg4SwV3brGHAQFY3a', 'Florida International University', NULL),
(52, 'CIS', 'Cloud Solutions Consultant', 8, '2015-02-02 00:00:00', '2015-03-04 00:00:00', '<ul>\r\n	<li>Excel as a technology consultant who deploys Workday Human Capital Management and/or Financials solutions.</li>\r\n	<li>Implement and integrate complex solutions for clients across a wide spectrum of industries, locations and business needs.</li>\r\n	<li>Demonstrate a strong awareness of a project lifecycle: from planning and design to configuration, testing and deployment.</li>\r\n	<li>Establish working relationships and collaborate with colleagues to provide a high quality solution for our clients.</li>\r\n	<li>Develop deep skills in functional or technical areas, such as human resources, payroll, recruiting, integration technology, data analysis, system architecture, financials, accounting, and more.</li>\r\n	<li>Build strong business relationships with clients and become a trusted advisor.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<ul>\r\n	<li>Research business challenges and use problem solving skills to provide optimal solutions.</li>\r\n	<li>Evaluate your responsibilities and demonstrate awareness of how your role relates to the big picture.</li>\r\n	<li>Complete project-related tasks on time, with quality, and suggest opportunities for process improvement.</li>\r\n	<li>Understand the value of proper and effective planning.</li>\r\n	<li>Monitor progress of tasks against a project plan and communicate status regarding project issues.</li>\r\n	<li>Contribute to growing the knowledge capital base through activities such as sharing lessons learned with colleagues.</li>\r\n	<li>Seek opportunities to learn and take on additional tasks and responsibility.</li>\r\n	<li>Represent the organization in a professional manner.</li>\r\n	<li>Understand the importance of client satisfaction and use this knowledge to meet client needs in daily interactions.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Behavioral Skills Required</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Excellent analytical and problem solving skills.</li>\r\n	<li>Clear, concise and articulate oral and written communication capabilities.</li>\r\n	<li>Self-motivated and willing to collaborate with others when necessary to meet deadlines.</li>\r\n	<li>Respond with a sense of urgency to immediate needs.</li>\r\n	<li>Take pride in producing high quality work and maintain a strong work ethic.</li>\r\n	<li>Listen carefully to others and ask questions to gain or clarify understanding.</li>\r\n	<li>Adapt to different leadership and communication styles with both team members and clients in order to successfully complete goals.</li>\r\n	<li>Embrace new ideas, approaches and work styles from other team members.</li>\r\n	<li>Demonstrate enthusiasm and commitment to the goals and objectives of the team.</li>\r\n	<li>Accept and adapt to change, and understand that change is constant and necessary in order to consistently improve.</li>\r\n	<li>Seek feedback on performance, recognize strengths and areas for development, and complete training and development initiatives as needed.</li>\r\n	<li>Demonstrate enthusiasm about applying technology as a solution to business problems.</li>\r\n</ul>\r\n\r\n<p><strong><em>*This role will also fall under Aon&rsquo;s early career development program, known as Launch.</em></strong></p>\r\n<ul>\r\n	<li>Bachelor&rsquo;s Degree in Information Science, Computer Science, Business, Math, Statistics, Finance, Economics or other disciplines that create an understanding of a structured solution design.</li>\r\n	<li>Ability and willingness for an average of 25% travel, including the potential for global travel.</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$dY6cAQ2jjxn2hfTJQrwh6O8OQPRr6qyNq2o7l0lZxgX7dtb8BUWr6', 'AON Hewitt', NULL),
(53, 'CIS', 'Hybrid Networks Engineering Student Intern', 8, '2015-02-06 00:00:00', '2015-03-08 00:00:00', '<p>Hybrid Networks Engineering Student Intern</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<ul>\r\n	<li>Assisting in the implementation of an OpenFlow/SDN network for research and experimentation, connecting U.S. and Brazil OpenFlow network deployments via the AMPATH International Exchange Point, in Miami, Florida.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Assisting with the deployment of OpenFlow software and Network operating system builds, working in coordination with OpenFlow development teams at Internet2, GENI, and Brazil&rsquo;s OpenFlow projects.</li>\r\n	<li>Assisting with the deployment and testing of a traffic monitoring and reporting system for monitoring of hybrid networks</li>\r\n	<li>Assisting with user and technical documentation for use internally and for dissemination to communities of interest on the use of hybrid networks.</li>\r\n</ul>\r\n<p>Current Undergraduate or Graduate students in a computer science, engineering or networking related curriculum. One to two years College or equivalent work experience in the areas of computer or network operations including:</p>\r\n\r\n<ul>\r\n	<li>Knowledge of IP is essential.</li>\r\n	<li>Some systems administration experience with Unix based operating system(s) is preferred.</li>\r\n	<li>Some programing experience, preferably in Python, C++ or Java.</li>\r\n	<li>Knowledge of network switching and routing protocols is desired.</li>\r\n	<li>Good oral and written communication skills.</li>\r\n</ul>\r\n\r\n<p><strong>Hours and Pay:</strong></p>\r\n\r\n<p>Pay: $12 - $18/hr Hours: Mon . Fri, 8am . 5pm (20+ hours/week )</p>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$0eo6EmSLQEupPI6gkodtMuiMNOByG74Fd1DT3JZyWSUAknKkkIS9K', 'CIARA FIU', NULL),
(54, 'CIS', 'IT Help Desk Technician', 8, '2015-02-12 00:00:00', '2015-03-14 00:00:00', '<p><strong>We&rsquo;re looking for an IT help desk guru to provide internal support for employees and contractors. Candidates should have a mix of technical and customer service skills, and be passionate about technology and helping people. We support both Macs and PCs, BYOD, printer, faxes, copiers, etc.</strong></p>\r\n<p><strong>Basic Function/Responsibilities:</strong></p>\r\n\r\n<ul>\r\n	<li>Handle Tier 1 help desk escalations through tickets or phone</li>\r\n	<li>Follow up on outstanding requests and ensure timely resolution</li>\r\n	<li>Create accounts and configure hardware as part of on-boarding process</li>\r\n	<li>Support audio and video equipment in conference rooms</li>\r\n	<li>Manage and monitor internal assets to ensure accurate inventory records</li>\r\n</ul>\r\n\r\n<p><em>Other duties may be added and/or assigned as needed</em></p>\r\n\r\n<p>&nbsp;</p>\r\n<p><strong>Required Experience:</strong></p>\r\n\r\n<ul>\r\n	<li>Windows 7, Mac OS X, Google Collaboration Apps and Office 365</li>\r\n	<li>Active Directory maintenance and Exchange 2007 &amp; 2010</li>\r\n	<li>Mac and PC hardware, Printers, scanners, computer peripherals, Mobile devices (iOS, Android)</li>\r\n	<li>Client PC connectivity - ethernet, TCP/IP and VPN</li>\r\n	<li>File server knowledge</li>\r\n	<li>Experience with Ghost, BigFix, and McAfee desktop security products</li>\r\n	<li>Strong customer service and troubleshooting skills</li>\r\n	<li>Ability to communicate technical information, both verbal and written, to a wide range of end-users</li>\r\n	<li>2 years+ experience working in a Windows/Mac environment</li>\r\n</ul>\r\n', '', NULL, NULL, 1, NULL, '$2a$08$w.3C/suckggy.LOnHTvB0.7W7wCMH/rbCtq6EsPmphuXpGufcs/nO', 'SpeedyIT360', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_skill_map`
--

DROP TABLE IF EXISTS `job_skill_map`;
CREATE TABLE IF NOT EXISTS `job_skill_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` int(11) NOT NULL,
  `skillid` int(11) NOT NULL,
  `level` varchar(45) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jobid` (`jobid`),
  KEY `idx_skillid` (`skillid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1197 ;

--
-- Dumping data for table `job_skill_map`
--

INSERT INTO `job_skill_map` (`id`, `jobid`, `skillid`, `level`, `ordering`) VALUES
(6, 5, 58, NULL, 0),
(7, 5, 58, NULL, 1),
(8, 5, 58, NULL, 2),
(9, 5, 58, NULL, 3),
(10, 5, 58, NULL, 4),
(11, 5, 58, NULL, 5),
(12, 5, 58, NULL, 6),
(13, 5, 58, NULL, 7),
(14, 5, 58, NULL, 8),
(15, 5, 58, NULL, 9),
(16, 5, 58, NULL, 10),
(17, 5, 58, NULL, 11),
(18, 5, 58, NULL, 12),
(19, 5, 58, NULL, 13),
(20, 5, 58, NULL, 14),
(21, 5, 58, NULL, 15),
(22, 5, 58, NULL, 16),
(23, 5, 58, NULL, 17),
(24, 5, 58, NULL, 18),
(25, 5, 58, NULL, 19),
(26, 5, 58, NULL, 20),
(27, 5, 54, NULL, 21),
(28, 5, 58, NULL, 22),
(29, 5, 54, NULL, 23),
(30, 5, 58, NULL, 24),
(31, 5, 58, NULL, 25),
(32, 5, 58, NULL, 26),
(33, 5, 58, NULL, 27),
(34, 5, 58, NULL, 28),
(35, 5, 58, NULL, 29),
(36, 5, 58, NULL, 30),
(37, 5, 58, NULL, 31),
(38, 6, 58, NULL, 0),
(39, 6, 58, NULL, 1),
(40, 6, 58, NULL, 2),
(41, 6, 58, NULL, 3),
(42, 6, 58, NULL, 4),
(43, 6, 58, NULL, 5),
(44, 6, 58, NULL, 6),
(45, 6, 58, NULL, 7),
(46, 6, 58, NULL, 8),
(47, 6, 58, NULL, 9),
(48, 6, 58, NULL, 10),
(49, 6, 58, NULL, 11),
(50, 6, 48, NULL, 12),
(51, 6, 58, NULL, 13),
(52, 6, 58, NULL, 14),
(53, 7, 58, NULL, 0),
(54, 7, 58, NULL, 1),
(55, 7, 58, NULL, 2),
(56, 7, 58, NULL, 3),
(57, 8, 58, NULL, 0),
(58, 8, 58, NULL, 1),
(59, 8, 58, NULL, 2),
(60, 8, 58, NULL, 3),
(61, 8, 58, NULL, 4),
(62, 8, 58, NULL, 5),
(63, 8, 58, NULL, 6),
(64, 8, 58, NULL, 7),
(65, 8, 3, NULL, 8),
(66, 8, 58, NULL, 9),
(67, 8, 2, NULL, 10),
(68, 8, 58, NULL, 11),
(69, 8, 25, NULL, 12),
(70, 8, 58, NULL, 13),
(71, 8, 1, NULL, 14),
(72, 8, 58, NULL, 15),
(73, 8, 64, NULL, 16),
(74, 8, 58, NULL, 17),
(75, 9, 58, NULL, 0),
(76, 9, 58, NULL, 1),
(77, 9, 58, NULL, 2),
(78, 9, 58, NULL, 3),
(79, 9, 58, NULL, 4),
(80, 9, 58, NULL, 5),
(81, 9, 58, NULL, 6),
(82, 9, 58, NULL, 7),
(83, 9, 58, NULL, 8),
(84, 9, 58, NULL, 9),
(85, 9, 58, NULL, 10),
(86, 9, 58, NULL, 11),
(87, 9, 58, NULL, 12),
(88, 9, 17, NULL, 13),
(89, 9, 58, NULL, 14),
(90, 9, 58, NULL, 15),
(91, 9, 58, NULL, 16),
(92, 9, 1, NULL, 17),
(93, 9, 58, NULL, 18),
(94, 9, 58, NULL, 19),
(95, 9, 58, NULL, 20),
(96, 9, 58, NULL, 21),
(97, 9, 58, NULL, 22),
(98, 10, 58, NULL, 0),
(99, 10, 58, NULL, 1),
(100, 10, 58, NULL, 2),
(101, 10, 58, NULL, 3),
(102, 10, 58, NULL, 4),
(103, 10, 58, NULL, 5),
(104, 10, 58, NULL, 6),
(105, 10, 58, NULL, 7),
(106, 10, 58, NULL, 8),
(107, 10, 58, NULL, 9),
(108, 10, 58, NULL, 10),
(109, 10, 58, NULL, 11),
(110, 10, 58, NULL, 12),
(111, 10, 58, NULL, 13),
(112, 10, 58, NULL, 14),
(113, 11, 58, NULL, 0),
(114, 11, 58, NULL, 1),
(115, 11, 58, NULL, 2),
(116, 11, 58, NULL, 3),
(117, 11, 58, NULL, 4),
(118, 11, 58, NULL, 5),
(119, 11, 58, NULL, 6),
(120, 11, 58, NULL, 7),
(121, 11, 58, NULL, 8),
(122, 11, 58, NULL, 9),
(123, 11, 58, NULL, 10),
(124, 11, 58, NULL, 11),
(125, 11, 58, NULL, 12),
(126, 11, 58, NULL, 13),
(127, 11, 58, NULL, 14),
(128, 11, 58, NULL, 15),
(129, 11, 58, NULL, 16),
(130, 11, 58, NULL, 17),
(131, 11, 58, NULL, 18),
(132, 11, 58, NULL, 19),
(133, 11, 58, NULL, 20),
(134, 11, 58, NULL, 21),
(135, 11, 58, NULL, 22),
(136, 11, 58, NULL, 23),
(137, 11, 58, NULL, 24),
(138, 11, 58, NULL, 25),
(139, 11, 58, NULL, 26),
(140, 11, 58, NULL, 27),
(141, 11, 58, NULL, 28),
(142, 11, 58, NULL, 29),
(143, 11, 58, NULL, 30),
(144, 11, 58, NULL, 31),
(145, 11, 58, NULL, 32),
(146, 11, 58, NULL, 33),
(147, 11, 58, NULL, 34),
(148, 11, 58, NULL, 35),
(149, 11, 58, NULL, 36),
(150, 11, 58, NULL, 37),
(151, 11, 58, NULL, 38),
(152, 11, 58, NULL, 39),
(153, 11, 58, NULL, 40),
(154, 11, 58, NULL, 41),
(155, 11, 58, NULL, 42),
(156, 11, 58, NULL, 43),
(157, 11, 58, NULL, 44),
(158, 11, 58, NULL, 45),
(159, 11, 58, NULL, 46),
(160, 11, 58, NULL, 47),
(161, 11, 58, NULL, 48),
(162, 11, 58, NULL, 49),
(163, 11, 58, NULL, 50),
(164, 11, 58, NULL, 51),
(165, 11, 58, NULL, 52),
(166, 11, 58, NULL, 53),
(167, 11, 58, NULL, 54),
(168, 11, 58, NULL, 55),
(169, 11, 58, NULL, 56),
(170, 11, 58, NULL, 57),
(171, 11, 58, NULL, 58),
(172, 11, 58, NULL, 59),
(173, 11, 58, NULL, 60),
(174, 11, 58, NULL, 61),
(175, 11, 58, NULL, 62),
(176, 11, 58, NULL, 63),
(177, 11, 58, NULL, 64),
(178, 11, 58, NULL, 65),
(179, 11, 58, NULL, 66),
(180, 11, 58, NULL, 67),
(181, 11, 58, NULL, 68),
(182, 11, 58, NULL, 69),
(183, 11, 58, NULL, 70),
(184, 11, 58, NULL, 71),
(185, 11, 58, NULL, 72),
(186, 11, 58, NULL, 73),
(187, 11, 58, NULL, 74),
(188, 11, 58, NULL, 75),
(189, 11, 58, NULL, 76),
(190, 11, 58, NULL, 77),
(191, 11, 58, NULL, 78),
(192, 11, 58, NULL, 79),
(193, 11, 58, NULL, 80),
(194, 11, 58, NULL, 81),
(195, 11, 58, NULL, 82),
(196, 11, 58, NULL, 83),
(197, 11, 58, NULL, 84),
(198, 11, 58, NULL, 85),
(199, 11, 58, NULL, 86),
(200, 11, 58, NULL, 87),
(201, 11, 58, NULL, 88),
(202, 11, 58, NULL, 89),
(203, 11, 58, NULL, 90),
(204, 11, 58, NULL, 91),
(205, 11, 58, NULL, 92),
(206, 11, 58, NULL, 93),
(207, 11, 58, NULL, 94),
(208, 12, 58, NULL, 0),
(209, 12, 58, NULL, 1),
(210, 12, 58, NULL, 2),
(211, 12, 58, NULL, 3),
(212, 12, 58, NULL, 4),
(213, 12, 58, NULL, 5),
(214, 12, 58, NULL, 6),
(215, 12, 58, NULL, 7),
(216, 12, 58, NULL, 8),
(217, 12, 58, NULL, 9),
(218, 12, 58, NULL, 10),
(219, 12, 58, NULL, 11),
(220, 12, 58, NULL, 12),
(221, 12, 58, NULL, 13),
(222, 12, 58, NULL, 14),
(223, 12, 24, NULL, 15),
(224, 12, 58, NULL, 16),
(225, 12, 58, NULL, 17),
(226, 12, 58, NULL, 18),
(227, 12, 58, NULL, 19),
(228, 12, 58, NULL, 20),
(229, 12, 58, NULL, 21),
(230, 12, 58, NULL, 22),
(231, 12, 58, NULL, 23),
(232, 12, 58, NULL, 24),
(233, 12, 58, NULL, 25),
(234, 12, 58, NULL, 26),
(235, 12, 58, NULL, 27),
(236, 12, 58, NULL, 28),
(237, 12, 58, NULL, 29),
(238, 12, 58, NULL, 30),
(239, 12, 58, NULL, 31),
(240, 12, 58, NULL, 32),
(241, 12, 58, NULL, 33),
(242, 12, 58, NULL, 34),
(243, 12, 58, NULL, 35),
(244, 12, 58, NULL, 36),
(245, 12, 58, NULL, 37),
(246, 12, 58, NULL, 38),
(247, 12, 58, NULL, 39),
(248, 12, 58, NULL, 40),
(249, 12, 58, NULL, 41),
(250, 12, 58, NULL, 42),
(251, 12, 58, NULL, 43),
(252, 12, 58, NULL, 44),
(253, 12, 58, NULL, 45),
(254, 12, 58, NULL, 46),
(255, 12, 58, NULL, 47),
(256, 12, 58, NULL, 48),
(257, 12, 58, NULL, 49),
(258, 12, 58, NULL, 50),
(259, 12, 58, NULL, 51),
(260, 12, 58, NULL, 52),
(261, 12, 58, NULL, 53),
(262, 12, 58, NULL, 54),
(263, 12, 58, NULL, 55),
(264, 12, 58, NULL, 56),
(265, 12, 58, NULL, 57),
(266, 12, 58, NULL, 58),
(267, 12, 58, NULL, 59),
(268, 12, 58, NULL, 60),
(269, 12, 58, NULL, 61),
(270, 12, 58, NULL, 62),
(271, 12, 58, NULL, 63),
(272, 12, 58, NULL, 64),
(273, 12, 58, NULL, 65),
(274, 12, 58, NULL, 66),
(275, 12, 58, NULL, 67),
(276, 12, 58, NULL, 68),
(277, 13, 58, NULL, 0),
(278, 13, 58, NULL, 1),
(279, 13, 58, NULL, 2),
(280, 13, 58, NULL, 3),
(281, 13, 58, NULL, 4),
(282, 13, 58, NULL, 5),
(283, 13, 58, NULL, 6),
(284, 13, 58, NULL, 7),
(285, 13, 16, NULL, 8),
(286, 13, 58, NULL, 9),
(287, 13, 8, NULL, 10),
(288, 13, 58, NULL, 11),
(289, 13, 17, NULL, 12),
(290, 13, 58, NULL, 13),
(291, 13, 54, NULL, 14),
(292, 13, 58, NULL, 15),
(293, 13, 58, NULL, 16),
(294, 14, 58, NULL, 0),
(295, 14, 58, NULL, 1),
(296, 14, 58, NULL, 2),
(297, 14, 58, NULL, 3),
(298, 14, 58, NULL, 4),
(299, 14, 58, NULL, 5),
(300, 14, 58, NULL, 6),
(301, 14, 58, NULL, 7),
(302, 14, 45, NULL, 8),
(303, 14, 58, NULL, 9),
(304, 14, 58, NULL, 10),
(305, 14, 58, NULL, 11),
(306, 14, 58, NULL, 12),
(307, 15, 33, NULL, 0),
(308, 15, 58, NULL, 1),
(309, 15, 58, NULL, 2),
(310, 15, 58, NULL, 3),
(311, 15, 58, NULL, 4),
(312, 15, 58, NULL, 5),
(313, 15, 58, NULL, 6),
(314, 15, 58, NULL, 7),
(315, 15, 58, NULL, 8),
(316, 15, 33, NULL, 9),
(317, 15, 58, NULL, 10),
(318, 15, 58, NULL, 11),
(319, 16, 58, NULL, 0),
(320, 16, 58, NULL, 1),
(321, 16, 58, NULL, 2),
(322, 16, 58, NULL, 3),
(323, 16, 58, NULL, 4),
(324, 16, 58, NULL, 5),
(325, 16, 58, NULL, 6),
(326, 16, 58, NULL, 7),
(327, 16, 58, NULL, 8),
(328, 16, 58, NULL, 9),
(329, 16, 58, NULL, 10),
(330, 16, 7, NULL, 11),
(331, 16, 58, NULL, 12),
(332, 16, 58, NULL, 13),
(333, 16, 58, NULL, 14),
(334, 16, 58, NULL, 15),
(335, 16, 58, NULL, 16),
(336, 16, 58, NULL, 17),
(337, 16, 54, NULL, 18),
(338, 16, 58, NULL, 19),
(339, 16, 58, NULL, 20),
(340, 16, 58, NULL, 21),
(341, 16, 7, NULL, 22),
(342, 16, 58, NULL, 23),
(343, 17, 2, NULL, 0),
(344, 17, 2, NULL, 1),
(345, 18, 58, NULL, 0),
(346, 18, 58, NULL, 1),
(347, 18, 1, NULL, 2),
(348, 18, 58, NULL, 3),
(349, 18, 58, NULL, 4),
(350, 18, 58, NULL, 5),
(351, 18, 58, NULL, 6),
(352, 18, 58, NULL, 7),
(353, 18, 58, NULL, 8),
(354, 18, 1, NULL, 9),
(355, 18, 58, NULL, 10),
(356, 18, 58, NULL, 11),
(357, 18, 58, NULL, 12),
(358, 18, 58, NULL, 13),
(359, 18, 58, NULL, 14),
(360, 18, 58, NULL, 15),
(361, 18, 58, NULL, 16),
(362, 18, 58, NULL, 17),
(363, 18, 58, NULL, 18),
(364, 18, 58, NULL, 19),
(365, 18, 58, NULL, 20),
(366, 18, 58, NULL, 21),
(367, 18, 58, NULL, 22),
(368, 18, 58, NULL, 23),
(369, 18, 58, NULL, 24),
(370, 18, 58, NULL, 25),
(371, 19, 58, NULL, 0),
(372, 19, 58, NULL, 1),
(373, 19, 58, NULL, 2),
(374, 19, 58, NULL, 3),
(375, 19, 58, NULL, 4),
(376, 19, 58, NULL, 5),
(377, 19, 58, NULL, 6),
(378, 19, 58, NULL, 7),
(379, 19, 58, NULL, 8),
(380, 19, 58, NULL, 9),
(381, 19, 58, NULL, 10),
(382, 19, 54, NULL, 11),
(383, 19, 50, NULL, 12),
(384, 19, 58, NULL, 13),
(385, 19, 1, NULL, 14),
(386, 19, 58, NULL, 15),
(387, 19, 58, NULL, 16),
(388, 19, 58, NULL, 17),
(389, 19, 58, NULL, 18),
(390, 19, 58, NULL, 19),
(391, 19, 58, NULL, 20),
(392, 19, 58, NULL, 21),
(393, 19, 58, NULL, 22),
(394, 19, 58, NULL, 23),
(395, 19, 58, NULL, 24),
(396, 19, 58, NULL, 25),
(397, 19, 58, NULL, 26),
(398, 19, 58, NULL, 27),
(399, 19, 58, NULL, 28),
(400, 19, 58, NULL, 29),
(401, 19, 58, NULL, 30),
(402, 19, 16, NULL, 31),
(403, 19, 58, NULL, 32),
(404, 19, 17, NULL, 33),
(405, 19, 58, NULL, 34),
(406, 19, 8, NULL, 35),
(407, 19, 58, NULL, 36),
(408, 19, 2, NULL, 37),
(409, 19, 58, NULL, 38),
(410, 19, 58, NULL, 39),
(411, 19, 58, NULL, 40),
(412, 19, 58, NULL, 41),
(413, 19, 58, NULL, 42),
(414, 19, 58, NULL, 43),
(415, 19, 14, NULL, 44),
(416, 19, 58, NULL, 45),
(417, 19, 58, NULL, 46),
(418, 19, 58, NULL, 47),
(419, 19, 58, NULL, 48),
(420, 19, 58, NULL, 49),
(421, 19, 58, NULL, 50),
(422, 19, 58, NULL, 51),
(423, 19, 58, NULL, 52),
(424, 19, 58, NULL, 53),
(425, 19, 58, NULL, 54),
(426, 19, 58, NULL, 55),
(427, 19, 58, NULL, 56),
(428, 19, 58, NULL, 57),
(429, 19, 58, NULL, 58),
(430, 20, 58, NULL, 0),
(431, 20, 58, NULL, 1),
(432, 20, 58, NULL, 2),
(433, 20, 58, NULL, 3),
(434, 20, 58, NULL, 4),
(435, 20, 58, NULL, 5),
(436, 20, 58, NULL, 6),
(437, 20, 58, NULL, 7),
(438, 20, 58, NULL, 8),
(439, 20, 58, NULL, 9),
(440, 20, 58, NULL, 10),
(441, 20, 58, NULL, 11),
(442, 20, 58, NULL, 12),
(443, 20, 58, NULL, 13),
(444, 20, 58, NULL, 14),
(445, 20, 45, NULL, 15),
(446, 20, 58, NULL, 16),
(447, 20, 58, NULL, 17),
(448, 20, 58, NULL, 18),
(449, 20, 58, NULL, 19),
(450, 20, 1, NULL, 20),
(451, 20, 58, NULL, 21),
(452, 20, 58, NULL, 22),
(453, 21, 45, NULL, 0),
(454, 21, 58, NULL, 1),
(455, 21, 58, NULL, 2),
(456, 21, 58, NULL, 3),
(457, 21, 58, NULL, 4),
(458, 21, 58, NULL, 5),
(459, 21, 58, NULL, 6),
(460, 21, 58, NULL, 7),
(461, 21, 58, NULL, 8),
(462, 21, 58, NULL, 9),
(463, 21, 45, NULL, 10),
(464, 21, 58, NULL, 11),
(465, 21, 58, NULL, 12),
(466, 21, 58, NULL, 13),
(467, 21, 58, NULL, 14),
(468, 21, 58, NULL, 15),
(469, 21, 58, NULL, 16),
(470, 21, 58, NULL, 17),
(471, 21, 58, NULL, 18),
(472, 21, 58, NULL, 19),
(473, 21, 58, NULL, 20),
(474, 21, 58, NULL, 21),
(475, 21, 58, NULL, 22),
(476, 21, 58, NULL, 23),
(477, 21, 58, NULL, 24),
(478, 21, 58, NULL, 25),
(479, 21, 58, NULL, 26),
(480, 21, 58, NULL, 27),
(481, 21, 16, NULL, 28),
(482, 21, 58, NULL, 29),
(483, 21, 58, NULL, 30),
(484, 21, 58, NULL, 31),
(485, 21, 1, NULL, 32),
(486, 21, 58, NULL, 33),
(487, 21, 58, NULL, 34),
(488, 21, 58, NULL, 35),
(489, 21, 58, NULL, 36),
(490, 22, 58, NULL, 0),
(491, 22, 58, NULL, 1),
(492, 22, 58, NULL, 2),
(493, 22, 58, NULL, 3),
(494, 22, 58, NULL, 4),
(495, 22, 58, NULL, 5),
(496, 22, 58, NULL, 6),
(497, 22, 58, NULL, 7),
(498, 22, 58, NULL, 8),
(499, 22, 58, NULL, 9),
(500, 22, 58, NULL, 10),
(501, 22, 58, NULL, 11),
(502, 22, 58, NULL, 12),
(503, 22, 58, NULL, 13),
(504, 22, 3, NULL, 14),
(505, 22, 58, NULL, 15),
(506, 22, 8, NULL, 16),
(507, 22, 58, NULL, 17),
(508, 22, 17, NULL, 18),
(509, 22, 58, NULL, 19),
(510, 22, 16, NULL, 20),
(511, 22, 14, NULL, 21),
(512, 22, 58, NULL, 22),
(513, 22, 58, NULL, 23),
(514, 22, 58, NULL, 24),
(515, 22, 58, NULL, 25),
(516, 22, 28, NULL, 26),
(517, 22, 58, NULL, 27),
(518, 22, 58, NULL, 28),
(519, 22, 16, NULL, 29),
(520, 22, 58, NULL, 30),
(521, 23, 58, NULL, 0),
(522, 23, 58, NULL, 1),
(523, 23, 58, NULL, 2),
(524, 23, 58, NULL, 3),
(525, 23, 33, NULL, 4),
(526, 23, 58, NULL, 5),
(527, 23, 50, NULL, 6),
(528, 23, 58, NULL, 7),
(529, 23, 1, NULL, 8),
(530, 23, 58, NULL, 9),
(531, 23, 58, NULL, 10),
(532, 23, 54, NULL, 11),
(533, 23, 58, NULL, 12),
(534, 23, 20, NULL, 13),
(535, 23, 58, NULL, 14),
(536, 23, 58, NULL, 15),
(537, 23, 58, NULL, 16),
(538, 23, 58, NULL, 17),
(539, 23, 58, NULL, 18),
(540, 23, 58, NULL, 19),
(541, 23, 58, NULL, 20),
(542, 23, 58, NULL, 21),
(543, 23, 58, NULL, 22),
(544, 23, 58, NULL, 23),
(545, 23, 14, NULL, 24),
(546, 23, 58, NULL, 25),
(547, 23, 58, NULL, 26),
(548, 23, 16, NULL, 27),
(549, 23, 58, NULL, 28),
(550, 23, 58, NULL, 29),
(551, 23, 33, NULL, 30),
(552, 23, 58, NULL, 31),
(553, 23, 50, NULL, 32),
(554, 23, 58, NULL, 33),
(555, 23, 1, NULL, 34),
(556, 23, 58, NULL, 35),
(557, 23, 58, NULL, 36),
(558, 23, 58, NULL, 37),
(559, 23, 58, NULL, 38),
(560, 23, 58, NULL, 39),
(561, 23, 58, NULL, 40),
(562, 24, 58, NULL, 0),
(563, 24, 58, NULL, 1),
(564, 24, 58, NULL, 2),
(565, 24, 58, NULL, 3),
(566, 24, 54, NULL, 4),
(567, 24, 58, NULL, 5),
(568, 24, 58, NULL, 6),
(569, 24, 16, NULL, 7),
(570, 24, 58, NULL, 8),
(571, 24, 58, NULL, 9),
(572, 24, 8, NULL, 10),
(573, 24, 17, NULL, 11),
(574, 24, 58, NULL, 12),
(575, 24, 16, NULL, 13),
(576, 24, 27, NULL, 14),
(577, 24, 58, NULL, 15),
(578, 24, 58, NULL, 16),
(579, 25, 58, NULL, 0),
(580, 25, 58, NULL, 1),
(581, 25, 58, NULL, 2),
(582, 25, 58, NULL, 3),
(583, 25, 58, NULL, 4),
(584, 25, 58, NULL, 5),
(585, 25, 58, NULL, 6),
(586, 25, 58, NULL, 7),
(587, 25, 58, NULL, 8),
(588, 25, 58, NULL, 9),
(589, 25, 58, NULL, 10),
(590, 25, 58, NULL, 11),
(591, 25, 58, NULL, 12),
(592, 25, 58, NULL, 13),
(593, 25, 58, NULL, 14),
(594, 25, 58, NULL, 15),
(595, 25, 58, NULL, 16),
(596, 25, 58, NULL, 17),
(597, 25, 58, NULL, 18),
(598, 25, 58, NULL, 19),
(599, 25, 58, NULL, 20),
(600, 25, 8, NULL, 21),
(601, 25, 58, NULL, 22),
(602, 25, 17, NULL, 23),
(603, 25, 58, NULL, 24),
(604, 25, 58, NULL, 25),
(605, 25, 58, NULL, 26),
(606, 25, 58, NULL, 27),
(607, 25, 58, NULL, 28),
(608, 26, 58, NULL, 0),
(609, 26, 45, NULL, 1),
(610, 26, 58, NULL, 2),
(611, 26, 58, NULL, 3),
(612, 26, 45, NULL, 4),
(613, 26, 45, NULL, 5),
(614, 26, 45, NULL, 6),
(615, 26, 58, NULL, 7),
(616, 26, 58, NULL, 8),
(617, 26, 58, NULL, 9),
(618, 26, 58, NULL, 10),
(619, 26, 58, NULL, 11),
(620, 26, 58, NULL, 12),
(621, 26, 58, NULL, 13),
(622, 26, 58, NULL, 14),
(623, 26, 7, NULL, 15),
(624, 26, 58, NULL, 16),
(625, 26, 58, NULL, 17),
(626, 27, 58, NULL, 0),
(627, 27, 45, NULL, 1),
(628, 27, 58, NULL, 2),
(629, 27, 58, NULL, 3),
(630, 27, 58, NULL, 4),
(631, 27, 45, NULL, 5),
(632, 27, 58, NULL, 6),
(633, 27, 58, NULL, 7),
(634, 27, 58, NULL, 8),
(635, 27, 58, NULL, 9),
(636, 27, 58, NULL, 10),
(637, 27, 58, NULL, 11),
(638, 27, 58, NULL, 12),
(639, 27, 58, NULL, 13),
(640, 27, 58, NULL, 14),
(641, 27, 58, NULL, 15),
(642, 27, 45, NULL, 16),
(643, 27, 58, NULL, 17),
(644, 27, 58, NULL, 18),
(645, 27, 58, NULL, 19),
(646, 28, 58, NULL, 0),
(647, 28, 58, NULL, 1),
(648, 28, 58, NULL, 2),
(649, 28, 58, NULL, 3),
(650, 28, 58, NULL, 4),
(651, 28, 58, NULL, 5),
(652, 28, 58, NULL, 6),
(653, 28, 58, NULL, 7),
(654, 28, 58, NULL, 8),
(655, 28, 58, NULL, 9),
(656, 28, 58, NULL, 10),
(657, 28, 58, NULL, 11),
(658, 28, 58, NULL, 12),
(659, 28, 58, NULL, 13),
(660, 28, 58, NULL, 14),
(661, 28, 58, NULL, 15),
(662, 28, 58, NULL, 16),
(663, 28, 58, NULL, 17),
(664, 28, 58, NULL, 18),
(665, 28, 58, NULL, 19),
(666, 28, 58, NULL, 20),
(667, 28, 58, NULL, 21),
(668, 28, 58, NULL, 22),
(669, 28, 58, NULL, 23),
(670, 28, 58, NULL, 24),
(671, 28, 58, NULL, 25),
(672, 28, 58, NULL, 26),
(673, 28, 58, NULL, 27),
(674, 28, 58, NULL, 28),
(675, 28, 58, NULL, 29),
(676, 28, 58, NULL, 30),
(677, 28, 58, NULL, 31),
(678, 28, 58, NULL, 32),
(679, 28, 58, NULL, 33),
(680, 28, 58, NULL, 34),
(681, 28, 58, NULL, 35),
(682, 28, 58, NULL, 36),
(683, 28, 58, NULL, 37),
(684, 28, 58, NULL, 38),
(685, 28, 58, NULL, 39),
(686, 28, 58, NULL, 40),
(687, 28, 58, NULL, 41),
(688, 28, 54, NULL, 42),
(689, 28, 58, NULL, 43),
(690, 28, 58, NULL, 44),
(691, 29, 45, NULL, 0),
(692, 29, 58, NULL, 1),
(693, 29, 58, NULL, 2),
(694, 29, 58, NULL, 3),
(695, 29, 58, NULL, 4),
(696, 29, 58, NULL, 5),
(697, 29, 58, NULL, 6),
(698, 29, 58, NULL, 7),
(699, 29, 58, NULL, 8),
(700, 29, 58, NULL, 9),
(701, 29, 45, NULL, 10),
(702, 29, 58, NULL, 11),
(703, 29, 58, NULL, 12),
(704, 29, 58, NULL, 13),
(705, 29, 58, NULL, 14),
(706, 29, 58, NULL, 15),
(707, 29, 58, NULL, 16),
(708, 29, 58, NULL, 17),
(709, 29, 58, NULL, 18),
(710, 29, 58, NULL, 19),
(711, 29, 58, NULL, 20),
(712, 29, 58, NULL, 21),
(713, 29, 58, NULL, 22),
(714, 29, 58, NULL, 23),
(715, 29, 58, NULL, 24),
(716, 29, 58, NULL, 25),
(717, 29, 58, NULL, 26),
(718, 29, 58, NULL, 27),
(719, 29, 16, NULL, 28),
(720, 29, 58, NULL, 29),
(721, 29, 58, NULL, 30),
(722, 29, 58, NULL, 31),
(723, 29, 1, NULL, 32),
(724, 29, 58, NULL, 33),
(725, 29, 58, NULL, 34),
(726, 29, 58, NULL, 35),
(727, 29, 58, NULL, 36),
(728, 30, 45, NULL, 0),
(729, 30, 58, NULL, 1),
(730, 30, 58, NULL, 2),
(731, 30, 58, NULL, 3),
(732, 30, 58, NULL, 4),
(733, 30, 58, NULL, 5),
(734, 30, 58, NULL, 6),
(735, 30, 58, NULL, 7),
(736, 30, 58, NULL, 8),
(737, 30, 58, NULL, 9),
(738, 30, 45, NULL, 10),
(739, 30, 58, NULL, 11),
(740, 30, 58, NULL, 12),
(741, 30, 58, NULL, 13),
(742, 30, 58, NULL, 14),
(743, 30, 58, NULL, 15),
(744, 30, 58, NULL, 16),
(745, 30, 58, NULL, 17),
(746, 30, 58, NULL, 18),
(747, 30, 58, NULL, 19),
(748, 30, 58, NULL, 20),
(749, 30, 58, NULL, 21),
(750, 30, 58, NULL, 22),
(751, 30, 58, NULL, 23),
(752, 30, 58, NULL, 24),
(753, 30, 58, NULL, 25),
(754, 30, 58, NULL, 26),
(755, 30, 58, NULL, 27),
(756, 30, 16, NULL, 28),
(757, 30, 58, NULL, 29),
(758, 30, 58, NULL, 30),
(759, 30, 58, NULL, 31),
(760, 30, 1, NULL, 32),
(761, 30, 58, NULL, 33),
(762, 30, 58, NULL, 34),
(763, 30, 58, NULL, 35),
(764, 30, 58, NULL, 36),
(765, 32, 1, NULL, 1),
(766, 33, 1, NULL, 1),
(767, 33, 3, NULL, 2),
(768, 33, 16, NULL, 3),
(769, 34, 3, NULL, 0),
(770, 34, 58, NULL, 1),
(771, 34, 16, NULL, 2),
(772, 34, 58, NULL, 3),
(773, 34, 8, NULL, 4),
(774, 34, 58, NULL, 5),
(775, 34, 17, NULL, 6),
(776, 34, 58, NULL, 7),
(777, 35, 58, NULL, 0),
(778, 35, 58, NULL, 1),
(779, 35, 58, NULL, 2),
(780, 35, 58, NULL, 3),
(781, 35, 58, NULL, 4),
(782, 35, 2, NULL, 5),
(783, 35, 58, NULL, 6),
(784, 35, 58, NULL, 7),
(785, 35, 58, NULL, 8),
(786, 35, 58, NULL, 9),
(787, 35, 58, NULL, 10),
(788, 35, 58, NULL, 11),
(789, 35, 58, NULL, 12),
(790, 35, 58, NULL, 13),
(791, 35, 58, NULL, 14),
(792, 35, 58, NULL, 15),
(793, 35, 58, NULL, 16),
(794, 35, 58, NULL, 17),
(795, 35, 58, NULL, 18),
(796, 35, 58, NULL, 19),
(797, 35, 54, NULL, 20),
(798, 35, 2, NULL, 21),
(799, 35, 58, NULL, 22),
(800, 35, 58, NULL, 23),
(801, 35, 8, NULL, 24),
(802, 35, 58, NULL, 25),
(803, 35, 16, NULL, 26),
(804, 36, 58, NULL, 0),
(805, 36, 58, NULL, 1),
(806, 36, 58, NULL, 2),
(807, 36, 58, NULL, 3),
(808, 36, 58, NULL, 4),
(809, 36, 58, NULL, 5),
(810, 36, 58, NULL, 6),
(811, 36, 58, NULL, 7),
(812, 36, 58, NULL, 8),
(813, 36, 58, NULL, 9),
(814, 36, 58, NULL, 10),
(815, 36, 58, NULL, 11),
(816, 36, 58, NULL, 12),
(817, 36, 48, NULL, 13),
(818, 36, 58, NULL, 14),
(819, 36, 58, NULL, 15),
(820, 36, 58, NULL, 16),
(821, 36, 58, NULL, 17),
(822, 36, 58, NULL, 18),
(823, 36, 58, NULL, 19),
(824, 36, 58, NULL, 20),
(825, 36, 58, NULL, 21),
(826, 36, 54, NULL, 22),
(827, 36, 58, NULL, 23),
(828, 36, 58, NULL, 24),
(829, 36, 16, NULL, 25),
(830, 36, 58, NULL, 26),
(831, 37, 58, NULL, 0),
(832, 37, 58, NULL, 1),
(833, 37, 58, NULL, 2),
(834, 37, 58, NULL, 3),
(835, 37, 58, NULL, 4),
(836, 37, 58, NULL, 5),
(837, 37, 3, NULL, 6),
(838, 37, 58, NULL, 7),
(839, 37, 58, NULL, 8),
(840, 37, 58, NULL, 9),
(841, 37, 58, NULL, 10),
(842, 37, 58, NULL, 11),
(843, 37, 58, NULL, 12),
(844, 37, 58, NULL, 13),
(845, 37, 58, NULL, 14),
(846, 37, 58, NULL, 15),
(847, 37, 58, NULL, 16),
(848, 37, 58, NULL, 17),
(849, 37, 58, NULL, 18),
(850, 37, 58, NULL, 19),
(851, 37, 58, NULL, 20),
(852, 37, 58, NULL, 21),
(853, 37, 58, NULL, 22),
(854, 37, 58, NULL, 23),
(855, 37, 58, NULL, 24),
(856, 37, 58, NULL, 25),
(857, 37, 58, NULL, 26),
(858, 37, 58, NULL, 27),
(859, 37, 58, NULL, 28),
(860, 38, 45, NULL, 0),
(861, 38, 45, NULL, 1),
(862, 38, 58, NULL, 2),
(863, 38, 58, NULL, 3),
(864, 38, 58, NULL, 4),
(865, 38, 58, NULL, 5),
(866, 38, 58, NULL, 6),
(867, 38, 58, NULL, 7),
(868, 38, 58, NULL, 8),
(869, 38, 58, NULL, 9),
(870, 38, 58, NULL, 10),
(871, 38, 45, NULL, 11),
(872, 38, 58, NULL, 12),
(873, 38, 58, NULL, 13),
(874, 38, 45, NULL, 14),
(875, 38, 58, NULL, 15),
(876, 38, 58, NULL, 16),
(877, 38, 58, NULL, 17),
(878, 38, 58, NULL, 18),
(879, 38, 45, NULL, 19),
(880, 38, 58, NULL, 20),
(881, 40, 57, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `match_notification`
--

DROP TABLE IF EXISTS `match_notification`;
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

DROP TABLE IF EXISTS `message`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `FK_receiver`, `FK_sender`, `message`, `date`, `been_read`, `been_deleted`, `subject`, `userImage`) VALUES
(6, 'ralon039@fiu.edu', 'GuestEmployer', 'PLEASE WORK FOR US\r\n\r\nRegards, \r\nRogelio', '2015-02-23 22:08:20', 1, 0, 'WE WANT YOU', '/JobFair/images/profileimages/user-default.png');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=831 ;

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
(830, 36, 52, '11:56:37', 0, 'rogemp001 just posted a new job: Python Developer. Click here to view the post. ', 'http://vjf-dev.cis.fiu.edu/JobFair/index.php/job/view/jobid/80', 1);

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

DROP TABLE IF EXISTS `resume`;
CREATE TABLE IF NOT EXISTS `resume` (
  `id` int(11) NOT NULL,
  `resume` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resume`
--

INSERT INTO `resume` (`id`, `resume`) VALUES
(34, '/JobFair/resumes/34-Rogelio Alonso Résumé.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `saved_queries`
--

DROP TABLE IF EXISTS `saved_queries`;
CREATE TABLE IF NOT EXISTS `saved_queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FK_userid` int(11) NOT NULL,
  `query_tag` varchar(25) NOT NULL,
  `query` text NOT NULL,
  `location` varchar(25) DEFAULT '',
  `active` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_userid` (`FK_userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `saved_queries`
--

INSERT INTO `saved_queries` (`id`, `FK_userid`, `query_tag`, `query`, `location`, `active`) VALUES
(6, 5, 'hello', '+java ', '', 0),
(7, 9, 'thequery', '+java ', '', 0),
(9, 1, 'test', '+java ', '', 0),
(10, 1, 'test1', '-programming ', '', 0),
(14, 1, 'test5', '+java +research ', '', 0),
(16, 3, '', '~school:Florida International University ', '', 0),
(19, 1, 'dev', '+Java +Php ', '', 0),
(20, 3, '', '~skills:java +programming ', '', 0),
(21, 12, '', '~skills:Javascript +php +iPhone Application Development ', '', 0),
(22, 3, '', '~city:Alaska ', '', 0),
(23, 12, '', '~city:Alaska ', '', 0),
(25, 12, '', '~position:Application Support Specialist ', '', 0),
(27, 12, '', '~experience:Manage ', '', 0),
(28, 12, '', '~skills:java ~school:Florida International University ~graduation:2014-10 ', '', 0),
(29, 12, '', '~ZIPcode:true ~major:Computer Science ', '', 0),
(31, 12, '', '~school:Florida International University ', '', 0),
(50, 24, 'Java', '+Java ', '', 0),
(51, 24, 'PHP', '+PHP ', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
CREATE TABLE IF NOT EXISTS `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email_string` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

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
(11, 'FIU', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skillset`
--

DROP TABLE IF EXISTS `skillset`;
CREATE TABLE IF NOT EXISTS `skillset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `FK_general_skills` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=83 ;

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
(82, 'ORACLE', 0);

-- --------------------------------------------------------

--
-- Table structure for table `SMS`
--

DROP TABLE IF EXISTS `SMS`;
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

DROP TABLE IF EXISTS `student_skill_map`;
CREATE TABLE IF NOT EXISTS `student_skill_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `skillid` int(11) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_skillid` (`skillid`),
  KEY `idx_userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=194 ;

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
(79, 1, 1, NULL, 1),
(80, 1, 40, NULL, 2),
(81, 1, 6, NULL, 3),
(82, 1, 3, NULL, 4),
(83, 1, 16, NULL, 5),
(103, 20, 3, NULL, 1),
(104, 20, 1, NULL, 2),
(105, 20, 16, NULL, 3),
(106, 20, 27, NULL, 4),
(107, 20, 17, NULL, 5),
(108, 20, 69, NULL, 6),
(109, 20, 70, NULL, 7),
(110, 20, 62, NULL, 8),
(111, 20, 20, NULL, 9),
(112, 20, 14, NULL, 10),
(113, 20, 71, NULL, 11),
(114, 20, 8, NULL, 12),
(115, 20, 72, NULL, 13),
(116, 20, 29, NULL, 14),
(117, 20, 73, NULL, 15),
(118, 20, 74, NULL, 16),
(119, 20, 75, NULL, 17),
(120, 20, 76, NULL, 18),
(121, 20, 77, NULL, 19),
(122, 20, 28, NULL, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migration`
--

DROP TABLE IF EXISTS `tbl_migration`;
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

DROP TABLE IF EXISTS `user`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `FK_usertype`, `email`, `registration_date`, `activation_string`, `activated`, `image_url`, `first_name`, `last_name`, `disable`, `has_viewed_profile`, `linkedinid`, `googleid`, `fiucsid`, `hide_email`, `job_notification`, `fiu_account_id`, `looking_for_job`, `job_int_date`) VALUES
(1, 'student1', '$2a$08$uIjjONcbol5mPr0sa.kzY.6JWHRU3GoKmhKUNzjNaA./oQEfFzmpy', 1, 'student1@mail.com', '2014-06-10 06:57:27', '', 1, '/JobFair/images/profileimages/user-default.png', 'Student', 'Seven', 0, 1, NULL, NULL, NULL, NULL, 0, NULL, 1, 5),
(2, 'admin', '$2a$08$uIjjONcbol5mPr0sa.kzY.6JWHRU3GoKmhKUNzjNaA./oQEfFzmpy', 3, 'admin@mail.com', '2014-06-10 06:57:27', '', 1, '/JobFair/images/profileimages/user-default.png', 'Admin', 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(3, 'employer1', '$2a$08$8lGICd9kmq7vnjBaTM6HzOlRVzmzuvDxjkxHNSd7IyU9KRJfEUkry', 2, 'employer1@mail.com', '2014-06-10 07:12:37', '', 1, '/JobFair/images/profileimages/user-default.png', 'Employer', 'One', 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 5),
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
(20, 'ralon039@fiu.edu', '$2a$08$/F8EKwvHlFYv6dUpKfsfVODMykVnjGKOijLuOvDiSYu214.09naSu', 1, 'ralon039@fiu.edu', '2015-01-27 12:24:42', '', 1, 'https://media.licdn.com/mpr/mprx/0_tJlIhCuqeaTjXONvvd1Lhi8n2SxxLpZvvSfQ6iKsTJOyTjoRcdrFkdA8HLA', 'Rogelio', 'Alonso', 0, 1, NULL, NULL, NULL, NULL, 1, '111259815576282894477', 1, 0),
(22, 'jtrav029@fiu.edu', '$2a$08$igvNQYv.yFI.3JrqELQXte2srqEr0sytDBPrfaNLQpkSRZCO/G9di', 1, 'jtrav029@fiu.edu', '2015-02-01 04:43:13', 'fiu', 1, 'https://lh3.googleusercontent.com/-xjXKxJLmagc/AAAAAAAAAAI/AAAAAAAAACI/8JbHCPrKBYM/photo.jpg', 'Jorge', 'Travieso', 0, NULL, NULL, NULL, NULL, NULL, 1, '116231147857551021368', 1, 0),
(23, 'GuestStudent', '$2a$08$8PspUXq1ggIuTn8.92.qG.rbCwv55mh9irvpfrQY2JiWy4r44k6Pe', 4, 'gueststudent@cs.fiu.edu', '2015-02-07 16:51:19', 'h6c5hy7r70', 1, '/JobFair/images/profileimages/user-default.png', 'Guest', 'Student', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0),
(24, 'GuestEmployer', '$2a$08$gWRjrpq9Xsd.XJmuWWc9.Ot/S/iP3MkrcyYewl7BXaknLNQupxKA6', 5, 'guestemployer@cs.fiu.edu', '2015-02-05 22:47:06', 'yekce5xo6s', 1, '/JobFair/images/profileimages/user-default.png', 'Guest', 'Employer', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 0),
(26, 'sadjadis@gmail.com', '$2a$08$czIQv8g6mh2xH/m/UlpPFOfJv1ksBHaFA4XIe1XgEcGtZ3/HvYy4W', 1, 'sadjadis@gmail.com', '2015-02-18 09:19:11', 'google', 1, 'https://lh3.googleusercontent.com/-QnmiMU0SQEQ/AAAAAAAAAAI/AAAAAAAAMtw/6TS6oscVgj8/photo.jpg', 'Masoud', 'Sadjadi', 0, NULL, NULL, '110291442056614091691', NULL, NULL, 1, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
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

DROP TABLE IF EXISTS `user_document`;
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

DROP TABLE IF EXISTS `video_interview`;
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

DROP TABLE IF EXISTS `video_resume`;
CREATE TABLE IF NOT EXISTS `video_resume` (
  `id` int(11) NOT NULL,
  `video_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_resume`
--

INSERT INTO `video_resume` (`id`, `video_path`) VALUES
(34, '/JobFair/resumes/v34-');

-- --------------------------------------------------------

--
-- Table structure for table `whiteboard_sessions`
--

DROP TABLE IF EXISTS `whiteboard_sessions`;
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
