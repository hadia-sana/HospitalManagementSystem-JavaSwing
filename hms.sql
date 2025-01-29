-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2025 at 12:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addappoint` (IN `newdatt` DATE, IN `newtim` TIME, IN `newdocid` INT, IN `newpid` INT, IN `apptype2` VARCHAR(30))   begin
insert into appointment(datt,tim,docid,pid,apptype) values (newdatt,newtim,newdocid,newpid,apptype2);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addbeds` (`bednumb2` INT, `wardnumb2` INT)   begin 
insert into bed(bednumb,wardnumb)values(bednumb2,wardnumb2);

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addbill` (`datt` DATE, `amount` INT, `name` VARCHAR(30), `appid` INT)   begin
insert into createbill values (datt,amount,name,appid);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `adddoctor` (IN `newname` VARCHAR(30), IN `age` INT, IN `gender` VARCHAR(15), IN `salary` INT, IN `qualification` VARCHAR(16))   begin
insert into  patient values (newname,age,gender,salary,qualification) ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `adddoctor2` (IN `newname` VARCHAR(30), IN `age` INT, IN `gender` VARCHAR(15), IN `salary` INT, IN `qualification` VARCHAR(16), OUT `res` INT)   begin
insert into  doctor values (newname,age,gender,salary,qualification) ;
set res=last_insert_id();
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `adddoctor3` (IN `newname` VARCHAR(30), IN `aage` INT, IN `ggender` VARCHAR(15), IN `ssalary` INT, IN `qqualification` VARCHAR(16), OUT `res` INT)   begin
insert into  doctor (name,age,gender,salary,qualification) values (newname,aage,ggender,ssalary,qqualification) ;
set res=last_insert_id();
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addinto` (`newname` VARCHAR(30), `newage` INT, `newgender` VARCHAR(30), `newdiagnose` VARCHAR(30), `newdocid` INT)   begin
insert into patient (name,age,gender,diagnose,doc_id) values(newnwme,newage,newgender,newdiagnose,newdocid);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addintop` (`newname` VARCHAR(30), `newage` INT, `newgender` VARCHAR(30), `newdiagnose` VARCHAR(30), `newdocid` INT)   begin
insert into patient (doc_id,name,age,gender,diagnose) values(newdocid,newname,newage,newgender,newdiagnose);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addintopatient2` (`newdcid` INT, `newname` VARCHAR(30), `newage` INT, `newgender` VARCHAR(30), `newdiagnose` VARCHAR(30))   begin
 insert into patient2(dcid,name,age,gender,diagnose)values (newdcid,newname,newage,newgender,newdiagnose);
 end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addnurse` (IN `id` INT, IN `name` VARCHAR(250), IN `age` INT, IN `gender` VARCHAR(250), IN `salary` INT, IN `qualification` VARCHAR(250))   begin
insert into nurse  values(id,name,age,gender,salary,qualification);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addpatient` (IN `newname` VARCHAR(30), IN `age` INT, IN `gender` VARCHAR(15), IN `diagnose` VARCHAR(16), IN `id` INT)   begin
insert into  patient values (id,newname,age,gender,diagnose ) ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addrecommendation` (IN `doc` VARCHAR(250), IN `patient` VARCHAR(250), IN `collabedhosp` VARCHAR(250), IN `speciality` VARCHAR(250), IN `reason` VARCHAR(250), IN `datee` DATE)   begin
insert into recommendation  values(doc,patient,collabedhosp,speciality,reason,datee);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addreservation` (`bednumb2` INT, `wardnumb2` INT)   begin
insert into reservation(bednumb,wardnumb)values(bednumb2,wardnumb2);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addshift` (IN `docname` VARCHAR(250), IN `nurse1name` VARCHAR(250), IN `nurse2name` VARCHAR(250), IN `wardnumb` INT, IN `shifttiming` VARCHAR(250))   begin
insert into shift values(docname ,nurse1name ,nurse2name,wardnumb ,shifttiming);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addward` (IN `numb` INT, IN `wtype` VARCHAR(250), IN `noofbeds` INT, IN `floor` INT)   begin
insert into ward values(numb , wtype ,noofbeds  ,floor );
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkdoctors` (IN `name` VARCHAR(250), OUT `res` TINYINT(1))   begin
if exists(select 1 from doctor where doctor.name=name) then
set res=1;
else 
set res=0;
end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checknurse` (IN `name` VARCHAR(250), OUT `res` TINYINT(1))   begin
if exists(select 1 from nurse where nurse.name=name) then
set res=1;
else 
set res=0;
end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `datewisebill` (`dattt` DATE)   begin
select * from createbill where datt=dattt;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletenurse` (`idnew` INT)   begin
delete from nurse where id=idnew;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `doctorwisereport` (`newid` INT)   begin
select d.name,p.name,p.diagnose from doctor as d inner join patient2 as p on p.dcid=d.id where d.id=newid;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getamount` (IN `appointmentid2` INT, OUT `amount2` FLOAT)   begin
SELECT amount INTO amount2
    FROM wbill_final
    WHERE reserveid = appointmentid2;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getamount2` (IN `appointmentid2` INT, OUT `amount2` FLOAT)   begin
SELECT amount INTO amount2
    FROM wbill_final
    WHERE reserveid = appointmentid2 order by  datt desc limit 1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `patientwisebill` (IN `id` INT)   begin
select a.appointmentid,a.datt,a.tim,a.docid,a.apptype from appointment a inner join patient p on a.pid=p.pid where p.pid=id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `patientwisebill2` (`id` INT)   begin
select a.appointmentid,a.datt,a.tim,a.docid,a.apptype from appointment as a inner join patient2 as p on a.pid=p.pid where p.pid=id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reservebeds` (IN `bednumb2` INT, IN `wardnumb2` INT, IN `patient_id2` INT, IN `status2` VARCHAR(250))   begin
update bed set patient_id=patient_id2 ,status=status2 where bednumb=bednumb2 and  wardnumb= wardnumb2;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `wardbill` (IN `patientname` VARCHAR(250), IN `appointmentid` INT, IN `datt` DATE, IN `ward` VARCHAR(250), IN `days` INT, IN `perdayamount` FLOAT, OUT `amount2` FLOAT)   begin
insert into wbill( patientname ,appointmentid,datt ,ward ,days ,perdayamount ) values(patientname ,appointmentid  ,datt ,ward ,days,perdayamount );
set amount2=wbill.amount;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `wardbill2` (IN `patientname` VARCHAR(250), IN `appointmentid` INT, IN `datt` DATE, IN `ward` VARCHAR(250), IN `days` INT, IN `perdayamount` FLOAT)   begin
insert into wbill_final( patientname ,reserveid,datt ,ward ,days ,perdayamount ) values(patientname ,appointmentid  ,datt ,ward ,days,perdayamount );

end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `datt` date DEFAULT NULL,
  `tim` time DEFAULT NULL,
  `appointmentid` int(11) NOT NULL,
  `docid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `apptype` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`datt`, `tim`, `appointmentid`, `docid`, `pid`, `apptype`) VALUES
('2024-11-10', '12:24:00', 1, NULL, NULL, 'fever'),
('2024-12-31', '01:00:00', 3, NULL, 2, 'general'),
('2024-12-31', '03:00:00', 4, NULL, NULL, 'general'),
('2024-12-31', '01:00:00', 5, 16, 6, 'general'),
('2024-12-31', '05:00:00', 6, NULL, NULL, 'general'),
('2024-12-31', '01:00:00', 7, 15, 2, 'fever and');

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `bednumb` int(11) NOT NULL,
  `wardnumb` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `status` varchar(250) DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bed`
--

INSERT INTO `bed` (`bednumb`, `wardnumb`, `patient_id`, `status`) VALUES
(1, 4, 3, 'reserved'),
(2, 4, 2, 'reserved'),
(3, 4, NULL, 'available'),
(4, 4, 3, 'reserved'),
(5, 4, NULL, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `createbill`
--

CREATE TABLE `createbill` (
  `datt` date DEFAULT NULL,
  `payamount` int(11) DEFAULT NULL,
  `payerName` varchar(30) DEFAULT NULL,
  `appid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `createbill`
--

INSERT INTO `createbill` (`datt`, `payamount`, `payerName`, `appid`) VALUES
('2024-11-10', 22000, 'amna', 1),
('2024-11-10', 24000, 'lola', 1),
('2024-12-31', 8500, 'tayyab', 4),
('2024-12-31', 85000, 'saira', 5),
('2024-12-31', 90000, 'salman', 6);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `qualification` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `name`, `age`, `gender`, `salary`, `qualification`) VALUES
(4, 'ahmad2', 25, 'male', 22000, 'mbbs'),
(7, 'ahmad2', 25, 'male', 22000, 'mbbs'),
(10, 'ahmad2', 25, 'male', 22000, 'mbbs'),
(14, 'tooba', 55, 'female', 78000, 'mbbs'),
(15, 'anfaal', 22, 'female', 45222, 'mbbs'),
(16, 'saleem', 75, 'male', 50000, 'mbbs'),
(18, 'kkjj', 225, 'ggg', 45655, 'mmm'),
(19, '455555', 89988, '555', 45555, '525155');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(250) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `qualification` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`id`, `name`, `age`, `gender`, `salary`, `qualification`) VALUES
(1, 'amna', 23, 'female', 50000, 'bs nursing'),
(2, 'tehmeen', 25, 'female', 30000, 'bs nursing'),
(3, 'iftikhar', 30, 'male', 22000, 'bs nursing');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `doc_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `diagnose` varchar(16) DEFAULT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`doc_id`, `name`, `age`, `gender`, `diagnose`, `pid`) VALUES
(1, 'ali', 22, 'male', 'fever', 1),
(4, 'ali', 22, 'male', 'fever', 2),
(7, 'ali', 22, 'male', 'fever', 3),
(10, 'ali', 22, 'male', 'fever', 4);

-- --------------------------------------------------------

--
-- Table structure for table `patient2`
--

CREATE TABLE `patient2` (
  `pid` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `diagnose` varchar(30) DEFAULT NULL,
  `dcid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient2`
--

INSERT INTO `patient2` (`pid`, `name`, `age`, `gender`, `diagnose`, `dcid`) VALUES
(2, 'hafi', 22, 'female', 'fever', NULL),
(3, 'altaf', 88, 'male', 'fever', NULL),
(6, 'saira', 55, 'female', 'fever', 16),
(8, 'lojjj', 66, 'hjnj', 'dfr', 15);

-- --------------------------------------------------------

--
-- Table structure for table `recommendation`
--

CREATE TABLE `recommendation` (
  `doc` varchar(250) DEFAULT NULL,
  `patient` varchar(250) DEFAULT NULL,
  `collabedhosp` varchar(250) DEFAULT NULL,
  `speciality` varchar(250) DEFAULT NULL,
  `reason` varchar(250) DEFAULT NULL,
  `datee` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recommendation`
--

INSERT INTO `recommendation` (`doc`, `patient`, `collabedhosp`, `speciality`, `reason`, `datee`) VALUES
('dr anas', 'amna', 'SHALAMAR HOSPITAL', 'NEUROLOGY', 'shortage of equipment', '2024-12-31'),
('tooba', 'amna', 'SHALAMAR HOSPITAL', 'NEUROLOGY', 'shortage of equipment', '2024-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `timee` timestamp NOT NULL DEFAULT current_timestamp(),
  `bednumb` int(11) DEFAULT NULL,
  `wardnumb` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `timee`, `bednumb`, `wardnumb`) VALUES
(3, '2025-01-12 18:12:22', 2, 4),
(4, '2025-01-12 18:12:26', 2, 4),
(6, '2025-01-21 15:40:06', 4, 4),
(7, '2025-01-21 15:41:32', 4, 4),
(8, '2025-01-24 12:21:36', 1, 4),
(9, '2025-01-24 12:22:20', 1, 4),
(10, '2025-01-24 12:24:27', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `docname` varchar(250) DEFAULT NULL,
  `nurse1name` varchar(250) DEFAULT NULL,
  `nurse2name` varchar(250) DEFAULT NULL,
  `wardnumb` int(11) DEFAULT NULL,
  `shifttiming` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`docname`, `nurse1name`, `nurse2name`, `wardnumb`, `shifttiming`) VALUES
('anas', 'amna', 'tehmeen', 1, 'Morning Shift: 8:00 AM - 2:00 PM'),
('tooba', 'amna', 'iftikhar', 2, 'Night Shift: 8:00 PM - 8:00 AM '),
('tooba', 'amna', '', 4, 'Afternoon Shift: 2:00 PM - 8:00 PM');

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `numb` int(11) NOT NULL,
  `wtype` varchar(250) DEFAULT NULL,
  `noofbeds` int(11) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ward`
--

INSERT INTO `ward` (`numb`, `wtype`, `noofbeds`, `floor`) VALUES
(1, 'general', 5, 2),
(2, 'general', 5, 2),
(3, 'general', 5, 3),
(4, 'general', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wbill`
--

CREATE TABLE `wbill` (
  `patientname` varchar(250) NOT NULL,
  `appointmentid` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `datt` date DEFAULT NULL,
  `ward` varchar(250) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `perdayamount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wbill`
--

INSERT INTO `wbill` (`patientname`, `appointmentid`, `amount`, `datt`, `ward`, `days`, `perdayamount`) VALUES
('amna', 3, 10000, '2024-12-31', 'GENERAL', 5, 2000),
('amna', 3, 10000, '2024-12-31', 'GENERAL', 5, 2000),
('amna', 3, 10000, '2024-12-31', 'GENERAL', 5, 2000),
('amna', 3, 2500, '2024-12-31', 'GENERAL', 5, 500),
('amna', 3, 10000, '2024-12-31', 'GENERAL', 5, 2000);

--
-- Triggers `wbill`
--
DELIMITER $$
CREATE TRIGGER `generateamount` BEFORE INSERT ON `wbill` FOR EACH ROW begin
set new.amount=new.days*new.perdayamount;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `wbill_final`
--

CREATE TABLE `wbill_final` (
  `patientname` varchar(250) NOT NULL,
  `reserveid` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `datt` date DEFAULT NULL,
  `ward` varchar(250) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `perdayamount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wbill_final`
--

INSERT INTO `wbill_final` (`patientname`, `reserveid`, `amount`, `datt`, `ward`, `days`, `perdayamount`) VALUES
('amna', 3, NULL, '2024-12-31', 'GENERAL', 5, 2000),
('tom', 4, 10000, '2024-12-31', 'GENERAL', 5, 2000),
('altaf', 3, 1500, '2024-12-31', 'GENERAL', 3, 500),
('altaf', 3, 1500, '2024-12-31', 'GENERAL', 3, 500),
('altaf', 3, 12000, '2024-12-31', 'GENERAL', 6, 2000);

--
-- Triggers `wbill_final`
--
DELIMITER $$
CREATE TRIGGER `generateamount2` BEFORE INSERT ON `wbill_final` FOR EACH ROW begin
set new.amount=new.days*new.perdayamount;
end
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`),
  ADD KEY `appointment_ibfk_1` (`docid`),
  ADD KEY `appointment_ibfk_2` (`pid`);

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bednumb`,`wardnumb`),
  ADD KEY `wardnumb` (`wardnumb`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `createbill`
--
ALTER TABLE `createbill`
  ADD KEY `appid` (`appid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `doc_id` (`doc_id`);

--
-- Indexes for table `patient2`
--
ALTER TABLE `patient2`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `dcid_fk` (`dcid`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `bednumb` (`bednumb`,`wardnumb`);

--
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`numb`);

--
-- Indexes for table `wbill`
--
ALTER TABLE `wbill`
  ADD KEY `fk_wbill` (`appointmentid`);

--
-- Indexes for table `wbill_final`
--
ALTER TABLE `wbill_final`
  ADD KEY `reserveid` (`reserveid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patient2`
--
ALTER TABLE `patient2`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`docid`) REFERENCES `doctor` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `patient2` (`pid`) ON DELETE SET NULL;

--
-- Constraints for table `bed`
--
ALTER TABLE `bed`
  ADD CONSTRAINT `bed_ibfk_1` FOREIGN KEY (`wardnumb`) REFERENCES `ward` (`numb`) ON DELETE NO ACTION,
  ADD CONSTRAINT `bed_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient2` (`pid`) ON DELETE NO ACTION;

--
-- Constraints for table `createbill`
--
ALTER TABLE `createbill`
  ADD CONSTRAINT `createbill_ibfk_1` FOREIGN KEY (`appid`) REFERENCES `appointment` (`appointmentid`);

--
-- Constraints for table `patient2`
--
ALTER TABLE `patient2`
  ADD CONSTRAINT `dcid_fk` FOREIGN KEY (`dcid`) REFERENCES `doctor` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`bednumb`,`wardnumb`) REFERENCES `bed` (`bednumb`, `wardnumb`) ON DELETE NO ACTION;

--
-- Constraints for table `wbill`
--
ALTER TABLE `wbill`
  ADD CONSTRAINT `fk_wbill` FOREIGN KEY (`appointmentid`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `wbill_final`
--
ALTER TABLE `wbill_final`
  ADD CONSTRAINT `wbill_final_ibfk_1` FOREIGN KEY (`reserveid`) REFERENCES `reservation` (`reservation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
