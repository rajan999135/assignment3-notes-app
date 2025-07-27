-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql202.infinityfree.com
-- Generation Time: Jul 27, 2025 at 03:49 PM
-- Server version: 11.4.7-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_39396420_notes_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_control`
--

CREATE TABLE `access_control` (
  `owner_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `viewer_id` int(11) NOT NULL,
  `access_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `access_control`
--

INSERT INTO `access_control` (`owner_id`, `topic_id`, `viewer_id`, `access_status`) VALUES
(36, 20, 35, 1),
(37, 21, 35, 1),
(37, 21, 36, 1),
(38, 22, 37, 1),
(38, 22, 39, 1),
(39, 23, 35, 1),
(39, 23, 36, 1),
(39, 23, 37, 1),
(39, 23, 38, 1),
(39, 54, 46, 1),
(44, 35, 45, 1),
(45, 36, 35, 1),
(45, 36, 36, 1),
(45, 36, 37, 1),
(46, 53, 39, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Courses`
--

CREATE TABLE `Courses` (
  `course_ID` int(11) NOT NULL,
  `course_Name` varchar(30) NOT NULL,
  `course_Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Courses`
--

INSERT INTO `Courses` (`course_ID`, `course_Name`, `course_Description`) VALUES
(1, 'CS100', 'Introduction to Computers'),
(2, 'CS110', 'Programming and Problem Solving'),
(3, 'CS210', 'Data Structures and Abstractions'),
(4, 'CS215', 'Web and Database Programming'),
(8, 'Demo', 'demo of lab'),
(9, 'Demo', 'demo of lab'),
(10, 'Demo', 'demo of lab'),
(11, 'Demo', 'demo of lab'),
(12, 'Demo', 'demo of lab'),
(13, 'Demo', 'demo of lab');

-- --------------------------------------------------------

--
-- Table structure for table `demotable`
--

CREATE TABLE `demotable` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(30) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `demotable`
--

INSERT INTO `demotable` (`user_id`, `email`, `password`, `dob`) VALUES
(1, 'rajan@ehncanada.com', '@Sonia7860', '2001-02-02'),
(2, 'fdknfsdn@gmail.com', 'dfsdfd', '1969-12-31'),
(3, 'rajannanda@gmail.com', '@rajan', '1969-12-31'),
(4, 'rajannanda@gmail.com', '@rajan786', '2005-01-01'),
(5, 'rajannanda@gmail.com', 'rajan786', '2005-01-01'),
(6, 'sajannanda@gmail.com', 'rajan786', '2005-01-01'),
(7, 'sajannanda@gmail.com', 'rajan786', '2005-01-01'),
(8, 'sajannanda@gmail.com', 'rajan786', '2005-01-01'),
(9, 'sajannanda@gmail.com', 'rajan786', '2005-01-01'),
(10, 'sajannanda@gmail.com', 'rajan786', '2005-01-01'),
(11, 'pajannanda@gmail.com', 'rajan786', '2005-01-01'),
(12, 'jajannanda@gmail.com', 'rajan786', '2005-01-01'),
(13, 'sanjeev@gmail.com', 'sanjeev786', '2005-01-01'),
(14, 'sanjeev@gmail.com', 'Sanjeev7860', '2005-01-01'),
(15, 'sanjeev@gmail.com', 'Sanjeev7860', '2005-01-01'),
(16, 'sanjeev@gmail.com', '@Sanjeev7860', '2005-01-01'),
(17, 'sanjeev@gmail.com', '@Sanjeev7860', '2005-01-01'),
(18, 'sanjeev@gmail.com', '@Sanjeev7860', '2005-01-01'),
(19, 'sanjeev@gmail.com', '@Sanjeev7860', '2005-01-01'),
(20, 'sanjeev@gmail.com', '@Sanjeev7860', '2005-01-01'),
(21, 'sanjeev@gmail.com', '@Sanjeev7860', '2005-01-01'),
(22, 'sanjeev@gmail.com', '@Sanjeev7860', '2005-01-01'),
(23, 'sanjeev@gmail.com', 'sanjeev', '2005-01-01'),
(24, 'sanjeev@gmail.com', 'sanjeev', '2005-01-01'),
(25, 'sanjeev@gmail.com', 'sanjeev', '2005-01-01'),
(26, 'sanjeev@gmail.com', 'sanjeev', '2005-01-01'),
(27, 'sanjeev@gmail.com', 'sanjeevfdsklfd', '2005-01-01'),
(28, 'sanjeev@gmail.com', 'sanjeevfdsklfd', '2005-01-01'),
(29, 'sanjeev@gmail.com', 'sanjeevfdsklfd', '2005-01-01'),
(30, 'sanjeev@gmail.com', 'sanjeevfdsklfd', '2005-01-01'),
(31, 'sanjeev@gmail.com', 'rajan@34', '2005-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `notes_id` int(11) NOT NULL,
  `note_decription` text NOT NULL,
  `creation_date` timestamp NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `word_count` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`notes_id`, `note_decription`, `creation_date`, `user_id`, `topic_id`, `word_count`, `created_at`) VALUES
(20, 'physic is really interesting subject for me.', '2025-07-18 19:06:03', 37, 21, 7, '2025-07-18 22:06:03'),
(21, 'this is intro to data of this world.', '2025-07-18 19:09:27', 38, 22, 8, '2025-07-18 22:09:27'),
(22, 'The purpose of this guide is to provide an overview of the basic structural components of living cells. In reviewing these structures, we will also discuss their functions.\n\nAll living organisms are composed of cells. A cell is a small, membrane-bound compartment that contains all the chemicals and molecules that help support an organism\'s life. An understanding of the structure of cells is one of the first steps in comprehending the complex cellular interactions that direct and produce life.', '2025-07-20 08:52:11', 39, 23, 79, '2025-07-20 11:52:11'),
(23, 'welcome to java', '2025-07-20 09:17:17', 40, 24, 3, '2025-07-20 12:17:17'),
(24, 'Sure! Here\'s a well-researched and clearly written **2000-word essay on â€œIntroduction to Fitness.â€** This can be used as a comprehensive note or as part of an assignment.\n\n---\n\n# **Introduction to Fitness**\n\n## **1. What Is Fitness?**\n\nFitness is generally defined as the ability to perform daily tasks with vigor and alertness, without undue fatigue, and with ample energy to enjoy leisure-time pursuits and meet unforeseen emergencies. It is a state of health and well-being that results from regular physical activity, proper nutrition, and adequate rest.', '2025-07-26 22:10:27', 41, 25, 83, '2025-07-27 01:10:27'),
(25, '6. Types of Medications\n\nType	Function\nAntibiotics	Kill or stop growth of bacteria\nAnalgesics	Pain relievers (e.g., paracetamol, ibuprofen)\nAntipyretics	Reduce fever\nAntihypertensives	Lower blood pressure\nDiuretics	Remove excess fluid from body', '2025-07-27 00:01:59', 42, 26, 32, '2025-07-27 03:02:00'),
(26, 'JavaScript Short Notes\n\n1. What is JavaScript?\nJavaScript is a high-level, interpreted programming language used to make websites interactive. It runs in the browser and can modify HTML, CSS, and handle events.\n\n2. Data Types\nString â†’ \"Hello\"\nNumber â†’ 42, 3.14\nBoolean â†’ true, false\nUndefined â†’ declared but not assigned\nNull â†’ intentionally empty\nObject â†’ { name: \"Yuvraj\" }\nArray â†’ [1, 2, 3]', '2025-07-27 00:11:03', 43, 27, 51, '2025-07-27 03:11:03'),
(27, 'Self-study is the process of learning independently without direct supervision. It builds discipline, confidence, and a deeper understanding of subjects. By setting personal goals and using resources like books, videos, and online tools, students develop critical thinking and problem-solving skills, preparing them for lifelong learning and real-world challenges.', '2025-07-27 00:19:57', 44, 28, 48, '2025-07-27 03:19:57'),
(28, 'General science explores the basic principles of the natural world, including physics, chemistry, biology, and earth science. It helps us understand how things workâ€”from atoms to ecosystems. By observing, experimenting, and questioning, science improves our daily lives, advances technology, and solves real-world problems through evidence-based understanding and discovery.', '2025-07-27 00:35:45', 44, 29, 49, '2025-07-27 03:35:45'),
(29, 'Self-awareness is the ability to recognize and understand your own thoughts, emotions, and behaviors. It helps individuals reflect on their strengths and weaknesses, make better decisions, and improve relationships. By being mindful of oneâ€™s actions and feelings, people can grow personally and adapt positively to lifeâ€™s challenges and experiences.', '2025-07-27 00:39:53', 44, 30, 51, '2025-07-27 03:39:53'),
(30, 'Workload** refers to the amount of tasks or responsibilities assigned to an individual or group within a specific time. Managing workload effectively is essential for productivity, reducing stress, and maintaining work-life balance. Proper planning, delegation, and time management help individuals handle workload efficiently and avoid burnout or performance decline.\n\nWould you like this added as a note entry in your system?', '2025-07-27 00:46:50', 44, 31, 61, '2025-07-27 03:46:50'),
(31, 'I am really chill guy.', '2025-07-27 00:50:05', 44, 32, 5, '2025-07-27 03:50:05'),
(32, 'you are also.', '2025-07-27 00:50:29', 44, 32, 3, '2025-07-27 03:50:29'),
(33, 'no one else.', '2025-07-27 00:51:28', 44, 32, 3, '2025-07-27 03:51:28'),
(34, 'A car is made up of various essential parts that work together to ensure smooth operation. Key components include the engine, transmission, brakes, suspension, battery, and tires. Each part plays a specific role, from powering the vehicle to ensuring safety and comfort while driving. Understanding these parts aids in maintenance.', '2025-07-27 15:02:18', 44, 33, 50, '2025-07-27 18:02:18'),
(35, 'Modern cars are advanced vehicles equipped with cutting-edge technology for improved safety, efficiency, and comfort. They feature computerized systems, fuel-efficient engines, automatic braking, GPS navigation, and smart infotainment. Many models now include hybrid or electric powertrains, lane assist, and parking sensors, making driving easier and more environmentally friendly.', '2025-07-27 15:04:10', 44, 34, 48, '2025-07-27 18:04:10'),
(36, 'Old cars, often referred to as classic or vintage cars, are vehicles typically built several decades ago. They showcase unique designs, mechanical simplicity, and nostalgic charm. Unlike modern cars, old cars lack advanced technology but are valued for their craftsmanship, historical significance, and collector appeal among enthusiasts.', '2025-07-27 15:09:53', 44, 35, 47, '2025-07-27 18:09:53'),
(37, 'kdljfds fksdl dfdsl dfjlsdk fslkfd fdkl dklsd f', '2025-07-27 15:51:36', 45, 36, 8, '2025-07-27 18:51:36'),
(38, 'fkshdf sdiofjsdhf dfjksdnf jfskd f', '2025-07-27 15:51:43', 45, 36, 5, '2025-07-27 18:51:43'),
(39, 'intro to outside this world.', '2025-07-27 16:48:28', 38, 22, 5, '2025-07-27 19:48:28'),
(40, 'how you can solve concern of terrorism in this world.', '2025-07-27 16:50:04', 46, 37, 10, '2025-07-27 19:50:04'),
(41, 'intro to terrorism in asia.', '2025-07-27 17:01:05', 46, 37, 5, '2025-07-27 20:01:05'),
(42, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:00', 46, 38, 50, '2025-07-27 20:09:00'),
(43, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:02', 46, 38, 50, '2025-07-27 20:09:02'),
(44, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:02', 46, 38, 50, '2025-07-27 20:09:02'),
(45, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:03', 46, 38, 50, '2025-07-27 20:09:02'),
(46, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:03', 46, 38, 50, '2025-07-27 20:09:02'),
(47, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:04', 46, 38, 50, '2025-07-27 20:09:04'),
(48, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:05', 46, 38, 50, '2025-07-27 20:09:04'),
(49, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:05', 46, 38, 50, '2025-07-27 20:09:04'),
(50, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:05', 46, 38, 50, '2025-07-27 20:09:05'),
(51, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:05', 46, 38, 50, '2025-07-27 20:09:05'),
(52, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:05', 46, 38, 50, '2025-07-27 20:09:05'),
(53, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:09', 46, 38, 50, '2025-07-27 20:09:08'),
(54, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:09', 46, 38, 50, '2025-07-27 20:09:08'),
(55, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:09', 46, 38, 50, '2025-07-27 20:09:09'),
(56, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:09', 46, 38, 50, '2025-07-27 20:09:09'),
(57, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:09', 46, 38, 50, '2025-07-27 20:09:09'),
(58, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:10', 46, 38, 50, '2025-07-27 20:09:09'),
(59, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:10', 46, 38, 50, '2025-07-27 20:09:09'),
(60, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:10', 46, 38, 50, '2025-07-27 20:09:10'),
(61, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:10', 46, 38, 50, '2025-07-27 20:09:10'),
(62, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:11', 46, 38, 50, '2025-07-27 20:09:10'),
(63, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:11', 46, 38, 50, '2025-07-27 20:09:10'),
(64, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:11', 46, 38, 50, '2025-07-27 20:09:10'),
(65, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:11', 46, 38, 50, '2025-07-27 20:09:11'),
(66, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:12', 46, 38, 50, '2025-07-27 20:09:11'),
(67, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:12', 46, 38, 50, '2025-07-27 20:09:12'),
(68, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:13', 46, 38, 50, '2025-07-27 20:09:12'),
(69, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:18', 46, 38, 50, '2025-07-27 20:09:17'),
(70, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:18', 46, 38, 50, '2025-07-27 20:09:18'),
(71, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:18', 46, 38, 50, '2025-07-27 20:09:18'),
(72, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:18', 46, 38, 50, '2025-07-27 20:09:18'),
(73, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:19', 46, 38, 50, '2025-07-27 20:09:18'),
(74, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:19', 46, 38, 50, '2025-07-27 20:09:18'),
(75, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:09:19', 46, 38, 50, '2025-07-27 20:09:19'),
(76, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:11:35', 46, 38, 50, '2025-07-27 20:11:34'),
(77, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:11:35', 46, 38, 50, '2025-07-27 20:11:35'),
(78, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:11:35', 46, 38, 50, '2025-07-27 20:11:35'),
(79, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:11:36', 46, 38, 50, '2025-07-27 20:11:35'),
(80, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:11:36', 46, 38, 50, '2025-07-27 20:11:35'),
(81, 'General science is the study of basic scientific concepts that explain the natural world. It includes core subjects like physics, chemistry, biology, and earth science. These areas help us understand matter, energy, life processes, and the environment. General science builds a foundation for exploring advanced scientific knowledge and everyday phenomena.', '2025-07-27 17:11:55', 46, 38, 50, '2025-07-27 17:11:55'),
(82, 'Hereâ€™s a 50-word note on **Self-Love**:\n\n> Self-love means accepting, valuing, and caring for yourself without judgment. It involves recognizing your worth, setting healthy boundaries, and prioritizing your well-being. Practicing self-love builds confidence, reduces stress, and fosters emotional resilience. It empowers individuals to make positive choices and maintain healthy relationships with themselves and others.', '2025-07-27 17:21:04', 46, 39, 54, '2025-07-27 17:21:04'),
(83, 'Hereâ€™s a 50-word note on **Self-Awareness**:\n\n> Self-awareness is the ability to understand your own thoughts, emotions, and behaviors. It allows you to recognize your strengths and weaknesses, reflect on your actions, and make better decisions. Being self-aware helps improve relationships, boosts confidence, and supports personal growth by fostering mindfulness and emotional intelligence in everyday life.', '2025-07-27 17:23:58', 46, 40, 56, '2025-07-27 17:23:58'),
(84, 'intro to world', '2025-07-27 17:26:28', 46, 41, 3, '2025-07-27 17:26:28'),
(85, 'Hereâ€™s a **50-word note** on **\"Intro to Machines\"** that you can use in your notes app:\n\n---\n\n**Intro to Machines:**\nMachines are devices that help make work easier by applying force, changing its direction, or increasing efficiency. They include simple tools like levers and pulleys, and complex ones like engines and computers. Machines are essential in daily life, industry, and technology, transforming energy into useful mechanical tasks.\n\n---\n\nLet me know if you want it in a different tone (e.g., technical, student-friendly, or more concise).', '2025-07-27 17:30:11', 46, 42, 87, '2025-07-27 17:30:11'),
(86, 'Physical education (PE) promotes physical fitness, motor skills, teamwork, and overall well-being through structured activities and sports. It helps students stay active, develop discipline, reduce stress, and build healthy habits. PE also encourages social interaction and teaches the importance of a balanced lifestyle for long-term physical and mental health.', '2025-07-27 17:32:32', 46, 43, 49, '2025-07-27 17:32:32'),
(87, 'physics is imagination', '2025-07-27 17:35:16', 46, 44, 3, '2025-07-27 17:35:16'),
(88, 'data data', '2025-07-27 17:37:43', 46, 45, 2, '2025-07-27 17:37:43'),
(89, 'no notes created yet', '2025-07-27 17:45:20', 46, 46, 4, '2025-07-27 17:45:20'),
(90, 'police', '2025-07-27 17:53:19', 39, 47, 1, '2025-07-27 17:53:19'),
(91, 'jnhvbh hvh hjn', '2025-07-27 17:54:03', 39, 47, 3, '2025-07-27 17:54:03'),
(92, 'God is often understood as the supreme being, creator, and ruler of the universe in many religions. Beliefs about God vary: some view God as personal and involved in the world, while others see God as a spiritual force or universal presence. God is associated with qualities like omnipotence, wisdom, love, and justice.', '2025-07-27 18:01:01', 46, 48, 53, '2025-07-27 18:01:01'),
(93, 'oikkbjkbkkjn', '2025-07-27 18:07:19', 46, 49, 1, '2025-07-27 18:07:19'),
(94, 'kjbj mbbjmn bn nm m', '2025-07-27 18:10:45', 46, 49, 5, '2025-07-27 18:10:45'),
(95, 'kwehndew eldken l ffds', '2025-07-27 18:15:54', 46, 49, 4, '2025-07-27 18:15:54'),
(96, 'dfkjsjdfn sdkfd sdkfjn sfdksjnc kjsdj', '2025-07-27 18:16:15', 46, 50, 5, '2025-07-27 18:16:15'),
(97, 'study hard', '2025-07-27 18:18:17', 46, 51, 2, '2025-07-27 18:18:17'),
(98, 'intro to web dev', '2025-07-27 18:56:24', 39, 52, 4, '2025-07-27 18:56:24'),
(99, 'study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study hard study ha', '2025-07-27 19:07:05', 46, 51, 168, '2025-07-27 19:07:05'),
(100, 'self disc', '2025-07-27 19:07:45', 46, 53, 2, '2025-07-27 19:07:45'),
(101, 'Mountains are majestic landforms that rise significantly above the surrounding terrain, often forming breathtaking peaks and ridges. Created by tectonic forces or volcanic activity over millions of years, they shape the geography of continents and influence weather patterns. From the towering Himalayas in Asia to the rugged Rockies in North America, mountains are home to diverse ecosystems, supporting unique plants and wildlife adapted to high altitudes. They offer fresh water through glaciers and rivers, making them crucial to life downstream. For humans, mountains symbolize strength, endurance, and challenge. They attract adventurers, hikers, and climbers seeking inspiration and thrill. Indigenous cultures often consider them sacred, weaving stories and spiritual meaning into their towering silhouettes. While awe-inspiring, mountain environments can also be harsh and unpredictable, demanding respect and preparation. As climate change threatens glaciers and biodiversity, protecting mountain regions becomes more important than everâ€”for nature, for people, and for the planet.', '2025-07-27 19:09:11', 46, 53, 150, '2025-07-27 19:09:11'),
(102, 'Mountains are majestic landforms that rise significantly above the surrounding terrain, often forming breathtaking peaks and ridges. Created by tectonic forces or volcanic activity over millions of years, they shape the geography of continents and influence weather patterns. From the towering Himalayas in Asia to the rugged Rockies in North America, mountains are home to diverse ecosystems, supporting unique plants and wildlife adapted to high altitudes. They offer fresh water through glaciers and rivers, making them crucial to life downstream. For humans, mountains symbolize strength, endurance, and challenge. They attract adventurers, hikers, and climbers seeking inspiration and thrill. Indigenous cultures often consider them sacred, weaving stories and spiritual meaning into their towering silhouettes. While awe-inspiring, mountain environments can also be harsh and unpredictable, demanding respect and preparation. As climate change threatens glaciers and biodiversity, protecting mountain regions becomes more important than everâ€”for nature, for people, and for the planet.', '2025-07-27 19:09:45', 39, 54, 150, '2025-07-27 19:09:45'),
(103, 'self dissss', '2025-07-27 19:10:22', 39, 55, 2, '2025-07-27 19:10:22'),
(104, 'sdkfsdnjn skfjsdnk sdkf sds dfkdsj kdjlkjsdl ldskljlsdj lvdslkjfldslj ldjljldsj dslflsdjlfj d', '2025-07-27 19:11:27', 39, 53, 11, '2025-07-27 19:11:27'),
(105, 'skjfsdn sdkjfsdj dsjkfnf sdkjsdf sdkkjfdn cskjd ds djkn sdkf dk sfcjd', '2025-07-27 19:12:50', 46, 54, 11, '2025-07-27 19:12:50'),
(106, 'Jsjejdndhjdjdjd', '2025-07-27 19:14:26', 38, 23, 1, '2025-07-27 19:14:26');

-- --------------------------------------------------------

--
-- Table structure for table `Student_Info`
--

CREATE TABLE `Student_Info` (
  `student_ID` int(11) NOT NULL,
  `first_Name` varchar(30) NOT NULL,
  `middle_Name` varchar(30) DEFAULT NULL,
  `last_Name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Student_Info`
--

INSERT INTO `Student_Info` (`student_ID`, `first_Name`, `middle_Name`, `last_Name`, `email`) VALUES
(200266200, 'Ahmed', 'Al', 'Abbad', 'alabba200@cs.uregina.ca'),
(200266202, 'Qaswar', '', 'Rai', 'ali202@cs.uregina.ca'),
(200266203, 'Nicholas', '', 'Phongsavath', 'phosan203@cs.uregina.ca'),
(200266204, 'Nikki', '', 'Pawlowski', 'pawlow204@cs.uregina.ca'),
(200266205, 'Nathan', '', 'Ellis', 'elli205@cs.uregina.ca'),
(200266206, 'John', '', 'Erick', 'eric20j206@cs.uregina.ca'),
(200266207, 'Jody-Lee', 'Van', 'DerVelden', 'vanervj207@cs.uregina.ca'),
(200266208, 'Sabrina ', '', 'Tram', 'tra200s208@cs.uregina.ca'),
(200266209, 'Ke', '', 'Tao', 'taoke209@cs.uregina.ca'),
(200266210, 'Yupeng', '', 'Xu', 'x210@cs.uregina.ca'),
(200266211, 'Chidinma', '', 'Ukabam', 'ukaba211@cs.uregina.ca'),
(200266212, 'Mandeep', '', 'Ghotra', 'gho212@cs.uregina.ca');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topic_id` int(11) NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `last_updation` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `topic_name`, `created_at`, `user_id`, `last_updation`) VALUES
(19, 'Introduction of Games importance in daily life', '2025-07-04 23:14:07', 35, '2025-07-04 23:14:07'),
(20, 'Introduction to programming language Concept.', '2025-07-04 23:15:08', 36, '2025-07-04 23:15:08'),
(21, 'intro to physics', '2025-07-18 22:05:26', 37, '2025-07-18 22:05:26'),
(22, 'intro to data sets', '2025-07-18 22:09:10', 38, '2025-07-18 22:09:10'),
(23, 'welcome to biology', '2025-07-20 11:44:48', 39, '2025-07-20 11:44:48'),
(24, 'welcome to java code', '2025-07-20 12:05:13', 40, '2025-07-20 12:05:13'),
(25, 'Introduction to fitness exercise.', '2025-07-27 01:00:38', 41, '2025-07-27 01:00:38'),
(26, 'intro to mental health.', '2025-07-27 02:58:16', 42, '2025-07-27 02:58:16'),
(27, 'introduction of javascript.', '2025-07-27 03:10:23', 43, '2025-07-27 03:10:23'),
(28, 'self study', '2025-07-27 03:19:21', 44, '2025-07-27 03:19:21'),
(29, 'intro to general science', '2025-07-27 03:35:09', 44, '2025-07-27 03:35:09'),
(30, 'self awareness', '2025-07-27 03:39:25', 44, '2025-07-27 03:39:25'),
(31, 'work load', '2025-07-27 03:46:24', 44, '2025-07-27 03:46:24'),
(32, 'intro to myself', '2025-07-27 03:49:45', 44, '2025-07-27 03:49:45'),
(33, 'Introduction to cars parts', '2025-07-27 18:01:39', 44, '2025-07-27 18:01:39'),
(34, 'Intro to modern cars', '2025-07-27 18:03:49', 44, '2025-07-27 18:03:49'),
(35, 'Intro to old cars.', '2025-07-27 18:09:33', 44, '2025-07-27 18:09:33'),
(36, 'intro to graphic design.', '2025-07-27 18:51:08', 45, '2025-07-27 18:51:08'),
(37, 'intro to terrorism', '2025-07-27 19:49:32', 46, '2025-07-27 19:49:32'),
(38, 'Intro to general science', '2025-07-27 20:08:32', 46, '2025-07-27 20:08:32'),
(39, 'self love', '2025-07-27 20:20:38', 46, '2025-07-27 20:20:38'),
(40, 'self awarness', '2025-07-27 20:23:37', 46, '2025-07-27 20:23:37'),
(41, 'intro to world', '2025-07-27 20:26:18', 46, '2025-07-27 20:26:18'),
(42, 'intro to machines', '2025-07-27 20:29:44', 46, '2025-07-27 20:29:44'),
(43, 'intro to physical education', '2025-07-27 20:32:08', 46, '2025-07-27 20:32:08'),
(44, 'intro to physics', '2025-07-27 20:35:03', 46, '2025-07-27 20:35:03'),
(45, 'data science', '2025-07-27 20:37:35', 46, '2025-07-27 20:37:35'),
(46, 'create the topic you eant', '2025-07-27 20:45:06', 46, '2025-07-27 20:45:06'),
(47, 'intro to police', '2025-07-27 20:53:11', 39, '2025-07-27 20:53:11'),
(48, 'intro to god', '2025-07-27 21:00:14', 46, '2025-07-27 21:00:14'),
(49, 'phopnes', '2025-07-27 21:07:05', 46, '2025-07-27 21:07:05'),
(50, 'self discusiion', '2025-07-27 21:16:07', 46, '2025-07-27 21:16:07'),
(51, 'study', '2025-07-27 21:18:09', 46, '2025-07-27 21:18:09'),
(52, 'welcome home', '2025-07-27 21:24:01', 39, '2025-07-27 21:24:01'),
(53, 'self disc', '2025-07-27 22:07:36', 46, '2025-07-27 22:07:36'),
(54, 'welcome to mountain', '2025-07-27 22:08:29', 39, '2025-07-27 22:08:29'),
(55, 'self disciplane', '2025-07-27 22:10:14', 39, '2025-07-27 22:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `users_access`
--

CREATE TABLE `users_access` (
  `access_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `users_info`
--

CREATE TABLE `users_info` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `screen_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar_image` varchar(255) DEFAULT NULL,
  `access_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users_info`
--

INSERT INTO `users_info` (`user_id`, `email`, `screen_name`, `password`, `avatar_image`, `access_status`) VALUES
(35, 'rajannanda786@gmail.com', 'rajan786', '$2y$10$SilfXA0Wl8iTq7GMXe58teZs1mbGr4rh4qvk8qNWqNa.Iioy/tC8C', '6868602ec4547.jpg', 1),
(36, 'rajannanda1@gmail.com', 'rajan777', '$2y$10$gnpAv4/vmmv56IFuhEwzde2Fc/m/J2ufSEY32uCtztEn19yyyxSEW', '686860709a0c6.jpg', 1),
(37, 'rajannanda123@gmail.com', 'rajan7890', '$2y$10$KwQKKinyxJ4XN5Z/H5/oP.SVjnwBuf7bIl3Kqw1eYrKXvg.xvgZli', '687a9ad8188b0.png', 1),
(38, 'rajannanda12@gmail.com', 'rajan0009988', '$2y$10$tBYiH2kJebXjF72G/TdpZOJtH25bxx5dXsYbFzfRh57P5Eju0rRFG', '687a9bc00ab3e.jpg', 1),
(39, 'rajannanda1234@gmail.com', 'rajan777777', '$2y$10$MlOdYJfZd5HGLsRR0IrFLe7dci3G5I0LixXZYxZPsO28Us7VgxcO6', '687cac3deff24.jpg', 1),
(40, 'rajannanda8899@gmail.com', 'rajan8899', '$2y$10$cc750Ld8yjuRvjYKmYUBL.fWMc9dIw2HnGfvaY/OUZ3iXzEDwAnKy', '687caf9949d73.jpg', 1),
(41, 'rajannanda66@gmail.com', 'harry', '$2y$10$nkrIXlUrGCyWZbP78xSX2eDE06aQT4BfqJO6EXRQuoKsYbYReflG.', '68854fd6c1095.jpg', 1),
(42, 'rajannanda44@gmail.com', 'rajandude', '$2y$10$HYpV3DOGjFKGOQ4/RZq7L.Zn5WpflXa3qoVMvyPdQNGns3U0Lub6y', '68856b82f23f3.jpg', 1),
(43, 'rajannanda12345678@gmail.com', 'rajannanda888888', '$2y$10$OsXIVq7N/sW0GsQU.p2R7.DqrLXM5n5V.2KAWZLUhDiJqS26tCKl.', '68856e5ccfe12.jpg', 1),
(44, 'rajannanda22@gmail.com', 'rajan99', '$2y$10$QBMjoRp8/EBrw768vWOvMuDOpwmqc7wIiaOCWfnTeovLk6o6603.6', '6885707b350b2.jpg', 1),
(45, 'rajannanda4455@gmail.com', 'damola', '$2y$10$U8j5SwbVK9EAIkQ926T6EuPL42IrO04ZmmmOk5vFvoCUjVU74xujO', 'default.jpg', 1),
(46, 'sajannanda12@gmail.com', 'sajannanda', '$2y$10$ZpWKiyr3qTQGOmVH1EZIBe7.OUyAnbB7YP93Y5.rY/GWdRus9oVOO', '6886588beceb5.jpg', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_control`
--
ALTER TABLE `access_control`
  ADD PRIMARY KEY (`owner_id`,`viewer_id`,`topic_id`);

--
-- Indexes for table `Courses`
--
ALTER TABLE `Courses`
  ADD PRIMARY KEY (`course_ID`);

--
-- Indexes for table `demotable`
--
ALTER TABLE `demotable`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`notes_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `Student_Info`
--
ALTER TABLE `Student_Info`
  ADD PRIMARY KEY (`student_ID`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users_access`
--
ALTER TABLE `users_access`
  ADD PRIMARY KEY (`access_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `screen_name` (`screen_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Courses`
--
ALTER TABLE `Courses`
  MODIFY `course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `demotable`
--
ALTER TABLE `demotable`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `notes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `users_access`
--
ALTER TABLE `users_access`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_info`
--
ALTER TABLE `users_info`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_info` (`user_id`),
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_info` (`user_id`);

--
-- Constraints for table `users_access`
--
ALTER TABLE `users_access`
  ADD CONSTRAINT `users_access_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_info` (`user_id`),
  ADD CONSTRAINT `users_access_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `notes` (`topic_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
