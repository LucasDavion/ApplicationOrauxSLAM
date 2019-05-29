-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 29 mai 2019 à 12:47
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bd_gesoraux`
--

-- --------------------------------------------------------

--
-- Structure de la table `choixprofdemijournee`
--

DROP TABLE IF EXISTS `choixprofdemijournee`;
CREATE TABLE IF NOT EXISTS `choixprofdemijournee` (
  `idUtilisateur` int(11) NOT NULL,
  `idDemiJournee` int(11) NOT NULL,
  `idSalle` int(11) NOT NULL,
  PRIMARY KEY (`idUtilisateur`,`idDemiJournee`),
  KEY `choixProfDemiJournee_DemiJournee1_FK` (`idDemiJournee`),
  KEY `choixProfDemiJournee_Salle2_FK` (`idSalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `choixprofdemijournee`
--

INSERT INTO `choixprofdemijournee` (`idUtilisateur`, `idDemiJournee`, `idSalle`) VALUES
(10, 2, 2),
(10, 3, 2),
(10, 10, 2),
(1, 1, 3),
(1, 2, 3),
(1, 4, 3),
(10, 9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `civilite`
--

DROP TABLE IF EXISTS `civilite`;
CREATE TABLE IF NOT EXISTS `civilite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `code` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `civilite`
--

INSERT INTO `civilite` (`id`, `libelle`, `code`) VALUES
(1, 'Monsieur', 'M.'),
(2, 'Madame', 'Mme'),
(3, 'Autre', 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `demijournee`
--

DROP TABLE IF EXISTS `demijournee`;
CREATE TABLE IF NOT EXISTS `demijournee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `matinAprem` char(13) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `demijournee`
--

INSERT INTO `demijournee` (`id`, `date`, `matinAprem`) VALUES
(1, '2019-06-03', 'matin'),
(2, '2019-06-03', 'après-midi'),
(3, '2019-06-04', 'matin'),
(4, '2019-06-04', 'après-midi'),
(5, '2019-06-05', 'matin'),
(6, '2019-06-05', 'après-midi'),
(7, '2019-06-06', 'matin'),
(8, '2019-06-06', 'après-midi'),
(9, '2019-06-07', 'matin'),
(10, '2019-06-07', 'après-midi');

-- --------------------------------------------------------

--
-- Structure de la table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
CREATE TABLE IF NOT EXISTS `discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `discipline`
--

INSERT INTO `discipline` (`id`, `libelle`) VALUES
(1, 'Anglais'),
(2, 'Espagnol'),
(3, 'Allemand'),
(4, 'Italien');

-- --------------------------------------------------------

--
-- Structure de la table `division`
--

DROP TABLE IF EXISTS `division`;
CREATE TABLE IF NOT EXISTS `division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `division`
--

INSERT INTO `division` (`id`, `libelle`) VALUES
(1, 'TS1'),
(2, 'TS2'),
(3, 'TS3'),
(4, 'TS4'),
(5, 'TS5'),
(6, 'TES1'),
(7, 'TES2'),
(8, 'TES3');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `dateNaissance` date DEFAULT NULL,
  `tiersTempsON` char(1) NOT NULL,
  `idCivilite` int(11) NOT NULL,
  `idSection` int(11) DEFAULT NULL,
  `idDivision` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Eleve_Civilite0_FK` (`idCivilite`),
  KEY `Eleve_Section1_FK` (`idSection`),
  KEY `Eleve_Division2_FK` (`idDivision`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id`, `nom`, `prenom`, `dateNaissance`, `tiersTempsON`, `idCivilite`, `idSection`, `idDivision`) VALUES
(8, 'AZAM', 'ALICE LOU CHARLOTTE', '2001-09-13', 'N', 2, 2, 1),
(9, 'BABEL', 'EMINA BETTY RUKIJA', '2001-06-29', 'N', 2, NULL, 6),
(10, 'BACHELIER', 'MARINE MANON', '2001-07-29', 'N', 2, 1, 4),
(11, 'BAGUET', 'YLAN FLORIAN', '2000-02-06', 'N', 1, NULL, 2),
(12, 'BEAUDAN', 'MATHEO PIERRE BARTHELEMY', '2001-04-27', 'N', 1, 1, 4),
(13, 'BECQ WOIRHAYE', 'JULES FRANCOIS LOUIS', '2001-05-03', 'O', 1, 1, 3),
(14, 'BELKACI', 'ALIENOR NATACHA SOFIA', '2001-04-10', 'N', 2, 1, 6),
(15, 'BERGERON', 'THEO LEENDERT JEAN-CLAUDE', '2001-02-09', 'N', 1, NULL, 7),
(16, 'BESLAY', 'LOUIS', '2000-09-27', 'N', 1, NULL, 1),
(17, 'BETAILLE', 'MAXIMILIEN CHARLES', '2001-09-24', 'N', 1, NULL, 1),
(18, 'BETHMONT', 'ALEXANDRE NICOLAS MORGAN', '2001-07-23', 'N', 1, NULL, 7),
(19, 'BILDIRAN', 'YUNUSAY', '2001-05-28', 'N', 2, NULL, 8),
(20, 'BIOT', 'THOMAS', '2001-01-26', 'N', 1, NULL, 3),
(21, 'BLAISE', 'ARTHUR', '2001-02-28', 'N', 1, 1, 5),
(22, 'BLERREAU', 'FLAVIE JADE VICTORIA', '2001-11-02', 'N', 2, 1, 6),
(23, 'BOUILLE', 'ESTELLE CAMILLE', '2001-10-21', 'N', 2, 1, 3),
(24, 'BOURSIER', 'SARAH MARTINE', '2001-02-01', 'N', 2, NULL, 7),
(25, 'BOURZIZA', 'YASMINE', '2001-04-20', 'N', 2, NULL, 3),
(26, 'BOUTRON', 'EVE EMMA CLAIRE', '2001-05-31', 'N', 2, 1, 4),
(27, 'BRETAUDEAU', 'CHLOE AUDE JULIE', '2001-04-03', 'N', 2, 1, 6),
(28, 'BRETON', 'GAELLE', '2001-04-30', 'N', 2, NULL, 7),
(29, 'BRIDE-BORGETTO', 'JOAN WILLIAM OLIVIER', '2000-06-13', 'O', 1, NULL, 7),
(30, 'BUREAU', 'NILS BERNARD PIERRE', '2001-04-07', 'N', 1, 1, 5),
(31, 'CAHUZAC', 'IAN CHRISTOPHER', '2001-03-20', 'N', 1, 2, 1),
(32, 'CAILLOT', 'EMMA ANDREE COLETTE', '2001-06-21', 'N', 2, NULL, 7),
(33, 'CARRET', 'ALEXIA CHLOE ANNE', '2001-11-19', 'N', 2, 2, 1),
(34, 'CARRIE', 'MARTIN ADRIEN LOUIS', '2001-08-03', 'N', 1, 1, 2),
(35, 'CASTANO', 'CHLOE MARGOT', '2001-06-22', 'N', 2, NULL, 1),
(36, 'CASTRO OLIVEIRA', 'CHLOE', '2001-02-25', 'O', 2, NULL, 7),
(37, 'CAZET', 'CLARA MARION', '2001-12-16', 'N', 2, 1, 3),
(38, 'CHALENCON', 'LEA MARIE PIERRETTE', '2001-05-28', 'N', 2, 1, 4),
(39, 'CHAMPION', 'QUENTIN HUGO', '2001-07-08', 'N', 1, NULL, 5),
(40, 'CHARON', 'MATHILDE CAROLINE AMELINE', '2001-02-15', 'N', 2, 1, 6),
(41, 'CHAVE', 'MADELEINE DOMINIQUE ANNIE', '2001-09-14', 'N', 2, NULL, 6),
(42, 'CIETERS', 'LESLIE FREDERIQUE CATHERI', '2001-08-14', 'N', 2, NULL, 3),
(43, 'CLAIR', 'LENA CHLOE LMIARA', '2001-10-18', 'N', 2, 1, 5),
(44, 'CLOAREC', 'CORENTIN PASCAL CLEMENT', '2002-08-07', 'N', 1, NULL, 5),
(45, 'COLLETTE', 'VICTOR JEAN MARIE', '2001-04-19', 'N', 1, NULL, 7),
(46, 'COLMAIRE', 'SARAH BENEDICTE', '2001-05-29', 'N', 2, NULL, 4),
(47, 'COSSIN', 'MAXIME BAPTISTE THOMAS', '2001-04-18', 'N', 1, NULL, 2),
(48, 'COUDRAY', 'CHLOE EMMY TIPHAINE', '2001-11-15', 'N', 2, 1, 3),
(49, 'COUVELARD', 'CELIA', '2001-10-23', 'N', 2, NULL, 7),
(50, 'COUVIDOU', 'GUILLAUME CHRISTIAN', '2001-07-20', 'N', 1, NULL, 4),
(51, 'CRETTEUR', 'MARTIN FRANCOIS', '2001-09-29', 'N', 1, 1, 3),
(52, 'CROZAT', 'JUSTINE CAROLINE LOUISE', '2000-04-30', 'N', 2, NULL, 7),
(53, 'CUNY', 'ANATOLE LUDOVIC JACQUES', '2001-09-15', 'N', 1, 1, 5),
(54, 'D\'ARTAGNAN', 'ANNE-SOPHIE DELPHINE', '2001-03-14', 'N', 2, NULL, 8),
(55, 'DE PAULA', 'DANIEL RUI', '2001-12-11', 'N', 1, 1, 2),
(56, 'DE WAELE', 'BENJAMIN', '2001-08-14', 'N', 1, NULL, 5),
(57, 'DEBRIL', 'GUILLAUME CORENTIN', '2002-01-06', 'N', 1, 1, 2),
(58, 'DECLERCQ', 'DORIANE ALINE DANAE', '2001-01-02', 'N', 2, NULL, 5),
(59, 'DEDENYS', 'CLOE FANNY CAMILLE', '2001-05-23', 'N', 2, NULL, 2),
(60, 'DELAROCHE', 'ANDREA', '2002-10-14', 'N', 1, NULL, 7),
(61, 'DELOBEL', 'ELLIOT REGINALD', '2001-12-03', 'N', 1, 1, 5),
(62, 'DELPLACE', 'MATHILDE', '2001-03-04', 'N', 2, NULL, 7),
(63, 'DEPREZ', 'SARA ANITA CECILE', '2001-05-25', 'N', 2, NULL, 7),
(64, 'DESMETTRE', 'ELSA', '2001-12-22', 'N', 2, 1, 6),
(65, 'DESPRES', 'BAPTISTE CLAUDE', '2001-01-22', 'N', 1, 1, 6),
(66, 'DESVIGNES', 'MARGUERITE EMMA', '2001-08-08', 'N', 2, 2, 1),
(67, 'DEULIN', 'KILLIAN', '1999-10-28', 'N', 1, NULL, 1),
(68, 'DIAS', 'DILARA', '2001-10-17', 'N', 2, NULL, 1),
(69, 'DION', 'ARTHUR', '2001-04-07', 'N', 1, 1, 3),
(70, 'DIOP', 'DJIBRIL', '2001-01-27', 'N', 1, NULL, 8),
(71, 'DOMART', 'FLORA HAI CHAO', '2001-12-28', 'N', 2, 1, 3),
(72, 'DREUE', 'FLORIAN FRANCOIS MAURICE', '2001-02-13', 'N', 1, NULL, 1),
(73, 'DUBERNARD', 'HELENE CAMILLE', '2001-12-23', 'N', 2, 1, 4),
(74, 'DUBOCAGE', 'MARIA', '2000-10-01', 'N', 2, 1, 6),
(75, 'DUBOIS', 'GUILLAUME NATHAN', '2001-12-17', 'N', 1, 1, 4),
(76, 'DUBOIS', 'THOMAS THIERRY', '2001-05-11', 'N', 1, NULL, 7),
(77, 'DUCHAUX', 'MANON SYLVIANE ELIANE', '2001-06-10', 'O', 2, NULL, 2),
(78, 'DUCRET', 'ENZO MICHEL SYLVAIN', '2000-09-08', 'N', 1, NULL, 8),
(79, 'DUFRENNE', 'LEANA LUCIE MARIE', '2001-08-21', 'N', 2, 1, 3),
(80, 'DUPLESSI', 'PAUL THOMAS', '2001-01-09', 'N', 1, NULL, 2),
(81, 'DUTEIL', 'MARCUS ALBERT', '2001-01-12', 'N', 1, NULL, 2),
(82, 'DUVAL', 'LAURIE ALEXIA', '2001-07-24', 'N', 2, NULL, 2),
(83, 'ECK', 'ROMAIN', '2001-07-06', 'N', 1, NULL, 3),
(84, 'EL RHARBI', 'NADIA', '2001-09-09', 'N', 2, NULL, 3),
(85, 'ELOY', 'MAUD LOLITA RENEE', '2001-02-23', 'N', 2, NULL, 4),
(86, 'FACE', 'CHRISTA', '2000-04-29', 'N', 2, NULL, 3),
(87, 'FALICON', 'TATIANA ARLETTE EVELYNE', '2001-05-22', 'N', 2, NULL, 1),
(88, 'FARRUGIA', 'MATTHIEU THOMAS', '2001-03-06', 'N', 1, 1, 5),
(89, 'FAURE', 'CLEMENTINE', '2001-04-15', 'N', 2, 2, 1),
(90, 'FAVIER', 'ALEXANDRA CHANTAL MARTINE', '2001-07-11', 'N', 2, NULL, 7),
(91, 'FERNANDES', 'EVA ELODIE VERONIQUE', '2000-12-10', 'N', 2, NULL, 2),
(92, 'FERRE', 'BATISTE ROLAND', '2002-03-21', 'N', 1, 1, 5),
(93, 'FOFANA', 'LAMINE', '2001-08-07', 'N', 1, NULL, 6),
(94, 'FONBONNE', 'JONATHAN DAVID MAURICE', '2000-09-07', 'N', 1, NULL, 4),
(95, 'FONTAINE', 'CLEMENCE DENISE LAURENCE', '2001-01-30', 'N', 2, 1, 3),
(96, 'FOREAU', 'GAUTHIER AXEL', '2001-12-08', 'N', 1, NULL, 2),
(97, 'FOUCHET', 'PAUL', '2000-10-09', 'N', 1, NULL, 2),
(98, 'FROGER', 'ROMAIN BLAISE', '2002-01-26', 'N', 1, 1, 4),
(99, 'GARCIA', 'CELINA BEATRIZ', '2001-09-12', 'N', 2, NULL, 3),
(100, 'GAUTHIER', 'COPPELIA CLARA', '2001-05-29', 'N', 2, 1, 4),
(101, 'GIBERT', 'LESLIE MICHAELLA', '2001-07-02', 'N', 2, NULL, 3),
(102, 'GILBERT', 'MALO FRANCOIS JEAN', '2001-04-13', 'N', 1, NULL, 8),
(103, 'GIRARD', 'MATHYS ROMAIN', '2001-04-13', 'N', 1, NULL, 1),
(104, 'GISSER', 'MARIE', '2001-06-13', 'N', 2, NULL, 3),
(105, 'GODARD', 'BASTIEN', '2001-04-01', 'N', 1, NULL, 7),
(106, 'GODFREY', 'OLIVIA HONOR', '2001-09-11', 'N', 2, 1, 6),
(107, 'GONIN', 'PIERRE MATHIEU', '2001-03-04', 'N', 1, 1, 4),
(108, 'GRATON', 'THOMAS CLAUDE ROLAND', '2001-01-31', 'N', 1, NULL, 7),
(109, 'GUEST', 'JULIE MARYVONNE GHISLAINE', '2001-01-15', 'N', 2, 1, 3),
(110, 'GUIBERT', 'CAMILLE CECILE MONIQUE', '2001-04-27', 'N', 2, NULL, 3),
(111, 'GUO', 'YIXIN', '2000-01-12', 'N', 2, NULL, 6),
(112, 'HADDAD', 'INES MONIQUE MESSAOUDA', '2001-08-07', 'N', 2, 1, 6),
(113, 'HAJIB', 'IHSSANE', '2001-08-29', 'N', 2, 1, 6),
(114, 'HARACHE', 'GAETAN JEAN-MARIE LUCAS', '2001-02-13', 'N', 1, NULL, 1),
(115, 'HARMER', 'SEBASTIEN DOUGLAS SERRIDG', '2000-10-26', 'N', 1, NULL, 1),
(116, 'HAUSSOULIER', 'LUCILE', '2001-04-24', 'N', 2, NULL, 7),
(117, 'HEBERT', 'ALICE MARIE LAURE', '2001-12-05', 'N', 2, 1, 6),
(118, 'HEDREVILLE', 'JOAQUIM LLOYD BENJAMIN', '2001-12-23', 'N', 1, 1, 5),
(119, 'HEME', 'ELSA EVE', '2001-08-29', 'N', 2, 2, 1),
(121, 'IATRINO', 'BENJAMIN DANIEL', '2001-04-21', 'N', 1, 1, 2),
(122, 'JACONELLI', 'THEO OCTAVE', '2001-12-11', 'O', 1, NULL, 1),
(123, 'JACQUEMET', 'MORGANE MYRIAM ANNICK', '2001-09-14', 'N', 2, NULL, 6),
(124, 'JACQUES', 'NICOLAS BERNARD ALFREDO', '2001-10-02', 'N', 1, 1, 3),
(125, 'JAOUEN', 'JULIA ANA ISABELLE', '2001-03-07', 'N', 2, 2, 1),
(126, 'JARRY', 'MARION THERESE MARIE', '2001-01-23', 'N', 2, NULL, 7),
(127, 'JARZAGUET', 'CLARA JULIETTE', '2001-02-12', 'N', 2, 1, 2),
(128, 'J\'DIR', 'MYRIAM', '2001-07-31', 'N', 2, NULL, 7),
(129, 'JEAN', 'OMBELINE MARIANNE NATHALI', '2001-07-02', 'N', 2, NULL, 5),
(130, 'JOUANJEAN', 'ASTRID CARINE SANDRINE', '2001-07-22', 'N', 2, NULL, 1),
(131, 'KADDOURI', 'ILHAM', '1999-10-09', 'N', 2, NULL, 1),
(132, 'KADDOURI', 'NOUREDDINE', '2001-05-29', 'N', 1, NULL, 2),
(133, 'KAFAIT', 'MAHNOOR', '2000-07-18', 'N', 2, NULL, 7),
(134, 'KERIOU', 'YLIES', '2001-10-31', 'N', 1, 1, 6),
(135, 'KERROC\'H', 'ANNA MORGANE MARITE', '2001-08-08', 'N', 2, 1, 5),
(136, 'LALOUM', 'WILLIAM ADAM CHARLY', '2001-11-14', 'N', 1, 1, 4),
(137, 'LAMBRET', 'MARGAUX JEANNE MARIE', '2002-01-22', 'N', 2, 1, 3),
(138, 'LAUNAY', 'NICOLAS JEAN-CLAUDE', '2001-12-23', 'N', 1, NULL, 1),
(139, 'LAURENT', 'CLEO JASMINE MARIE-JOSEE', '2001-02-27', 'O', 2, NULL, 2),
(140, 'LE GUILLY', 'ERWANN GERARD MICHEL', '2002-03-30', 'N', 1, 1, 4),
(142, 'LEBRUN', 'BENOITE PRISCILLA MARGUER', '2001-02-10', 'N', 2, 1, 6),
(143, 'LECLERC', 'HUGO CHARLES JEAN', '2001-03-04', 'N', 1, NULL, 2),
(144, 'LECLERE', 'LEOPOLD OLIVIER GERALD', '2001-04-08', 'N', 1, 1, 5),
(145, 'LEDOYEN', 'ALEXANDRE REGIS ANDRE', '2002-08-19', 'N', 1, 1, 6),
(146, 'LEGRAND', 'REBECCA DORINE', '2001-03-09', 'N', 2, NULL, 7),
(147, 'LEGRESY', 'CHLOE SANDRA', '2001-05-08', 'N', 2, NULL, 6),
(148, 'LEGROS', 'THEVA JACK LUCIEN', '1999-04-30', 'N', 1, NULL, 7),
(149, 'LELEUP', 'THEO', '2002-05-01', 'N', 1, 1, 4),
(150, 'LENOHIN', 'KEASY MARIE-LINDSAY MAYMO', '2001-06-14', 'N', 2, NULL, 1),
(151, 'LEON', 'MYLENE ILIANA PAOLINE', '2001-03-25', 'N', 2, 1, 3),
(152, 'LEROUX', 'ANTHONY', '2000-09-15', 'N', 1, NULL, 6),
(153, 'LESNARD', 'TANGUY LUCIEN JEAN', '2001-05-25', 'N', 1, 1, 5),
(154, 'LETANG', 'CONSTANCE ELISABETH GINET', '2001-03-15', 'N', 2, NULL, 6),
(155, 'L\'HEUREUX', 'HUGO ERIC FABRICE', '2002-01-19', 'N', 1, 1, 3),
(156, 'LINKES', 'FELICIA ODILE NICOLE', '2001-06-20', 'N', 2, NULL, 7),
(157, 'LOGEZ', 'LAURA JOSETTE BRIGITTE', '2001-06-18', 'N', 2, NULL, 8),
(158, 'LORIDAN', 'ROMANE MARTINE THERESE', '2001-06-13', 'N', 2, NULL, 5),
(159, 'LYON', 'RAPHAEL ALEXANDRE', '2001-03-03', 'N', 1, 1, 2),
(160, 'MAILLY', 'LUC CLAUDE PAUL', '2001-01-13', 'N', 1, NULL, 8),
(161, 'MALAPELLE', 'CLARA YVETTE JOSETTE', '2001-09-16', 'N', 2, NULL, 8),
(162, 'MARCEL', 'HUGO DENIS DANIEL', '2001-06-15', 'N', 1, 1, 5),
(163, 'MARIE', 'VIANNEY', '2001-10-02', 'N', 1, NULL, 2),
(164, 'MARTEL', 'LEA NICOLE DENISE', '2002-11-04', 'N', 2, 1, 6),
(165, 'MARTIN', 'THIBAULT MICHEL JEAN', '2001-09-03', 'N', 1, 1, 2),
(166, 'MARTINEZ', 'VINCENT ESTEBAN NATHAN', '2001-05-24', 'O', 1, NULL, 4),
(167, 'MAULVAULT', 'ALINE', '2001-01-06', 'N', 2, NULL, 3),
(168, 'MCAULEY', 'ZACHARY KOCH', '2001-05-11', 'N', 1, 2, 1),
(169, 'MEHTOUGUI', 'ACHRAF', '2001-09-18', 'N', 1, NULL, 2),
(170, 'MELLY', 'PAULINE', '2001-06-21', 'N', 2, NULL, 8),
(171, 'MENERET -SIMON', 'SOLENE SOLANGE JEANNETTE', '2001-12-06', 'N', 2, NULL, 8),
(172, 'MENOU', 'DIANE MONIQUE', '2001-08-28', 'N', 2, 1, 6),
(174, 'MICHEL', 'EMELINE DELPHINE', '2001-12-20', 'N', 2, NULL, 8),
(175, 'MIXTUR', 'MELVIN - ALLEN JOEL FRED', '2001-01-22', 'N', 1, NULL, 8),
(176, 'MOINET', 'EMILIE MADELEINE CECILE', '2000-12-04', 'N', 2, NULL, 8),
(177, 'MOLON', 'EVA RENEE SYLVIE', '2002-05-15', 'N', 2, NULL, 7),
(178, 'MONIER', 'ANTOINE VINCENT FRANCOIS-', '2001-01-05', 'N', 1, NULL, 2),
(179, 'MONRAISIN', 'ALEXI', '2001-10-16', 'N', 1, NULL, 8),
(180, 'MOUELLE MOUNGALA', 'ISMAEL', '2001-05-28', 'N', 1, NULL, 7),
(181, 'MOULIN', 'LOIS ROBIN', '2001-09-20', 'N', 1, 1, 2),
(182, 'NAYAR', 'LAVANYA ELEANOR KAUR', '2001-09-16', 'N', 2, 2, 1),
(183, 'NAYRAT', 'EMELINE', '2000-11-22', 'N', 2, NULL, 3),
(184, 'NGAINDJO', 'SERGE WILFRIED', '2001-08-30', 'N', 1, NULL, 7),
(185, 'NGAMI LIKIBI', 'DYLAN ARISTOTE MICHEL', '2001-03-27', 'N', 1, NULL, 8),
(186, 'NGUYEN', 'LUC HONG PHUC', '2001-02-24', 'N', 1, NULL, 4),
(187, 'NICOLAS', 'JULIEN CHRISTOPHER JOSE', '2001-05-26', 'N', 1, NULL, 1),
(188, 'OUSSELIM', 'ASMAA', '2000-12-22', 'N', 2, NULL, 6),
(189, 'PAIXAO', 'LUCA', '2001-05-05', 'N', 1, NULL, 8),
(190, 'PASTE DADONE', 'AXEL CLAUDE GUY', '2001-05-03', 'N', 1, NULL, 4),
(191, 'PAUCHET', 'JULIEN', '2001-08-16', 'N', 1, NULL, 4),
(192, 'PAUL', 'CARLA', '2001-04-20', 'N', 2, NULL, 3),
(193, 'PIETO', 'SIMON JEAN VICTOR', '2001-10-29', 'O', 1, NULL, 1),
(194, 'PIETRUSZKA', 'RAPHAEL HERY DENIS', '2001-11-07', 'N', 1, NULL, 8),
(195, 'POGAM', 'MARTIN PASCAL EMMANUEL', '2001-12-04', 'N', 1, 1, 2),
(196, 'PRAQUIN', 'FELIX MATHURIN PIERRE', '2001-06-28', 'N', 1, 1, 2),
(197, 'PUECH', 'JEREMY ALAIN ROBERT', '2001-04-12', 'N', 1, NULL, 8),
(198, 'QUARTERMAINE', 'LENA PERRINE', '2001-08-19', 'N', 2, 1, 2),
(199, 'RAZAC', 'VALENTIN PAUL JEAN', '2002-01-23', 'N', 1, 1, 3),
(200, 'REICHMAN', 'RAPHAEL EDGAR', '2001-08-22', 'N', 1, 1, 4),
(201, 'REMAZEILLES', 'ANAIS GENEVIEVE DENISE', '2001-01-17', 'N', 2, 1, 5),
(202, 'RENARD', 'EVA-DORINE MICHELE', '2000-08-03', 'N', 2, NULL, 7),
(203, 'RICHET', 'ELISA MARYVONNNE VERONIQU', '2002-01-19', 'N', 2, 2, 6),
(204, 'RIVRIN', 'ROMAIN KYLLIAN CLEMENT', '2001-09-27', 'N', 1, NULL, 7),
(205, 'ROSSO', 'CHIARA', '2001-06-08', 'O', 2, NULL, 2),
(206, 'ROUGEMONT', 'ELLIOTT', '2001-06-17', 'N', 1, NULL, 6),
(207, 'SALAUN', 'LOUISE-ANNE GABRIELLE JOS', '2001-09-07', 'N', 2, 1, 5),
(208, 'SAUVAGE', 'SOLENN ERIKA ALEXANDRA', '2001-03-19', 'N', 2, 1, 6),
(209, 'SAVELL-CONGREVE', 'HARRY JAMES', '2001-04-20', 'N', 1, NULL, 6),
(210, 'SCORNET', 'ILONA CHRISTELLE CAROLINE', '2001-02-01', 'N', 2, NULL, 8),
(211, 'SELLE', 'LEA JUSTINE', '2001-05-24', 'N', 2, 1, 2),
(212, 'SELMI', 'SOFIANE', '2001-05-28', 'N', 1, NULL, 6),
(213, 'SERCER', 'ALEXANDRE JEAN MARIE', '2000-10-26', 'O', 1, NULL, 8),
(214, 'SERRAI', 'EMMA', '2001-12-13', 'N', 2, NULL, 7),
(215, 'SERRANO', 'MATTEO GILBERT CLAUDE', '2001-06-13', 'N', 1, NULL, 4),
(216, 'SMAIL', 'AKSEL', '2001-12-06', 'O', 1, NULL, 3),
(217, 'SMAIL', 'LOUISE', '2001-12-06', 'N', 2, 1, 3),
(218, 'SOUMAH', 'NINA', '2001-04-29', 'N', 2, 1, 6),
(219, 'STEVENAZZI', 'CLARA LAURENCE', '2001-04-03', 'N', 2, NULL, 8),
(220, 'STOURBE', 'ALBAN MICHEL ROGER', '2001-10-04', 'N', 1, 1, 4),
(221, 'SWIDERSKI', 'MARINE SIMONE JOSIANE', '2000-04-19', 'N', 2, NULL, 2),
(222, 'SZPIRGLAS', 'FELIX', '2002-07-26', 'N', 1, 1, 4),
(223, 'TALIBART', 'MALO PIERRE-JEAN LAURENT', '2001-05-14', 'N', 1, 1, 5),
(224, 'TASSIN', 'MATTEO EYRIAN', '2001-06-05', 'N', 1, NULL, 8),
(225, 'TETU', 'MARYSE ROMAINE AIMEE', '2001-09-11', 'N', 2, NULL, 1),
(226, 'THILLOUX', 'CHLOE DENISE CATHERINE', '2001-05-04', 'N', 2, NULL, 7),
(227, 'THIOUB', 'KADIATA', '2001-07-02', 'N', 2, 2, 1),
(228, 'THUMARIN', 'JULIEN NICOLAS', '2002-08-25', 'N', 1, 1, 5),
(229, 'TOURAILLE', 'MAXENCE MICHEL ROGER', '2000-10-26', 'N', 1, NULL, 6),
(230, 'TOURE', 'LISA TAI', '2000-02-28', 'N', 2, NULL, 6),
(231, 'TOURNES-SAVRY', 'SACHA JEAN', '2003-02-03', 'N', 1, NULL, 1),
(232, 'TROALEN', 'GWENOLA CLAUDYE DANIELLE', '2001-08-10', 'N', 2, NULL, 7),
(233, 'VALERIO', 'ALICE JULIETTE', '2001-06-25', 'N', 2, 1, 3),
(234, 'VANDEKERCHOVE', 'VALENTIN CLEMENT STANISLA', '2001-01-12', 'N', 1, NULL, 3),
(235, 'VANDEKERCKHOVE', 'NINON ZOE MARIE', '2001-12-30', 'N', 2, NULL, 1),
(236, 'VANDERSPEETEN', 'THIBAUD JEAN-PAUL', '2001-08-11', 'N', 1, 1, 2),
(237, 'VAZ VIEIRA', 'PAULINE', '2000-12-21', 'O', 2, NULL, 7),
(238, 'VERNOUX-YAHMI', 'ELISA SELIHA LEILA', '2001-08-20', 'N', 2, NULL, 8),
(239, 'VIGNJEVIC', 'MILA', '2001-04-21', 'N', 2, 1, 5),
(240, 'VILLIERS', 'CLEMENT LAURENT JEAN-CLAU', '2001-05-14', 'N', 1, 1, 3),
(241, 'VIROT', 'AUDRAN', '2001-07-29', 'N', 1, NULL, 6),
(242, 'WYCZSANY', 'ILANA FRANCOISE LUCIENNE', '2001-01-19', 'N', 2, NULL, 2);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `elevespassantep`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `elevespassantep`;
CREATE TABLE IF NOT EXISTS `elevespassantep` (
`idE` int(11)
,`nomE` varchar(50)
,`prenomE` varchar(50)
,`divisionE` varchar(100)
,`salleE` varchar(5)
,`disciplineE` varchar(50)
,`epreuveE` varchar(50)
,`jourE` date
,`plagHoraireE` varchar(5)
,`dureeEpreuveE` int(11)
,`tiersTempsE` char(1)
,`idP` int(11)
,`nomP` varchar(50)
,`prenomP` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

DROP TABLE IF EXISTS `epreuve`;
CREATE TABLE IF NOT EXISTS `epreuve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDiscipline` int(11) NOT NULL,
  `idNatureEpreuve` int(11) DEFAULT NULL,
  `dureeEpreuve` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Epreuve_Discipline0_FK` (`idDiscipline`),
  KEY `Epreuve_NatureEpreuve1_FK` (`idNatureEpreuve`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `epreuve`
--

INSERT INTO `epreuve` (`id`, `idDiscipline`, `idNatureEpreuve`, `dureeEpreuve`) VALUES
(1, 1, 1, 10),
(2, 1, 2, 25),
(3, 2, 1, 18),
(4, 2, 2, 60),
(5, 3, 1, 12),
(6, 3, 2, 5),
(7, 4, 1, 50),
(8, 4, 2, 30);

-- --------------------------------------------------------

--
-- Structure de la table `natureepreuve`
--

DROP TABLE IF EXISTS `natureepreuve`;
CREATE TABLE IF NOT EXISTS `natureepreuve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `natureepreuve`
--

INSERT INTO `natureepreuve` (`id`, `libelle`) VALUES
(1, 'LV1'),
(2, 'LV2');

-- --------------------------------------------------------

--
-- Structure de la table `optionmenu`
--

DROP TABLE IF EXISTS `optionmenu`;
CREATE TABLE IF NOT EXISTS `optionmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(20) NOT NULL,
  `nomScript` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `optionmenu`
--

INSERT INTO `optionmenu` (`id`, `libelle`, `nomScript`) VALUES
(1, 'choixEleve', 'choix_eleve.php');

-- --------------------------------------------------------

--
-- Structure de la table `optionmenuutilisateur`
--

DROP TABLE IF EXISTS `optionmenuutilisateur`;
CREATE TABLE IF NOT EXISTS `optionmenuutilisateur` (
  `idOption` int(11) NOT NULL,
  `idTypeUtil` int(11) NOT NULL,
  PRIMARY KEY (`idOption`,`idTypeUtil`),
  KEY `idOption` (`idOption`),
  KEY `idTypeUtil` (`idTypeUtil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `passageepreuve`
--

DROP TABLE IF EXISTS `passageepreuve`;
CREATE TABLE IF NOT EXISTS `passageepreuve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inscritBenef` char(1) NOT NULL,
  `derogation` char(1) NOT NULL,
  `absence` char(1) DEFAULT NULL,
  `idEleve` int(11) NOT NULL,
  `idDemiJournee` int(11) DEFAULT NULL,
  `idPlage` int(11) DEFAULT NULL,
  `idEpreuve` int(11) NOT NULL,
  `idProfChoix` int(11) DEFAULT NULL,
  `idSalle` int(11) DEFAULT NULL,
  `idProfAffecte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PassageEpreuve_Epreuve2_FK` (`idEpreuve`),
  KEY `PassageEpreuve_Salle4_FK` (`idSalle`),
  KEY `PassageEpreuve_Professeur3_FK` (`idProfChoix`),
  KEY `PassageEpreuve_Professeur5_FK` (`idProfAffecte`),
  KEY `idEleve` (`idEleve`),
  KEY `idDemiJournee` (`idDemiJournee`,`idPlage`)
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `passageepreuve`
--

INSERT INTO `passageepreuve` (`id`, `inscritBenef`, `derogation`, `absence`, `idEleve`, `idDemiJournee`, `idPlage`, `idEpreuve`, `idProfChoix`, `idSalle`, `idProfAffecte`) VALUES
(15, 'N', 'N', NULL, 8, 3, 1, 1, 12, 2, 10),
(16, 'N', 'N', NULL, 8, 3, 1, 4, 15, 2, 10),
(17, 'N', 'N', NULL, 9, 3, 1, 1, 12, 2, 10),
(18, 'N', 'N', NULL, 9, 3, 1, 8, 13, 2, 10),
(19, 'N', 'N', NULL, 10, 3, 1, 1, 10, 2, 10),
(20, 'N', 'N', NULL, 10, 3, 1, 6, NULL, 2, 10),
(21, 'N', 'N', NULL, 11, 3, 1, 1, NULL, 2, 10),
(22, 'N', 'N', NULL, 11, 3, 1, 4, NULL, 2, 10),
(23, 'N', 'N', NULL, 12, 3, 1, 1, NULL, 2, 10),
(24, 'N', 'N', NULL, 12, 3, 1, 4, NULL, 2, 10),
(25, 'N', 'N', NULL, 13, 3, 1, 1, NULL, 2, 10),
(26, 'N', 'N', NULL, 13, 3, 1, 4, NULL, 2, 10),
(27, 'N', 'N', NULL, 14, 3, 1, 5, NULL, 2, 10),
(28, 'N', 'N', NULL, 14, 3, 1, 2, NULL, 2, 10),
(29, 'N', 'N', NULL, 15, 3, 1, 1, NULL, 2, 10),
(30, 'N', 'N', NULL, 15, 3, 1, 4, NULL, 2, 10),
(31, 'O', 'N', NULL, 16, 3, 1, 1, NULL, 2, 10),
(32, 'N', 'N', NULL, 16, 3, 1, 4, NULL, 2, 10),
(33, 'N', 'N', NULL, 17, 3, 1, 1, NULL, 2, 10),
(34, 'N', 'N', NULL, 17, 3, 1, 6, NULL, 2, 10),
(35, 'N', 'N', NULL, 18, 3, 1, 1, NULL, 2, 10),
(36, 'N', 'N', NULL, 18, 3, 1, 4, NULL, 2, 10),
(37, 'N', 'N', NULL, 19, 3, 1, 2, NULL, 2, 10),
(38, 'N', 'N', NULL, 20, 3, 1, 1, NULL, 2, 10),
(39, 'N', 'N', NULL, 20, 3, 1, 6, NULL, 2, 10),
(40, 'N', 'N', NULL, 21, 3, 1, 1, NULL, 2, 10),
(41, 'N', 'N', NULL, 21, 3, 1, 6, NULL, 2, 10),
(42, 'N', 'N', NULL, 22, 3, 1, 1, NULL, 2, 10),
(43, 'N', 'N', NULL, 22, 3, 1, 4, NULL, 2, 10),
(44, 'N', 'N', NULL, 23, 3, 1, 1, NULL, 2, 10),
(45, 'N', 'N', NULL, 23, 3, 1, 6, NULL, 2, 10),
(46, 'N', 'N', NULL, 24, 3, 1, 1, NULL, 2, 10),
(47, 'N', 'N', NULL, 24, 3, 1, 4, NULL, 2, 10),
(48, 'N', 'N', NULL, 25, 3, 1, 1, NULL, 2, 10),
(49, 'N', 'N', NULL, 25, 3, 1, 4, NULL, 2, 10),
(50, 'N', 'N', NULL, 26, 3, 1, 1, NULL, 2, 10),
(51, 'N', 'N', NULL, 26, 3, 1, 6, NULL, 2, 10),
(52, 'N', 'N', NULL, 27, 3, 1, 1, NULL, 2, 10),
(53, 'N', 'N', NULL, 27, 3, 1, 4, NULL, 2, 10),
(54, 'N', 'N', NULL, 28, 3, 1, 1, NULL, 2, 10),
(55, 'N', 'N', NULL, 28, 3, 1, 4, NULL, 2, 10),
(56, 'N', 'N', NULL, 29, 3, 1, 1, NULL, 2, 10),
(57, 'N', 'N', NULL, 29, 3, 1, 4, NULL, 2, 10),
(58, 'N', 'N', NULL, 30, 3, 1, 1, NULL, 2, 10),
(59, 'N', 'N', NULL, 30, 3, 1, 6, NULL, 2, 10),
(60, 'N', 'N', NULL, 31, 3, 1, 1, NULL, 2, 10),
(61, 'N', 'N', NULL, 31, 3, 1, 6, NULL, 2, 10),
(62, 'N', 'N', NULL, 32, 3, 1, 1, NULL, 2, 10),
(63, 'N', 'N', NULL, 32, 3, 1, 4, NULL, 2, 10),
(64, 'N', 'N', NULL, 33, 3, 1, 1, NULL, 2, 10),
(65, 'N', 'N', NULL, 33, 3, 1, 6, NULL, 2, 10),
(66, 'N', 'N', NULL, 34, 3, 1, 1, NULL, 2, 10),
(67, 'N', 'N', NULL, 34, 3, 1, 6, NULL, 2, 10),
(68, 'N', 'N', NULL, 35, 3, 1, 1, NULL, 2, 10),
(69, 'N', 'N', NULL, 35, 3, 1, 4, NULL, 2, 10),
(70, 'N', 'N', NULL, 36, 3, 1, 1, NULL, 2, 10),
(71, 'N', 'N', NULL, 36, 3, 1, 4, NULL, 2, 10),
(72, 'N', 'N', NULL, 37, 3, 1, 1, NULL, 2, 10),
(73, 'N', 'N', NULL, 37, 3, 1, 4, NULL, 2, 10),
(74, 'N', 'N', NULL, 38, 3, 1, 1, NULL, 2, 10),
(75, 'N', 'N', NULL, 38, 3, 1, 6, NULL, 2, 10),
(76, 'N', 'N', NULL, 39, 3, 1, 1, NULL, 2, 10),
(77, 'N', 'N', NULL, 39, 3, 1, 4, NULL, 2, 10),
(78, 'N', 'N', NULL, 40, 3, 1, 5, NULL, 2, 10),
(79, 'N', 'N', NULL, 40, 3, 1, 2, NULL, 2, 10),
(80, 'N', 'N', NULL, 41, 3, 1, 1, NULL, 2, 10),
(81, 'N', 'N', NULL, 41, 3, 1, 6, NULL, 2, 10),
(82, 'N', 'N', NULL, 42, 3, 1, 1, NULL, 2, 10),
(83, 'N', 'N', NULL, 42, 3, 1, 4, NULL, 2, 10),
(84, 'N', 'N', NULL, 43, 3, 1, 5, NULL, 2, 10),
(85, 'N', 'N', NULL, 43, 3, 1, 2, NULL, 2, 10),
(86, 'N', 'N', NULL, 44, 3, 1, 1, NULL, 2, 10),
(87, 'N', 'N', NULL, 44, 3, 1, 4, NULL, 2, 10),
(88, 'N', 'N', NULL, 45, 3, 1, 1, NULL, 2, 10),
(89, 'N', 'N', NULL, 45, 3, 1, 4, NULL, 2, 10),
(90, 'N', 'N', NULL, 46, 3, 1, 1, NULL, 2, 10),
(91, 'N', 'N', NULL, 46, 3, 1, 4, NULL, 2, 10),
(92, 'N', 'N', NULL, 47, 3, 1, 1, NULL, 2, 10),
(93, 'N', 'N', NULL, 47, 3, 1, 4, NULL, 2, 10),
(94, 'N', 'N', NULL, 48, 3, 1, 1, NULL, 2, 10),
(95, 'N', 'N', NULL, 48, 3, 1, 4, NULL, 2, 10),
(96, 'N', 'N', NULL, 49, 3, 1, 1, NULL, 2, 10),
(97, 'N', 'N', NULL, 49, 3, 1, 4, NULL, 2, 10),
(98, 'N', 'N', NULL, 50, 3, 1, 1, NULL, 2, 10),
(99, 'N', 'N', NULL, 50, 3, 1, 8, 13, 2, 10),
(100, 'N', 'N', NULL, 51, 3, 1, 1, NULL, 2, 10),
(101, 'N', 'N', NULL, 51, 3, 1, 6, NULL, 2, 10),
(102, 'N', 'N', NULL, 52, 3, 1, 1, NULL, 2, 10),
(103, 'N', 'N', NULL, 52, 3, 1, 4, NULL, 2, 10),
(104, 'N', 'N', NULL, 53, 3, 1, 1, NULL, 2, 10),
(105, 'N', 'N', NULL, 53, 3, 1, 6, NULL, 2, 10),
(106, 'N', 'N', NULL, 54, 3, 1, 1, NULL, 2, 10),
(107, 'N', 'N', NULL, 55, 3, 1, 1, NULL, 2, 10),
(108, 'N', 'N', NULL, 55, 3, 1, 4, NULL, 2, 10),
(109, 'N', 'N', NULL, 56, 3, 1, 1, NULL, 2, 10),
(110, 'N', 'N', NULL, 56, 3, 1, 4, NULL, 2, 10),
(111, 'N', 'N', NULL, 57, 3, 1, 1, NULL, 2, 10),
(112, 'N', 'N', NULL, 57, 3, 1, 6, NULL, 2, 10),
(113, 'N', 'N', NULL, 58, 3, 1, 1, NULL, 2, 10),
(114, 'N', 'N', NULL, 58, 3, 1, 4, NULL, 2, 10),
(115, 'N', 'N', NULL, 59, 3, 1, 1, NULL, 2, 10),
(116, 'N', 'N', NULL, 59, 3, 1, 4, NULL, 2, 10),
(117, 'N', 'N', NULL, 60, 3, 1, 1, NULL, 2, 10),
(118, 'N', 'N', NULL, 60, 3, 1, 4, NULL, 2, 10),
(119, 'N', 'N', NULL, 61, 3, 1, 5, NULL, 2, 10),
(120, 'N', 'N', NULL, 61, 3, 1, 2, NULL, 2, 10),
(121, 'N', 'N', NULL, 62, 3, 1, 1, NULL, 2, 10),
(122, 'N', 'N', NULL, 62, 3, 1, 4, NULL, 2, 10),
(123, 'N', 'N', NULL, 63, 3, 1, 1, NULL, 2, 10),
(124, 'N', 'N', NULL, 63, 3, 1, 4, NULL, 2, 10),
(125, 'N', 'N', NULL, 64, 3, 1, 1, NULL, 2, 10),
(126, 'N', 'N', NULL, 64, 3, 1, 4, NULL, 2, 10),
(127, 'N', 'N', NULL, 65, 3, 1, 1, NULL, 2, 10),
(128, 'N', 'N', NULL, 65, 3, 1, 4, NULL, 2, 10),
(129, 'N', 'N', NULL, 66, 3, 1, 1, NULL, 2, 10),
(130, 'N', 'N', NULL, 66, 3, 1, 4, NULL, 2, 10),
(131, 'N', 'N', NULL, 67, 3, 1, 1, NULL, 2, 10),
(132, 'N', 'N', NULL, 67, 3, 1, 4, NULL, 2, 10),
(133, 'N', 'N', NULL, 68, 3, 1, 1, NULL, 2, 10),
(134, 'N', 'N', NULL, 68, 3, 1, 4, NULL, 2, 10),
(135, 'N', 'N', NULL, 69, 3, 1, 1, NULL, 2, 10),
(136, 'N', 'N', NULL, 69, 3, 1, 4, NULL, 2, 10),
(137, 'N', 'N', NULL, 70, 3, 1, 1, NULL, 2, 10),
(138, 'N', 'N', NULL, 70, 3, 1, 4, NULL, 2, 10),
(139, 'N', 'N', NULL, 71, 3, 1, 1, NULL, 2, 10),
(140, 'N', 'N', NULL, 71, 3, 1, 8, 13, 2, 10),
(141, 'N', 'N', NULL, 72, 3, 1, 1, NULL, 2, 10),
(142, 'N', 'N', NULL, 72, 3, 1, 4, NULL, 2, 10),
(143, 'N', 'N', NULL, 73, 3, 1, 1, NULL, 2, 10),
(144, 'N', 'N', NULL, 73, 3, 1, 6, NULL, 2, 10),
(145, 'N', 'N', NULL, 74, 3, 1, 1, NULL, 2, 10),
(146, 'N', 'N', NULL, 74, 3, 1, 6, NULL, 2, 10),
(147, 'N', 'N', NULL, 75, 3, 1, 1, NULL, 2, 10),
(148, 'N', 'N', NULL, 75, 3, 1, 4, NULL, 2, 10),
(149, 'N', 'N', NULL, 76, 3, 1, 1, NULL, 2, 10),
(150, 'N', 'N', NULL, 76, 3, 1, 4, NULL, 2, 10),
(151, 'N', 'N', NULL, 77, 3, 1, 1, NULL, 2, 10),
(152, 'N', 'N', NULL, 77, 3, 1, 4, NULL, 2, 10),
(153, 'N', 'N', NULL, 78, 3, 1, 1, NULL, 2, 10),
(154, 'N', 'N', NULL, 78, 3, 1, 4, NULL, 2, 10),
(155, 'N', 'N', NULL, 79, 3, 1, 1, NULL, 2, 10),
(156, 'N', 'N', NULL, 79, 3, 1, 4, NULL, 2, 10),
(157, 'N', 'N', NULL, 80, 3, 1, 1, NULL, 2, 10),
(158, 'N', 'N', NULL, 80, 3, 1, 4, NULL, 2, 10),
(159, 'N', 'N', NULL, 81, 3, 1, 1, NULL, 2, 10),
(160, 'N', 'N', NULL, 81, 3, 1, 6, NULL, 2, 10),
(161, 'N', 'N', NULL, 82, 3, 1, 1, NULL, 2, 10),
(162, 'N', 'N', NULL, 82, 3, 1, 4, NULL, 2, 10),
(163, 'N', 'N', NULL, 83, 3, 1, 1, NULL, 2, 10),
(164, 'N', 'N', NULL, 83, 3, 1, 6, NULL, 2, 10),
(165, 'N', 'N', NULL, 84, 3, 1, 1, NULL, 2, 10),
(166, 'N', 'N', NULL, 84, 3, 1, 4, NULL, 2, 10),
(167, 'N', 'N', NULL, 85, 3, 1, 1, NULL, 2, 10),
(168, 'N', 'N', NULL, 85, 3, 1, 4, NULL, 2, 10),
(169, 'N', 'N', NULL, 86, 3, 1, 1, NULL, 2, 10),
(170, 'O', 'N', NULL, 86, 3, 1, 4, NULL, 2, 10),
(171, 'N', 'N', NULL, 87, 3, 1, 1, NULL, 2, 10),
(172, 'N', 'N', NULL, 87, 3, 1, 4, NULL, 2, 10),
(173, 'N', 'N', NULL, 88, 3, 1, 5, NULL, 2, 10),
(174, 'N', 'N', NULL, 88, 3, 1, 2, NULL, 2, 10),
(175, 'N', 'N', NULL, 89, 3, 1, 1, NULL, 2, 10),
(176, 'N', 'N', NULL, 89, 3, 1, 4, NULL, 2, 10),
(177, 'N', 'N', NULL, 90, 3, 1, 1, NULL, 2, 10),
(178, 'N', 'N', NULL, 90, 3, 1, 4, NULL, 2, 10),
(179, 'O', 'N', NULL, 91, 3, 1, 1, NULL, 2, 10),
(180, 'O', 'N', NULL, 91, 3, 1, 4, NULL, 2, 10),
(181, 'N', 'N', NULL, 92, 3, 1, 5, NULL, 2, 10),
(182, 'N', 'N', NULL, 92, 3, 1, 2, NULL, 2, 10),
(183, 'N', 'N', NULL, 93, 3, 1, 1, NULL, 2, 10),
(184, 'N', 'N', NULL, 93, 3, 1, 4, NULL, 2, 10),
(185, 'N', 'N', NULL, 94, 3, 1, 1, NULL, 2, 10),
(186, 'N', 'N', NULL, 94, 3, 1, 4, NULL, 2, 10),
(187, 'N', 'N', NULL, 95, 3, 1, 1, NULL, 2, 10),
(188, 'N', 'N', NULL, 95, 3, 1, 6, NULL, 2, 10),
(189, 'N', 'N', NULL, 96, 3, 1, 1, NULL, 2, 10),
(190, 'N', 'N', NULL, 96, 3, 1, 4, NULL, 2, 10),
(191, 'N', 'N', NULL, 97, 3, 1, 1, NULL, 2, 10),
(192, 'N', 'N', NULL, 97, 3, 1, 4, NULL, 2, 10),
(193, 'N', 'N', NULL, 98, 3, 1, 1, NULL, 2, 10),
(194, 'N', 'N', NULL, 98, 3, 1, 6, NULL, 2, 10),
(195, 'N', 'N', NULL, 99, 3, 1, 1, NULL, 2, 10),
(196, 'N', 'N', NULL, 99, 3, 1, 4, NULL, 2, 10),
(197, 'N', 'N', NULL, 100, 3, 1, 1, NULL, 2, 10),
(198, 'N', 'N', NULL, 100, 3, 1, 4, NULL, 2, 10),
(199, 'N', 'N', NULL, 101, 3, 1, 1, NULL, 2, 10),
(200, 'N', 'N', NULL, 101, 3, 1, 4, NULL, 2, 10),
(201, 'N', 'N', NULL, 102, 3, 1, 1, NULL, 2, 10),
(202, 'N', 'N', NULL, 102, 3, 1, 6, NULL, 2, 10),
(203, 'N', 'N', NULL, 103, 3, 1, 1, NULL, 2, 10),
(204, 'N', 'N', NULL, 103, 3, 1, 4, NULL, 2, 10),
(205, 'N', 'N', NULL, 104, 3, 1, 1, NULL, 2, 10),
(206, 'N', 'N', NULL, 104, 3, 1, 4, NULL, 2, 10),
(207, 'N', 'N', NULL, 105, 3, 1, 1, NULL, 2, 10),
(208, 'N', 'N', NULL, 105, 3, 1, 4, NULL, 2, 10),
(209, 'N', 'N', NULL, 106, 3, 1, 1, NULL, 2, 10),
(210, 'N', 'N', NULL, 106, 3, 1, 4, NULL, 2, 10),
(211, 'N', 'N', NULL, 107, 3, 1, 1, NULL, 2, 10),
(212, 'N', 'N', NULL, 107, 3, 1, 4, NULL, 2, 10),
(213, 'N', 'N', NULL, 108, 3, 1, 1, NULL, 2, 10),
(214, 'N', 'N', NULL, 108, 3, 1, 4, NULL, 2, 10),
(215, 'N', 'N', NULL, 109, 3, 1, 1, NULL, 2, 10),
(216, 'N', 'N', NULL, 109, 3, 1, 4, NULL, 2, 10),
(217, 'N', 'N', NULL, 110, 3, 1, 1, NULL, 2, 10),
(218, 'N', 'N', NULL, 110, 3, 1, 4, NULL, 2, 10),
(219, 'N', 'N', NULL, 111, 3, 1, 1, NULL, 2, 10),
(220, 'N', 'N', NULL, 111, 3, 1, 6, NULL, 2, 10),
(221, 'N', 'N', NULL, 112, 3, 1, 1, NULL, 2, 10),
(222, 'N', 'N', NULL, 112, 3, 1, 8, 13, 2, 10),
(223, 'N', 'N', NULL, 113, 3, 1, 1, NULL, 2, 10),
(224, 'N', 'N', NULL, 113, 3, 1, 4, NULL, 2, 10),
(225, 'N', 'N', NULL, 114, 3, 1, 1, NULL, 2, 10),
(226, 'N', 'N', NULL, 114, 3, 1, 4, NULL, 2, 10),
(227, 'N', 'N', NULL, 115, 3, 1, 1, NULL, 2, 10),
(228, 'N', 'N', NULL, 115, 3, 1, 4, NULL, 2, 10),
(229, 'N', 'N', NULL, 116, 3, 1, 1, NULL, 2, 10),
(230, 'N', 'N', NULL, 116, 3, 1, 4, NULL, 2, 10),
(231, 'N', 'N', NULL, 117, 3, 1, 1, NULL, 2, 10),
(232, 'N', 'N', NULL, 117, 3, 1, 4, NULL, 2, 10),
(233, 'N', 'N', NULL, 118, 3, 1, 5, NULL, 2, 10),
(234, 'N', 'N', NULL, 118, 3, 1, 2, NULL, 2, 10),
(235, 'N', 'N', NULL, 119, 3, 1, 1, NULL, 2, 10),
(236, 'N', 'N', NULL, 119, 3, 1, 4, NULL, 2, 10),
(239, 'N', 'N', NULL, 121, 3, 1, 1, NULL, 2, 10),
(240, 'N', 'N', NULL, 121, 3, 1, 6, NULL, 2, 10),
(241, 'N', 'N', NULL, 122, 3, 1, 1, NULL, 2, 10),
(242, 'N', 'N', NULL, 122, 3, 1, 4, NULL, 2, 10),
(243, 'N', 'N', NULL, 123, 3, 1, 1, NULL, 2, 10),
(244, 'N', 'N', NULL, 123, 3, 1, 6, NULL, 2, 10),
(245, 'N', 'N', NULL, 124, 3, 1, 1, NULL, 2, 10),
(246, 'N', 'N', NULL, 124, 3, 1, 8, 13, 2, 10),
(247, 'N', 'N', NULL, 125, 3, 1, 1, NULL, 2, 10),
(248, 'N', 'N', NULL, 125, 3, 1, 6, NULL, 2, 10),
(249, 'N', 'N', NULL, 126, 3, 1, 1, NULL, 2, 10),
(250, 'N', 'N', NULL, 126, 3, 1, 4, NULL, 2, 10),
(251, 'N', 'N', NULL, 127, 3, 1, 1, NULL, 2, 10),
(252, 'N', 'N', NULL, 127, 3, 1, 4, NULL, 2, 10),
(253, 'N', 'N', NULL, 128, 3, 1, 1, NULL, 2, 10),
(254, 'N', 'N', NULL, 128, 3, 1, 4, NULL, 2, 10),
(255, 'N', 'N', NULL, 129, 3, 1, 5, NULL, 2, 10),
(256, 'N', 'N', NULL, 129, 3, 1, 2, NULL, 2, 10),
(257, 'N', 'N', NULL, 130, 3, 1, 3, NULL, 2, 10),
(258, 'N', 'N', NULL, 130, 3, 1, 2, NULL, 2, 10),
(259, 'N', 'N', NULL, 131, 3, 1, 1, NULL, 2, 10),
(260, 'O', 'N', NULL, 131, 3, 1, 4, NULL, 2, 10),
(261, 'N', 'N', NULL, 132, 3, 1, 1, NULL, 2, 10),
(262, 'N', 'N', NULL, 132, 3, 1, 4, NULL, 2, 10),
(263, 'N', 'N', NULL, 133, 3, 1, 1, NULL, 2, 10),
(264, 'N', 'N', NULL, 133, 3, 1, 4, NULL, 2, 10),
(265, 'N', 'N', NULL, 134, 3, 1, 1, NULL, 2, 10),
(266, 'N', 'N', NULL, 134, 3, 1, 6, NULL, 2, 10),
(267, 'N', 'N', NULL, 135, 3, 1, 1, NULL, 2, 10),
(268, 'N', 'N', NULL, 135, 3, 1, 6, NULL, 2, 10),
(269, 'N', 'N', NULL, 136, 3, 1, 1, NULL, 2, 10),
(270, 'N', 'N', NULL, 136, 3, 1, 6, NULL, 2, 10),
(271, 'N', 'N', NULL, 137, 3, 1, 1, NULL, 2, 10),
(272, 'N', 'N', NULL, 137, 3, 1, 6, NULL, 2, 10),
(273, 'N', 'N', NULL, 138, 3, 1, 1, NULL, 2, 10),
(274, 'N', 'N', NULL, 138, 3, 1, 4, NULL, 2, 10),
(275, 'N', 'O', NULL, 139, 3, 1, 3, NULL, 2, 10),
(276, 'N', 'O', NULL, 139, 3, 1, 2, NULL, 2, 10),
(277, 'N', 'N', NULL, 140, 3, 1, 1, NULL, 2, 10),
(278, 'N', 'N', NULL, 140, 3, 1, 6, NULL, 2, 10),
(281, 'N', 'N', NULL, 142, 3, 1, 1, NULL, 2, 10),
(282, 'N', 'N', NULL, 142, 3, 1, 6, NULL, 2, 10),
(283, 'N', 'N', NULL, 143, 3, 1, 1, NULL, 2, 10),
(284, 'N', 'N', NULL, 143, 3, 1, 4, NULL, 2, 10),
(285, 'N', 'N', NULL, 144, 3, 1, 1, NULL, 2, 10),
(286, 'N', 'N', NULL, 144, 3, 1, 6, NULL, 2, 10),
(287, 'N', 'N', NULL, 145, 3, 1, 1, NULL, 2, 10),
(288, 'N', 'N', NULL, 145, 3, 1, 4, NULL, 2, 10),
(289, 'N', 'N', NULL, 146, 3, 1, 1, NULL, 2, 10),
(290, 'N', 'N', NULL, 146, 3, 1, 4, NULL, 2, 10),
(291, 'N', 'N', NULL, 147, 3, 1, 7, 13, 2, 10),
(292, 'N', 'N', NULL, 147, 3, 1, 2, NULL, 2, 10),
(293, 'N', 'N', NULL, 148, 3, 1, 1, NULL, 2, 10),
(294, 'N', 'N', NULL, 148, 3, 1, 4, NULL, 2, 10),
(295, 'N', 'N', NULL, 149, 3, 1, 1, NULL, 2, 10),
(296, 'N', 'N', NULL, 149, 3, 1, 6, NULL, 2, 10),
(297, 'N', 'N', NULL, 150, 3, 1, 1, NULL, 2, 10),
(298, 'N', 'N', NULL, 150, 3, 1, 6, NULL, 2, 10),
(299, 'N', 'N', NULL, 151, 3, 1, 1, NULL, 2, 10),
(300, 'N', 'N', NULL, 151, 3, 1, 4, NULL, 2, 10),
(301, 'N', 'N', NULL, 152, 3, 1, 1, NULL, 2, 10),
(302, 'N', 'N', NULL, 152, 3, 1, 8, 13, 2, 10),
(303, 'N', 'N', NULL, 153, 3, 1, 5, NULL, 2, 10),
(304, 'N', 'N', NULL, 153, 3, 1, 2, NULL, 2, 10),
(305, 'N', 'N', NULL, 154, 3, 1, 1, NULL, 2, 10),
(306, 'N', 'N', NULL, 154, 3, 1, 8, 13, 2, 10),
(307, 'N', 'N', NULL, 155, 3, 1, 1, NULL, 2, 10),
(308, 'N', 'N', NULL, 155, 3, 1, 4, NULL, 2, 10),
(309, 'N', 'N', NULL, 156, 3, 1, 1, NULL, 2, 10),
(310, 'N', 'N', NULL, 156, 3, 1, 4, NULL, 2, 10),
(311, 'N', 'N', NULL, 157, 3, 1, 1, NULL, 2, 10),
(312, 'N', 'N', NULL, 157, 3, 1, 4, NULL, 2, 10),
(313, 'N', 'N', NULL, 158, 3, 1, 5, NULL, 2, 10),
(314, 'N', 'N', NULL, 158, 3, 1, 2, NULL, 2, 10),
(315, 'N', 'N', NULL, 159, 3, 1, 1, NULL, 2, 10),
(316, 'N', 'N', NULL, 159, 3, 1, 4, NULL, 2, 10),
(317, 'N', 'N', NULL, 160, 3, 1, 1, NULL, 2, 10),
(318, 'N', 'N', NULL, 160, 3, 1, 4, NULL, 2, 10),
(319, 'N', 'N', NULL, 161, 3, 1, 1, NULL, 2, 10),
(320, 'N', 'N', NULL, 161, 3, 1, 4, NULL, 2, 10),
(321, 'N', 'N', NULL, 162, 3, 1, 1, NULL, 2, 10),
(322, 'N', 'N', NULL, 162, 3, 1, 6, NULL, 2, 10),
(323, 'N', 'N', NULL, 163, 3, 1, 1, NULL, 2, 10),
(324, 'N', 'N', NULL, 163, 3, 1, 4, NULL, 2, 10),
(325, 'N', 'N', NULL, 164, 3, 1, 1, NULL, 2, 10),
(326, 'N', 'N', NULL, 164, 3, 1, 4, NULL, 2, 10),
(327, 'N', 'N', NULL, 165, 3, 1, 3, NULL, 2, 10),
(328, 'N', 'N', NULL, 165, 3, 1, 2, NULL, 2, 10),
(329, 'N', 'N', NULL, 166, 3, 1, 1, NULL, 2, 10),
(330, 'N', 'N', NULL, 166, 3, 1, 4, NULL, 2, 10),
(331, 'N', 'N', NULL, 167, 3, 1, 1, NULL, 2, 10),
(332, 'N', 'N', NULL, 167, 3, 1, 8, NULL, 2, 10),
(333, 'N', 'N', NULL, 168, 3, 1, 1, NULL, 2, 10),
(334, 'N', 'N', NULL, 168, 3, 1, 6, NULL, 2, 10),
(335, 'N', 'N', NULL, 169, 3, 1, 1, NULL, 2, 10),
(336, 'N', 'N', NULL, 169, 3, 1, 4, NULL, 2, 10),
(337, 'N', 'N', NULL, 170, 3, 1, 1, NULL, 2, 10),
(338, 'N', 'N', NULL, 170, 3, 1, 4, NULL, 2, 10),
(339, 'N', 'N', NULL, 171, 3, 1, 1, NULL, 2, 10),
(340, 'N', 'N', NULL, 171, 3, 1, 4, NULL, 2, 10),
(341, 'N', 'N', NULL, 172, 3, 1, 1, NULL, 2, 10),
(342, 'N', 'N', NULL, 172, 3, 1, 6, NULL, 2, 10),
(345, 'N', 'N', NULL, 174, 3, 1, 1, NULL, 2, 10),
(346, 'N', 'N', NULL, 174, 3, 1, 4, NULL, 2, 10),
(347, 'N', 'N', NULL, 175, 3, 1, 1, NULL, 2, 10),
(348, 'N', 'N', NULL, 175, 3, 1, 4, NULL, 2, 10),
(349, 'O', 'N', NULL, 176, 3, 1, 1, NULL, 2, 10),
(350, 'O', 'N', NULL, 176, 3, 1, 4, NULL, 2, 10),
(351, 'N', 'N', NULL, 177, 3, 1, 1, NULL, 2, 10),
(352, 'N', 'N', NULL, 177, 3, 1, 4, NULL, 2, 10),
(353, 'N', 'N', NULL, 178, 3, 1, 1, NULL, 2, 10),
(354, 'N', 'N', NULL, 178, 3, 1, 6, NULL, 2, 10),
(355, 'N', 'N', NULL, 179, 3, 1, 1, NULL, 2, 10),
(356, 'N', 'N', NULL, 179, 3, 1, 4, NULL, 2, 10),
(357, 'N', 'N', NULL, 180, 3, 1, 3, NULL, 2, 10),
(358, 'N', 'N', NULL, 180, 3, 1, 2, NULL, 2, 10),
(359, 'N', 'N', NULL, 181, 3, 1, 1, NULL, 2, 10),
(360, 'N', 'N', NULL, 181, 3, 1, 4, NULL, 2, 10),
(361, 'N', 'N', NULL, 182, 3, 1, 1, NULL, 2, 10),
(362, 'N', 'N', NULL, 182, 3, 1, 6, NULL, 2, 10),
(363, 'N', 'N', NULL, 183, 3, 1, 1, NULL, 2, 10),
(364, 'N', 'N', NULL, 183, 3, 1, 4, NULL, 2, 10),
(365, 'N', 'N', NULL, 184, 3, 1, 3, NULL, 2, 10),
(366, 'N', 'N', NULL, 184, 3, 1, 2, NULL, 2, 10),
(367, 'N', 'N', NULL, 185, 3, 1, 1, NULL, 2, 10),
(368, 'N', 'N', NULL, 185, 3, 1, 6, NULL, 2, 10),
(369, 'N', 'N', NULL, 186, 3, 1, 1, NULL, 2, 10),
(370, 'N', 'N', NULL, 186, 3, 1, 4, NULL, 2, 10),
(371, 'N', 'N', NULL, 187, 3, 1, 1, NULL, 2, 10),
(372, 'N', 'N', NULL, 187, 3, 1, 4, NULL, 2, 10),
(373, 'N', 'N', NULL, 188, 3, 1, 7, NULL, 2, 10),
(374, 'N', 'N', NULL, 188, 3, 1, 2, NULL, 2, 10),
(375, 'N', 'N', NULL, 189, 3, 1, 1, NULL, 2, 10),
(376, 'N', 'N', NULL, 189, 3, 1, 4, NULL, 2, 10),
(377, 'N', 'N', NULL, 190, 3, 1, 1, NULL, 2, 10),
(378, 'N', 'N', NULL, 190, 3, 1, 6, NULL, 2, 10),
(379, 'N', 'N', NULL, 191, 3, 1, 1, NULL, 2, 10),
(380, 'N', 'N', NULL, 191, 3, 1, 8, NULL, 2, 10),
(381, 'N', 'N', NULL, 192, 3, 1, 1, NULL, 2, 10),
(382, 'N', 'N', NULL, 192, 3, 1, 4, NULL, 2, 10),
(383, 'N', 'N', NULL, 193, 3, 1, 1, NULL, 2, 10),
(384, 'N', 'N', NULL, 193, 3, 1, 6, NULL, 2, 10),
(385, 'N', 'N', NULL, 194, 3, 1, 1, NULL, 2, 10),
(386, 'N', 'N', NULL, 194, 3, 1, 6, NULL, 2, 10),
(387, 'N', 'N', NULL, 195, 3, 1, 1, NULL, 2, 10),
(388, 'N', 'N', NULL, 195, 3, 1, 4, NULL, 2, 10),
(389, 'N', 'N', NULL, 196, 3, 1, 1, NULL, 2, 10),
(390, 'N', 'N', NULL, 196, 3, 1, 6, NULL, 2, 10),
(391, 'N', 'N', NULL, 197, 3, 1, 1, NULL, 2, 10),
(392, 'N', 'N', NULL, 197, 3, 1, 4, NULL, 2, 10),
(393, 'N', 'N', NULL, 198, 3, 1, 1, NULL, 2, 10),
(394, 'N', 'N', NULL, 198, 3, 1, 6, NULL, 2, 10),
(395, 'N', 'N', NULL, 199, 3, 1, 1, NULL, 2, 10),
(396, 'N', 'N', NULL, 199, 3, 1, 6, NULL, 2, 10),
(397, 'N', 'N', NULL, 200, 3, 1, 1, NULL, 2, 10),
(398, 'N', 'N', NULL, 200, 3, 1, 4, NULL, 2, 10),
(399, 'N', 'N', NULL, 201, 3, 1, 5, NULL, 2, 10),
(400, 'N', 'N', NULL, 201, 3, 1, 2, NULL, 2, 10),
(401, 'N', 'N', NULL, 202, 3, 1, 1, NULL, 2, 10),
(402, 'N', 'N', NULL, 202, 3, 1, 4, NULL, 2, 10),
(403, 'N', 'N', NULL, 203, 3, 1, 1, NULL, 2, 10),
(404, 'N', 'N', NULL, 203, 3, 1, 4, NULL, 2, 10),
(405, 'N', 'N', NULL, 204, 3, 1, 1, NULL, 2, 10),
(406, 'N', 'N', NULL, 204, 3, 1, 4, NULL, 2, 10),
(407, 'N', 'N', NULL, 205, 3, 1, 1, NULL, 2, 10),
(408, 'N', 'N', NULL, 205, 3, 1, 4, NULL, 2, 10),
(409, 'N', 'N', NULL, 206, 3, 1, 1, NULL, 2, 10),
(410, 'N', 'N', NULL, 206, 3, 1, 6, NULL, 2, 10),
(411, 'N', 'N', NULL, 207, 3, 1, 5, NULL, 2, 10),
(412, 'N', 'N', NULL, 207, 3, 1, 2, NULL, 2, 10),
(413, 'N', 'N', NULL, 208, 3, 1, 1, NULL, 2, 10),
(414, 'N', 'N', NULL, 208, 3, 1, 4, NULL, 2, 10),
(415, 'N', 'N', NULL, 209, 3, 1, 1, NULL, 2, 10),
(416, 'N', 'N', NULL, 209, 3, 1, 4, NULL, 2, 10),
(417, 'N', 'N', NULL, 210, 3, 1, 1, NULL, 2, 10),
(418, 'N', 'N', NULL, 210, 3, 1, 4, NULL, 2, 10),
(419, 'N', 'N', NULL, 211, 3, 1, 1, NULL, 2, 10),
(420, 'N', 'N', NULL, 211, 3, 1, 4, NULL, 2, 10),
(421, 'N', 'N', NULL, 212, 3, 1, 1, NULL, 2, 10),
(422, 'N', 'N', NULL, 212, 3, 1, 6, NULL, 2, 10),
(423, 'N', 'N', NULL, 213, 3, 1, 3, NULL, 2, 10),
(424, 'N', 'N', NULL, 213, 3, 1, 2, NULL, 2, 10),
(425, 'N', 'N', NULL, 214, 3, 1, 1, NULL, 2, 10),
(426, 'N', 'N', NULL, 214, 3, 1, 4, NULL, 2, 10),
(427, 'N', 'N', NULL, 215, 3, 1, 1, NULL, 2, 10),
(428, 'N', 'N', NULL, 215, 3, 1, 8, NULL, 2, 10),
(429, 'N', 'N', NULL, 216, 3, 1, 1, NULL, 2, 10),
(430, 'N', 'N', NULL, 216, 3, 1, 8, NULL, 2, 10),
(431, 'N', 'N', NULL, 217, 3, 1, 1, NULL, 2, 10),
(432, 'N', 'N', NULL, 217, 3, 1, 8, NULL, 2, 10),
(433, 'N', 'N', NULL, 218, 3, 1, 5, NULL, 2, 10),
(434, 'N', 'N', NULL, 218, 3, 1, 2, NULL, 2, 10),
(435, 'N', 'N', NULL, 219, 3, 1, 1, NULL, 2, 10),
(436, 'N', 'N', NULL, 219, 3, 1, 4, NULL, 2, 10),
(437, 'N', 'N', NULL, 220, 3, 1, 1, NULL, 2, 10),
(438, 'N', 'N', NULL, 220, 3, 1, 4, NULL, 2, 10),
(439, 'N', 'N', NULL, 221, 3, 1, 1, NULL, 2, 10),
(440, 'N', 'N', NULL, 221, 3, 1, 4, NULL, 2, 10),
(441, 'N', 'N', NULL, 222, 3, 1, 1, NULL, 2, 10),
(442, 'N', 'N', NULL, 222, 3, 1, 4, NULL, 2, 10),
(443, 'N', 'N', NULL, 223, 3, 1, 5, NULL, 2, 10),
(444, 'N', 'N', NULL, 223, 3, 1, 2, NULL, 2, 10),
(445, 'N', 'N', NULL, 224, 3, 1, 1, NULL, 2, 10),
(446, 'N', 'N', NULL, 224, 3, 1, 4, NULL, 2, 10),
(447, 'N', 'N', NULL, 225, 3, 1, 1, NULL, 2, 10),
(448, 'N', 'N', NULL, 225, 3, 1, 4, NULL, 2, 10),
(449, 'N', 'N', NULL, 226, 3, 1, 1, NULL, 2, 10),
(450, 'N', 'N', NULL, 226, 3, 1, 4, NULL, 2, 10),
(451, 'N', 'N', NULL, 227, 3, 1, 1, NULL, 2, 10),
(452, 'N', 'N', NULL, 227, 3, 1, 4, NULL, 2, 10),
(453, 'N', 'N', NULL, 228, 3, 1, 1, NULL, 2, 10),
(454, 'N', 'N', NULL, 228, 3, 1, 6, NULL, 2, 10),
(455, 'N', 'N', NULL, 229, 3, 1, 1, NULL, 2, 10),
(456, 'N', 'N', NULL, 229, 3, 1, 4, NULL, 2, 10),
(457, 'N', 'N', NULL, 230, 3, 1, 1, NULL, 2, 10),
(458, 'N', 'N', NULL, 230, 3, 1, 8, NULL, 2, 10),
(459, 'N', 'N', NULL, 231, 3, 1, 1, NULL, 2, 10),
(460, 'N', 'N', NULL, 231, 3, 1, 4, NULL, 2, 10),
(461, 'N', 'N', NULL, 232, 3, 1, 1, NULL, 2, 10),
(462, 'N', 'N', NULL, 232, 3, 1, 4, NULL, 2, 10),
(463, 'N', 'N', NULL, 233, 3, 1, 1, NULL, 2, 10),
(464, 'N', 'N', NULL, 233, 3, 1, 6, NULL, 2, 10),
(465, 'N', 'N', NULL, 234, 3, 1, 1, NULL, 2, 10),
(466, 'N', 'N', NULL, 234, 3, 1, 6, NULL, 2, 10),
(467, 'N', 'N', NULL, 235, 3, 1, 1, NULL, 2, 10),
(468, 'N', 'N', NULL, 235, 3, 1, 4, NULL, 2, 10),
(469, 'N', 'N', NULL, 236, 3, 1, 1, NULL, 2, 10),
(470, 'N', 'N', NULL, 236, 3, 1, 4, NULL, 2, 10),
(471, 'N', 'N', NULL, 237, 3, 1, 1, NULL, 2, 10),
(472, 'N', 'N', NULL, 237, 3, 1, 4, NULL, 2, 10),
(473, 'N', 'N', NULL, 238, 3, 1, 1, NULL, 2, 10),
(474, 'N', 'N', NULL, 238, 3, 1, 4, NULL, 2, 10),
(475, 'N', 'N', NULL, 239, 3, 1, 5, NULL, 2, 10),
(476, 'N', 'N', NULL, 239, 3, 1, 2, NULL, 2, 10),
(477, 'N', 'N', NULL, 240, 3, 1, 1, NULL, 2, 10),
(478, 'N', 'N', NULL, 240, 3, 1, 6, NULL, 2, 10),
(479, 'N', 'N', NULL, 241, 3, 1, 1, NULL, 2, 10),
(480, 'N', 'N', NULL, 241, 3, 1, 6, NULL, 2, 10),
(481, 'N', 'N', NULL, 242, 3, 1, 1, NULL, 2, 10),
(482, 'N', 'N', NULL, 242, 3, 1, 1, NULL, 2, 10);

-- --------------------------------------------------------

--
-- Structure de la table `plage`
--

DROP TABLE IF EXISTS `plage`;
CREATE TABLE IF NOT EXISTS `plage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `heureDebut` varchar(5) NOT NULL,
  `heureFin` varchar(5) NOT NULL,
  `nbMaxEleve` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `plage`
--

INSERT INTO `plage` (`id`, `heureDebut`, `heureFin`, `nbMaxEleve`) VALUES
(1, '8:00', '9:00', 4),
(2, '9:00', '10:00', 4),
(3, '10:30', '11:00', 2),
(4, '11:00', '12:00', 4),
(5, '13:30', '14:00', 2),
(6, '14:00', '15:00', 4),
(7, '15:30', '16:00', 2),
(8, '16:00', '17:00', 4);

-- --------------------------------------------------------

--
-- Structure de la table `plagedemijournee`
--

DROP TABLE IF EXISTS `plagedemijournee`;
CREATE TABLE IF NOT EXISTS `plagedemijournee` (
  `idDemiJournee` int(11) NOT NULL,
  `idPlage` int(11) NOT NULL,
  PRIMARY KEY (`idDemiJournee`,`idPlage`),
  KEY `PlageDemiJournee_DemiJournee0_FK` (`idDemiJournee`),
  KEY `PlageDemiJournee_Plage1_FK` (`idPlage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `plagedemijournee`
--

INSERT INTO `plagedemijournee` (`idDemiJournee`, `idPlage`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Structure de la table `profenseigdivision`
--

DROP TABLE IF EXISTS `profenseigdivision`;
CREATE TABLE IF NOT EXISTS `profenseigdivision` (
  `idUtilisateur` int(11) NOT NULL,
  `idDivision` int(11) NOT NULL,
  PRIMARY KEY (`idUtilisateur`,`idDivision`),
  KEY `enseigner_a_Division1_FK` (`idDivision`),
  KEY `idUtilisateur` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id`, `libelle`) VALUES
(1, '120'),
(2, '130'),
(3, '126'),
(4, '127');

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `section`
--

INSERT INTO `section` (`id`, `libelle`) VALUES
(1, 'Européenne'),
(2, 'Internationale');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `selectioneleve`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `selectioneleve`;
CREATE TABLE IF NOT EXISTS `selectioneleve` (
`nom` varchar(50)
,`prenom` varchar(50)
,`division` varchar(100)
,`natureepreuve` varchar(50)
,`professeur` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure de la table `tabletempo`
--

DROP TABLE IF EXISTS `tabletempo`;
CREATE TABLE IF NOT EXISTS `tabletempo` (
  `idUtilisateur` int(11) NOT NULL,
  `idDemiJournee` int(11) NOT NULL,
  `idSalle` int(11) NOT NULL,
  `idPlage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tabletempo`
--

INSERT INTO `tabletempo` (`idUtilisateur`, `idDemiJournee`, `idSalle`, `idPlage`) VALUES
(1, 1, 3, 1),
(10, 3, 2, 1),
(1, 1, 3, 2),
(10, 3, 2, 2),
(1, 1, 3, 3),
(10, 3, 2, 3),
(1, 1, 3, 4),
(10, 3, 2, 4),
(1, 2, 3, 5),
(10, 2, 2, 5),
(1, 4, 3, 5),
(1, 2, 3, 6),
(10, 2, 2, 6),
(1, 4, 3, 6),
(1, 2, 3, 7),
(10, 2, 2, 7),
(1, 4, 3, 7),
(1, 2, 3, 8),
(10, 2, 2, 8),
(1, 4, 3, 8);

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

DROP TABLE IF EXISTS `traitement`;
CREATE TABLE IF NOT EXISTS `traitement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  `valeur` varchar(50) NOT NULL,
  `dateMaj` date NOT NULL,
  `idUtilisateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Traitement_Administrateur0_FK` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typeutilisateur`
--

DROP TABLE IF EXISTS `typeutilisateur`;
CREATE TABLE IF NOT EXISTS `typeutilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typeutilisateur`
--

INSERT INTO `typeutilisateur` (`id`, `libelle`) VALUES
(1, 'Admin'),
(2, 'Prof'),
(3, 'Scolarite');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(30) NOT NULL,
  `motDePasse` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `idTypeUtilisateur` int(11) NOT NULL,
  `idSalleAtt` int(11) DEFAULT NULL,
  `idDiscipline` int(11) NOT NULL,
  `idCivilite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idTypeUtilisateur` (`idTypeUtilisateur`),
  KEY `idSalleAtt` (`idSalleAtt`),
  KEY `FK_idDiscipline` (`idDiscipline`),
  KEY `FK_idcivilite` (`idCivilite`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `identifiant`, `motDePasse`, `mail`, `nom`, `prenom`, `idTypeUtilisateur`, `idSalleAtt`, `idDiscipline`, `idCivilite`) VALUES
(1, 'testA', '4e9775c0d913ec576a2c91905d17b5500b942f8a', 'test@test.test', 'le_nom', 'le_prenom', 1, 3, 3, 1),
(10, 'testP', 'fdcf46d98b70ea6d02a4abfeb6c1172510d87241', 'Targaryen@DuTyphon.wes', 'Targaryen', 'Daenerys', 2, NULL, 4, 2),
(11, 'testS', '44ca78a9a75fa51de51fe4d0588beb00cd4ae276', 'S.Stark@lady.wes', 'Stark', 'Sansa', 3, NULL, 1, 2),
(12, 'Joffrey', 'Baratheon', 'King.J@Baratheon.wes', 'Baratheon', 'Joffrey', 2, 4, 2, 1),
(13, 'Khal', 'Drogo', 'soleil.etoilé@dortak.essos', 'Drogo', 'Khal', 2, NULL, 4, 1),
(14, 'Gregor', 'Clegane', 'Briseur.De.Tete@Montagne.wes', 'Clegane', 'Gregor', 2, NULL, 1, 1),
(15, 'Arya', 'Stark', 'FaceLess@Stark.wes', 'Stark', 'Arya', 2, NULL, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la vue `elevespassantep`
--
DROP TABLE IF EXISTS `elevespassantep`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dupont`@`%` SQL SECURITY DEFINER VIEW `elevespassantep`  AS  select `eleve`.`id` AS `idE`,`eleve`.`nom` AS `nomE`,`eleve`.`prenom` AS `prenomE`,`division`.`libelle` AS `divisionE`,`salle`.`libelle` AS `salleE`,`discipline`.`libelle` AS `disciplineE`,`natureepreuve`.`libelle` AS `epreuveE`,`demijournee`.`date` AS `jourE`,`plage`.`heureDebut` AS `plagHoraireE`,`epreuve`.`dureeEpreuve` AS `dureeEpreuveE`,`eleve`.`tiersTempsON` AS `tiersTempsE`,`utilisateur`.`id` AS `idP`,`utilisateur`.`nom` AS `nomP`,`utilisateur`.`prenom` AS `prenomP` from ((((((((((`passageepreuve` join `eleve` on((`passageepreuve`.`idEleve` = `eleve`.`id`))) join `division` on((`eleve`.`idDivision` = `division`.`id`))) join `salle` on((`passageepreuve`.`idSalle` = `salle`.`id`))) join `epreuve` on((`passageepreuve`.`idEpreuve` = `epreuve`.`id`))) join `discipline` on((`epreuve`.`idDiscipline` = `discipline`.`id`))) join `natureepreuve` on((`epreuve`.`idNatureEpreuve` = `natureepreuve`.`id`))) join `plagedemijournee` on(((`passageepreuve`.`idDemiJournee` = `plagedemijournee`.`idDemiJournee`) and (`passageepreuve`.`idPlage` = `plagedemijournee`.`idPlage`)))) join `demijournee` on((`plagedemijournee`.`idDemiJournee` = `demijournee`.`id`))) join `plage` on((`plagedemijournee`.`idPlage` = `plage`.`id`))) join `utilisateur` on((`passageepreuve`.`idProfAffecte` = `utilisateur`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `selectioneleve`
--
DROP TABLE IF EXISTS `selectioneleve`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ayub`@`%` SQL SECURITY DEFINER VIEW `selectioneleve`  AS  select `eleve`.`nom` AS `nom`,`eleve`.`prenom` AS `prenom`,`division`.`libelle` AS `division`,`natureepreuve`.`libelle` AS `natureepreuve`,`utilisateur`.`nom` AS `professeur` from (((((`passageepreuve` left join `utilisateur` on((`passageepreuve`.`idProfChoix` = `utilisateur`.`id`))) left join `eleve` on((`passageepreuve`.`idEleve` = `eleve`.`id`))) join `division` on((`eleve`.`idDivision` = `division`.`id`))) join `epreuve` on((`passageepreuve`.`idEpreuve` = `epreuve`.`id`))) join `natureepreuve` on((`epreuve`.`idNatureEpreuve` = `natureepreuve`.`id`))) order by `eleve`.`nom` ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `choixprofdemijournee`
--
ALTER TABLE `choixprofdemijournee`
  ADD CONSTRAINT `choixProfDemiJournee_DemiJournee1_FK` FOREIGN KEY (`idDemiJournee`) REFERENCES `demijournee` (`id`),
  ADD CONSTRAINT `choixProfDemiJournee_Professeur0_FK` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `choixProfDemiJournee_Salle2_FK` FOREIGN KEY (`idSalle`) REFERENCES `salle` (`id`);

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `Eleve_Civilite0_FK` FOREIGN KEY (`idCivilite`) REFERENCES `civilite` (`id`),
  ADD CONSTRAINT `Eleve_Division2_FK` FOREIGN KEY (`idDivision`) REFERENCES `division` (`id`);

--
-- Contraintes pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD CONSTRAINT `Epreuve_Discipline0_FK` FOREIGN KEY (`idDiscipline`) REFERENCES `discipline` (`id`),
  ADD CONSTRAINT `Epreuve_NatureEpreuve1_FK` FOREIGN KEY (`idNatureEpreuve`) REFERENCES `natureepreuve` (`id`);

--
-- Contraintes pour la table `optionmenuutilisateur`
--
ALTER TABLE `optionmenuutilisateur`
  ADD CONSTRAINT `FK_idoption` FOREIGN KEY (`idOption`) REFERENCES `optionmenu` (`id`),
  ADD CONSTRAINT `FK_idtypeutil` FOREIGN KEY (`idTypeUtil`) REFERENCES `typeutilisateur` (`id`);

--
-- Contraintes pour la table `passageepreuve`
--
ALTER TABLE `passageepreuve`
  ADD CONSTRAINT `FK_Plagedemijournee_idDemiJournee_idPlage` FOREIGN KEY (`idDemiJournee`,`idPlage`) REFERENCES `plagedemijournee` (`idDemiJournee`, `idPlage`),
  ADD CONSTRAINT `FK_idElevePassage` FOREIGN KEY (`idEleve`) REFERENCES `eleve` (`id`),
  ADD CONSTRAINT `PassageEpreuve_Epreuve2_FK` FOREIGN KEY (`idEpreuve`) REFERENCES `epreuve` (`id`),
  ADD CONSTRAINT `PassageEpreuve_Professeur3_FK` FOREIGN KEY (`idProfChoix`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `PassageEpreuve_Professeur5_FK` FOREIGN KEY (`idProfAffecte`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `PassageEpreuve_Salle4_FK` FOREIGN KEY (`idSalle`) REFERENCES `salle` (`id`);

--
-- Contraintes pour la table `plagedemijournee`
--
ALTER TABLE `plagedemijournee`
  ADD CONSTRAINT `PlageDemiJournee_DemiJournee0_FK` FOREIGN KEY (`idDemiJournee`) REFERENCES `demijournee` (`id`),
  ADD CONSTRAINT `PlageDemiJournee_Plage1_FK` FOREIGN KEY (`idPlage`) REFERENCES `plage` (`id`);

--
-- Contraintes pour la table `profenseigdivision`
--
ALTER TABLE `profenseigdivision`
  ADD CONSTRAINT `enseigner_a_Division1_FK` FOREIGN KEY (`idDivision`) REFERENCES `division` (`id`),
  ADD CONSTRAINT `enseigner_a_Professeur0_FK` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD CONSTRAINT `Traitement_Administrateur0_FK` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_idDiscipline` FOREIGN KEY (`idDiscipline`) REFERENCES `discipline` (`id`),
  ADD CONSTRAINT `FK_idSalle` FOREIGN KEY (`idSalleAtt`) REFERENCES `salle` (`id`),
  ADD CONSTRAINT `FK_idcivilite` FOREIGN KEY (`idCivilite`) REFERENCES `civilite` (`id`),
  ADD CONSTRAINT `FK_idtypeUtilisateur` FOREIGN KEY (`idTypeUtilisateur`) REFERENCES `typeutilisateur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
