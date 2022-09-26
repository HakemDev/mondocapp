-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le : Dim 12 déc. 2021 à 17:26
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cabinet_medicale`
--
DROP DATABASE IF EXISTS cabinet_medicale;
CREATE DATABASE cabinet_medicale;
USE cabinet_medicale;
-- --------------------------------------------------------

--
-- Structure de la table `announce`
--

DROP TABLE IF EXISTS `announce`;
CREATE TABLE IF NOT EXISTS `announce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) NOT NULL,
  `heure` time NOT NULL,
  `mas` varchar(30) NOT NULL,
  `date_creation` date NOT NULL,
  `observation` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `salle_attente`
--

DROP TABLE IF EXISTS `salle_attente`;
CREATE TABLE IF NOT EXISTS `salle_attente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cin` varchar(30) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `heure` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `certificat`
--

DROP TABLE IF EXISTS `certificat`;
CREATE TABLE IF NOT EXISTS `certificat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` date NOT NULL,
  `date_naissance` date NOT NULL,
  `type` varchar(50) NOT NULL,
  `cin` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `repos` int(5) NOT NULL,
  `id_patientt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `par_ind` (`id_patientt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

DROP TABLE IF EXISTS `dossier`;
CREATE TABLE IF NOT EXISTS `dossier` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `date_visite` date NOT NULL,
  `diagnostic` varchar(200) NOT NULL,
  `conclusion_exam` varchar(200) NOT NULL,
  `antecendants` varchar(200) NOT NULL,
  `motif` varchar(50) NOT NULL,
  `exem_clinique` varchar(200) NOT NULL,
  `id_patientt` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `par_ind` (`id_patientt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  `remarque` varchar(250) NOT NULL,
  `id_ordonance` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `par_ind` (`id_ordonance`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ordonance`
--

DROP TABLE IF EXISTS `ordonance`;
CREATE TABLE IF NOT EXISTS `ordonance` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `date_creat` date NOT NULL,
  `id_patientt` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `par_ind` (`id_patientt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--


-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous`
--

DROP TABLE IF EXISTS `rendez_vous`;
CREATE TABLE IF NOT EXISTS `rendez_vous` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `label` varchar(40) NOT NULL,
  `date_rendez` date NOT NULL,
  `date_creat` date NOT NULL,
  `horarire` time NOT NULL,
  `num_rendez` int(2) NOT NULL,
  `hor_nam` varchar(50) NOT NULL,
  `observation` varchar(100) NOT NULL,
  `id_patientt` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `par_ind` (`id_patientt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------

DROP TABLE IF EXISTS `raporter`;
CREATE TABLE IF NOT EXISTS `raporter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cin` varchar(10) NOT NULL,
  `nom` varchar(20) NOT NULL, 
  `prenom` varchar(15) NOT NULL,
  `date_rendez` date NOT NULL,
  `tel` int(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
-- --------------------------------------------------

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id_patient` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) default 0,
  `cin` varchar(10) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `address` varchar(300) NOT NULL,
  `ville` varchar(20) NOT NULL,
  `prenom` varchar(15) NOT NULL,
  `date_nes` date NOT NULL,
  `mdp` varchar(20) NOT NULL,
  `tel` int(6) NOT NULL,
  `zipcode` int(6) NOT NULL,
  `takemed` varchar(20) NOT NULL,
  `poids` double NOT NULL,
  `taille` double DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `medecament` varchar(50) NOT NULL,	
  PRIMARY KEY (`id_patient`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id_patient`,`cin`,`nom`,`address`,`ville`,`prenom`,`date_nes`,`mdp`,`tel`,`zipcode`,`takemed`,`poids`,`taille`,`sex`,`email`,`medecament` ) VALUES (2,'J54169','Hakem','rue el houda','Agadir','Hamza','1999-10-13','1234',672209816,0,'',70,170,'H','hamzahakem78@gmail.com','');
INSERT INTO `patient` (`id_patient`,`cin`,`nom`,`address`,`ville`,`prenom`,`date_nes`,`mdp`,`tel`,`zipcode`,`takemed`,`poids`,`taille`,`sex`,`email`,`medecament` )VALUES (3,'j4444','Hakem','Dcheira','Agadir','Saad','2003-10-10','acab',672209816,0,'',56,183,'H','saadhakem78@gmail.com','');



-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `certificat`
--
ALTER TABLE `certificat`
  ADD CONSTRAINT `certificat_ibfk_1` FOREIGN KEY (`id_patientt`) REFERENCES `patient` (`id_patient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `dossier`
--
ALTER TABLE `dossier`
  ADD CONSTRAINT `dossier_ibfk_1` FOREIGN KEY (`id_patientt`) REFERENCES `patient` (`id_patient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD CONSTRAINT `medicament_ibfk_1` FOREIGN KEY (`id_ordonance`) REFERENCES `ordonance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ordonance`
--
ALTER TABLE `ordonance`
  ADD CONSTRAINT `ordonance_ibfk_1` FOREIGN KEY (`id_patientt`) REFERENCES `patient` (`id_patient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD CONSTRAINT `rendez_vous_ibfk_1` FOREIGN KEY (`id_patientt`) REFERENCES `patient` (`id_patient`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO `announce` (`id`,`libelle`,`heure`,`mas`,`date_creation`,`observation`,`message`) VALUES (1,'Jour Férier','12:12:12','dsd','2021-12-13','n\'oublier pas que le docteur n\'est pas présente dans tous les cas','le cabinet n\'est pas ouvert le 03/12/2021 a cause du jour férier');
INSERT INTO `announce` (`id`,`libelle`,`heure`,`mas`,`date_creation`,`observation`,`message`) VALUES (2,'Rendez-vous','12:12:12','dd','2021-10-15','je vais rappeler dans votre numero pour changer votre Rendez-vous','pour les gens qui ont un Rendez-vous le 03/12/2021 matin, le docteur est pas disponible');
INSERT INTO `announce` (`id`,`libelle`,`heure`,`mas`,`date_creation`,`observation`,`message`) VALUES (3,'Choisir votre docteur','12:12:12','dz','2021-09-02','n\'oublier pas que vous pouvez nous appelons par notre numero whatsapp et fix','Bonjour je vous informer que D.Laraki ne peut pas étre disponible le 03/12/2021 mais il va etre remplacé par D.labidi. si vous voulez changer votre rendez-vous contacter nous.');
INSERT INTO `announce` (`id`,`libelle`,`heure`,`mas`,`date_creation`,`observation`,`message`) VALUES (4,'Jour Férier','12:12:12','dsd','2021-12-13','n\'oublier pas que le docteur n\'est pas présente dans tous les cas','le cabinet n\'est pas ouvert le 03/12/2021 a cause du jour férier');
INSERT INTO `announce` (`id`,`libelle`,`heure`,`mas`,`date_creation`,`observation`,`message`) VALUES (5,'Rendez-vous','12:12:12','dd','2021-10-15','je vais rappeler dans votre numero pour changer votre Rendez-vous','pour les gens qui ont un Rendez-vous le 03/12/2021 matin, le docteur est pas disponible');
INSERT INTO `announce` (`id`,`libelle`,`heure`,`mas`,`date_creation`,`observation`,`message`) VALUES (6,'Choisir votre docteur','12:12:12','dz','2021-09-02','n\'oublier pas que vous pouvez nous appelons par notre numero whatsapp et fix','Bonjour je vous informer que D.Laraki ne peut pas étre disponible le 03/12/2021 mais il va etre remplacé par D.labidi. si vous voulez changer votre rendez-vous contacter nous.');

INSERT INTO `ordonance` (`id`,`date_creat`,`id_patientt`) VALUES (2,'2021-12-01',2);
INSERT INTO `ordonance` (`id`,`date_creat`,`id_patientt`) VALUES (3,'2021-12-13',2);
INSERT INTO `ordonance` (`id`,`date_creat`,`id_patientt`) VALUES (4,'2021-12-01',3);
INSERT INTO `ordonance` (`id`,`date_creat`,`id_patientt`) VALUES (5,'2021-12-13',3);

INSERT INTO `medicament` (`id`,`libelle`,`remarque`,`id_ordonance`) VALUES (2,'Glucophage 500mg','1piece/jour',2);
INSERT INTO `medicament` (`id`,`libelle`,`remarque`,`id_ordonance`) VALUES (3,'sitagliptine','2pieces/jour\r\n',2);
INSERT INTO `medicament` (`id`,`libelle`,`remarque`,`id_ordonance`) VALUES (4,'Xenical 120mg','1piece/jour',2);
INSERT INTO `medicament` (`id`,`libelle`,`remarque`,`id_ordonance`) VALUES (5,'Supradyne 50mg','1piece/jour',3);
INSERT INTO `medicament` (`id`,`libelle`,`remarque`,`id_ordonance`) VALUES (6,'Glucophage 500mg','1piece/jour',4);
INSERT INTO `medicament` (`id`,`libelle`,`remarque`,`id_ordonance`) VALUES (7,'sitagliptine','2pieces/jour',4);
INSERT INTO `medicament` (`id`,`libelle`,`remarque`,`id_ordonance`) VALUES (8,'Supradyne 50mg','1piece/jour',5);

INSERT INTO `rendez_vous` (`id`,`label`,`date_rendez`,`date_creat`,`horarire`,`num_rendez`,`hor_nam`,`observation`,`id_patientt`) VALUES (2,'Visite Medicale','2021-12-13','2021-12-02','11:00:57',1,'matin','n\'oublier pas que le docteur n\'est pas présente aprés midi',2);
INSERT INTO `rendez_vous` (`id`,`label`,`date_rendez`,`date_creat`,`horarire`,`num_rendez`,`hor_nam`,`observation`,`id_patientt`) VALUES (3,'Visite Medicale','2021-11-03','2021-12-14','17:00:57',2,'soir','',2);
INSERT INTO `rendez_vous` (`id`,`label`,`date_rendez`,`date_creat`,`horarire`,`num_rendez`,`hor_nam`,`observation`,`id_patientt`) VALUES (4,'test','2021-12-01','2021-12-01','14:15:03',1,'matin','',2);
INSERT INTO `rendez_vous` (`id`,`label`,`date_rendez`,`date_creat`,`horarire`,`num_rendez`,`hor_nam`,`observation`,`id_patientt`) VALUES (12,'Visite Medicale','2021-12-13','2021-12-02','11:00:57',1,'matin','n\'oublier pas que le docteur n\'est pas présente aprés midi',3);
INSERT INTO `rendez_vous` (`id`,`label`,`date_rendez`,`date_creat`,`horarire`,`num_rendez`,`hor_nam`,`observation`,`id_patientt`) VALUES (13,'Visite Medicale','2021-11-03','2021-12-14','17:00:57',2,'soir','  ',3);
INSERT INTO `rendez_vous` (`id`,`label`,`date_rendez`,`date_creat`,`horarire`,`num_rendez`,`hor_nam`,`observation`,`id_patientt`) VALUES (14,'test','2021-12-01','2021-12-01','14:15:03',1,'matin','n\'oublier pas que le docteur n\'est pas présente aprés midi',3);

INSERT INTO `cabinet_medicale`.`user` (`id`, `mail`, `mdp`, `role`) VALUES ('1', 'secre@gmail.com', 'abc', 's');
INSERT INTO `cabinet_medicale`.`user` (`id`, `mail`, `mdp`, `role`) VALUES ('2', 'doc@gmail.com', 'wxz', 'd');


INSERT INTO `certificat` (`id`,`date_creation`,`date_naissance`,`type`,`cin`,`nom`,`prenom`,`repos`,`id_patientt`) VALUES (2,'2021-12-30','2000-04-25','certificatRepos','j547733','kahem','hajar',7,2);
INSERT INTO `certificat` (`id`,`date_creation`,`date_naissance`,`type`,`cin`,`nom`,`prenom`,`repos`,`id_patientt`) VALUES (3,'2021-12-22','2000-04-25','certificatActivite','j547733','kahem','hajar',30,2);
INSERT INTO `certificat` (`id`,`date_creation`,`date_naissance`,`type`,`cin`,`nom`,`prenom`,`repos`,`id_patientt`) VALUES (4,'2021-12-31','2000-04-25','certificatActivite','j547733','kahem','hajar',30,2);
INSERT INTO `certificat` (`id`,`date_creation`,`date_naissance`,`type`,`cin`,`nom`,`prenom`,`repos`,`id_patientt`) VALUES (5,'2021-12-31','2000-04-25','certificatRepos','j547733','kahem','hajar',7,2);
INSERT INTO `certificat` (`id`,`date_creation`,`date_naissance`,`type`,`cin`,`nom`,`prenom`,`repos`,`id_patientt`) VALUES (6,'2022-01-01','2000-04-25','certificatRepos','j547733','ennaji','ghita',12,2);
INSERT INTO `certificat` (`id`,`date_creation`,`date_naissance`,`type`,`cin`,`nom`,`prenom`,`repos`,`id_patientt`) VALUES (7,'2022-01-01','2000-04-25','certificatRepos','j547733','ennaji','ghita',15,2);

INSERT INTO `salle_attente` (`id`,`cin`,`nom`,`prenom`,`heure`) VALUES (2,'J54169','Hakem','Hamza','9h00');
INSERT INTO `salle_attente` (`id`,`cin`,`nom`,`prenom`,`heure`) VALUES (3,'J47158','Hakem','Saad','9h45');


INSERT INTO `cabinet_medicale`.`raporter` (`id`, `cin`, `nom`, `prenom`, `date_rendez`, `tel`, `email`) VALUES ('1', 'J54169', 'Hakem', 'Hamza', '2022-10-10', '0672209816', 'hamzahakem78@gmail.com');
INSERT INTO `cabinet_medicale`.`raporter` (`id`, `cin`, `nom`, `prenom`, `date_rendez`, `tel`, `email`) VALUES ('2', 'j4444', 'Hakem', 'Saad', '2022-10-10', '0678214826', 'saad@gmail.com');


INSERT INTO `dossier` (`id`,`date_visite`,`diagnostic`,`conclusion_exam`,`antecendants`,`motif`,`exem_clinique`,`id_patientt`) VALUES (2,'2021-12-01','d\'aprés l\'examen clinique on peur dire que vous étes diabétique,et méme aussi par des signes corporelles comme les infections, les ulcères de pied et de jambe.','d\'aprés l\'examen clinique on peur dire que vous étes diabétique,et méme aussi par des signes corporelles comme les infections, les ulcères de pied et de jambe.','aa','Diabète','Le dosage sanguin de l\'hémoglobine glyquée',2);
INSERT INTO `dossier` (`id`,`date_visite`,`diagnostic`,`conclusion_exam`,`antecendants`,`motif`,`exem_clinique`,`id_patientt`) VALUES (3,'2021-12-13','d\'aprés les observation des symptome connu par se maladie comme: \'douleurs dans tout le corp\', \'fatigue chronique\'.','Il n\'existe pas','aa','maladie','fibromyalgie',2);
INSERT INTO `dossier` (`id`,`date_visite`,`diagnostic`,`conclusion_exam`,`antecendants`,`motif`,`exem_clinique`,`id_patientt`) VALUES (4,'2021-12-01','d\'aprés l\'examen clinique on peur dire que vous étes diabétique,et méme aussi par des signes corporelles comme les infections, les ulcères de pied et de jambe.','d\'aprés l\'examen clinique on peur dire que vous étes diabétique,et méme aussi par des signes corporelles comme les infections, les ulcères de pied et de jambe.','aa','Diabète','Le dosage sanguin de l\'hémoglobine glyquée',3);
INSERT INTO `cabinet_medicale`.`dossier` (`date_visite`, `diagnostic`, `conclusion_exam`, `antecendants`, `motif`, `exem_clinique`, `id_patientt`) VALUES ('2021-12-13', 'd\'aprés les observation des symptome connu par se maladie comme: \'douleurs dans tout le corp\', \'fatigue chronique\'.', 'Il n\'existe pas', 'aa', 'maladie', 'fibromyalgie', '3');
