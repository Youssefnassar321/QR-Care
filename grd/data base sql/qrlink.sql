-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 10:39 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qrlink`
--

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique child identifier',
  `parent_user_id` varchar(20) DEFAULT NULL COMMENT 'Parent user ID',
  `name` varchar(255) NOT NULL COMMENT 'Child name',
  `age` int(11) DEFAULT NULL COMMENT 'Child age',
  `height` decimal(5,2) DEFAULT NULL COMMENT 'Child height',
  `weight` decimal(5,2) DEFAULT NULL COMMENT 'User weight',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp of child registration',
  `address` varchar(255) DEFAULT NULL COMMENT 'Child address',
  `emergency_contact` varchar(15) DEFAULT NULL COMMENT 'Emergency contact for child',
  `national_id` varchar(20) DEFAULT NULL COMMENT 'Identification card for the first-time registration',
  `analysis_text` text DEFAULT NULL COMMENT 'Text description of the medical analysis',
  `analysis_date` date DEFAULT NULL COMMENT 'Date of the medical analysis',
  `chronic_disease` varchar(255) DEFAULT NULL COMMENT 'Chronic diseases',
  `allergies` varchar(255) DEFAULT NULL COMMENT 'Allergies',
  `type_of_allergy` varchar(255) DEFAULT NULL COMMENT 'Type of allergies',
  `x_ray_image` varchar(255) DEFAULT NULL COMMENT 'X-ray image URL or path',
  `medical_analysis` varchar(255) DEFAULT NULL COMMENT 'Medical analysis details',
  `blood_type` varchar(5) DEFAULT NULL COMMENT 'User blood type',
  `blood_pressure` varchar(255) DEFAULT NULL COMMENT 'User blood pressure',
  `blood_sugar_level` decimal(5,2) DEFAULT NULL COMMENT 'User blood sugar level',
  `heart_rate` int(11) DEFAULT NULL COMMENT 'User heart rate',
  `test_date` date DEFAULT NULL COMMENT 'Date of the medical test',
  `allergen_name` varchar(255) DEFAULT NULL COMMENT 'Name of the allergen',
  `reaction` varchar(255) DEFAULT NULL COMMENT 'User reaction to the allergen',
  `disease_name` varchar(255) DEFAULT NULL COMMENT 'Name of the disease',
  `diagnosis_date` date DEFAULT NULL COMMENT 'Date of diagnosis',
  `treatment` varchar(255) DEFAULT NULL COMMENT 'Treatment for the disease'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`id`, `parent_user_id`, `name`, `age`, `height`, `weight`, `created_at`, `address`, `emergency_contact`, `national_id`, `analysis_text`, `analysis_date`, `chronic_disease`, `allergies`, `type_of_allergy`, `x_ray_image`, `medical_analysis`, `blood_type`, `blood_pressure`, `blood_sugar_level`, `heart_rate`, `test_date`, `allergen_name`, `reaction`, `disease_name`, `diagnosis_date`, `treatment`) VALUES
(1, '30215115516', 'Child1', 7, 120.50, 25.50, '2024-05-30 12:00:00', 'El Tahrir Street, Cairo, Egypt', '+201234567890', '12345678901234', 'Healthy child with no issues', '2023-06-30', 'Asthma', 'Pollen', 'Seasonal allergy', 'xray_image_1.jpg', 'Regular checkup, no issues', 'A+', '120/80', 80.00, 72, '2023-06-30', 'Pollen', 'Mild sneezing', 'Asthma', '2023-01-01', 'Inhaler twice daily'),
(2, '30205101465598', 'Child2', 8, 130.70, 28.40, '2024-05-30 12:00:00', 'Ramses Street, Giza, Egypt', '+201234567891', '12345678901235', 'Regular medical analysis conducted', '2023-06-29', 'Diabetes', 'Dust', 'Chronic allergy', 'xray_image_2.jpg', 'Regular checkup, monitoring required', 'B+', '130/85', 85.00, 75, '2023-06-29', 'Dust', 'Coughing', 'Diabetes', '2023-02-01', 'Insulin shots daily'),
(3, '30205101324567', 'Child3', 9, 115.30, 27.60, '2024-05-30 12:00:00', 'Zamalek Street, Alexandria, Egypt', '+201234567892', '12345678901236', 'Child with minor allergies', '2023-06-28', 'Hypertension', 'Peanuts', 'Food allergy', 'xray_image_3.jpg', 'Minor allergy issues', 'AB+', '110/70', 90.00, 78, '2023-06-28', 'Peanuts', 'Hives', 'Hypertension', '2023-03-01', 'Low salt diet'),
(4, '30205106479831', 'Child4', 10, 125.80, 26.20, '2024-05-30 12:00:00', 'Nasr Road, Mansoura, Egypt', '+201234567893', '12345678901237', 'Medical examination complete', '2023-06-27', 'Eczema', 'Shellfish', 'Food allergy', 'xray_image_4.jpg', 'Regular checkup, mild eczema', 'O+', '125/80', 95.00, 80, '2023-06-27', 'Shellfish', 'Swelling', 'Eczema', '2023-04-01', 'Topical cream'),
(5, '30205101324567', 'Child5', 11, 110.20, 24.70, '2024-05-30 12:00:00', 'Maadi Street, Tanta, Egypt', '+201234567894', '12345678901238', 'Routine analysis conducted', '2023-06-26', 'Allergies', 'Gluten', 'Food intolerance', 'xray_image_5.jpg', 'Routine checkup, no major issues', 'A-', '115/75', 100.00, 82, '2023-06-26', 'Gluten', 'Stomach ache', 'Allergies', '2023-05-01', 'Gluten-free diet'),
(6, '30205346034987', 'Child6', 12, 140.60, 32.40, '2024-05-30 12:00:00', 'El Tahrir Street, Cairo, Egypt', '+201234567895', '12345678901239', 'Child with good health', '2023-06-25', 'Asthma', 'Pollen', 'Seasonal allergy', 'xray_image_6.jpg', 'Good health, asthma managed', 'B-', '120/80', 105.00, 85, '2023-06-25', 'Pollen', 'Mild sneezing', 'Asthma', '2023-06-25', 'Inhaler as needed'),
(7, '30205004697632', 'Child7', 13, 150.30, 35.10, '2024-05-30 12:00:00', 'Ramses Street, Giza, Egypt', '+201234567896', '12345678901240', 'Regular medical test', '2023-06-24', 'Diabetes', 'Dust', 'Chronic allergy', 'xray_image_7.jpg', 'Regular monitoring, stable', 'AB-', '130/85', 110.00, 88, '2023-06-24', 'Dust', 'Coughing', 'Diabetes', '2023-06-24', 'Insulin and diet control'),
(8, '302151155161', 'Child8', 14, 135.70, 30.80, '2024-05-30 12:00:00', 'Zamalek Street, Alexandria, Egypt', '+201234567897', '12345678901241', 'Detailed analysis complete', '2023-06-23', 'Hypertension', 'Peanuts', 'Food allergy', 'xray_image_8.jpg', 'Minor health issues, managed', 'O-', '110/70', 115.00, 90, '2023-06-23', 'Peanuts', 'Hives', 'Hypertension', '2023-06-23', 'Medication and diet'),
(9, '3021511551610', 'Child9', 15, 145.90, 33.50, '2024-05-30 12:00:00', 'Nasr Road, Mansoura, Egypt', '+201234567898', '12345678901242', 'Routine checkup complete', '2023-06-22', 'Eczema', 'Shellfish', 'Food allergy', 'xray_image_9.jpg', 'Good health, minor eczema', 'A+', '125/80', 120.00, 92, '2023-06-22', 'Shellfish', 'Swelling', 'Eczema', '2023-06-22', 'Topical treatment'),
(10, '52123112512', 'Child10', 16, 155.40, 36.20, '2024-05-30 12:00:00', 'Maadi Street, Tanta, Egypt', '+201234567899', '12345678901243', 'Child in good health', '2023-06-21', 'Allergies', 'Gluten', 'Food intolerance', 'xray_image_10.jpg', 'Routine checkup, no major issues', 'B+', '115/75', 125.00, 95, '2023-06-21', 'Gluten', 'Stomach ache', 'Allergies', '2023-06-21', 'Gluten-free diet');

-- --------------------------------------------------------

--
-- Table structure for table `child_files`
--

CREATE TABLE `child_files` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique child file identifier',
  `child_image` varchar(255) DEFAULT NULL COMMENT 'URL or path to user image',
  `child_id` int(11) DEFAULT NULL COMMENT 'Child associated with the file',
  `id_image` varchar(255) DEFAULT NULL COMMENT 'URL or path to user image',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Path to child file in governmental organization'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `government_agencies`
--

CREATE TABLE `government_agencies` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique agency identifier',
  `account_id` varchar(20) NOT NULL COMMENT 'Account ID for government agency login',
  `unique_id` varchar(20) NOT NULL COMMENT 'Unique ID for citizens',
  `name` varchar(255) NOT NULL COMMENT 'Agency name',
  `job_role` varchar(255) NOT NULL COMMENT 'Job role of agency personnel (doctor, officer, etc.)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp of agency registration'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_analysis`
--

CREATE TABLE `medical_analysis` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique medical analysis identifier',
  `national_id` varchar(20) NOT NULL COMMENT 'Identification card for the first-time registration',
  `analysis_text` text DEFAULT NULL COMMENT 'Text description of the medical analysis',
  `analysis_date` date DEFAULT NULL COMMENT 'Date of the medical analysis',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp of medical analysis creation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_analysis`
--

INSERT INTO `medical_analysis` (`id`, `national_id`, `analysis_text`, `analysis_date`, `created_at`) VALUES
(1, '30215115516', 'Blood test results show normal levels of hemoglobin and white blood cells.', '2024-01-15', '2024-05-16 21:21:48'),
(2, '22345678901234', 'X-ray indicates a minor fracture in the left arm.', '2024-02-20', '2024-05-16 21:21:48'),
(3, '323456789301234', 'MRI scan reveals no abnormalities in the brain.', '2024-03-05', '2024-05-16 21:21:48'),
(4, '42345678901234', 'Urine test shows signs of a possible urinary tract infection.', '2024-04-10', '2024-05-16 21:21:48'),
(5, '52345678901234', 'Blood pressure monitoring indicates hypertension.', '2024-05-25', '2024-05-16 21:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `medical_tests`
--

CREATE TABLE `medical_tests` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique medical test identifier',
  `national_id` varchar(20) NOT NULL COMMENT 'Identification card for the first-time registration',
  `height` decimal(5,2) DEFAULT NULL COMMENT 'User height',
  `weight` decimal(5,2) DEFAULT NULL COMMENT 'User weight',
  `chronic_disease` varchar(255) DEFAULT NULL COMMENT 'Chronic diseases',
  `allergies` varchar(255) DEFAULT NULL COMMENT 'Allergies',
  `type_of_allergy` varchar(255) DEFAULT NULL COMMENT 'Type of allergies',
  `x_ray_image` varchar(255) DEFAULT NULL COMMENT 'X-ray image URL or path',
  `medical_analysis` varchar(255) DEFAULT NULL COMMENT 'Medical analysis details',
  `blood_type` varchar(5) DEFAULT NULL COMMENT 'User blood type',
  `blood_pressure` varchar(255) DEFAULT NULL COMMENT 'User blood pressure',
  `blood_sugar_level` decimal(5,2) DEFAULT NULL COMMENT 'User blood sugar level',
  `heart_rate` int(11) DEFAULT NULL COMMENT 'User heart rate',
  `test_date` date DEFAULT NULL COMMENT 'Date of the medical test',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp of medical test creation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_tests`
--

INSERT INTO `medical_tests` (`id`, `national_id`, `height`, `weight`, `chronic_disease`, `allergies`, `type_of_allergy`, `x_ray_image`, `medical_analysis`, `blood_type`, `blood_pressure`, `blood_sugar_level`, `heart_rate`, `test_date`, `created_at`) VALUES
(1, '30215115516', 175.50, 70.25, 'Hypertension', 'Peanuts', 'Food Allergy', 'https://imgur.com/a/1FP7fZu', 'Normal blood test', 'O+', '120/80', 90.50, 72, '2023-01-15', '2024-05-16 21:21:48'),
(2, '22345678901234', 160.75, 60.00, 'Diabetes', 'Dust', 'Environmental Allergy', 'https://drive.google.com/file/d/1XvLkNSJ_Q-VyZxOmvjbCM6h4D-S32LcI/view?usp=sharing', 'High blood sugar', 'A+', '130/85', 150.00, 80, '2023-02-20', '2024-05-16 21:21:48'),
(3, '32345678900234', 180.00, 85.00, 'None', 'None', 'None', 'C:xampphtdocsgrduploadR1.jpeg', 'Normal MRI scan', 'B-', '110/70', 95.00, 68, '2023-03-05', '2024-05-16 21:21:48'),
(4, '42345678901234', 170.25, 65.75, 'Asthma', 'Pollen', 'Seasonal Allergy', 'C:xampphtdocsgrduploadR1.jpeg', 'Possible UTI', 'AB+', '115/75', 85.00, 75, '2023-04-10', '2024-05-16 21:21:48'),
(5, '52345678901234', 165.50, 68.00, 'Heart Disease', 'Penicillin', 'Drug Allergy', '\"C:xampphtdocsgrduploadR2.jpg\"', 'High blood pressure', 'O-', '140/90', 105.00, 77, '2023-05-25', '2024-05-16 21:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `public_data`
--

CREATE TABLE `public_data` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique public data identifier',
  `user_id` int(11) DEFAULT NULL COMMENT 'User associated with the public data',
  `data` text DEFAULT NULL COMMENT 'Public data visible to authorized personnel',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp of public data creation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qrcode`
--

CREATE TABLE `qrcode` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique QR code identifier',
  `user_id` int(11) NOT NULL COMMENT 'User ID associated with the QR code',
  `qr_data` varchar(255) NOT NULL COMMENT 'Data stored in the QR code',
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp when the QR code was generated',
  `expiration_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Timestamp indicating the expiration date of the QR code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique user identifier',
  `account_id` varchar(20) NOT NULL COMMENT 'Account ID for user login',
  `national_id` varchar(20) NOT NULL COMMENT 'Identification card for the first-time registration',
  `password` varchar(255) NOT NULL COMMENT 'Password',
  `confirm_password` varchar(255) NOT NULL COMMENT 'Confirm Password',
  `job` varchar(255) NOT NULL COMMENT 'User job (doctor, officer, etc.)',
  `gender` varchar(255) NOT NULL COMMENT 'User gender',
  `government` varchar(3) DEFAULT NULL COMMENT 'Government code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `government_city` varchar(255) NOT NULL COMMENT 'Government city',
  `government_center` varchar(255) NOT NULL COMMENT 'Government center',
  `contact` varchar(15) NOT NULL COMMENT 'User contact number',
  `emergency_contact` varchar(15) NOT NULL COMMENT 'Emergency contact',
  `emergency_name` varchar(255) DEFAULT NULL COMMENT 'Emergency contact name',
  `user_image` varchar(255) DEFAULT NULL COMMENT 'URL or path to user image',
  `user_id` varchar(255) DEFAULT NULL COMMENT 'URL or path to user image',
  `date_of_birth` date DEFAULT NULL COMMENT 'User date of birth',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp of user registration'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `account_id`, `national_id`, `password`, `confirm_password`, `job`, `gender`, `government`, `city`, `government_city`, `government_center`, `contact`, `emergency_contact`, `emergency_name`, `user_image`, `user_id`, `date_of_birth`, `created_at`) VALUES
(1, 'doctor_66468c47.com', '30215115516', '$2y$10$CMG78WeJ3OsNmZ3obvDVUOwrSKiWCzsN5P3p/.s3k5i1uejdMaK.i', '$2y$10$CMG78WeJ3OsNmZ3obvDVUOwrSKiWCzsN5P3p/.s3k5i1uejdMaK.i', 'doctor', 'Female', '011', '22 Agriculture Road Km11', 'Alexandria', 'Alexandria', '01501100047', '01201654197', 'Enas Khalid', 'R1.jpeg', 'R3.jpeg', NULL, '2024-05-16 22:44:23'),
(4, 'doctor_6606dd7c.com', '30205101465598', '$2y$10$vBBlNobk7Bk3m.NfOhGfkO49swmLhYQ2Eg3dauqkEbOCDen5Aw6G6', '$2y$10$EHF4Abjq9F8Bt14X8LlLXO1KFvEKb99XHTBBajhkOcI.TLze.YHFi', 'doctor', 'Female', '011', 'El Iskandariya', 'Alexandria', 'Alexandria', '01011019848', '01011019465', 'Dalia Ahmed', 'id_gi.jpeg', NULL, NULL, '2024-03-29 15:25:48'),
(5, 'doctor_6606de58.com', '30205101324567', '$2y$10$s5I81DYpHLFRnn4kEukIGefTtBrIwLdIxmfC0c3VSvJKyEbKEMNu6', '$2y$10$xkYfrelHyC73stuW/Z42Weg/j/OX8.tSDrUd6ZXLlqMRlFDhf3ho.', 'doctor', 'Female', '115', 'Nasr City-Free Zone', 'Cairo', 'Cairo', '01011047963', '01011014631', 'mona Ahmed', 'id_gi.jpeg', NULL, NULL, '2024-03-29 15:29:28'),
(6, 'officer_6606df2c.com', '30205106479831', '$2y$10$adbnTf766Uh/KwJUYOFhoOgeOZVn4.ZGZkOnwoQnUtzKlr6xeFrvK', '$2y$10$xUBOtkfJldBDFE6QHQemBuLE8vlEQQ.mg1UBj/zaPNY4qVSzxC8Y6', 'police officer', 'Male', '617', '2-El Minia, El Gidida', 'Minya', 'Minya', '01011078941', '01013147964', 'Ahmed Hany', 'id_gi.jpeg', NULL, NULL, '2024-03-29 15:33:01'),
(7, 'officer_6606dfce.com', '30205346973156', '$2y$10$dwxeirK9UOwasjBD9DhZeeudeG6eJ5UJgINs5r.mJKngckGATgex2', '$2y$10$bz0dslcltNfvYp6gLyB2k.YHdCH8Ght5CRkw3nWxbUP2NB8l./KH6', 'police officer', 'Male', '115', '33 Sayed Ali Street, Zayton', 'Cairo', 'Cairo', '01101107369', '01201314472', 'Ail AHMED', 'id_ma.jpeg', NULL, NULL, '2024-03-29 15:35:42'),
(8, 'other_6606e096.com', '30205346034987', '$2y$10$tTedm/SKAjbQN1fEKvIwcevTh2eloJXSiuTsSGzOQlHKwbPiwUAQO', '$2y$10$b0FrG7mFMJ9RLlWC/jUsNeaaoEkHXYwE4VUSUAYcCv6oD6utDYTzi', 'Software engineering', 'Male', '415', 'Building 13, Shebin Street, Tani', 'Ismailia', 'Ismailia', '01201134785', '01101310047', 'Malak Ahmed', 'id_ma.jpeg', NULL, NULL, '2024-03-29 15:39:02'),
(9, 'other_6606e190.com', '30205004697632', '$2y$10$6uhlmIrVku7COHspB0gEved0exTrRbjmaIVDJvA.zeS0y50CsKjey', '$2y$10$8LV.pL84N.MHlTyPIfJM2.Xt2Pp3yOA/BuwJfH2SBPxYty4.8G2Ji', 'Lawyer', 'Female', '011', '22 Agriculture Road Km11', 'Alexandria', 'Alexandria', '01501100047', '01201654197', 'Enas Khalid', 'id_gi.jpeg', NULL, NULL, '2024-03-29 15:43:12'),
(10, 'doctor_66468cb3.com', '302151155161', '$2y$10$FxZ6SSdpf2dwtJ0pVoJUVeavwLnBTdLf1IQYII38514wTVEzsCPWu', '$2y$10$FxZ6SSdpf2dwtJ0pVoJUVeavwLnBTdLf1IQYII38514wTVEzsCPWu', 'doctor', 'Female', '011', '22 Agriculture Road Km11', 'Alexandria', 'Alexandria', '01501100047', '01201654197', 'Enas Khalid', 'R1.jpeg', '1', NULL, '2024-05-16 22:46:12'),
(12, 'doctor_66468cbc.com', '3021511551610', '$2y$10$3MH36.XvCwCqGZQSDIGACO98ArDBX0b0.1rr3dSBajGMr8XVnVJvK', '$2y$10$3MH36.XvCwCqGZQSDIGACO98ArDBX0b0.1rr3dSBajGMr8XVnVJvK', 'doctor', 'Female', '011', '22 Agriculture Road Km11', 'Alexandria', 'Alexandria', '01501100047', '01201654197', 'Enas Khalid', 'R1.jpeg', '1', NULL, '2024-05-16 22:46:20'),
(32, 'other_66475c57.com', '52123112512', '$2y$10$BmQDKIyih.gJ1xGiPlSozuNoXBipsDIY1Rtuu.XDMFx5fkGhnalV6', '$2y$10$BmQDKIyih.gJ1xGiPlSozuNoXBipsDIY1Rtuu.XDMFx5fkGhnalV6', '34345', 'Female', '424', '2434', 'Alexandria', '435435', '324324', '42424', 'eman Khalid', 'id_ma.jpeg', 'R3.jpeg', NULL, '2024-05-17 13:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_allergies`
--

CREATE TABLE `user_allergies` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique allergy identifier',
  `national_id` varchar(20) NOT NULL COMMENT 'Identification card for the first-time registration',
  `allergen_name` varchar(255) NOT NULL COMMENT 'Name of the allergen',
  `reaction` varchar(255) DEFAULT NULL COMMENT 'User reaction to the allergen',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp of allergy record creation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_allergies`
--

INSERT INTO `user_allergies` (`id`, `national_id`, `allergen_name`, `reaction`, `created_at`) VALUES
(1, '30215115516', 'Peanuts', 'Anaphylaxis', '2024-05-16 21:21:49'),
(2, '0987654321', 'Dust', 'Sneezing', '2024-05-16 21:21:49'),
(3, '1122334455', 'Cats', 'Itchy eyes', '2024-05-16 21:21:49'),
(4, '30205346034987', 'Pollen', 'Runny nose', '2024-05-16 21:21:49'),
(5, '3344556677', 'Latex', 'Skin rash', '2024-05-16 21:21:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_conscription_status`
--

CREATE TABLE `user_conscription_status` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique child identifier',
  `national_id` varchar(20) NOT NULL COMMENT 'National ID of the user, referencing the national_id in the users table',
  `conscription_status` enum('Performed','Exempt','Not Completed') NOT NULL COMMENT 'Conscription status of the user',
  `exemption_reason` varchar(255) DEFAULT NULL COMMENT 'Reason for exemption, applicable if conscription_status is Exempt',
  `service_start_date` date DEFAULT NULL COMMENT 'Start date of the service, applicable if conscription_status is Performed',
  `service_end_date` date DEFAULT NULL COMMENT 'End date of the service, applicable if conscription_status is Performed',
  `notes` text DEFAULT NULL COMMENT 'Additional notes regarding the conscription status',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp of record creation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_conscription_status`
--

INSERT INTO `user_conscription_status` (`id`, `national_id`, `conscription_status`, `exemption_reason`, `service_start_date`, `service_end_date`, `notes`, `created_at`) VALUES
(1, '30215115516', 'Exempt', 'Medical condition', NULL, NULL, 'Exempted due to chronic asthma', '2024-05-16 21:21:48'),
(2, '30205101324567', 'Performed', NULL, '2020-01-01', '2022-01-01', 'Completed military service', '2024-05-16 21:21:48'),
(3, '30205106479831', 'Not Completed', NULL, NULL, NULL, 'Awaiting conscription', '2024-05-16 21:21:48'),
(4, '30205346973156', 'Performed', NULL, '2018-06-15', '2020-06-14', 'Served in the army', '2024-05-16 21:21:48'),
(5, '362053460349871', 'Exempt', 'Educational pursuit', NULL, NULL, 'Exempted for pursuing higher education', '2024-05-16 21:21:48'),
(6, '30205004697632', 'Performed', NULL, '2019-09-01', '2021-08-31', 'Completed service in the navy', '2024-05-16 21:21:48'),
(7, '16345678901234', 'Exempt', 'Physical disability', NULL, NULL, 'Exempted due to permanent disability', '2024-05-16 21:21:48'),
(8, '22345678901234', 'Performed', NULL, '2017-03-01', '2019-02-28', 'Served in the air force', '2024-05-16 21:21:48'),
(9, '32345678901434', 'Not Completed', NULL, NULL, NULL, 'Pending conscription assessment', '2024-05-16 21:21:48'),
(10, '42345678901234', 'Exempt', 'Sole breadwinner', NULL, NULL, 'Exempted as the sole breadwinner of the family', '2024-05-16 21:21:48'),
(11, '52345678901234', 'Performed', NULL, '2021-11-01', '2023-10-31', 'Currently serving in the military', '2024-05-16 21:21:48'),
(12, '123456789', 'Performed', NULL, '2023-01-01', '2023-12-31', 'User completed conscription service.', '2024-05-16 21:21:48'),
(13, '987654321', 'Exempt', 'Medical condition', NULL, NULL, 'User exempted from conscription due to a medical condition.', '2024-05-16 21:21:48'),
(14, '456789123', 'Not Completed', NULL, NULL, NULL, 'User has not yet completed conscription service.', '2024-05-16 21:21:48'),
(15, '10345678901234', 'Performed', NULL, '2022-01-15', '2023-01-14', 'Completed mandatory service.', '2024-05-16 21:21:48'),
(16, '30205346034987', 'Exempt', 'Medical Condition', NULL, NULL, 'Exempted due to a chronic illness.', '2024-05-16 21:21:48'),
(17, '32345678901264', 'Not Completed', NULL, NULL, NULL, 'Conscription pending.', '2024-05-16 21:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_diseases`
--

CREATE TABLE `user_diseases` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique disease identifier',
  `national_id` varchar(20) NOT NULL COMMENT 'Identification card for the first-time registration',
  `disease_name` varchar(255) NOT NULL COMMENT 'Name of the disease',
  `diagnosis_date` date DEFAULT NULL COMMENT 'Date of diagnosis',
  `treatment` varchar(255) DEFAULT NULL COMMENT 'Treatment for the disease',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp of disease record creation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_diseases`
--

INSERT INTO `user_diseases` (`id`, `national_id`, `disease_name`, `diagnosis_date`, `treatment`, `created_at`) VALUES
(1, '30215115516', 'Diabetes', '2020-01-15', 'Insulin therapy', '2024-05-16 21:21:49'),
(2, '0987654321', 'Hypertension', '2019-11-20', 'ACE inhibitors', '2024-05-16 21:21:49'),
(3, '30205346034987', 'Asthma', '2021-03-10', 'Inhalers', '2024-05-16 21:21:49'),
(4, '2233445566', 'Heart Disease', '2018-07-25', 'Statins', '2024-05-16 21:21:49'),
(5, '3344556677', 'Arthritis', '2022-09-30', 'NSAIDs', '2024-05-16 21:21:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_files`
--

CREATE TABLE `user_files` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Unique user file identifier',
  `user_id` int(11) DEFAULT NULL COMMENT 'User associated with the file',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Path to user file in governmental organization'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_government_agencies`
--

CREATE TABLE `user_government_agencies` (
  `user_id` int(11) DEFAULT NULL COMMENT 'User associated with the agency',
  `agency_id` int(11) DEFAULT NULL COMMENT 'Government agency'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_codes`
--

CREATE TABLE `verification_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact` varchar(15) NOT NULL,
  `verification_code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `verification_codes`
--

INSERT INTO `verification_codes` (`id`, `contact`, `verification_code`, `created_at`, `expires_at`) VALUES
(19, '01101496542412', '9238', '2024-03-29 16:51:32', '2024-03-29 16:06:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `child_files`
--
ALTER TABLE `child_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `government_agencies`
--
ALTER TABLE `government_agencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_id` (`account_id`),
  ADD UNIQUE KEY `unique_id` (`unique_id`);

--
-- Indexes for table `medical_analysis`
--
ALTER TABLE `medical_analysis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_tests`
--
ALTER TABLE `medical_tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `public_data`
--
ALTER TABLE `public_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qrcode`
--
ALTER TABLE `qrcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `qr_data` (`qr_data`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_id` (`account_id`),
  ADD UNIQUE KEY `national_id` (`national_id`);

--
-- Indexes for table `user_allergies`
--
ALTER TABLE `user_allergies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_conscription_status`
--
ALTER TABLE `user_conscription_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_diseases`
--
ALTER TABLE `user_diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_files`
--
ALTER TABLE `user_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_codes`
--
ALTER TABLE `verification_codes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique child identifier', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `child_files`
--
ALTER TABLE `child_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique child file identifier', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `government_agencies`
--
ALTER TABLE `government_agencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique agency identifier';

--
-- AUTO_INCREMENT for table `medical_analysis`
--
ALTER TABLE `medical_analysis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique medical analysis identifier', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medical_tests`
--
ALTER TABLE `medical_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique medical test identifier', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `public_data`
--
ALTER TABLE `public_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique public data identifier';

--
-- AUTO_INCREMENT for table `qrcode`
--
ALTER TABLE `qrcode`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique QR code identifier';

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique user identifier', AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user_conscription_status`
--
ALTER TABLE `user_conscription_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique child identifier', AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
