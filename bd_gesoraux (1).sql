-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 23 sep. 2019 à 15:24
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
(17, 12, 18),
(17, 13, 18),
(17, 15, 18);

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
(2, 'Madame', 'MME'),
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `demijournee`
--

INSERT INTO `demijournee` (`id`, `date`, `matinAprem`) VALUES
(1, '2019-02-25', 'matin'),
(2, '2019-02-25', 'après-midi'),
(3, '2019-02-26', 'matin'),
(4, '2019-02-26', 'après-midi'),
(5, '2019-02-27', 'matin'),
(6, '2019-02-27', 'après-midi'),
(7, '2019-02-28', 'matin'),
(8, '2019-02-28', 'après-midi'),
(9, '2019-03-01', 'matin'),
(10, '2019-03-01', 'après-midi'),
(11, '2019-03-18', 'matin'),
(12, '2019-03-18', 'après-midi'),
(13, '2019-03-19', 'matin'),
(14, '2019-03-19', 'après-midi'),
(15, '2019-03-20', 'matin'),
(16, '2019-03-20', 'après-midi');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

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
(1, 'ABERDANE', 'SALMA', '2002-02-18', 'N', 2, NULL, 2),
(2, 'ADOUI', 'ADAM AHMED', '2001-12-24', 'N', 1, NULL, 7),
(3, 'ALEXOPOULOS', 'JULIEN JOSE DENIS', '2001-06-22', 'N', 1, NULL, 8),
(4, 'ALFANDARI', 'APOLLINE MARION MONIQUE', '2001-09-27', 'N', 2, 1, 6),
(5, 'ALLAL', 'ALEXIA SARAH MICHELE', '2003-02-14', 'N', 2, 1, 3),
(6, 'AMOEDO', 'ELISE', '2001-12-31', 'N', 2, NULL, 2),
(7, 'AROUMOUGAM', 'RIOS SOUDAMANE', '2001-07-14', 'N', 1, 1, 3),
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
(120, 'HOUIS', 'ELEA', '2001-11-06', 'N', 2, NULL, 1),
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
(141, 'LEBRAUD', 'VALENTIN ALEXANDRE', '1999-04-25', 'O', 1, NULL, 5),
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
(173, 'MESNIER-LEVATIC', 'SACHA DIMITRI', '2001-04-14', 'N', 1, 1, 2),
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
-- Structure de la table `etablissement`
--

DROP TABLE IF EXISTS `etablissement`;
CREATE TABLE IF NOT EXISTS `etablissement` (
  `idEtablissement` int(11) NOT NULL AUTO_INCREMENT,
  `complementNom` varchar(100) NOT NULL,
  `nomEtablissement` varchar(50) NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `tel` varchar(14) NOT NULL,
  `email` varchar(100) NOT NULL,
  `siteWeb` varchar(200) NOT NULL,
  PRIMARY KEY (`idEtablissement`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`idEtablissement`, `complementNom`, `nomEtablissement`, `adresse`, `cp`, `ville`, `tel`, `email`, `siteWeb`) VALUES
(1, 'citée scolaire', 'Jean Rostand', '2 Place Georges Paquier', '60634', 'Chantilly', '03 44 62 47 00', 'blabal@blabla.blabla', 'rostand.lyc.ac-amiens.fr');

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
-- Structure de la table `nomexam`
--

DROP TABLE IF EXISTS `nomexam`;
CREATE TABLE IF NOT EXISTS `nomexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `nomexam`
--

INSERT INTO `nomexam` (`id`, `nom`) VALUES
(1, 'Oral d\'anglais'),
(2, 'Oral d\'espagnol');

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
(1, 'N', 'N', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL),
(2, 'N', 'N', NULL, 1, NULL, NULL, 4, NULL, NULL, NULL),
(3, 'N', 'N', NULL, 2, NULL, NULL, 1, NULL, NULL, NULL),
(4, 'N', 'N', NULL, 2, NULL, NULL, 4, NULL, NULL, NULL),
(5, 'N', 'N', NULL, 3, NULL, NULL, 1, NULL, NULL, NULL),
(6, 'N', 'N', NULL, 3, NULL, NULL, 4, NULL, NULL, NULL),
(7, 'N', 'N', NULL, 4, NULL, NULL, 1, NULL, NULL, NULL),
(8, 'N', 'N', NULL, 4, NULL, NULL, 4, NULL, NULL, NULL),
(9, 'N', 'N', NULL, 5, NULL, NULL, 1, NULL, NULL, NULL),
(10, 'N', 'N', NULL, 5, NULL, NULL, 6, NULL, NULL, NULL),
(11, 'N', 'N', NULL, 6, NULL, NULL, 3, NULL, NULL, NULL),
(12, 'N', 'N', NULL, 6, NULL, NULL, 2, NULL, NULL, NULL),
(13, 'N', 'N', NULL, 7, NULL, NULL, 1, NULL, NULL, NULL),
(14, 'N', 'N', NULL, 7, NULL, NULL, 4, NULL, NULL, NULL),
(15, 'N', 'N', NULL, 8, NULL, NULL, 1, NULL, NULL, NULL),
(16, 'N', 'N', NULL, 8, NULL, NULL, 4, NULL, NULL, NULL),
(17, 'N', 'N', NULL, 9, NULL, NULL, 1, NULL, NULL, NULL),
(18, 'N', 'N', NULL, 9, NULL, NULL, 8, NULL, NULL, NULL),
(19, 'N', 'N', NULL, 10, NULL, NULL, 1, NULL, NULL, NULL),
(20, 'N', 'N', NULL, 10, NULL, NULL, 6, NULL, NULL, NULL),
(21, 'N', 'N', NULL, 11, NULL, NULL, 1, NULL, NULL, NULL),
(22, 'N', 'N', NULL, 11, NULL, NULL, 4, NULL, NULL, NULL),
(23, 'N', 'N', NULL, 12, NULL, NULL, 1, NULL, NULL, NULL),
(24, 'N', 'N', NULL, 12, NULL, NULL, 4, NULL, NULL, NULL),
(25, 'N', 'N', NULL, 13, NULL, NULL, 1, NULL, NULL, NULL),
(26, 'N', 'N', NULL, 13, NULL, NULL, 4, NULL, NULL, NULL),
(27, 'N', 'N', NULL, 14, NULL, NULL, 5, NULL, NULL, NULL),
(28, 'N', 'N', NULL, 14, NULL, NULL, 2, NULL, NULL, NULL),
(29, 'N', 'N', NULL, 15, NULL, NULL, 1, NULL, NULL, NULL),
(30, 'N', 'N', NULL, 15, NULL, NULL, 4, NULL, NULL, NULL),
(31, 'O', 'N', NULL, 16, NULL, NULL, 1, NULL, NULL, NULL),
(32, 'N', 'N', NULL, 16, NULL, NULL, 4, NULL, NULL, NULL),
(33, 'N', 'N', NULL, 17, NULL, NULL, 1, NULL, NULL, NULL),
(34, 'N', 'N', NULL, 17, NULL, NULL, 6, NULL, NULL, NULL),
(35, 'N', 'N', NULL, 18, NULL, NULL, 1, NULL, NULL, NULL),
(36, 'N', 'N', NULL, 18, NULL, NULL, 4, NULL, NULL, NULL),
(37, 'N', 'N', NULL, 19, NULL, NULL, 2, NULL, NULL, NULL),
(38, 'N', 'N', NULL, 20, NULL, NULL, 1, NULL, NULL, NULL),
(39, 'N', 'N', NULL, 20, NULL, NULL, 6, NULL, NULL, NULL),
(40, 'N', 'N', NULL, 21, NULL, NULL, 1, NULL, NULL, NULL),
(41, 'N', 'N', NULL, 21, NULL, NULL, 6, NULL, NULL, NULL),
(42, 'N', 'N', NULL, 22, NULL, NULL, 1, NULL, NULL, NULL),
(43, 'N', 'N', NULL, 22, NULL, NULL, 4, NULL, NULL, NULL),
(44, 'N', 'N', NULL, 23, NULL, NULL, 1, NULL, NULL, NULL),
(45, 'N', 'N', NULL, 23, NULL, NULL, 6, NULL, NULL, NULL),
(46, 'N', 'N', NULL, 24, NULL, NULL, 1, NULL, NULL, NULL),
(47, 'N', 'N', NULL, 24, NULL, NULL, 4, NULL, NULL, NULL),
(48, 'N', 'N', NULL, 25, NULL, NULL, 1, NULL, NULL, NULL),
(49, 'N', 'N', NULL, 25, NULL, NULL, 4, NULL, NULL, NULL),
(50, 'N', 'N', NULL, 26, NULL, NULL, 1, NULL, NULL, NULL),
(51, 'N', 'N', NULL, 26, NULL, NULL, 6, NULL, NULL, NULL),
(52, 'N', 'N', NULL, 27, NULL, NULL, 1, NULL, NULL, NULL),
(53, 'N', 'N', NULL, 27, NULL, NULL, 4, NULL, NULL, NULL),
(54, 'N', 'N', NULL, 28, NULL, NULL, 1, NULL, NULL, NULL),
(55, 'N', 'N', NULL, 28, NULL, NULL, 4, NULL, NULL, NULL),
(56, 'N', 'N', NULL, 29, NULL, NULL, 1, NULL, NULL, NULL),
(57, 'N', 'N', NULL, 29, NULL, NULL, 4, NULL, NULL, NULL),
(58, 'N', 'N', NULL, 30, NULL, NULL, 1, NULL, NULL, NULL),
(59, 'N', 'N', NULL, 30, NULL, NULL, 6, NULL, NULL, NULL),
(60, 'N', 'N', NULL, 31, NULL, NULL, 1, NULL, NULL, NULL),
(61, 'N', 'N', NULL, 31, NULL, NULL, 6, NULL, NULL, NULL),
(62, 'N', 'N', NULL, 32, NULL, NULL, 1, NULL, NULL, NULL),
(63, 'N', 'N', NULL, 32, NULL, NULL, 4, NULL, NULL, NULL),
(64, 'N', 'N', NULL, 33, NULL, NULL, 1, NULL, NULL, NULL),
(65, 'N', 'N', NULL, 33, NULL, NULL, 6, NULL, NULL, NULL),
(66, 'N', 'N', NULL, 34, NULL, NULL, 1, NULL, NULL, NULL),
(67, 'N', 'N', NULL, 34, NULL, NULL, 6, NULL, NULL, NULL),
(68, 'N', 'N', NULL, 35, NULL, NULL, 1, NULL, NULL, NULL),
(69, 'N', 'N', NULL, 35, NULL, NULL, 4, NULL, NULL, NULL),
(70, 'N', 'N', NULL, 36, NULL, NULL, 1, NULL, NULL, NULL),
(71, 'N', 'N', NULL, 36, NULL, NULL, 4, NULL, NULL, NULL),
(72, 'N', 'N', NULL, 37, NULL, NULL, 1, NULL, NULL, NULL),
(73, 'N', 'N', NULL, 37, NULL, NULL, 4, NULL, NULL, NULL),
(74, 'N', 'N', NULL, 38, NULL, NULL, 1, NULL, NULL, NULL),
(75, 'N', 'N', NULL, 38, NULL, NULL, 6, NULL, NULL, NULL),
(76, 'N', 'N', NULL, 39, NULL, NULL, 1, NULL, NULL, NULL),
(77, 'N', 'N', NULL, 39, NULL, NULL, 4, NULL, NULL, NULL),
(78, 'N', 'N', NULL, 40, NULL, NULL, 5, NULL, NULL, NULL),
(79, 'N', 'N', NULL, 40, NULL, NULL, 2, NULL, NULL, NULL),
(80, 'N', 'N', NULL, 41, NULL, NULL, 1, NULL, NULL, NULL),
(81, 'N', 'N', NULL, 41, NULL, NULL, 6, NULL, NULL, NULL),
(82, 'N', 'N', NULL, 42, NULL, NULL, 1, NULL, NULL, NULL),
(83, 'N', 'N', NULL, 42, NULL, NULL, 4, NULL, NULL, NULL),
(84, 'N', 'N', NULL, 43, NULL, NULL, 5, NULL, NULL, NULL),
(85, 'N', 'N', NULL, 43, NULL, NULL, 2, NULL, NULL, NULL),
(86, 'N', 'N', NULL, 44, NULL, NULL, 1, NULL, NULL, NULL),
(87, 'N', 'N', NULL, 44, NULL, NULL, 4, NULL, NULL, NULL),
(88, 'N', 'N', NULL, 45, NULL, NULL, 1, NULL, NULL, NULL),
(89, 'N', 'N', NULL, 45, NULL, NULL, 4, NULL, NULL, NULL),
(90, 'N', 'N', NULL, 46, NULL, NULL, 1, NULL, NULL, NULL),
(91, 'N', 'N', NULL, 46, NULL, NULL, 4, NULL, NULL, NULL),
(92, 'N', 'N', NULL, 47, NULL, NULL, 1, NULL, NULL, NULL),
(93, 'N', 'N', NULL, 47, NULL, NULL, 4, NULL, NULL, NULL),
(94, 'N', 'N', NULL, 48, NULL, NULL, 1, NULL, NULL, NULL),
(95, 'N', 'N', NULL, 48, NULL, NULL, 4, NULL, NULL, NULL),
(96, 'N', 'N', NULL, 49, NULL, NULL, 1, NULL, NULL, NULL),
(97, 'N', 'N', NULL, 49, NULL, NULL, 4, NULL, NULL, NULL),
(98, 'N', 'N', NULL, 50, NULL, NULL, 1, NULL, NULL, NULL),
(99, 'N', 'N', NULL, 50, NULL, NULL, 8, NULL, NULL, NULL),
(100, 'N', 'N', NULL, 51, NULL, NULL, 1, NULL, NULL, NULL),
(101, 'N', 'N', NULL, 51, NULL, NULL, 6, NULL, NULL, NULL),
(102, 'N', 'N', NULL, 52, NULL, NULL, 1, NULL, NULL, NULL),
(103, 'N', 'N', NULL, 52, NULL, NULL, 4, NULL, NULL, NULL),
(104, 'N', 'N', NULL, 53, NULL, NULL, 1, NULL, NULL, NULL),
(105, 'N', 'N', NULL, 53, NULL, NULL, 6, NULL, NULL, NULL),
(106, 'N', 'N', NULL, 54, NULL, NULL, 1, NULL, NULL, NULL),
(107, 'N', 'N', NULL, 55, NULL, NULL, 1, NULL, NULL, NULL),
(108, 'N', 'N', NULL, 55, NULL, NULL, 4, NULL, NULL, NULL),
(109, 'N', 'N', NULL, 56, NULL, NULL, 1, NULL, NULL, NULL),
(110, 'N', 'N', NULL, 56, NULL, NULL, 4, NULL, NULL, NULL),
(111, 'N', 'N', NULL, 57, NULL, NULL, 1, NULL, NULL, NULL),
(112, 'N', 'N', NULL, 57, NULL, NULL, 6, NULL, NULL, NULL),
(113, 'N', 'N', NULL, 58, NULL, NULL, 1, NULL, NULL, NULL),
(114, 'N', 'N', NULL, 58, NULL, NULL, 4, NULL, NULL, NULL),
(115, 'N', 'N', NULL, 59, NULL, NULL, 1, NULL, NULL, NULL),
(116, 'N', 'N', NULL, 59, NULL, NULL, 4, NULL, NULL, NULL),
(117, 'N', 'N', NULL, 60, NULL, NULL, 1, NULL, NULL, NULL),
(118, 'N', 'N', NULL, 60, NULL, NULL, 4, NULL, NULL, NULL),
(119, 'N', 'N', NULL, 61, NULL, NULL, 5, NULL, NULL, NULL),
(120, 'N', 'N', NULL, 61, NULL, NULL, 2, NULL, NULL, NULL),
(121, 'N', 'N', NULL, 62, NULL, NULL, 1, NULL, NULL, NULL),
(122, 'N', 'N', NULL, 62, NULL, NULL, 4, NULL, NULL, NULL),
(123, 'N', 'N', NULL, 63, NULL, NULL, 1, NULL, NULL, NULL),
(124, 'N', 'N', NULL, 63, NULL, NULL, 4, NULL, NULL, NULL),
(125, 'N', 'N', NULL, 64, NULL, NULL, 1, NULL, NULL, NULL),
(126, 'N', 'N', NULL, 64, NULL, NULL, 4, NULL, NULL, NULL),
(127, 'N', 'N', NULL, 65, NULL, NULL, 1, NULL, NULL, NULL),
(128, 'N', 'N', NULL, 65, NULL, NULL, 4, NULL, NULL, NULL),
(129, 'N', 'N', NULL, 66, NULL, NULL, 1, NULL, NULL, NULL),
(130, 'N', 'N', NULL, 66, NULL, NULL, 4, NULL, NULL, NULL),
(131, 'N', 'N', NULL, 67, NULL, NULL, 1, NULL, NULL, NULL),
(132, 'N', 'N', NULL, 67, NULL, NULL, 4, NULL, NULL, NULL),
(133, 'N', 'N', NULL, 68, NULL, NULL, 1, NULL, NULL, NULL),
(134, 'N', 'N', NULL, 68, NULL, NULL, 4, NULL, NULL, NULL),
(135, 'N', 'N', NULL, 69, NULL, NULL, 1, NULL, NULL, NULL),
(136, 'N', 'N', NULL, 69, NULL, NULL, 4, NULL, NULL, NULL),
(137, 'N', 'N', NULL, 70, NULL, NULL, 1, NULL, NULL, NULL),
(138, 'N', 'N', NULL, 70, NULL, NULL, 4, NULL, NULL, NULL),
(139, 'N', 'N', NULL, 71, NULL, NULL, 1, NULL, NULL, NULL),
(140, 'N', 'N', NULL, 71, NULL, NULL, 8, NULL, NULL, NULL),
(141, 'N', 'N', NULL, 72, NULL, NULL, 1, NULL, NULL, NULL),
(142, 'N', 'N', NULL, 72, NULL, NULL, 4, NULL, NULL, NULL),
(143, 'N', 'N', NULL, 73, NULL, NULL, 1, NULL, NULL, NULL),
(144, 'N', 'N', NULL, 73, NULL, NULL, 6, NULL, NULL, NULL),
(145, 'N', 'N', NULL, 74, NULL, NULL, 1, NULL, NULL, NULL),
(146, 'N', 'N', NULL, 74, NULL, NULL, 6, NULL, NULL, NULL),
(147, 'N', 'N', NULL, 75, NULL, NULL, 1, NULL, NULL, NULL),
(148, 'N', 'N', NULL, 75, NULL, NULL, 4, NULL, NULL, NULL),
(149, 'N', 'N', NULL, 76, NULL, NULL, 1, NULL, NULL, NULL),
(150, 'N', 'N', NULL, 76, NULL, NULL, 4, NULL, NULL, NULL),
(151, 'N', 'N', NULL, 77, NULL, NULL, 1, NULL, NULL, NULL),
(152, 'N', 'N', NULL, 77, NULL, NULL, 4, NULL, NULL, NULL),
(153, 'N', 'N', NULL, 78, NULL, NULL, 1, NULL, NULL, NULL),
(154, 'N', 'N', NULL, 78, NULL, NULL, 4, NULL, NULL, NULL),
(155, 'N', 'N', NULL, 79, NULL, NULL, 1, NULL, NULL, NULL),
(156, 'N', 'N', NULL, 79, NULL, NULL, 4, NULL, NULL, NULL),
(157, 'N', 'N', NULL, 80, NULL, NULL, 1, NULL, NULL, NULL),
(158, 'N', 'N', NULL, 80, NULL, NULL, 4, NULL, NULL, NULL),
(159, 'N', 'N', NULL, 81, NULL, NULL, 1, NULL, NULL, NULL),
(160, 'N', 'N', NULL, 81, NULL, NULL, 6, NULL, NULL, NULL),
(161, 'N', 'N', NULL, 82, NULL, NULL, 1, NULL, NULL, NULL),
(162, 'N', 'N', NULL, 82, NULL, NULL, 4, NULL, NULL, NULL),
(163, 'N', 'N', NULL, 83, NULL, NULL, 1, NULL, NULL, NULL),
(164, 'N', 'N', NULL, 83, NULL, NULL, 6, NULL, NULL, NULL),
(165, 'N', 'N', NULL, 84, NULL, NULL, 1, NULL, NULL, NULL),
(166, 'N', 'N', NULL, 84, NULL, NULL, 4, NULL, NULL, NULL),
(167, 'N', 'N', NULL, 85, NULL, NULL, 1, NULL, NULL, NULL),
(168, 'N', 'N', NULL, 85, NULL, NULL, 4, NULL, NULL, NULL),
(169, 'N', 'N', NULL, 86, NULL, NULL, 1, NULL, NULL, NULL),
(170, 'O', 'N', NULL, 86, NULL, NULL, 4, NULL, NULL, NULL),
(171, 'N', 'N', NULL, 87, NULL, NULL, 1, NULL, NULL, NULL),
(172, 'N', 'N', NULL, 87, NULL, NULL, 4, NULL, NULL, NULL),
(173, 'N', 'N', NULL, 88, NULL, NULL, 5, NULL, NULL, NULL),
(174, 'N', 'N', NULL, 88, NULL, NULL, 2, NULL, NULL, NULL),
(175, 'N', 'N', NULL, 89, NULL, NULL, 1, NULL, NULL, NULL),
(176, 'N', 'N', NULL, 89, NULL, NULL, 4, NULL, NULL, NULL),
(177, 'N', 'N', NULL, 90, NULL, NULL, 1, NULL, NULL, NULL),
(178, 'N', 'N', NULL, 90, NULL, NULL, 4, NULL, NULL, NULL),
(179, 'O', 'N', NULL, 91, NULL, NULL, 1, NULL, NULL, NULL),
(180, 'O', 'N', NULL, 91, NULL, NULL, 4, NULL, NULL, NULL),
(181, 'N', 'N', NULL, 92, NULL, NULL, 5, NULL, NULL, NULL),
(182, 'N', 'N', NULL, 92, NULL, NULL, 2, NULL, NULL, NULL),
(183, 'N', 'N', NULL, 93, NULL, NULL, 1, NULL, NULL, NULL),
(184, 'N', 'N', NULL, 93, NULL, NULL, 4, NULL, NULL, NULL),
(185, 'N', 'N', NULL, 94, NULL, NULL, 1, NULL, NULL, NULL),
(186, 'N', 'N', NULL, 94, NULL, NULL, 4, NULL, NULL, NULL),
(187, 'N', 'N', NULL, 95, NULL, NULL, 1, NULL, NULL, NULL),
(188, 'N', 'N', NULL, 95, NULL, NULL, 6, NULL, NULL, NULL),
(189, 'N', 'N', NULL, 96, NULL, NULL, 1, NULL, NULL, NULL),
(190, 'N', 'N', NULL, 96, NULL, NULL, 4, NULL, NULL, NULL),
(191, 'N', 'N', NULL, 97, NULL, NULL, 1, NULL, NULL, NULL),
(192, 'N', 'N', NULL, 97, NULL, NULL, 4, NULL, NULL, NULL),
(193, 'N', 'N', NULL, 98, NULL, NULL, 1, NULL, NULL, NULL),
(194, 'N', 'N', NULL, 98, NULL, NULL, 6, NULL, NULL, NULL),
(195, 'N', 'N', NULL, 99, NULL, NULL, 1, NULL, NULL, NULL),
(196, 'N', 'N', NULL, 99, NULL, NULL, 4, NULL, NULL, NULL),
(197, 'N', 'N', NULL, 100, NULL, NULL, 1, NULL, NULL, NULL),
(198, 'N', 'N', NULL, 100, NULL, NULL, 4, NULL, NULL, NULL),
(199, 'N', 'N', NULL, 101, NULL, NULL, 1, NULL, NULL, NULL),
(200, 'N', 'N', NULL, 101, NULL, NULL, 4, NULL, NULL, NULL),
(201, 'N', 'N', NULL, 102, NULL, NULL, 1, NULL, NULL, NULL),
(202, 'N', 'N', NULL, 102, NULL, NULL, 6, NULL, NULL, NULL),
(203, 'N', 'N', NULL, 103, NULL, NULL, 1, NULL, NULL, NULL),
(204, 'N', 'N', NULL, 103, NULL, NULL, 4, NULL, NULL, NULL),
(205, 'N', 'N', NULL, 104, NULL, NULL, 1, NULL, NULL, NULL),
(206, 'N', 'N', NULL, 104, NULL, NULL, 4, NULL, NULL, NULL),
(207, 'N', 'N', NULL, 105, NULL, NULL, 1, NULL, NULL, NULL),
(208, 'N', 'N', NULL, 105, NULL, NULL, 4, NULL, NULL, NULL),
(209, 'N', 'N', NULL, 106, NULL, NULL, 1, NULL, NULL, NULL),
(210, 'N', 'N', NULL, 106, NULL, NULL, 4, NULL, NULL, NULL),
(211, 'N', 'N', NULL, 107, NULL, NULL, 1, NULL, NULL, NULL),
(212, 'N', 'N', NULL, 107, NULL, NULL, 4, NULL, NULL, NULL),
(213, 'N', 'N', NULL, 108, NULL, NULL, 1, NULL, NULL, NULL),
(214, 'N', 'N', NULL, 108, NULL, NULL, 4, NULL, NULL, NULL),
(215, 'N', 'N', NULL, 109, NULL, NULL, 1, NULL, NULL, NULL),
(216, 'N', 'N', NULL, 109, NULL, NULL, 4, NULL, NULL, NULL),
(217, 'N', 'N', NULL, 110, NULL, NULL, 1, NULL, NULL, NULL),
(218, 'N', 'N', NULL, 110, NULL, NULL, 4, NULL, NULL, NULL),
(219, 'N', 'N', NULL, 111, NULL, NULL, 1, NULL, NULL, NULL),
(220, 'N', 'N', NULL, 111, NULL, NULL, 6, NULL, NULL, NULL),
(221, 'N', 'N', NULL, 112, NULL, NULL, 1, NULL, NULL, NULL),
(222, 'N', 'N', NULL, 112, NULL, NULL, 8, NULL, NULL, NULL),
(223, 'N', 'N', NULL, 113, NULL, NULL, 1, NULL, NULL, NULL),
(224, 'N', 'N', NULL, 113, NULL, NULL, 4, NULL, NULL, NULL),
(225, 'N', 'N', NULL, 114, NULL, NULL, 1, NULL, NULL, NULL),
(226, 'N', 'N', NULL, 114, NULL, NULL, 4, NULL, NULL, NULL),
(227, 'N', 'N', NULL, 115, NULL, NULL, 1, NULL, NULL, NULL),
(228, 'N', 'N', NULL, 115, NULL, NULL, 4, NULL, NULL, NULL),
(229, 'N', 'N', NULL, 116, NULL, NULL, 1, NULL, NULL, NULL),
(230, 'N', 'N', NULL, 116, NULL, NULL, 4, NULL, NULL, NULL),
(231, 'N', 'N', NULL, 117, NULL, NULL, 1, NULL, NULL, NULL),
(232, 'N', 'N', NULL, 117, NULL, NULL, 4, NULL, NULL, NULL),
(233, 'N', 'N', NULL, 118, NULL, NULL, 5, NULL, NULL, NULL),
(234, 'N', 'N', NULL, 118, NULL, NULL, 2, NULL, NULL, NULL),
(235, 'N', 'N', NULL, 119, NULL, NULL, 1, NULL, NULL, NULL),
(236, 'N', 'N', NULL, 119, NULL, NULL, 4, NULL, NULL, NULL),
(237, 'N', 'N', NULL, 120, NULL, NULL, 3, NULL, NULL, NULL),
(238, 'N', 'N', NULL, 120, NULL, NULL, 2, NULL, NULL, NULL),
(239, 'N', 'N', NULL, 121, NULL, NULL, 1, NULL, NULL, NULL),
(240, 'N', 'N', NULL, 121, NULL, NULL, 6, NULL, NULL, NULL),
(241, 'N', 'N', NULL, 122, NULL, NULL, 1, NULL, NULL, NULL),
(242, 'N', 'N', NULL, 122, NULL, NULL, 4, NULL, NULL, NULL),
(243, 'N', 'N', NULL, 123, NULL, NULL, 1, NULL, NULL, NULL),
(244, 'N', 'N', NULL, 123, NULL, NULL, 6, NULL, NULL, NULL),
(245, 'N', 'N', NULL, 124, NULL, NULL, 1, NULL, NULL, NULL),
(246, 'N', 'N', NULL, 124, NULL, NULL, 8, NULL, NULL, NULL),
(247, 'N', 'N', NULL, 125, NULL, NULL, 1, NULL, NULL, NULL),
(248, 'N', 'N', NULL, 125, NULL, NULL, 6, NULL, NULL, NULL),
(249, 'N', 'N', NULL, 126, NULL, NULL, 1, NULL, NULL, NULL),
(250, 'N', 'N', NULL, 126, NULL, NULL, 4, NULL, NULL, NULL),
(251, 'N', 'N', NULL, 127, NULL, NULL, 1, NULL, NULL, NULL),
(252, 'N', 'N', NULL, 127, NULL, NULL, 4, NULL, NULL, NULL),
(253, 'N', 'N', NULL, 128, NULL, NULL, 1, NULL, NULL, NULL),
(254, 'N', 'N', NULL, 128, NULL, NULL, 4, NULL, NULL, NULL),
(255, 'N', 'N', NULL, 129, NULL, NULL, 5, NULL, NULL, NULL),
(256, 'N', 'N', NULL, 129, NULL, NULL, 2, NULL, NULL, NULL),
(257, 'N', 'N', NULL, 130, NULL, NULL, 3, NULL, NULL, NULL),
(258, 'N', 'N', NULL, 130, NULL, NULL, 2, NULL, NULL, NULL),
(259, 'N', 'N', NULL, 131, NULL, NULL, 1, NULL, NULL, NULL),
(260, 'O', 'N', NULL, 131, NULL, NULL, 4, NULL, NULL, NULL),
(261, 'N', 'N', NULL, 132, NULL, NULL, 1, NULL, NULL, NULL),
(262, 'N', 'N', NULL, 132, NULL, NULL, 4, NULL, NULL, NULL),
(263, 'N', 'N', NULL, 133, NULL, NULL, 1, NULL, NULL, NULL),
(264, 'N', 'N', NULL, 133, NULL, NULL, 4, NULL, NULL, NULL),
(265, 'N', 'N', NULL, 134, NULL, NULL, 1, NULL, NULL, NULL),
(266, 'N', 'N', NULL, 134, NULL, NULL, 6, NULL, NULL, NULL),
(267, 'N', 'N', NULL, 135, NULL, NULL, 1, NULL, NULL, NULL),
(268, 'N', 'N', NULL, 135, NULL, NULL, 6, NULL, NULL, NULL),
(269, 'N', 'N', NULL, 136, NULL, NULL, 1, NULL, NULL, NULL),
(270, 'N', 'N', NULL, 136, NULL, NULL, 6, NULL, NULL, NULL),
(271, 'N', 'N', NULL, 137, NULL, NULL, 1, NULL, NULL, NULL),
(272, 'N', 'N', NULL, 137, NULL, NULL, 6, NULL, NULL, NULL),
(273, 'N', 'N', NULL, 138, NULL, NULL, 1, NULL, NULL, NULL),
(274, 'N', 'N', NULL, 138, NULL, NULL, 4, NULL, NULL, NULL),
(275, 'N', 'O', NULL, 139, NULL, NULL, 3, NULL, NULL, NULL),
(276, 'N', 'O', NULL, 139, NULL, NULL, 2, NULL, NULL, NULL),
(277, 'N', 'N', NULL, 140, NULL, NULL, 1, NULL, NULL, NULL),
(278, 'N', 'N', NULL, 140, NULL, NULL, 6, NULL, NULL, NULL),
(279, 'N', 'N', NULL, 141, NULL, NULL, 1, NULL, NULL, NULL),
(280, 'N', 'N', NULL, 141, NULL, NULL, 4, NULL, NULL, NULL),
(281, 'N', 'N', NULL, 142, NULL, NULL, 1, NULL, NULL, NULL),
(282, 'N', 'N', NULL, 142, NULL, NULL, 6, NULL, NULL, NULL),
(283, 'N', 'N', NULL, 143, NULL, NULL, 1, NULL, NULL, NULL),
(284, 'N', 'N', NULL, 143, NULL, NULL, 4, NULL, NULL, NULL),
(285, 'N', 'N', NULL, 144, NULL, NULL, 1, NULL, NULL, NULL),
(286, 'N', 'N', NULL, 144, NULL, NULL, 6, NULL, NULL, NULL),
(287, 'N', 'N', NULL, 145, NULL, NULL, 1, NULL, NULL, NULL),
(288, 'N', 'N', NULL, 145, NULL, NULL, 4, NULL, NULL, NULL),
(289, 'N', 'N', NULL, 146, NULL, NULL, 1, NULL, NULL, NULL),
(290, 'N', 'N', NULL, 146, NULL, NULL, 4, NULL, NULL, NULL),
(291, 'N', 'N', NULL, 147, NULL, NULL, 7, NULL, NULL, NULL),
(292, 'N', 'N', NULL, 147, NULL, NULL, 2, NULL, NULL, NULL),
(293, 'N', 'N', NULL, 148, NULL, NULL, 1, NULL, NULL, NULL),
(294, 'N', 'N', NULL, 148, NULL, NULL, 4, NULL, NULL, NULL),
(295, 'N', 'N', NULL, 149, NULL, NULL, 1, NULL, NULL, NULL),
(296, 'N', 'N', NULL, 149, NULL, NULL, 6, NULL, NULL, NULL),
(297, 'N', 'N', NULL, 150, NULL, NULL, 1, NULL, NULL, NULL),
(298, 'N', 'N', NULL, 150, NULL, NULL, 6, NULL, NULL, NULL),
(299, 'N', 'N', NULL, 151, NULL, NULL, 1, NULL, NULL, NULL),
(300, 'N', 'N', NULL, 151, NULL, NULL, 4, NULL, NULL, NULL),
(301, 'N', 'N', NULL, 152, NULL, NULL, 1, NULL, NULL, NULL),
(302, 'N', 'N', NULL, 152, NULL, NULL, 8, NULL, NULL, NULL),
(303, 'N', 'N', NULL, 153, NULL, NULL, 5, NULL, NULL, NULL),
(304, 'N', 'N', NULL, 153, NULL, NULL, 2, NULL, NULL, NULL),
(305, 'N', 'N', NULL, 154, NULL, NULL, 1, NULL, NULL, NULL),
(306, 'N', 'N', NULL, 154, NULL, NULL, 8, NULL, NULL, NULL),
(307, 'N', 'N', NULL, 155, NULL, NULL, 1, NULL, NULL, NULL),
(308, 'N', 'N', NULL, 155, NULL, NULL, 4, NULL, NULL, NULL),
(309, 'N', 'N', NULL, 156, NULL, NULL, 1, NULL, NULL, NULL),
(310, 'N', 'N', NULL, 156, NULL, NULL, 4, NULL, NULL, NULL),
(311, 'N', 'N', NULL, 157, NULL, NULL, 1, NULL, NULL, NULL),
(312, 'N', 'N', NULL, 157, NULL, NULL, 4, NULL, NULL, NULL),
(313, 'N', 'N', NULL, 158, NULL, NULL, 5, NULL, NULL, NULL),
(314, 'N', 'N', NULL, 158, NULL, NULL, 2, NULL, NULL, NULL),
(315, 'N', 'N', NULL, 159, NULL, NULL, 1, NULL, NULL, NULL),
(316, 'N', 'N', NULL, 159, NULL, NULL, 4, NULL, NULL, NULL),
(317, 'N', 'N', NULL, 160, NULL, NULL, 1, NULL, NULL, NULL),
(318, 'N', 'N', NULL, 160, NULL, NULL, 4, NULL, NULL, NULL),
(319, 'N', 'N', NULL, 161, NULL, NULL, 1, NULL, NULL, NULL),
(320, 'N', 'N', NULL, 161, NULL, NULL, 4, NULL, NULL, NULL),
(321, 'N', 'N', NULL, 162, NULL, NULL, 1, NULL, NULL, NULL),
(322, 'N', 'N', NULL, 162, NULL, NULL, 6, NULL, NULL, NULL),
(323, 'N', 'N', NULL, 163, NULL, NULL, 1, NULL, NULL, NULL),
(324, 'N', 'N', NULL, 163, NULL, NULL, 4, NULL, NULL, NULL),
(325, 'N', 'N', NULL, 164, NULL, NULL, 1, NULL, NULL, NULL),
(326, 'N', 'N', NULL, 164, NULL, NULL, 4, NULL, NULL, NULL),
(327, 'N', 'N', NULL, 165, NULL, NULL, 3, NULL, NULL, NULL),
(328, 'N', 'N', NULL, 165, NULL, NULL, 2, NULL, NULL, NULL),
(329, 'N', 'N', NULL, 166, NULL, NULL, 1, NULL, NULL, NULL),
(330, 'N', 'N', NULL, 166, NULL, NULL, 4, NULL, NULL, NULL),
(331, 'N', 'N', NULL, 167, NULL, NULL, 1, NULL, NULL, NULL),
(332, 'N', 'N', NULL, 167, NULL, NULL, 8, NULL, NULL, NULL),
(333, 'N', 'N', NULL, 168, NULL, NULL, 1, NULL, NULL, NULL),
(334, 'N', 'N', NULL, 168, NULL, NULL, 6, NULL, NULL, NULL),
(335, 'N', 'N', NULL, 169, NULL, NULL, 1, NULL, NULL, NULL),
(336, 'N', 'N', NULL, 169, NULL, NULL, 4, NULL, NULL, NULL),
(337, 'N', 'N', NULL, 170, NULL, NULL, 1, NULL, NULL, NULL),
(338, 'N', 'N', NULL, 170, NULL, NULL, 4, NULL, NULL, NULL),
(339, 'N', 'N', NULL, 171, NULL, NULL, 1, NULL, NULL, NULL),
(340, 'N', 'N', NULL, 171, NULL, NULL, 4, NULL, NULL, NULL),
(341, 'N', 'N', NULL, 172, NULL, NULL, 1, NULL, NULL, NULL),
(342, 'N', 'N', NULL, 172, NULL, NULL, 6, NULL, NULL, NULL),
(343, 'N', 'N', NULL, 173, NULL, NULL, 1, NULL, NULL, NULL),
(344, 'N', 'N', NULL, 173, NULL, NULL, 4, NULL, NULL, NULL),
(345, 'N', 'N', NULL, 174, NULL, NULL, 1, NULL, NULL, NULL),
(346, 'N', 'N', NULL, 174, NULL, NULL, 4, NULL, NULL, NULL),
(347, 'N', 'N', NULL, 175, NULL, NULL, 1, NULL, NULL, NULL),
(348, 'N', 'N', NULL, 175, NULL, NULL, 4, NULL, NULL, NULL),
(349, 'O', 'N', NULL, 176, NULL, NULL, 1, NULL, NULL, NULL),
(350, 'O', 'N', NULL, 176, NULL, NULL, 4, NULL, NULL, NULL),
(351, 'N', 'N', NULL, 177, NULL, NULL, 1, NULL, NULL, NULL),
(352, 'N', 'N', NULL, 177, NULL, NULL, 4, NULL, NULL, NULL),
(353, 'N', 'N', NULL, 178, NULL, NULL, 1, NULL, NULL, NULL),
(354, 'N', 'N', NULL, 178, NULL, NULL, 6, NULL, NULL, NULL),
(355, 'N', 'N', NULL, 179, NULL, NULL, 1, NULL, NULL, NULL),
(356, 'N', 'N', NULL, 179, NULL, NULL, 4, NULL, NULL, NULL),
(357, 'N', 'N', NULL, 180, NULL, NULL, 3, NULL, NULL, NULL),
(358, 'N', 'N', NULL, 180, NULL, NULL, 2, NULL, NULL, NULL),
(359, 'N', 'N', NULL, 181, NULL, NULL, 1, NULL, NULL, NULL),
(360, 'N', 'N', NULL, 181, NULL, NULL, 4, NULL, NULL, NULL),
(361, 'N', 'N', NULL, 182, NULL, NULL, 1, NULL, NULL, NULL),
(362, 'N', 'N', NULL, 182, NULL, NULL, 6, NULL, NULL, NULL),
(363, 'N', 'N', NULL, 183, NULL, NULL, 1, NULL, NULL, NULL),
(364, 'N', 'N', NULL, 183, NULL, NULL, 4, NULL, NULL, NULL),
(365, 'N', 'N', NULL, 184, NULL, NULL, 3, NULL, NULL, NULL),
(366, 'N', 'N', NULL, 184, NULL, NULL, 2, NULL, NULL, NULL),
(367, 'N', 'N', NULL, 185, NULL, NULL, 1, NULL, NULL, NULL),
(368, 'N', 'N', NULL, 185, NULL, NULL, 6, NULL, NULL, NULL),
(369, 'N', 'N', NULL, 186, NULL, NULL, 1, NULL, NULL, NULL),
(370, 'N', 'N', NULL, 186, NULL, NULL, 4, NULL, NULL, NULL),
(371, 'N', 'N', NULL, 187, NULL, NULL, 1, NULL, NULL, NULL),
(372, 'N', 'N', NULL, 187, NULL, NULL, 4, NULL, NULL, NULL),
(373, 'N', 'N', NULL, 188, NULL, NULL, 7, NULL, NULL, NULL),
(374, 'N', 'N', NULL, 188, NULL, NULL, 2, NULL, NULL, NULL),
(375, 'N', 'N', NULL, 189, NULL, NULL, 1, NULL, NULL, NULL),
(376, 'N', 'N', NULL, 189, NULL, NULL, 4, NULL, NULL, NULL),
(377, 'N', 'N', NULL, 190, NULL, NULL, 1, NULL, NULL, NULL),
(378, 'N', 'N', NULL, 190, NULL, NULL, 6, NULL, NULL, NULL),
(379, 'N', 'N', NULL, 191, NULL, NULL, 1, NULL, NULL, NULL),
(380, 'N', 'N', NULL, 191, NULL, NULL, 8, NULL, NULL, NULL),
(381, 'N', 'N', NULL, 192, NULL, NULL, 1, NULL, NULL, NULL),
(382, 'N', 'N', NULL, 192, NULL, NULL, 4, NULL, NULL, NULL),
(383, 'N', 'N', NULL, 193, NULL, NULL, 1, NULL, NULL, NULL),
(384, 'N', 'N', NULL, 193, NULL, NULL, 6, NULL, NULL, NULL),
(385, 'N', 'N', NULL, 194, NULL, NULL, 1, NULL, NULL, NULL),
(386, 'N', 'N', NULL, 194, NULL, NULL, 6, NULL, NULL, NULL),
(387, 'N', 'N', NULL, 195, NULL, NULL, 1, NULL, NULL, NULL),
(388, 'N', 'N', NULL, 195, NULL, NULL, 4, NULL, NULL, NULL),
(389, 'N', 'N', NULL, 196, NULL, NULL, 1, NULL, NULL, NULL),
(390, 'N', 'N', NULL, 196, NULL, NULL, 6, NULL, NULL, NULL),
(391, 'N', 'N', NULL, 197, NULL, NULL, 1, NULL, NULL, NULL),
(392, 'N', 'N', NULL, 197, NULL, NULL, 4, NULL, NULL, NULL),
(393, 'N', 'N', NULL, 198, NULL, NULL, 1, NULL, NULL, NULL),
(394, 'N', 'N', NULL, 198, NULL, NULL, 6, NULL, NULL, NULL),
(395, 'N', 'N', NULL, 199, NULL, NULL, 1, NULL, NULL, NULL),
(396, 'N', 'N', NULL, 199, NULL, NULL, 6, NULL, NULL, NULL),
(397, 'N', 'N', NULL, 200, NULL, NULL, 1, NULL, NULL, NULL),
(398, 'N', 'N', NULL, 200, NULL, NULL, 4, NULL, NULL, NULL),
(399, 'N', 'N', NULL, 201, NULL, NULL, 5, NULL, NULL, NULL),
(400, 'N', 'N', NULL, 201, NULL, NULL, 2, NULL, NULL, NULL),
(401, 'N', 'N', NULL, 202, NULL, NULL, 1, NULL, NULL, NULL),
(402, 'N', 'N', NULL, 202, NULL, NULL, 4, NULL, NULL, NULL),
(403, 'N', 'N', NULL, 203, NULL, NULL, 1, NULL, NULL, NULL),
(404, 'N', 'N', NULL, 203, NULL, NULL, 4, NULL, NULL, NULL),
(405, 'N', 'N', NULL, 204, NULL, NULL, 1, NULL, NULL, NULL),
(406, 'N', 'N', NULL, 204, NULL, NULL, 4, NULL, NULL, NULL),
(407, 'N', 'N', NULL, 205, NULL, NULL, 1, NULL, NULL, NULL),
(408, 'N', 'N', NULL, 205, NULL, NULL, 4, NULL, NULL, NULL),
(409, 'N', 'N', NULL, 206, NULL, NULL, 1, NULL, NULL, NULL),
(410, 'N', 'N', NULL, 206, NULL, NULL, 6, NULL, NULL, NULL),
(411, 'N', 'N', NULL, 207, NULL, NULL, 5, NULL, NULL, NULL),
(412, 'N', 'N', NULL, 207, NULL, NULL, 2, NULL, NULL, NULL),
(413, 'N', 'N', NULL, 208, NULL, NULL, 1, NULL, NULL, NULL),
(414, 'N', 'N', NULL, 208, NULL, NULL, 4, NULL, NULL, NULL),
(415, 'N', 'N', NULL, 209, NULL, NULL, 1, NULL, NULL, NULL),
(416, 'N', 'N', NULL, 209, NULL, NULL, 4, NULL, NULL, NULL),
(417, 'N', 'N', NULL, 210, NULL, NULL, 1, NULL, NULL, NULL),
(418, 'N', 'N', NULL, 210, NULL, NULL, 4, NULL, NULL, NULL),
(419, 'N', 'N', NULL, 211, NULL, NULL, 1, NULL, NULL, NULL),
(420, 'N', 'N', NULL, 211, NULL, NULL, 4, NULL, NULL, NULL),
(421, 'N', 'N', NULL, 212, NULL, NULL, 1, NULL, NULL, NULL),
(422, 'N', 'N', NULL, 212, NULL, NULL, 6, NULL, NULL, NULL),
(423, 'N', 'N', NULL, 213, NULL, NULL, 3, NULL, NULL, NULL),
(424, 'N', 'N', NULL, 213, NULL, NULL, 2, NULL, NULL, NULL),
(425, 'N', 'N', NULL, 214, NULL, NULL, 1, NULL, NULL, NULL),
(426, 'N', 'N', NULL, 214, NULL, NULL, 4, NULL, NULL, NULL),
(427, 'N', 'N', NULL, 215, NULL, NULL, 1, NULL, NULL, NULL),
(428, 'N', 'N', NULL, 215, NULL, NULL, 8, NULL, NULL, NULL),
(429, 'N', 'N', NULL, 216, NULL, NULL, 1, NULL, NULL, NULL),
(430, 'N', 'N', NULL, 216, NULL, NULL, 8, NULL, NULL, NULL),
(431, 'N', 'N', NULL, 217, NULL, NULL, 1, NULL, NULL, NULL),
(432, 'N', 'N', NULL, 217, NULL, NULL, 8, NULL, NULL, NULL),
(433, 'N', 'N', NULL, 218, NULL, NULL, 5, NULL, NULL, NULL),
(434, 'N', 'N', NULL, 218, NULL, NULL, 2, NULL, NULL, NULL),
(435, 'N', 'N', NULL, 219, NULL, NULL, 1, NULL, NULL, NULL),
(436, 'N', 'N', NULL, 219, NULL, NULL, 4, NULL, NULL, NULL),
(437, 'N', 'N', NULL, 220, NULL, NULL, 1, NULL, NULL, NULL),
(438, 'N', 'N', NULL, 220, NULL, NULL, 4, NULL, NULL, NULL),
(439, 'N', 'N', NULL, 221, NULL, NULL, 1, NULL, NULL, NULL),
(440, 'N', 'N', NULL, 221, NULL, NULL, 4, NULL, NULL, NULL),
(441, 'N', 'N', NULL, 222, NULL, NULL, 1, NULL, NULL, NULL),
(442, 'N', 'N', NULL, 222, NULL, NULL, 4, NULL, NULL, NULL),
(443, 'N', 'N', NULL, 223, NULL, NULL, 5, NULL, NULL, NULL),
(444, 'N', 'N', NULL, 223, NULL, NULL, 2, NULL, NULL, NULL),
(445, 'N', 'N', NULL, 224, NULL, NULL, 1, NULL, NULL, NULL),
(446, 'N', 'N', NULL, 224, NULL, NULL, 4, NULL, NULL, NULL),
(447, 'N', 'N', NULL, 225, NULL, NULL, 1, NULL, NULL, NULL),
(448, 'N', 'N', NULL, 225, NULL, NULL, 4, NULL, NULL, NULL),
(449, 'N', 'N', NULL, 226, NULL, NULL, 1, NULL, NULL, NULL),
(450, 'N', 'N', NULL, 226, NULL, NULL, 4, NULL, NULL, NULL),
(451, 'N', 'N', NULL, 227, NULL, NULL, 1, NULL, NULL, NULL),
(452, 'N', 'N', NULL, 227, NULL, NULL, 4, NULL, NULL, NULL),
(453, 'N', 'N', NULL, 228, NULL, NULL, 1, NULL, NULL, NULL),
(454, 'N', 'N', NULL, 228, NULL, NULL, 6, NULL, NULL, NULL),
(455, 'N', 'N', NULL, 229, NULL, NULL, 1, NULL, NULL, NULL),
(456, 'N', 'N', NULL, 229, NULL, NULL, 4, NULL, NULL, NULL),
(457, 'N', 'N', NULL, 230, NULL, NULL, 1, NULL, NULL, NULL),
(458, 'N', 'N', NULL, 230, NULL, NULL, 8, NULL, NULL, NULL),
(459, 'N', 'N', NULL, 231, NULL, NULL, 1, NULL, NULL, NULL),
(460, 'N', 'N', NULL, 231, NULL, NULL, 4, NULL, NULL, NULL),
(461, 'N', 'N', NULL, 232, NULL, NULL, 1, NULL, NULL, NULL),
(462, 'N', 'N', NULL, 232, NULL, NULL, 4, NULL, NULL, NULL),
(463, 'N', 'N', NULL, 233, NULL, NULL, 1, NULL, NULL, NULL),
(464, 'N', 'N', NULL, 233, NULL, NULL, 6, NULL, NULL, NULL),
(465, 'N', 'N', NULL, 234, NULL, NULL, 1, NULL, NULL, NULL),
(466, 'N', 'N', NULL, 234, NULL, NULL, 6, NULL, NULL, NULL),
(467, 'N', 'N', NULL, 235, NULL, NULL, 1, NULL, NULL, NULL),
(468, 'N', 'N', NULL, 235, NULL, NULL, 4, NULL, NULL, NULL),
(469, 'N', 'N', NULL, 236, NULL, NULL, 1, NULL, NULL, NULL),
(470, 'N', 'N', NULL, 236, NULL, NULL, 4, NULL, NULL, NULL),
(471, 'N', 'N', NULL, 237, NULL, NULL, 1, NULL, NULL, NULL),
(472, 'N', 'N', NULL, 237, NULL, NULL, 4, NULL, NULL, NULL),
(473, 'N', 'N', NULL, 238, NULL, NULL, 1, NULL, NULL, NULL),
(474, 'N', 'N', NULL, 238, NULL, NULL, 4, NULL, NULL, NULL),
(475, 'N', 'N', NULL, 239, NULL, NULL, 5, NULL, NULL, NULL),
(476, 'N', 'N', NULL, 239, NULL, NULL, 2, NULL, NULL, NULL),
(477, 'N', 'N', NULL, 240, NULL, NULL, 1, NULL, NULL, NULL),
(478, 'N', 'N', NULL, 240, NULL, NULL, 6, NULL, NULL, NULL),
(479, 'N', 'N', NULL, 241, NULL, NULL, 1, NULL, NULL, NULL),
(480, 'N', 'N', NULL, 241, NULL, NULL, 6, NULL, NULL, NULL),
(481, 'N', 'N', NULL, 242, NULL, NULL, 1, NULL, NULL, NULL),
(482, 'N', 'N', NULL, 242, NULL, NULL, 4, NULL, NULL, NULL);

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
(4, 8),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(14, 5),
(14, 6),
(14, 7),
(14, 8),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(16, 5),
(16, 6),
(16, 7),
(16, 8);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id`, `libelle`) VALUES
(1, '120'),
(2, '121'),
(7, '119'),
(8, '125'),
(9, '126'),
(10, '127'),
(11, '128'),
(12, '106'),
(13, '103'),
(14, '107'),
(15, '105'),
(16, '108'),
(17, '109'),
(18, '104');

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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
  `idPlage` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tabletempo`
--

INSERT INTO `tabletempo` (`idUtilisateur`, `idDemiJournee`, `idSalle`, `idPlage`, `date`) VALUES
(1, 1, 3, 1, '2019-06-03'),
(10, 3, 2, 1, '2019-06-04'),
(1, 1, 3, 2, '2019-06-03'),
(10, 3, 2, 2, '2019-06-04'),
(1, 1, 3, 3, '2019-06-03'),
(10, 3, 2, 3, '2019-06-04'),
(1, 1, 3, 4, '2019-06-03'),
(10, 3, 2, 4, '2019-06-04'),
(1, 2, 3, 5, '2019-06-03'),
(10, 2, 2, 5, '2019-06-03'),
(1, 4, 3, 5, '2019-06-04'),
(1, 2, 3, 6, '2019-06-03'),
(10, 2, 2, 6, '2019-06-03'),
(1, 4, 3, 6, '2019-06-04'),
(1, 2, 3, 7, '2019-06-03'),
(10, 2, 2, 7, '2019-06-03'),
(1, 4, 3, 7, '2019-06-04'),
(1, 2, 3, 8, '2019-06-03'),
(10, 2, 2, 8, '2019-06-03'),
(1, 4, 3, 8, '2019-06-04');

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
  `idDiscipline` int(11) DEFAULT NULL,
  `idCivilite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idTypeUtilisateur` (`idTypeUtilisateur`),
  KEY `idSalleAtt` (`idSalleAtt`),
  KEY `FK_idDiscipline` (`idDiscipline`),
  KEY `FK_idcivilite` (`idCivilite`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `identifiant`, `motDePasse`, `mail`, `nom`, `prenom`, `idTypeUtilisateur`, `idSalleAtt`, `idDiscipline`, `idCivilite`) VALUES
(1, 'dolores.hurtado', 'edfe4707763b80c7defe9ead7ab32d75c010474a', 'd.hurtado@gmail.com', 'Hurtado', 'Dolores', 2, 1, 2, 2),
(2, 'caroline.blatge', '287f43aa89e14005a7255be8fc246ad537087090', 'c.blatge@gmail.com', 'blatge', 'caroline', 2, 10, 1, 2),
(3, 'benjamin.bue', 'fc2e9fafb2d7a7978802c6a57c0669aee2f65024', 'b.bue@gmail.com', 'bue', 'benjamin', 2, 7, 1, 1),
(4, 'laetitia.candes', 'e70c31188c28b4c80e15e5eda52c00899f65e33e', 'l.candes@gmail.com', 'candes', 'laetitia', 2, 2, 1, 2),
(5, 'amar.el farissi', '4c83b77b3ab5fd8aba4e9585deb11b75ffc6c2c1', 'a.farissi@gmail.com', 'el farissi', 'amar', 2, 1, 1, 1),
(6, 'valerie.genty', '0b4709419aedf27e508f4ed2f1db91dc992c9e07', 'v.genty@gmail.com', 'genty', 'valerie', 2, 9, 1, 2),
(7, 'murielle.galby', '44b370692704bae63c70f63e3312f5f27c630fb2', 'm.galby@gmail.com', 'galby', 'murielle', 2, NULL, 1, 2),
(8, 'manon.lambert', '3dd5b809272e5bd20eb3bd3295847f720c0cb3ae', 'm.lambert@gmail.com', 'lambert', 'manon', 2, NULL, 1, 2),
(9, 'florence.sultana', '66e687bf0c705a66f4903883b15a7c051be7a16b', 'f.sultana@gmail.com', 'sultana', 'florence', 2, 11, 1, 2),
(10, 'dominique.trimouille', '8623809c29cc585eb39dfe4fd6dbb961237c9776', 'd.trimouille', 'trimouille', 'dominique', 2, 8, 1, 2),
(11, 'emmanuelle.lucas', 'f32d6a28ed31112421c7b672ad6131c8c7ac921d', 'e.lucas@gmail.com', 'lucas', 'emmanuelle', 2, NULL, 2, 2),
(12, 'katel.le hesran', '878e6bd843b3dd99c3e4ccf4f17c8e904ed9a1dc', 'k.lehersan@gmail.com', 'le hesran', 'katel', 2, 12, 2, 2),
(13, 'lydie.preschoux', 'df60cb229b8c16fb218f320ceae26fc5863a153b', 'l.preschoux', 'preschoux', 'lydie', 2, 13, 2, 2),
(14, 'audrey.zavaleta', '82ab6b78e10cbd146a80dbfef6e5aa6c439ce090', 'a.zavaleta', 'zavaleta', 'audrey', 2, 15, 2, 2),
(15, 'milena.maselli', '1107fc0b2bd4706fd502ecd7c2de1136a4d89a9b', 'm.maselli', 'maselli', 'milena', 2, 16, 4, 2),
(16, 'sabine.berruyer', '4420521ec43a1758c1ead08a6793466132f58112', 's.berruyer@gmail.com', 'berruyer', 'sabine', 2, 17, 3, 2),
(17, 'valerie.mauchamp', '06ad4d8550ce2ae936a9581d819e60f099770436', 'v.mauchamp@gmail.com', 'mauchamp', 'valerie', 2, 18, 3, 2),
(18, 'admin', '47ac11a73ddd132c85947e90bb7ca5b18a789990', 'admin@gmail.com', 'Admin', 'Admin', 1, NULL, NULL, 3);

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
