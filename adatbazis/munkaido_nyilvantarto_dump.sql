-- --------------------------------------------------------
-- Gazdagép:                     192.168.1.99
-- Szerver verzió:               10.7.3-MariaDB - Source distribution
-- Szerver OS:                   Linux
-- HeidiSQL Verzió:              12.14.0.7165
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Adatbázis struktúra mentése a munkaido.
DROP DATABASE IF EXISTS `munkaido`;
CREATE DATABASE IF NOT EXISTS `munkaido` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci */;
USE `munkaido`;

-- Struktúra mentése tábla munkaido. alkalmazott
DROP TABLE IF EXISTS `alkalmazott`;
CREATE TABLE IF NOT EXISTS `alkalmazott` (
  `alkalmazott_azonosito` int(11) NOT NULL AUTO_INCREMENT,
  `szuletesi_nev` varchar(100) COLLATE utf8mb3_hungarian_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb3_hungarian_ci NOT NULL,
  `adoazonosito_jel` varchar(10) COLLATE utf8mb3_hungarian_ci NOT NULL,
  `homeoffice_lehetoseg` enum('I','N') COLLATE utf8mb3_hungarian_ci NOT NULL DEFAULT 'N',
  `beosztas` varchar(50) COLLATE utf8mb3_hungarian_ci NOT NULL DEFAULT '0',
  `engedelyezo` int(11) DEFAULT NULL,
  `vezeto` enum('I','N') COLLATE utf8mb3_hungarian_ci NOT NULL DEFAULT 'N',
  `anyja_szuletesi_neve` varchar(100) COLLATE utf8mb3_hungarian_ci NOT NULL,
  `belepes_datuma` date NOT NULL,
  `kilepes_datuma` date DEFAULT NULL,
  `szuletesi_hely` varchar(50) COLLATE utf8mb3_hungarian_ci NOT NULL,
  `szuletesi_ido` date NOT NULL,
  `jelszo` varchar(200) COLLATE utf8mb3_hungarian_ci NOT NULL,
  `adminisztrator` enum('I','N') COLLATE utf8mb3_hungarian_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`alkalmazott_azonosito`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- Tábla adatainak mentése munkaido.alkalmazott: ~150 rows (hozzávetőleg)
REPLACE INTO `alkalmazott` (`alkalmazott_azonosito`, `szuletesi_nev`, `email`, `adoazonosito_jel`, `homeoffice_lehetoseg`, `beosztas`, `engedelyezo`, `vezeto`, `anyja_szuletesi_neve`, `belepes_datuma`, `kilepes_datuma`, `szuletesi_hely`, `szuletesi_ido`, `jelszo`, `adminisztrator`) VALUES
	(1, 'Nagy Anna', 'nagy.anna@gengi.hu', '8123456785', 'I', 'könyvelő', 83, 'N', 'Kiss Mária', '2019-02-11', NULL, 'Budapest', '1985-03-14', '329dafe8be9f244812221c9a70bf6dcf1ae95b92fc2b1f194dbe42cbaf9819f1', 'N'),
	(2, 'Kiss Béla', 'kiss.bela@gengi.hu', '8125001237', 'N', 'informatikus', 66, 'N', 'Nagy Éva', '2020-06-01', NULL, 'Szeged', '1990-07-22', 'fba983a16c074277dc1780fd7984797c498520bc552847b07133bd3d452ad046', 'N'),
	(3, 'Szabó Csilla', 'szabo.csilla@gengi.hu', '8130002469', 'I', 'értékesítő', 4, 'N', 'Tóth Ilona', '2018-04-19', '2024-03-10', 'Pécs', '1988-01-05', '7cf603f68b1241abdc4110ed66a2aa551fd1728c1ffcce042872b8503a752fc9', 'N'),
	(4, 'Horváth Dávid', 'horvath.david@gengi.hu', '8137003692', 'N', 'csoportvezető', 15, 'I', 'Varga Katalin', '2021-01-15', NULL, 'Győr', '1992-11-30', '5c87ac7dca5812432a60572a6d617453ca0e1d41604ffd3bde8a1f84b0fb82a5', 'N'),
	(5, 'Varga Erika', 'varga.erika@gengi.hu', '8141004828', 'I', 'ügyintéző', 20, 'N', 'Molnár Anna', '2017-09-12', NULL, 'Debrecen', '1987-06-18', 'dd5a58b16a3d61d841fbf17ff6e75d5860ba5d5d3979170ba461a7483cedaf40', 'N'),
	(6, 'Molnár Ferenc', 'molnar.ferenc@gengi.hu', '8149005173', 'N', 'rendszergazda', 66, 'N', 'Farkas Judit', '2016-05-20', '2023-12-31', 'Miskolc', '1982-09-09', '730dc77850ef7dd8adccfe9bea28c87997f3d721174ec8133b71adf6c2fb02e9', 'N'),
	(7, 'Tóth Gabriella', 'toth.gabriella@gengi.hu', '8156006344', 'I', 'HR munkatárs', 15, 'N', 'Balogh Erzsébet', '2022-03-07', NULL, 'Budapest', '1995-02-27', 'cb3f88c4120fc49f0c382c7fa7b4359c27ecb9368c42c4c853a4a83aa90b8d98', 'N'),
	(8, 'Farkas István', 'farkas.istvan@gengi.hu', '8162007586', 'N', 'adminisztrátor', 36, 'N', 'Kovács Edit', '2019-11-18', '2023-12-31', 'Szeged', '1989-12-15', '8becbe15f9c89d303d560ad647e43240258736f858d53fc044c4b1a350fd99ee', 'I'),
	(9, 'Balogh Júlia', 'balogh.julia@gengi.hu', '8168008418', 'I', 'adminisztrátor', 15, 'N', 'Nagy Mária', '2020-08-24', NULL, 'Pécs', '1991-04-03', 'be4e30756478779e91adc02dbdf22cbb9739980ce8101155e81ab1d394d7516e', 'I'),
	(10, 'Kovács László', 'kovacs.laszlo@gengi.hu', '8173009564', 'N', 'informatikus', 66, 'N', 'Kiss Ilona', '2018-10-05', '2024-01-20', 'Győr', '1986-08-25', '39781b54e5cf8d45ae3d56a236d4d30b9ab0a1a001178e3644fb5e3631269626', 'N'),
	(11, 'Németh Ádám', 'nemeth.adam@gengi.hu', '8179010649', 'I', 'értékesítő', 44, 'N', 'Szabó Éva', '2021-04-12', NULL, 'Budapest', '1993-05-16', 'ee6c2caebaf74d0ff8c615403f991631d8db913915bb7de71489b2cefcfa09b5', 'N'),
	(12, 'Lakatos Beáta', 'lakatos.beata@gengi.hu', '8185011780', 'N', 'projektvezető', 15, 'N', 'Horváth Katalin', '2017-02-01', NULL, 'Szeged', '1984-10-11', '21ab28647059c0af4009e113317defdee6e5df4422a80454438ec5adf708b0a2', 'N'),
	(13, 'Kerekes Gábor', 'kerekes.gabor@gengi.hu', '8191012896', 'I', 'ügyintéző', 4, 'N', 'Varga Judit', '2020-09-09', NULL, 'Pécs', '1990-03-29', 'c8b309a93f88323e7eff928d4df5440d146e2ffc79c80b2cd2a58ef50d086031', 'N'),
	(14, 'Papp Henrietta', 'papp.henrietta@gengi.hu', '8197013952', 'N', 'rendszergazda', 66, 'N', 'Molnár Zsuzsa', '2019-07-23', '2024-02-15', 'Győr', '1987-12-02', 'fdde30a3517685f674c9a77e1ddd9d28838bde269d11773d477df63bf3ced674', 'N'),
	(15, 'Sipos Imre', 'sipos.imre@gengi.hu', '8203014128', 'I', 'HR igazgató', 56, 'I', 'Farkas Anna', '2018-01-18', NULL, 'Debrecen', '1985-07-07', '277b70dff80f278e40cd791274bf9f929d6078ee01628d6a7143f55353f6ce22', 'I'),
	(16, 'Vass Judit', 'vass.judit@gengi.hu', '8209015284', 'N', 'adminisztrátor', 20, 'N', 'Balogh Mária', '2022-06-14', NULL, 'Miskolc', '1994-09-19', '186932fc4abc4e370fb38547671f9c053916004f926041be4290537c2ada5065', 'N'),
	(17, 'Bíró Katalin', 'biro.katalin@gengi.hu', '8215016395', 'I', 'könyvelő', 83, 'N', 'Kovács Éva', '2021-08-30', NULL, 'Budapest', '1992-02-14', '3212ff4cc482bc4d7e622c0571747a08cad61276366c99b585a4624e2b5bca52', 'N'),
	(18, 'Fodor Lilla', 'fodor.lilla@gengi.hu', '8221017407', 'N', 'informatikus', 66, 'N', 'Nagy Ilona', '2017-11-11', '2023-11-30', 'Szeged', '1983-06-21', 'a2d6420582c2f40729f1cf0ec53f29870c9a4f50f58a269c912b8e0e82102a54', 'N'),
	(19, 'Takács Márton', 'takacs.marton@gengi.hu', '8227018538', 'I', 'értékesítő', 44, 'N', 'Kiss Mária', '2020-12-02', NULL, 'Pécs', '1991-10-08', '7e90c6d2dc522640928f0b469f01867b0eadad82f8bf48713273ce16caf5f646', 'N'),
	(20, 'Rácz Noémi', 'racz.noemi@gengi.hu', '8233019679', 'N', 'csoportvezető', 15, 'I', 'Szabó Anna', '2019-05-25', NULL, 'Győr', '1988-04-17', '50509938c380862f8e5a0ec4f0147d0cfaadb58be43ed7ca351bd40ff1a23da3', 'N'),
	(21, 'Vörös Orsolya', 'voros.orsolya@gengi.hu', '8239020746', 'I', 'ügyintéző', 20, 'N', 'Horváth Éva', '2021-02-16', NULL, 'Budapest', '1993-01-23', 'ed48d811e9df3fc96283d2b625d063e4964dc83585aced2307bd8ee95ef69082', 'N'),
	(22, 'Kiss Péter', 'kiss.peter@gengi.hu', '8245021867', 'N', 'rendszergazda', 66, 'N', 'Varga Mária', '2018-06-06', NULL, 'Debrecen', '1986-11-12', '20847a21ca22ef089382a8be8cf096c2003cba499d680030fabd6d16443a894b', 'N'),
	(23, 'Nagy Réka', 'nagy.reka@gengi.hu', '8251022978', 'I', 'HR munkatárs', 15, 'N', 'Molnár Judit', '2020-03-03', '2024-04-01', 'Miskolc', '1990-05-30', '27d15e589add0b4bc1e7ac09b19919195b7b7a8f66b157bd6fa5325004e2d5a9', 'N'),
	(24, 'Szűcs Sándor', 'szucs.sandor@gengi.hu', '8257024089', 'N', 'adminisztrátor', 28, 'N', 'Farkas Katalin', '2017-09-19', NULL, 'Budapest', '1984-08-15', '3cf553795d7a39727a8d1976740f278b4af85313d622bddb330763c074cb0d4c', 'N'),
	(25, 'Kovács Tamara', 'kovacs.tamara@gengi.hu', '8263025190', 'I', 'könyvelő', 83, 'N', 'Balogh Anna', '2022-01-10', NULL, 'Szeged', '1995-03-09', '0de360d21acc37f2c36b06c352edadb152ed7685fb0367d00ffd76efcbe8d2ae', 'N'),
	(26, 'Barta Viktor', 'barta.viktor@gengi.hu', '8269026301', 'N', 'informatikus', 66, 'N', 'Kovács Ilona', '2019-10-14', NULL, 'Pécs', '1989-07-24', 'fae5cdbcecb3953c34b44fc6fea285af2039cd54d49bcc4c1a66facac2fdc748', 'N'),
	(27, 'Gál Zsófia', 'gal.zsofia@gengi.hu', '8275027412', 'I', 'értékesítő', 44, 'N', 'Németh Éva', '2020-05-21', '2023-10-31', 'Győr', '1991-12-05', '097fe022a9e7ed13c28a98521932fb2fbb0cace32d44d0418b3c9097ac842094', 'N'),
	(28, 'Mészáros Áron', 'meszaros.aron@gengi.hu', '8281028523', 'N', 'csoportvezető', 15, 'I', 'Lakatos Mária', '2018-12-12', NULL, 'Debrecen', '1987-02-18', '24588e206ba81eaa241012cc25730ca533e862e3c8a562edf4d6334b73b6f780', 'N'),
	(29, 'Boros Beatrix', 'boros.beatrix@gengi.hu', '8287029634', 'I', 'ügyintéző', 36, 'N', 'Kerekes Anna', '2021-07-07', NULL, 'Miskolc', '1992-06-26', '69fa9d7a59f0c1e5ca33babdf22dba41e719ec87dc93033ce9f8f3f1afe85395', 'N'),
	(30, 'Oláh Csaba', 'olah.csaba@gengi.hu', '8293030745', 'N', 'rendszergazda', 66, 'N', 'Papp Éva', '2017-04-22', NULL, 'Budapest', '1985-11-03', '6fbd5d5a5da22399653fc0fb7ef98bed6a9afbc50bf2e82cd867a96e0dfe6d77', 'N'),
	(31, 'Fehér Dóra', 'feher.dora@gengi.hu', '8299031856', 'I', 'HR munkatárs', 15, 'N', 'Sipos Mária', '2020-02-28', NULL, 'Szeged', '1994-01-13', 'e62e0ce3989a1bd9c39755c91f128a60cd54272b1d175bb62f2208f4c0e985a2', 'N'),
	(32, 'Kiss Endre', 'kiss.endre@gengi.hu', '8305032967', 'N', 'adminisztrátor', 4, 'N', 'Vass Ilona', '2019-08-08', '2024-05-15', 'Pécs', '1986-09-27', 'd1260fffe2b2d474d63c4f8070a4026cdd251780df3208b7ac40563b8804e978', 'I'),
	(33, 'Nagy Fanni', 'nagy.fanni@gengi.hu', '8311034078', 'I', 'könyvelő', 83, 'N', 'Bíró Éva', '2021-11-01', NULL, 'Győr', '1993-07-04', '13aa8f57a7bf6b44a8787db187877fa662fa153f92da30644c431e8dc12a233a', 'N'),
	(34, 'Szabó Gergő', 'szabo.gergo@gengi.hu', '8317035189', 'N', 'informatikus', 66, 'N', 'Fodor Katalin', '2018-03-14', NULL, 'Debrecen', '1988-12-20', '1f43b731fba13fe9804d0332ede7d01b7b6a9c1e34d9218810126a4d28dddba4', 'N'),
	(35, 'Horváth Hanna', 'horvath.hanna@gengi.hu', '8323036290', 'I', 'értékesítő', 28, 'N', 'Takács Judit', '2022-04-18', NULL, 'Miskolc', '1996-05-11', '7e97931e5b139149ff549437e36cbe4cd62f2e45bd7cba0f8c88823749313aa7', 'N'),
	(36, 'Varga Iván', 'varga.ivan@gengi.hu', '8329037401', 'N', 'csoportvezető', 15, 'I', 'Rácz Mária', '2017-06-27', NULL, 'Budapest', '1983-10-30', 'f0a0cdd0b17804d49bbc7a510b44f63f2d0400db76810c2dc9eff61464393ef4', 'N'),
	(37, 'Molnár Júlia', 'molnar.julia@gengi.hu', '8335038512', 'I', 'ügyintéző', 4, 'N', 'Vörös Anna', '2020-10-10', '2024-06-30', 'Szeged', '1990-02-08', '3ae7380e1630dd3585a8f4568e5cbef43f8a284a8ffd1e5f4a373c7a48a859de', 'N'),
	(38, 'Tóth Károly', 'toth.karoly@gengi.hu', '8341039623', 'N', 'rendszergazda', 66, 'N', 'Kiss Éva', '2019-01-16', NULL, 'Pécs', '1987-03-22', '8b249956e2defc5dffdecdfe85c727a499a82f08181d97eddb7a48eb158ae93c', 'N'),
	(39, 'Farkas Laura', 'farkas.laura@gengi.hu', '8347040734', 'I', 'HR munkatárs', 15, 'N', 'Nagy Katalin', '2021-05-05', NULL, 'Győr', '1992-09-14', '2dd53f5cf7bd487b3396e09c78c5f39269a6dfa5a98611d187560b3c4a87d2ab', 'N'),
	(40, 'Balogh Miklós', 'balogh.miklos@gengi.hu', '8353041845', 'N', 'adminisztrátor', 36, 'N', 'Szabó Mária', '2018-11-23', NULL, 'Debrecen', '1984-06-01', '2caac1dae621646ab02ef498ee7cba723e6014cce8feac05cb10dd37215e32e3', 'N'),
	(41, 'Kovács Nóra', 'kovacs.nora@gengi.hu', '8359042956', 'I', 'könyvelő', 83, 'N', 'Horváth Judit', '2020-07-17', NULL, 'Miskolc', '1995-11-25', 'f0d3b834299cc5f1c30bff23ec7fd30f9cfd9fd25a69dfc5ea3b893b0a7ab12c', 'N'),
	(42, 'Németh Olivér', 'nemeth.oliver@gengi.hu', '8365043067', 'N', 'informatikus', 66, 'N', 'Varga Éva', '2017-03-09', '2023-09-30', 'Budapest', '1989-04-12', '15845e44acfc463e3d9348d88a43240cfbe7a06fb7419b7b35add7cb956df4bc', 'N'),
	(43, 'Lakatos Petra', 'lakatos.petra@gengi.hu', '8371044178', 'I', 'értékesítő', 44, 'N', 'Molnár Katalin', '2022-02-20', NULL, 'Szeged', '1991-08-19', '2cc593c7599a10dee863c87693ce333fc50f5076bcd3454ab57151ebb6010739', 'N'),
	(44, 'Kerekes Roland', 'kerekes.roland@gengi.hu', '8377045289', 'N', 'csoportvezető', 15, 'I', 'Farkas Mária', '2019-09-13', NULL, 'Pécs', '1986-12-28', 'c88704831ec58e0e4f71208a5bccb531e05d12056db12ea659c8a421c06428e8', 'N'),
	(45, 'Papp Sára', 'papp.sara@gengi.hu', '8383046390', 'I', 'ügyintéző', 20, 'N', 'Balogh Éva', '2021-06-21', NULL, 'Győr', '1994-04-07', '453446f5214fe3e743084c40f68044942592d4dd06fbfb5f847ef02c456dc111', 'N'),
	(46, 'Sipos Tamás', 'sipos.tamas@gengi.hu', '8389047401', 'N', 'rendszergazda', 66, 'N', 'Kovács Judit', '2018-08-08', NULL, 'Debrecen', '1985-01-16', 'd8a4a8e9cfbf1e97d869b0244c4d964e09a89de6a37630840e7a8310bf2ecb1b', 'N'),
	(47, 'Vass Viktória', 'vass.viktoria@gengi.hu', '8395048512', 'I', 'HR munkatárs', 15, 'N', 'Nagy Éva', '2020-11-11', NULL, 'Miskolc', '1993-03-31', '756d89f51b1c88f79dc7b43feccef9bcd453cfbb44d322a9f243ca99946e4463', 'N'),
	(48, 'Bíró Zoltán', 'biro.zoltan@gengi.hu', '8401049623', 'N', 'adminisztrátor', 28, 'N', 'Kiss Anna', '2017-12-01', '2024-07-01', 'Budapest', '1982-05-23', '71adee13cc4bc8ece53376916929a52e3873d403fe3044c6de97ea63ab3497f7', 'N'),
	(49, 'Fodor Adrienn', 'fodor.adrienn@gengi.hu', '8407050734', 'I', 'könyvelő', 83, 'N', 'Szabó Katalin', '2021-09-09', NULL, 'Szeged', '1996-10-10', '5815b8cfc49bda276e9ef5ad82fdb02baea49f151f99ab182b34ef78eb74a4a6', 'N'),
	(50, 'Takács Balázs', 'takacs.balazs@gengi.hu', '8413051845', 'N', 'informatikus', 66, 'N', 'Horváth Mária', '2019-04-04', NULL, 'Pécs', '1988-07-17', 'e20bed6bb24206cddb87fde63d835061f83c37357f104d56c6e8c23430cd697e', 'N'),
	(51, 'Gál Csaba', 'gal.csaba@gengi.hu', '8419052956', 'I', 'értékesítő', 20, 'N', 'Varga Anna', '2020-01-20', NULL, 'Győr', '1990-09-06', 'd83521becb06b9a48a7cf150d73381d9788243c8abae57d79fc012faf104675f', 'N'),
	(52, 'Mészáros Dóra', 'meszaros.dora@gengi.hu', '8425053067', 'N', 'projektvezető', 15, 'N', 'Molnár Éva', '2018-05-12', NULL, 'Debrecen', '1987-04-25', 'a964b0ddda57b1686217f480013d4e81ea25bc09bf232ab06259fd6ddb4d5549', 'N'),
	(53, 'Boros Eszter', 'boros.eszter@gengi.hu', '8431054178', 'I', 'ügyintéző', 28, 'N', 'Farkas Judit', '2021-03-18', NULL, 'Miskolc', '1994-08-13', '68996cc1102e2187ded33ec33281a1732c06081252ece160e0967786665930d6', 'N'),
	(54, 'Oláh Ferenc', 'olah.ferenc@gengi.hu', '8437055289', 'N', 'rendszergazda', 66, 'N', 'Balogh Mária', '2019-10-07', '2024-02-28', 'Budapest', '1985-12-19', 'cebaddfc187385d3f1d1a8e3537636a9af4b48ebf9e2c3181bc54557a61d8e6a', 'N'),
	(55, 'Fehér Gabriella', 'feher.gabriella@gengi.hu', '8443056390', 'I', 'HR munkatárs', 15, 'N', 'Kovács Éva', '2022-05-15', NULL, 'Szeged', '1993-06-02', '9fe30f7a0cecd14fe0c0eb14055c5a985f980269abba9c2f9a5d6f5fa27e7aa1', 'N'),
	(56, 'Kiss Henrik', 'kiss.henrik@gengi.hu', '8449057401', 'N', 'vezérigazgató', 0, 'I', 'Nagy Ilona', '2017-07-21', NULL, 'Pécs', '1989-02-14', '9b9973585582fdfa7585d2ea1a1f5cdd2f2a89281b4a3fac75cf4c735b9c7664', 'N'),
	(57, 'Nagy Ildikó', 'nagy.ildiko@gengi.hu', '8455058512', 'I', 'könyvelő', 83, 'N', 'Szabó Judit', '2020-11-30', NULL, 'Győr', '1991-09-28', '4ba94e340626bee4c9ec06c6b9d36dd969443027d8570d67584746cb67112c5e', 'N'),
	(58, 'Szabó János', 'szabo.janos@gengi.hu', '8461059623', 'N', 'informatikus', 66, 'N', 'Horváth Mária', '2018-02-09', '2023-08-31', 'Debrecen', '1984-05-17', '111be659619c0008899b6f971eddc9fbd6347aef3264bada33c0b18e101276c7', 'N'),
	(59, 'Horváth Kitti', 'horvath.kitti@gengi.hu', '8467060734', 'I', 'értékesítő', 36, 'N', 'Varga Éva', '2021-08-01', NULL, 'Miskolc', '1996-01-26', '86ba2e304e5fe78dbe46203292b345170123fa13e9ab1e3a6d5e17b3db30e0d5', 'N'),
	(60, 'Varga Levente', 'varga.levente@gengi.hu', '8473061845', 'N', 'projektvezető', 15, 'N', 'Molnár Katalin', '2019-06-14', NULL, 'Budapest', '1988-11-08', '0a4c4225aac678ab81c0fb6393147e880ab79bc28fb21d0aad96432c07c15d23', 'N'),
	(61, 'Molnár Mónika', 'molnar.monika@gengi.hu', '8479062956', 'I', 'ügyintéző', 20, 'N', 'Farkas Anna', '2020-04-22', NULL, 'Szeged', '1992-07-15', 'ef6923dda57b2cb9b1c7ca65e2c26d8610a067810c4b59229e66fe06ebbd2605', 'N'),
	(62, 'Tóth Norbert', 'toth.norbert@gengi.hu', '8485063067', 'N', 'rendszergazda', 66, 'N', 'Balogh Éva', '2017-10-10', NULL, 'Pécs', '1986-03-03', 'f01086d50064eee08c3a11698cdef000266abfff6e4ab67504ca141e31e362ca', 'N'),
	(63, 'Farkas Orsolya', 'farkas.orsolya@gengi.hu', '8491064178', 'I', 'HR munkatárs', 15, 'N', 'Kovács Katalin', '2022-01-24', NULL, 'Győr', '1995-09-12', '8606f73490bf3f72b1ae20d67f3167e3fb7ac3fc2608b4896bd4a38a72105a56', 'N'),
	(64, 'Balogh Péter', 'balogh.peter@gengi.hu', '8497065289', 'N', 'adminisztrátor', 4, 'N', 'Nagy Judit', '2018-09-17', '2024-03-31', 'Debrecen', '1983-12-22', 'dab0d9b332fd656c8d6d057587ad98254880d5292004e418331e368e128f22ab', 'N'),
	(65, 'Kovács Réka', 'kovacs.reka@gengi.hu', '8503066390', 'I', 'könyvelő', 83, 'N', 'Kiss Éva', '2021-05-28', NULL, 'Miskolc', '1990-06-11', 'f9b82d12c45bf00db1938e89d990d817004d81911d7d654a5a7b088728abc0fb', 'N'),
	(66, 'Németh Sándor', 'nemeth.sandor@gengi.hu', '8509067401', 'N', 'informatikai igazgató', 56, 'I', 'Szabó Mária', '2019-03-03', NULL, 'Budapest', '1987-10-29', '6955f44f0e55b494a0a40b19fae4da2b2e13b0cef58c12ba75ffbd0c99e4994b', 'N'),
	(67, 'Lakatos Tímea', 'lakatos.timea@gengi.hu', '8515068512', 'I', 'értékesítő', 28, 'N', 'Horváth Anna', '2020-08-19', NULL, 'Szeged', '1994-02-07', 'b927a2facd4e9261b1a316cc774cf5f571598ded141cce96652f597f8cad0d3c', 'N'),
	(68, 'Kerekes Viktor', 'kerekes.viktor@gengi.hu', '8521069623', 'N', 'projektvezető', 15, 'N', 'Varga Judit', '2017-12-15', NULL, 'Pécs', '1985-07-20', '7e81338cfae0c2f655d02e7ab713d73aac57c88658db93bb03e7892f76a509c4', 'N'),
	(69, 'Papp Zita', 'papp.zita@gengi.hu', '8527070734', 'I', 'ügyintéző', 44, 'N', 'Molnár Éva', '2022-03-11', NULL, 'Győr', '1993-11-04', '2813f698f85bef76f1d6c6e2bd799d9d8f9a473b0c11ddc6639acb18db6b6d34', 'N'),
	(70, 'Sipos Ágnes', 'sipos.agnes@gengi.hu', '8533071845', 'N', 'rendszergazda', 66, 'N', 'Farkas Katalin', '2018-06-25', '2024-01-31', 'Debrecen', '1989-08-16', '4f3f7ad7eda56cedc5ea1e2c8a017ecdb1e32de32464324da501601641ac3917', 'N'),
	(71, 'Vass Balázs', 'vass.balazs@gengi.hu', '8539072956', 'I', 'HR munkatárs', 15, 'N', 'Balogh Mária', '2020-10-03', NULL, 'Miskolc', '1991-03-27', '2c3eb2ea7747ce579fedc57b4b66cbd83be859c9a156bb609d9f5afb30c630f2', 'N'),
	(72, 'Bíró Csenge', 'biro.csenge@gengi.hu', '8545073067', 'N', 'adminisztrátor', 4, 'N', 'Kovács Éva', '2019-01-29', NULL, 'Budapest', '1995-05-09', '0203488975804bb90f125160ded3abf32e39504ead3ceb8cee65c262a548395d', 'I'),
	(73, 'Fodor Dávid', 'fodor.david@gengi.hu', '8551074178', 'I', 'könyvelő', 83, 'N', 'Nagy Katalin', '2021-07-16', NULL, 'Szeged', '1988-09-21', 'ef4316d1eab4231c35be40118d421ba91790c3d00e266360180230c03ac60b3b', 'N'),
	(74, 'Takács Emese', 'takacs.emese@gengi.hu', '8557075289', 'N', 'informatikus', 66, 'N', 'Kiss Judit', '2018-04-04', '2023-12-15', 'Pécs', '1992-01-30', '5ee0394d71e9d2712f816a2472be2918f9cecc0f2690ccbec31fb5c655a8eaab', 'N'),
	(75, 'Rácz Ferenc', 'racz.ferenc@gengi.hu', '8563076390', 'I', 'értékesítő', 28, 'N', 'Szabó Anna', '2020-12-12', NULL, 'Győr', '1986-06-18', 'f36de97e5dd60f0c75c46ec0efb2a982852fd16ade4d81d252022ae4970a5340', 'N'),
	(76, 'Vörös Gabriella', 'voros.gabriella@gengi.hu', '8569077401', 'N', 'projektvezető', 15, 'N', 'Horváth Éva', '2017-08-23', NULL, 'Debrecen', '1990-10-05', '141b5a07e59be5db65b073d88e05e881c1aa9fd824e792f1053f91454132f309', 'N'),
	(77, 'Kiss Hanga', 'kiss.hanga@gengi.hu', '8575078512', 'I', 'ügyintéző', 36, 'N', 'Varga Mária', '2022-06-06', NULL, 'Miskolc', '1996-03-14', '70e6105cb51b54e752c2bf591631e30e1c71318ff5cca1edb15cdd291ed43350', 'N'),
	(78, 'Nagy István', 'nagy.istvan@gengi.hu', '8581079623', 'N', 'rendszergazda', 66, 'N', 'Molnár Judit', '2019-11-11', NULL, 'Budapest', '1984-07-07', '0eb9442465086d37d2db880c8ab1db082b4c90c93a178a96c47f82668810c93a', 'N'),
	(79, 'Szabó Júlia', 'szabo.julia@gengi.hu', '8587080734', 'I', 'HR munkatárs', 15, 'N', 'Farkas Anna', '2021-02-02', NULL, 'Szeged', '1993-12-24', '000951688d5a673c71017d7592fafc11b84098aa65ab379da1dfb08e9bfeecd9', 'N'),
	(80, 'Horváth Károly', 'horvath.karoly@gengi.hu', '8593081845', 'N', 'adminisztrátor', 28, 'N', 'Balogh Éva', '2018-10-19', '2024-05-31', 'Pécs', '1987-04-01', 'd2f94f0d69fc06ec5585b505b4d46894f6ce0317365cc9f231ec61c936aad092', 'N'),
	(81, 'Varga László', 'varga.laszlo@gengi.hu', '8599082956', 'I', 'könyvelő', 83, 'N', 'Kovács Mária', '2020-06-30', NULL, 'Győr', '1989-11-13', '68f19a0c860c3fc9e39ea5da5ba4e2e932fd76c46e7243044f41cc4cd12e65c2', 'N'),
	(82, 'Molnár Márta', 'molnar.marta@gengi.hu', '8605083067', 'N', 'informatikus', 66, 'N', 'Nagy Judit', '2017-03-22', NULL, 'Debrecen', '1994-06-29', '4f78f4677477928d3fde1b60584710cc94d047a8750d0d1f1b21d0286e300498', 'N'),
	(83, 'Tóth Norina', 'toth.norina@gengi.hu', '8611084178', 'I', 'pénzügyi igazgató', 56, 'I', 'Szabó Éva', '2021-09-14', NULL, 'Miskolc', '1991-01-18', 'c5f5359e75f6e965085b7a81ab5239330ff545e2fe725bf94d195b2486878388', 'N'),
	(84, 'Farkas Olivér', 'farkas.oliver@gengi.hu', '8617085289', 'N', 'projektvezető', 15, 'N', 'Horváth Katalin', '2019-05-05', '2024-02-01', 'Budapest', '1985-08-24', 'ef00e65501234611929afbcb0422d100a970b795c9d02824c31a3d84456fb900', 'N'),
	(85, 'Balogh Petra', 'balogh.petra@gengi.hu', '8623086390', 'I', 'ügyintéző', 44, 'N', 'Varga Anna', '2022-02-17', NULL, 'Szeged', '1996-12-09', 'd710e5a68fd6499702f1ba780f8ef4837d960d01234def5f940d8fbca367be91', 'N'),
	(86, 'Kovács Richárd', 'kovacs.richard@gengi.hu', '8629087401', 'N', 'rendszergazda', 66, 'N', 'Molnár Éva', '2018-07-12', NULL, 'Pécs', '1983-03-31', 'f879b3c9da5facdaa38b88cbd3123cd7cc35aca484bde5e9eae8e8fbf50c0c1d', 'N'),
	(87, 'Németh Sára', 'nemeth.sara@gengi.hu', '8635088512', 'I', 'HR munkatárs', 15, 'N', 'Farkas Judit', '2020-09-25', NULL, 'Győr', '1990-11-26', 'a826a39bc03f5a5e750a302971b17529d7ee7587d180f52757874d7272b986d7', 'N'),
	(88, 'Lakatos Tamás', 'lakatos.tamas@gengi.hu', '8641089623', 'N', 'adminisztrátor', 28, 'N', 'Balogh Mária', '2017-11-03', NULL, 'Debrecen', '1986-02-12', 'b0b5ee6ab361db5bd78384fb60d3b2bd6890a6f9cb75ea8cd0054fafe26e344a', 'N'),
	(89, 'Kerekes Viktória', 'kerekes.viktoria@gengi.hu', '8647090734', 'I', 'könyvelő', 83, 'N', 'Kovács Anna', '2021-04-08', NULL, 'Miskolc', '1995-07-23', '16ffd162afc22524e47b4f2285249d9b0c6eec7245292f78b38ac35b61a8f067', 'N'),
	(90, 'Papp Zoltán', 'papp.zoltan@gengi.hu', '8653091845', 'N', 'informatikus', 66, 'N', 'Nagy Éva', '2019-12-20', '2024-06-15', 'Budapest', '1988-05-05', 'd26effe215f7fba4c071ea9fa6abe6bddc3b12bdb63d41a2920f82f18152df3e', 'N'),
	(91, 'Sipos Adél', 'sipos.adel@gengi.hu', '8659092956', 'I', 'értékesítő', 20, 'N', 'Kiss Judit', '2020-03-13', NULL, 'Szeged', '1992-10-17', '954f4e2c78718590ddfd409869e0f14a43f1d94a4b8f4514636d7976c4b528a4', 'N'),
	(92, 'Vass Bence', 'vass.bence@gengi.hu', '8665093067', 'N', 'projektvezető', 15, 'N', 'Szabó Mária', '2018-08-28', NULL, 'Pécs', '1987-09-09', 'a379a998ddb4c9e0c51db46b0d1bc47e577175cfaf2a4ef37682966c7786c983', 'N'),
	(93, 'Bíró Csaba', 'biro.csaba@gengi.hu', '8671094178', 'I', 'ügyintéző', 20, 'N', 'Horváth Éva', '2021-12-01', NULL, 'Győr', '1994-04-16', 'cf5f4e132ff57555a3e2b2799c8f53e9e80ec5b6c0d9095ba1695718dbb1ae3c', 'N'),
	(94, 'Fodor Dóra', 'fodor.dora@gengi.hu', '8677095289', 'N', 'rendszergazda', 66, 'N', 'Varga Katalin', '2017-05-18', NULL, 'Debrecen', '1985-12-28', '41bce5935fd282267bd84fe5db57de7f8fbd7b0c894066c6af05b613291d9de7', 'N'),
	(95, 'Takács Erika', 'takacs.erika@gengi.hu', '8683096390', 'I', 'HR munkatárs', 15, 'N', 'Molnár Judit', '2022-07-07', NULL, 'Miskolc', '1991-06-06', 'f27d1f4409029911d0f71990597be54af5bfc389895896075e5b40510de0a4d0', 'N'),
	(96, 'Rácz Gábor', 'racz.gabor@gengi.hu', '8689097401', 'N', 'adminisztrátor', 20, 'N', 'Farkas Anna', '2019-09-09', '2024-07-10', 'Budapest', '1989-02-02', 'a065576c6a7491841b9c5d62238c2f3bb1276b1a759e52040f8bde7660b22c1b', 'N'),
	(97, 'Vörös Helga', 'voros.helga@gengi.hu', '8695098512', 'I', 'főkönyvelő', 83, 'N', 'Balogh Éva', '2020-05-14', NULL, 'Szeged', '1993-08-30', '4c5fdfa4430b38b75c22fec97f4735328bb076b153af120f6de0701e3b6be540', 'N'),
	(98, 'Kiss Ilona', 'kiss.ilona@gengi.hu', '8701099623', 'N', 'informatikus', 66, 'N', 'Kovács Mária', '2018-01-25', NULL, 'Pécs', '1984-11-11', '1830d178d2ab297ca1d7388dc59f3709d2c0c68f4efd415be0329aa0dac21836', 'N'),
	(99, 'Nagy József', 'nagy.jozsef@gengi.hu', '8707100734', 'I', 'értékesítő', 44, 'N', 'Szabó Judit', '2021-10-22', NULL, 'Győr', '1990-03-19', '33e859017cab307c16041ac6323986ae5490a7770f0ec0e0a4a636a29bf6e4f3', 'N'),
	(100, 'Szabó Katalin', 'szabo.katalin@gengi.hu', '8713101845', 'N', 'projektvezető', 15, 'N', 'Horváth Anna', '2017-06-16', NULL, 'Debrecen', '1986-08-08', '1915f1eb134d2e5d8bfda7a37edfc8079ff35d3cdfa0b9ee7bf4216348b6142f', 'N'),
	(101, 'Horváth László', 'horvath.laszlo@gengi.hu', '8719102956', 'I', 'ügyintéző', 44, 'N', 'Varga Éva', '2020-02-12', NULL, 'Budapest', '1992-12-01', '87c95efdf2bff9d412b4eb5d721ccf593a6bc6338e9d7a33dc0b872d78647181', 'N'),
	(102, 'Varga Mónika', 'varga.monika@gengi.hu', '8725103067', 'N', 'rendszergazda', 66, 'N', 'Molnár Anna', '2018-07-03', NULL, 'Szeged', '1988-03-14', '9553489e3fbb6f8fa5b321be2cefe5132eb4929a9327b7ac148526fa0cb60190', 'N'),
	(103, 'Molnár Norbert', 'molnar.norbert@gengi.hu', '8731104178', 'I', 'HR munkatárs', 15, 'N', 'Farkas Judit', '2021-01-19', NULL, 'Pécs', '1994-10-22', '798ad42d6be1f8d22cb92bdfc82b5dad519b244f7065ceaa35c283a94ba99e5e', 'N'),
	(104, 'Tóth Orsolya', 'toth.orsolya@gengi.hu', '8737105289', 'N', 'adminisztrátor', 4, 'N', 'Balogh Mária', '2019-06-06', '2024-03-20', 'Győr', '1987-05-17', '74c4cae176bcc4ea097a7bcd1a8da10a1ea9c4256f3ff09381c039b894067093', 'N'),
	(105, 'Farkas Péter', 'farkas.peter@gengi.hu', '8743106390', 'I', 'könyvelő', 83, 'N', 'Kovács Éva', '2022-04-04', NULL, 'Debrecen', '1990-09-25', '66d892728257169e575db34b46f3f6c7389ef2bf5e11766f94a820cc56181ea7', 'N'),
	(106, 'Balogh Réka', 'balogh.reka@gengi.hu', '8749107401', 'N', 'informatikus', 66, 'N', 'Nagy Katalin', '2017-11-14', NULL, 'Miskolc', '1985-01-08', '12acfd4bca5615c75b8e06bd30ac74a4242dd8025b71107f3e789b270c7d5b3b', 'N'),
	(107, 'Kovács Sándor', 'kovacs.sandor@gengi.hu', '8755108512', 'I', 'értékesítő', 4, 'N', 'Kiss Judit', '2020-08-28', NULL, 'Budapest', '1993-06-16', 'df98e7e1376d661d98288f46fff6095d4a6605a5d7a05ada3f58dc3c60490440', 'N'),
	(108, 'Németh Tímea', 'nemeth.timea@gengi.hu', '8761109623', 'N', 'projektvezető', 15, 'N', 'Szabó Anna', '2018-03-21', NULL, 'Szeged', '1989-11-30', 'a2c1002e71b188c83468a1f906453d8c233a5bbb13de93017329f1f433a70cb1', 'N'),
	(109, 'Lakatos Viktor', 'lakatos.viktor@gengi.hu', '8767110734', 'I', 'ügyintéző', 36, 'N', 'Horváth Mária', '2021-06-10', NULL, 'Pécs', '1995-02-27', '05297f59c4138b11913de1cef5bef54b895e7acec4a1cdc3dba47bbc0b65eab8', 'N'),
	(110, 'Kerekes Zoltán', 'kerekes.zoltan@gengi.hu', '8773111845', 'N', 'rendszergazda', 66, 'N', 'Varga Judit', '2019-10-02', NULL, 'Győr', '1986-07-13', '40a2ce32ef23ad1936699e51719d0f0e9c6e75277f0f9aa558524c149f65b669', 'N'),
	(111, 'Papp Andrea', 'papp.andrea@gengi.hu', '8779112956', 'I', 'HR munkatárs', 15, 'N', 'Molnár Éva', '2020-12-15', NULL, 'Debrecen', '1991-04-21', '2f12f07bb220bb81f886e4a84c463d8f4393bc01d096103b41830926789b85ca', 'N'),
	(112, 'Sipos Balázs', 'sipos.balazs@gengi.hu', '8785113067', 'N', 'adminisztrátor', 20, 'N', 'Farkas Katalin', '2017-04-18', '2023-12-31', 'Miskolc', '1984-09-09', 'a0b7e856c523cd55c8652e59a06ac2869976c5da76c9d04d5138d31efe08d183', 'N'),
	(113, 'Vass Csilla', 'vass.csilla@gengi.hu', '8791114178', 'I', 'könyvelő', 83, 'N', 'Balogh Anna', '2022-01-06', NULL, 'Budapest', '1996-03-03', 'd4675dc009ca8bf099087cfe582c6417babbfcef5bf7640b22d9b3bbf078a960', 'N'),
	(114, 'Bíró Dávid', 'biro.david@gengi.hu', '8797115289', 'N', 'informatikus', 66, 'N', 'Kovács Mária', '2018-09-25', NULL, 'Szeged', '1988-12-12', 'b72e10b8b605c968a10f242b9e46a6341c6ccff6cedfdfe3b373fd8db67d9819', 'N'),
	(115, 'Fodor Emese', 'fodor.emese@gengi.hu', '8803116390', 'I', 'értékesítő', 28, 'N', 'Nagy Éva', '2021-05-17', NULL, 'Pécs', '1992-08-28', '18cf9c1995fb3b62385e15d7412600046b33359c72039494ada9a87d48e5d632', 'N'),
	(116, 'Takács Ferenc', 'takacs.ferenc@gengi.hu', '8809117401', 'N', 'projektvezető', 15, 'N', 'Kiss Anna', '2019-02-08', NULL, 'Győr', '1987-03-19', 'b980ecb98e26923e1956620d06827b79cac313da3291ad667aedba922c220b7c', 'N'),
	(117, 'Rácz Gabriella', 'racz.gabriella@gengi.hu', '8815118512', 'I', 'ügyintéző', 28, 'N', 'Szabó Judit', '2020-07-29', NULL, 'Debrecen', '1994-11-07', '255450170a4a671f9400ccdf2c93b4f742b1be812396d172a8ecd980a160ca7d', 'N'),
	(118, 'Vörös Henrik', 'voros.henrik@gengi.hu', '8821119623', 'N', 'rendszergazda', 66, 'N', 'Horváth Éva', '2018-05-16', NULL, 'Miskolc', '1985-06-26', '7fe7e89433de7c46f43d5da3e62444cc9036bcc3b13b07ea9dba8c4be55c3f09', 'N'),
	(119, 'Kiss Ildikó', 'kiss.ildiko@gengi.hu', '8827120734', 'I', 'HR munkatárs', 15, 'N', 'Varga Mária', '2021-11-11', NULL, 'Budapest', '1990-01-15', '1c3302f28b6f1ec6abea27c316d392cf9eb1471bb2c81dfb11817a002ed99832', 'N'),
	(120, 'Nagy János', 'nagy.janos@gengi.hu', '8833121845', 'N', 'adminisztrátor', 4, 'N', 'Molnár Katalin', '2017-08-02', '2024-04-30', 'Szeged', '1983-10-20', '8643c3757613e726c376a1e46e64632d8ca51c28ace58bac736ba13f252875ba', 'N'),
	(121, 'Szabó Katalin', 'szabo.katalin2@gengi.hu', '8839122956', 'I', 'könyvelő', 83, 'N', 'Farkas Anna', '2022-03-23', NULL, 'Pécs', '1995-07-11', '6897ccff1f3133f08dbb6915e3fcc872cf142db24827b90e8afc4f37090297b0', 'N'),
	(122, 'Horváth Lilla', 'horvath.lilla@gengi.hu', '8845123067', 'N', 'informatikus', 66, 'N', 'Balogh Éva', '2019-11-05', NULL, 'Győr', '1989-02-24', 'fc2b5a3b7eb8865ea6158e2130589beb05eede3f9e77ee4ce03890f359aa7251', 'N'),
	(123, 'Varga Márton', 'varga.marton@gengi.hu', '8851124178', 'I', 'értékesítő', 44, 'N', 'Kovács Judit', '2020-06-18', NULL, 'Debrecen', '1991-09-02', 'da07664f3e9c159b298f0b81f164a60877a72fb46e027fe5adc43a821740e504', 'N'),
	(124, 'Molnár Noémi', 'molnar.noemi@gengi.hu', '8857125289', 'N', 'projektvezető', 15, 'N', 'Nagy Mária', '2018-01-30', NULL, 'Miskolc', '1986-05-15', 'ca883247e031ac1aa99e6cb06d6d48252e744ef44e3d1cafcf354477851d8299', 'N'),
	(125, 'Tóth Olivér', 'toth.oliver@gengi.hu', '8863126390', 'I', 'ügyintéző', 36, 'N', 'Kiss Éva', '2021-09-09', NULL, 'Budapest', '1993-12-03', '354f5b0dd96b122a41af7d97c8a014788886c986b29ea1ecd9f07876efff27b7', 'N'),
	(126, 'Farkas Petra', 'farkas.petra@gengi.hu', '8869127401', 'N', 'rendszergazda', 66, 'N', 'Szabó Mária', '2017-12-12', '2024-01-15', 'Szeged', '1988-06-18', '6b1d2e6be66c6b61597ab021c31c366cd23ef1f5747c7ce3196d5844b95ceb55', 'N'),
	(127, 'Balogh Roland', 'balogh.roland@gengi.hu', '8875128512', 'I', 'HR munkatárs', 15, 'N', 'Horváth Anna', '2020-04-25', NULL, 'Pécs', '1994-04-04', 'a9285378a33d9079939fbf9ad5e885d1c94d72c86ef425fdba93286399be2302', 'N'),
	(128, 'Kovács Sára', 'kovacs.sara@gengi.hu', '8881129623', 'N', 'adminisztrátor', 20, 'N', 'Varga Judit', '2019-07-07', NULL, 'Győr', '1987-11-21', 'eabcf69d47d50a58c8285603cc5f0328723e6471f67919fd8a427fbbe085102c', 'N'),
	(129, 'Németh Tamás', 'nemeth.tamas@gengi.hu', '8887130734', 'I', 'könyvelő', 83, 'N', 'Molnár Éva', '2022-02-14', NULL, 'Debrecen', '1990-08-13', 'b3edead17a67db0ab02061d98e75b99dc8d049b3210037bc7b8c3b553daec5ef', 'N'),
	(130, 'Lakatos Viktória', 'lakatos.viktoria@gengi.hu', '8893131845', 'N', 'informatikus', 66, 'N', 'Farkas Katalin', '2018-10-10', NULL, 'Miskolc', '1985-03-06', '240a86d66ed062dc5d04e1e3d13e00588d87f88ee3e7c5fbca017aa9d262cae2', 'N'),
	(131, 'Kerekes Zsófia', 'kerekes.zsofia@gengi.hu', '8899132956', 'I', 'értékesítő', 20, 'N', 'Balogh Mária', '2021-04-20', NULL, 'Budapest', '1996-09-18', 'd76a446d173c3f82f17ac7c93656d807e2123ec52966196dd731eddeaa2be54b', 'N'),
	(132, 'Papp Ádám', 'papp.adam@gengi.hu', '8905133067', 'N', 'projektvezető', 15, 'N', 'Kovács Éva', '2017-06-01', NULL, 'Szeged', '1989-12-27', '6ada18ea0705bd98067cc15fddc70498a269b03eb09f92262ceecd48ebdca92d', 'N'),
	(133, 'Sipos Beáta', 'sipos.beata@gengi.hu', '8911134178', 'I', 'ügyintéző', 44, 'N', 'Nagy Anna', '2020-10-13', NULL, 'Pécs', '1992-02-09', '50ef59abbf73737b57de922507f37e4cb8cdab292d19fa42ee9570452dcae7cb', 'N'),
	(134, 'Vass Csaba', 'vass.csaba@gengi.hu', '8917135289', 'N', 'rendszergazda', 66, 'N', 'Kiss Judit', '2019-03-26', '2024-05-01', 'Győr', '1986-10-31', 'f4aca84c23ead498c81ae2b5c4160a561772badfa32e081c0db6f40e1fdcbeeb', 'N'),
	(135, 'Bíró Dóra', 'biro.dora@gengi.hu', '8923136390', 'I', 'HR munkatárs', 15, 'N', 'Szabó Éva', '2021-07-07', NULL, 'Debrecen', '1995-01-22', '19a2050a6e4aaaf56999ec66d8a4de8460b7d12ce572566ef3989da6ee472e83', 'N'),
	(136, 'Fodor Endre', 'fodor.endre@gengi.hu', '8929137401', 'N', 'adminisztrátor', 36, 'N', 'Horváth Mária', '2018-12-18', NULL, 'Miskolc', '1983-08-14', 'f4c29b9691cedb7a7cb52212120e8a6e55dfdb2f6691d769fdf25a707c03d25a', 'N'),
	(137, 'Takács Fanni', 'takacs.fanni@gengi.hu', '8935138512', 'I', 'könyvelő', 83, 'N', 'Varga Katalin', '2022-05-05', NULL, 'Budapest', '1994-03-25', 'd02a369ba0c292512e8d09d2338a65b0fe692236a965289f5a87ad229bdf8345', 'N'),
	(138, 'Rácz Gergő', 'racz.gergo@gengi.hu', '8941139623', 'N', 'informatikus', 66, 'N', 'Molnár Judit', '2017-09-21', NULL, 'Szeged', '1988-07-10', '385af70cfc49eb24b5754544d565deb72592a795a697ce2ec871bc9275670897', 'N'),
	(139, 'Vörös Hanna', 'voros.hanna@gengi.hu', '8947140734', 'I', 'értékesítő', 28, 'N', 'Farkas Anna', '2020-01-09', NULL, 'Pécs', '1991-11-05', '6dd1552d1ca57c56f3095addf357405e0a302ef3cdbdd8a467bda92126d6bbbd', 'N'),
	(140, 'Kiss Imre', 'kiss.imre@gengi.hu', '8953141845', 'N', 'projektvezető', 15, 'N', 'Balogh Éva', '2019-05-30', NULL, 'Győr', '1987-04-16', '934090428f4606695e12fa9b46dd653359a85c5a9196e0a08b1753fb39ecc942', 'N'),
	(141, 'Nagy Júlia', 'nagy.julia2@gengi.hu', '8959142956', 'I', 'ügyintéző', 28, 'N', 'Kovács Mária', '2021-08-12', NULL, 'Debrecen', '1993-06-29', '025c0349b681f2e5bfb7a2683616c5b4b2fd0b03b673a046d00da7bdb557d73f', 'N'),
	(142, 'Szabó Károly', 'szabo.karoly@gengi.hu', '8965143067', 'N', 'rendszergazda', 66, 'N', 'Nagy Judit', '2018-04-16', NULL, 'Miskolc', '1985-09-23', 'a323238f38ef3cc0f607572d8640f3c790614bd1c784603eef6f41bbc7340e04', 'N'),
	(143, 'Horváth Laura', 'horvath.laura@gengi.hu', '8971144178', 'I', 'HR munkatárs', 4, 'N', 'Kiss Anna', '2020-11-23', NULL, 'Budapest', '1996-02-17', '9e301c0c4ffcc18053c98b8692a6333c038c458b2a6594abb411081e61b55479', 'N'),
	(144, 'Varga Miklós', 'varga.miklos@gengi.hu', '8977145289', 'N', 'adminisztrátor', 4, 'N', 'Szabó Mária', '2017-10-05', '2024-06-01', 'Szeged', '1984-12-08', 'f3d5b79f0465171c99dfb9c43fca1a25b942106552f5e67f254c2782355479ac', 'N'),
	(145, 'Molnár Nóra', 'molnar.nora@gengi.hu', '8983146390', 'I', 'könyvelő', 83, 'N', 'Horváth Éva', '2022-01-18', NULL, 'Pécs', '1990-05-14', '9bd28e1fa3f40fab6d9ffd9619aa75a186576570663c6f3a2ae453605aecb0e9', 'N'),
	(146, 'Tóth Olivér', 'toth.oliver2@gengi.hu', '8989147401', 'N', 'informatikus', 66, 'N', 'Varga Judit', '2019-08-08', NULL, 'Győr', '1988-03-28', '8a655e603b36f567714ac6a3b9ab850a5b07c5e400d485b1a85c60bc06c6c071', 'N'),
	(147, 'Farkas Petra', 'farkas.petra2@gengi.hu', '8995148512', 'I', 'értékesítő', 20, 'N', 'Molnár Anna', '2021-03-03', NULL, 'Debrecen', '1994-10-12', '0121a3c3ba56187aed9912287ac1beabfb8ed7b17eacf9f945d47879058839ac', 'N'),
	(148, 'Balogh Róbert', 'balogh.robert@gengi.hu', '9001149623', 'N', 'projektvezető', 15, 'N', 'Farkas Katalin', '2018-06-22', NULL, 'Miskolc', '1986-01-31', '17fc2e1820c60b3301ea0acdf2d213a2a1bf340369eab00e1d41b96347f20d29', 'N'),
	(149, 'Kovács Szilvia', 'kovacs.szilvia@gengi.hu', '9007150734', 'I', 'ügyintéző', 20, 'N', 'Balogh Mária', '2020-09-14', NULL, 'Budapest', '1992-07-07', '59c32e17fbb0bb9da0f1b0a83a8ace88c6a0a1e104f109f5d770efef9ca42f26', 'N'),
	(150, 'Németh Zoltán', 'nemeth.zoltan@gengi.hu', '9013151845', 'N', 'rendszergazda', 66, 'N', 'Kovács Éva', '2017-11-28', NULL, 'Szeged', '1985-04-19', 'b3c4eeb5cfefdbaa7dee72ec9924f12950823cea315c5a36a4a470b2f2fdd76e', 'N');

-- Struktúra mentése tábla munkaido. alkalmazott_eves_szabadsaga
DROP TABLE IF EXISTS `alkalmazott_eves_szabadsaga`;
CREATE TABLE IF NOT EXISTS `alkalmazott_eves_szabadsaga` (
  `alkalmazott_eves_szabadsaga_azonosito` int(11) NOT NULL AUTO_INCREMENT,
  `alkalmazott_azonosito` int(11) NOT NULL,
  `ev` int(4) NOT NULL,
  `szabadnapok_szama` int(2) NOT NULL,
  PRIMARY KEY (`alkalmazott_eves_szabadsaga_azonosito`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- Tábla adatainak mentése munkaido.alkalmazott_eves_szabadsaga: ~123 rows (hozzávetőleg)
REPLACE INTO `alkalmazott_eves_szabadsaga` (`alkalmazott_eves_szabadsaga_azonosito`, `alkalmazott_azonosito`, `ev`, `szabadnapok_szama`) VALUES
	(1, 1, 2026, 29),
	(2, 2, 2026, 22),
	(3, 4, 2026, 28),
	(4, 5, 2026, 27),
	(5, 7, 2026, 22),
	(6, 9, 2026, 25),
	(7, 11, 2026, 22),
	(8, 12, 2026, 21),
	(9, 13, 2026, 28),
	(10, 15, 2026, 27),
	(11, 16, 2026, 25),
	(12, 17, 2026, 29),
	(13, 19, 2026, 27),
	(14, 20, 2026, 26),
	(15, 21, 2026, 20),
	(16, 22, 2026, 21),
	(17, 24, 2026, 26),
	(18, 25, 2026, 28),
	(19, 26, 2026, 22),
	(20, 28, 2026, 27),
	(21, 29, 2026, 28),
	(22, 30, 2026, 21),
	(23, 31, 2026, 29),
	(24, 33, 2026, 22),
	(25, 34, 2026, 30),
	(26, 35, 2026, 26),
	(27, 36, 2026, 24),
	(28, 38, 2026, 26),
	(29, 39, 2026, 26),
	(30, 40, 2026, 22),
	(31, 41, 2026, 27),
	(32, 43, 2026, 25),
	(33, 44, 2026, 24),
	(34, 45, 2026, 24),
	(35, 46, 2026, 22),
	(36, 47, 2026, 23),
	(37, 49, 2026, 27),
	(38, 50, 2026, 24),
	(39, 51, 2026, 24),
	(40, 52, 2026, 28),
	(41, 53, 2026, 25),
	(42, 55, 2026, 23),
	(43, 56, 2026, 28),
	(44, 57, 2026, 25),
	(45, 59, 2026, 26),
	(46, 60, 2026, 22),
	(47, 61, 2026, 23),
	(48, 62, 2026, 22),
	(49, 63, 2026, 23),
	(50, 65, 2026, 23),
	(51, 66, 2026, 24),
	(52, 67, 2026, 20),
	(53, 68, 2026, 20),
	(54, 69, 2026, 29),
	(55, 71, 2026, 23),
	(56, 72, 2026, 27),
	(57, 73, 2026, 28),
	(58, 75, 2026, 25),
	(59, 76, 2026, 30),
	(60, 77, 2026, 25),
	(61, 78, 2026, 24),
	(62, 79, 2026, 25),
	(63, 81, 2026, 21),
	(64, 82, 2026, 27),
	(65, 83, 2026, 20),
	(66, 85, 2026, 23),
	(67, 86, 2026, 22),
	(68, 87, 2026, 29),
	(69, 88, 2026, 26),
	(70, 89, 2026, 20),
	(71, 91, 2026, 27),
	(72, 92, 2026, 28),
	(73, 93, 2026, 27),
	(74, 94, 2026, 29),
	(75, 95, 2026, 25),
	(76, 97, 2026, 29),
	(77, 98, 2026, 25),
	(78, 99, 2026, 22),
	(79, 100, 2026, 29),
	(80, 101, 2026, 28),
	(81, 102, 2026, 27),
	(82, 103, 2026, 25),
	(83, 105, 2026, 23),
	(84, 106, 2026, 21),
	(85, 107, 2026, 21),
	(86, 108, 2026, 26),
	(87, 109, 2026, 20),
	(88, 110, 2026, 30),
	(89, 111, 2026, 26),
	(90, 113, 2026, 20),
	(91, 114, 2026, 28),
	(92, 115, 2026, 22),
	(93, 116, 2026, 20),
	(94, 117, 2026, 28),
	(95, 118, 2026, 20),
	(96, 119, 2026, 24),
	(97, 121, 2026, 24),
	(98, 122, 2026, 29),
	(99, 123, 2026, 30),
	(100, 124, 2026, 20),
	(101, 125, 2026, 28),
	(102, 127, 2026, 20),
	(103, 128, 2026, 24),
	(104, 129, 2026, 20),
	(105, 130, 2026, 22),
	(106, 131, 2026, 28),
	(107, 132, 2026, 23),
	(108, 133, 2026, 26),
	(109, 135, 2026, 21),
	(110, 136, 2026, 29),
	(111, 137, 2026, 27),
	(112, 138, 2026, 23),
	(113, 139, 2026, 28),
	(114, 140, 2026, 22),
	(115, 141, 2026, 24),
	(116, 142, 2026, 28),
	(117, 143, 2026, 21),
	(118, 145, 2026, 30),
	(119, 146, 2026, 26),
	(120, 147, 2026, 21),
	(121, 148, 2026, 28),
	(122, 149, 2026, 30),
	(123, 150, 2026, 27);

-- Struktúra mentése tábla munkaido. alkalmazotti_munkaido_nyilvantartas
DROP TABLE IF EXISTS `alkalmazotti_munkaido_nyilvantartas`;
CREATE TABLE IF NOT EXISTS `alkalmazotti_munkaido_nyilvantartas` (
  `alkalmazotti_munkaido_nyilvantartas_azonosito` int(11) NOT NULL AUTO_INCREMENT,
  `alkalmazott_azonosito` int(11) NOT NULL,
  `eves_munkaido_naptar_azonosito` int(11) NOT NULL,
  `munkaido_kezdete` time DEFAULT NULL,
  `munkaido_vege` time DEFAULT NULL,
  `jovahagyva` enum('I','N') COLLATE utf8mb3_hungarian_ci NOT NULL DEFAULT 'N',
  `statusz` enum('ledolgozott nap','szabadság','betegszabadság','home office') COLLATE utf8mb3_hungarian_ci DEFAULT NULL,
  PRIMARY KEY (`alkalmazotti_munkaido_nyilvantartas_azonosito`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- Tábla adatainak mentése munkaido.alkalmazotti_munkaido_nyilvantartas: ~25 rows (hozzávetőleg)
REPLACE INTO `alkalmazotti_munkaido_nyilvantartas` (`alkalmazotti_munkaido_nyilvantartas_azonosito`, `alkalmazott_azonosito`, `eves_munkaido_naptar_azonosito`, `munkaido_kezdete`, `munkaido_vege`, `jovahagyva`, `statusz`) VALUES
	(1, 1, 215, '08:00:00', '16:30:00', 'I', 'ledolgozott nap'),
	(8, 9, 216, NULL, NULL, 'I', 'home office'),
	(9, 9, 218, '08:00:00', '16:00:00', 'N', 'ledolgozott nap'),
	(11, 9, 2, NULL, NULL, 'I', 'szabadság'),
	(12, 9, 5, '00:15:00', '06:30:00', 'I', 'ledolgozott nap'),
	(13, 9, 124, NULL, NULL, 'I', 'home office'),
	(14, 9, 217, NULL, NULL, 'I', 'betegszabadság'),
	(15, 9, 222, '08:00:00', '16:30:00', 'I', 'ledolgozott nap'),
	(16, 9, 223, NULL, NULL, 'I', 'home office'),
	(17, 9, 6, NULL, NULL, 'I', 'szabadság'),
	(18, 10, 224, '00:00:00', '00:00:00', 'I', 'ledolgozott nap'),
	(19, 9, 219, '12:00:00', '17:00:00', 'N', 'ledolgozott nap'),
	(20, 9, 224, '11:00:00', '19:00:00', 'N', 'ledolgozott nap'),
	(21, 15, 215, '07:30:00', '17:00:00', 'N', 'ledolgozott nap'),
	(22, 15, 219, NULL, NULL, 'N', 'home office'),
	(23, 7, 314, NULL, NULL, 'I', 'szabadság'),
	(24, 9, 271, NULL, NULL, 'N', 'home office'),
	(25, 9, 215, '08:00:00', '16:30:00', 'I', 'ledolgozott nap'),
	(26, 9, 229, NULL, NULL, 'N', 'betegszabadság'),
	(27, 9, 281, NULL, NULL, 'N', 'szabadság'),
	(28, 9, 282, NULL, NULL, 'N', 'szabadság'),
	(29, 8, 265, NULL, NULL, 'I', 'szabadság'),
	(30, 9, 220, NULL, NULL, 'N', 'betegszabadság'),
	(31, 9, 260, NULL, NULL, 'I', 'szabadság'),
	(32, 9, 261, NULL, NULL, 'I', 'szabadság');

-- Struktúra mentése tábla munkaido. alkalmazotti_munkarend
DROP TABLE IF EXISTS `alkalmazotti_munkarend`;
CREATE TABLE IF NOT EXISTS `alkalmazotti_munkarend` (
  `alkalmazotti_munkarend_azonosito` int(11) NOT NULL AUTO_INCREMENT,
  `alkalmazott_azonosito` int(11) NOT NULL,
  `munkaido_kezdete` time NOT NULL,
  `munkaido_vege` time NOT NULL,
  `ebedido_kezdete` time NOT NULL,
  `ebedido_vege` time NOT NULL,
  PRIMARY KEY (`alkalmazotti_munkarend_azonosito`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- Tábla adatainak mentése munkaido.alkalmazotti_munkarend: ~150 rows (hozzávetőleg)
REPLACE INTO `alkalmazotti_munkarend` (`alkalmazotti_munkarend_azonosito`, `alkalmazott_azonosito`, `munkaido_kezdete`, `munkaido_vege`, `ebedido_kezdete`, `ebedido_vege`) VALUES
	(1, 1, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(2, 2, '09:15:00', '17:45:00', '13:15:00', '13:45:00'),
	(3, 3, '06:30:00', '15:00:00', '10:30:00', '11:00:00'),
	(4, 4, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(5, 5, '10:15:00', '18:45:00', '14:15:00', '14:45:00'),
	(6, 6, '07:00:00', '15:30:00', '11:00:00', '11:30:00'),
	(7, 7, '08:00:00', '16:30:00', '12:00:00', '12:30:00'),
	(8, 8, '06:00:00', '14:30:00', '10:00:00', '10:30:00'),
	(9, 9, '10:30:00', '19:00:00', '14:30:00', '15:00:00'),
	(10, 10, '08:15:00', '16:45:00', '12:15:00', '12:45:00'),
	(11, 11, '08:45:00', '17:15:00', '12:45:00', '13:15:00'),
	(12, 12, '07:00:00', '15:30:00', '11:00:00', '11:30:00'),
	(13, 13, '06:45:00', '15:15:00', '10:45:00', '11:15:00'),
	(14, 14, '08:30:00', '17:00:00', '12:30:00', '13:00:00'),
	(15, 15, '07:30:00', '16:00:00', '11:30:00', '12:00:00'),
	(16, 16, '08:45:00', '17:15:00', '12:45:00', '13:15:00'),
	(17, 17, '07:00:00', '15:30:00', '11:00:00', '11:30:00'),
	(18, 18, '07:30:00', '16:00:00', '11:30:00', '12:00:00'),
	(19, 19, '06:45:00', '15:15:00', '10:45:00', '11:15:00'),
	(20, 20, '08:00:00', '16:30:00', '12:00:00', '12:30:00'),
	(21, 21, '09:30:00', '18:00:00', '13:30:00', '14:00:00'),
	(22, 22, '09:45:00', '18:15:00', '13:45:00', '14:15:00'),
	(23, 23, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(24, 24, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(25, 25, '08:00:00', '16:30:00', '12:00:00', '12:30:00'),
	(26, 26, '10:30:00', '19:00:00', '14:30:00', '15:00:00'),
	(27, 27, '08:15:00', '16:45:00', '12:15:00', '12:45:00'),
	(28, 28, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(29, 29, '07:15:00', '15:45:00', '11:15:00', '11:45:00'),
	(30, 30, '09:15:00', '17:45:00', '13:15:00', '13:45:00'),
	(31, 31, '08:45:00', '17:15:00', '12:45:00', '13:15:00'),
	(32, 32, '06:15:00', '14:45:00', '10:15:00', '10:45:00'),
	(33, 33, '09:15:00', '17:45:00', '13:15:00', '13:45:00'),
	(34, 34, '07:30:00', '16:00:00', '11:30:00', '12:00:00'),
	(35, 35, '08:15:00', '16:45:00', '12:15:00', '12:45:00'),
	(36, 36, '06:15:00', '14:45:00', '10:15:00', '10:45:00'),
	(37, 37, '06:45:00', '15:15:00', '10:45:00', '11:15:00'),
	(38, 38, '08:15:00', '16:45:00', '12:15:00', '12:45:00'),
	(39, 39, '10:15:00', '18:45:00', '14:15:00', '14:45:00'),
	(40, 40, '06:30:00', '15:00:00', '10:30:00', '11:00:00'),
	(41, 41, '09:00:00', '17:30:00', '13:00:00', '13:30:00'),
	(42, 42, '08:15:00', '16:45:00', '12:15:00', '12:45:00'),
	(43, 43, '07:15:00', '15:45:00', '11:15:00', '11:45:00'),
	(44, 44, '10:30:00', '19:00:00', '14:30:00', '15:00:00'),
	(45, 45, '10:15:00', '18:45:00', '14:15:00', '14:45:00'),
	(46, 46, '07:30:00', '16:00:00', '11:30:00', '12:00:00'),
	(47, 47, '08:45:00', '17:15:00', '12:45:00', '13:15:00'),
	(48, 48, '07:45:00', '16:15:00', '11:45:00', '12:15:00'),
	(49, 49, '08:30:00', '17:00:00', '12:30:00', '13:00:00'),
	(50, 50, '07:30:00', '16:00:00', '11:30:00', '12:00:00'),
	(51, 51, '09:00:00', '17:30:00', '13:00:00', '13:30:00'),
	(52, 52, '06:30:00', '15:00:00', '10:30:00', '11:00:00'),
	(53, 53, '09:00:00', '17:30:00', '13:00:00', '13:30:00'),
	(54, 54, '07:00:00', '15:30:00', '11:00:00', '11:30:00'),
	(55, 55, '08:45:00', '17:15:00', '12:45:00', '13:15:00'),
	(56, 56, '06:30:00', '15:00:00', '10:30:00', '11:00:00'),
	(57, 57, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(58, 58, '06:30:00', '15:00:00', '10:30:00', '11:00:00'),
	(59, 59, '10:00:00', '18:30:00', '14:00:00', '14:30:00'),
	(60, 60, '09:45:00', '18:15:00', '13:45:00', '14:15:00'),
	(61, 61, '07:45:00', '16:15:00', '11:45:00', '12:15:00'),
	(62, 62, '10:00:00', '18:30:00', '14:00:00', '14:30:00'),
	(63, 63, '08:45:00', '17:15:00', '12:45:00', '13:15:00'),
	(64, 64, '07:00:00', '15:30:00', '11:00:00', '11:30:00'),
	(65, 65, '07:30:00', '16:00:00', '11:30:00', '12:00:00'),
	(66, 66, '07:00:00', '15:30:00', '11:00:00', '11:30:00'),
	(67, 67, '08:30:00', '17:00:00', '12:30:00', '13:00:00'),
	(68, 68, '08:45:00', '17:15:00', '12:45:00', '13:15:00'),
	(69, 69, '09:00:00', '17:30:00', '13:00:00', '13:30:00'),
	(70, 70, '09:30:00', '18:00:00', '13:30:00', '14:00:00'),
	(71, 71, '08:00:00', '16:30:00', '12:00:00', '12:30:00'),
	(72, 72, '10:00:00', '18:30:00', '14:00:00', '14:30:00'),
	(73, 73, '10:15:00', '18:45:00', '14:15:00', '14:45:00'),
	(74, 74, '08:45:00', '17:15:00', '12:45:00', '13:15:00'),
	(75, 75, '09:00:00', '17:30:00', '13:00:00', '13:30:00'),
	(76, 76, '10:15:00', '18:45:00', '14:15:00', '14:45:00'),
	(77, 77, '10:30:00', '19:00:00', '14:30:00', '15:00:00'),
	(78, 78, '06:00:00', '14:30:00', '10:00:00', '10:30:00'),
	(79, 79, '10:15:00', '18:45:00', '14:15:00', '14:45:00'),
	(80, 80, '08:15:00', '16:45:00', '12:15:00', '12:45:00'),
	(81, 81, '09:15:00', '17:45:00', '13:15:00', '13:45:00'),
	(82, 82, '10:00:00', '18:30:00', '14:00:00', '14:30:00'),
	(83, 83, '06:45:00', '15:15:00', '10:45:00', '11:15:00'),
	(84, 84, '07:30:00', '16:00:00', '11:30:00', '12:00:00'),
	(85, 85, '06:30:00', '15:00:00', '10:30:00', '11:00:00'),
	(86, 86, '08:15:00', '16:45:00', '12:15:00', '12:45:00'),
	(87, 87, '08:45:00', '17:15:00', '12:45:00', '13:15:00'),
	(88, 88, '07:45:00', '16:15:00', '11:45:00', '12:15:00'),
	(89, 89, '09:30:00', '18:00:00', '13:30:00', '14:00:00'),
	(90, 90, '06:15:00', '14:45:00', '10:15:00', '10:45:00'),
	(91, 91, '09:30:00', '18:00:00', '13:30:00', '14:00:00'),
	(92, 92, '10:30:00', '19:00:00', '14:30:00', '15:00:00'),
	(93, 93, '09:45:00', '18:15:00', '13:45:00', '14:15:00'),
	(94, 94, '06:30:00', '15:00:00', '10:30:00', '11:00:00'),
	(95, 95, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(96, 96, '07:15:00', '15:45:00', '11:15:00', '11:45:00'),
	(97, 97, '06:30:00', '15:00:00', '10:30:00', '11:00:00'),
	(98, 98, '10:30:00', '19:00:00', '14:30:00', '15:00:00'),
	(99, 99, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(100, 100, '09:15:00', '17:45:00', '13:15:00', '13:45:00'),
	(101, 101, '09:15:00', '17:45:00', '13:15:00', '13:45:00'),
	(102, 102, '09:30:00', '18:00:00', '13:30:00', '14:00:00'),
	(103, 103, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(104, 104, '10:15:00', '18:45:00', '14:15:00', '14:45:00'),
	(105, 105, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(106, 106, '06:30:00', '15:00:00', '10:30:00', '11:00:00'),
	(107, 107, '08:00:00', '16:30:00', '12:00:00', '12:30:00'),
	(108, 108, '06:00:00', '14:30:00', '10:00:00', '10:30:00'),
	(109, 109, '09:00:00', '17:30:00', '13:00:00', '13:30:00'),
	(110, 110, '06:00:00', '14:30:00', '10:00:00', '10:30:00'),
	(111, 111, '06:45:00', '15:15:00', '10:45:00', '11:15:00'),
	(112, 112, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(113, 113, '06:15:00', '14:45:00', '10:15:00', '10:45:00'),
	(114, 114, '06:15:00', '14:45:00', '10:15:00', '10:45:00'),
	(115, 115, '06:00:00', '14:30:00', '10:00:00', '10:30:00'),
	(116, 116, '07:45:00', '16:15:00', '11:45:00', '12:15:00'),
	(117, 117, '09:15:00', '17:45:00', '13:15:00', '13:45:00'),
	(118, 118, '07:30:00', '16:00:00', '11:30:00', '12:00:00'),
	(119, 119, '10:00:00', '18:30:00', '14:00:00', '14:30:00'),
	(120, 120, '10:15:00', '18:45:00', '14:15:00', '14:45:00'),
	(121, 121, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(122, 122, '06:15:00', '14:45:00', '10:15:00', '10:45:00'),
	(123, 123, '06:00:00', '14:30:00', '10:00:00', '10:30:00'),
	(124, 124, '06:30:00', '15:00:00', '10:30:00', '11:00:00'),
	(125, 125, '10:15:00', '18:45:00', '14:15:00', '14:45:00'),
	(126, 126, '10:30:00', '19:00:00', '14:30:00', '15:00:00'),
	(127, 127, '06:45:00', '15:15:00', '10:45:00', '11:15:00'),
	(128, 128, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(129, 129, '08:15:00', '16:45:00', '12:15:00', '12:45:00'),
	(130, 130, '08:00:00', '16:30:00', '12:00:00', '12:30:00'),
	(131, 131, '10:15:00', '18:45:00', '14:15:00', '14:45:00'),
	(132, 132, '09:15:00', '17:45:00', '13:15:00', '13:45:00'),
	(133, 133, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(134, 134, '08:15:00', '16:45:00', '12:15:00', '12:45:00'),
	(135, 135, '10:30:00', '19:00:00', '14:30:00', '15:00:00'),
	(136, 136, '10:30:00', '19:00:00', '14:30:00', '15:00:00'),
	(137, 137, '08:00:00', '16:30:00', '12:00:00', '12:30:00'),
	(138, 138, '08:00:00', '16:30:00', '12:00:00', '12:30:00'),
	(139, 139, '10:45:00', '19:15:00', '14:45:00', '15:15:00'),
	(140, 140, '06:00:00', '14:30:00', '10:00:00', '10:30:00'),
	(141, 141, '09:15:00', '17:45:00', '13:15:00', '13:45:00'),
	(142, 142, '07:15:00', '15:45:00', '11:15:00', '11:45:00'),
	(143, 143, '06:30:00', '15:00:00', '10:30:00', '11:00:00'),
	(144, 144, '06:45:00', '15:15:00', '10:45:00', '11:15:00'),
	(145, 145, '07:00:00', '15:30:00', '11:00:00', '11:30:00'),
	(146, 146, '09:15:00', '17:45:00', '13:15:00', '13:45:00'),
	(147, 147, '10:00:00', '18:30:00', '14:00:00', '14:30:00'),
	(148, 148, '10:15:00', '18:45:00', '14:15:00', '14:45:00'),
	(149, 149, '09:15:00', '17:45:00', '13:15:00', '13:45:00'),
	(150, 150, '06:30:00', '15:00:00', '10:30:00', '11:00:00');

-- Struktúra mentése tábla munkaido. eves_munkaido_naptar
DROP TABLE IF EXISTS `eves_munkaido_naptar`;
CREATE TABLE IF NOT EXISTS `eves_munkaido_naptar` (
  `eves_munkaido_naptar_azonosito` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL,
  `nap_tipusa` enum('Munkanap','Ünnepnap','Pihenőnap') COLLATE utf8mb3_hungarian_ci NOT NULL,
  PRIMARY KEY (`eves_munkaido_naptar_azonosito`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- Tábla adatainak mentése munkaido.eves_munkaido_naptar: ~365 rows (hozzávetőleg)
REPLACE INTO `eves_munkaido_naptar` (`eves_munkaido_naptar_azonosito`, `datum`, `nap_tipusa`) VALUES
	(1, '2026-01-01', 'Ünnepnap'),
	(2, '2026-01-02', 'Pihenőnap'),
	(3, '2026-01-03', 'Pihenőnap'),
	(4, '2026-01-04', 'Pihenőnap'),
	(5, '2026-01-05', 'Munkanap'),
	(6, '2026-01-06', 'Munkanap'),
	(7, '2026-01-07', 'Munkanap'),
	(8, '2026-01-08', 'Munkanap'),
	(9, '2026-01-09', 'Munkanap'),
	(10, '2026-01-10', 'Munkanap'),
	(11, '2026-01-11', 'Pihenőnap'),
	(12, '2026-01-12', 'Munkanap'),
	(13, '2026-01-13', 'Munkanap'),
	(14, '2026-01-14', 'Munkanap'),
	(15, '2026-01-15', 'Munkanap'),
	(16, '2026-01-16', 'Munkanap'),
	(17, '2026-01-17', 'Pihenőnap'),
	(18, '2026-01-18', 'Pihenőnap'),
	(19, '2026-01-19', 'Munkanap'),
	(20, '2026-01-20', 'Munkanap'),
	(21, '2026-01-21', 'Munkanap'),
	(22, '2026-01-22', 'Munkanap'),
	(23, '2026-01-23', 'Munkanap'),
	(24, '2026-01-24', 'Pihenőnap'),
	(25, '2026-01-25', 'Pihenőnap'),
	(26, '2026-01-26', 'Munkanap'),
	(27, '2026-01-27', 'Munkanap'),
	(28, '2026-01-28', 'Munkanap'),
	(29, '2026-01-29', 'Munkanap'),
	(30, '2026-01-30', 'Munkanap'),
	(31, '2026-01-31', 'Pihenőnap'),
	(32, '2026-02-01', 'Pihenőnap'),
	(33, '2026-02-02', 'Munkanap'),
	(34, '2026-02-03', 'Munkanap'),
	(35, '2026-02-04', 'Munkanap'),
	(36, '2026-02-05', 'Munkanap'),
	(37, '2026-02-06', 'Munkanap'),
	(38, '2026-02-07', 'Pihenőnap'),
	(39, '2026-02-08', 'Pihenőnap'),
	(40, '2026-02-09', 'Munkanap'),
	(41, '2026-02-10', 'Munkanap'),
	(42, '2026-02-11', 'Munkanap'),
	(43, '2026-02-12', 'Munkanap'),
	(44, '2026-02-13', 'Munkanap'),
	(45, '2026-02-14', 'Pihenőnap'),
	(46, '2026-02-15', 'Pihenőnap'),
	(47, '2026-02-16', 'Munkanap'),
	(48, '2026-02-17', 'Munkanap'),
	(49, '2026-02-18', 'Munkanap'),
	(50, '2026-02-19', 'Munkanap'),
	(51, '2026-02-20', 'Munkanap'),
	(52, '2026-02-21', 'Pihenőnap'),
	(53, '2026-02-22', 'Pihenőnap'),
	(54, '2026-02-23', 'Munkanap'),
	(55, '2026-02-24', 'Munkanap'),
	(56, '2026-02-25', 'Munkanap'),
	(57, '2026-02-26', 'Munkanap'),
	(58, '2026-02-27', 'Munkanap'),
	(59, '2026-02-28', 'Pihenőnap'),
	(60, '2026-03-01', 'Pihenőnap'),
	(61, '2026-03-02', 'Munkanap'),
	(62, '2026-03-03', 'Munkanap'),
	(63, '2026-03-04', 'Munkanap'),
	(64, '2026-03-05', 'Munkanap'),
	(65, '2026-03-06', 'Munkanap'),
	(66, '2026-03-07', 'Pihenőnap'),
	(67, '2026-03-08', 'Pihenőnap'),
	(68, '2026-03-09', 'Munkanap'),
	(69, '2026-03-10', 'Munkanap'),
	(70, '2026-03-11', 'Munkanap'),
	(71, '2026-03-12', 'Munkanap'),
	(72, '2026-03-13', 'Munkanap'),
	(73, '2026-03-14', 'Pihenőnap'),
	(74, '2026-03-15', 'Ünnepnap'),
	(75, '2026-03-16', 'Munkanap'),
	(76, '2026-03-17', 'Munkanap'),
	(77, '2026-03-18', 'Munkanap'),
	(78, '2026-03-19', 'Munkanap'),
	(79, '2026-03-20', 'Munkanap'),
	(80, '2026-03-21', 'Pihenőnap'),
	(81, '2026-03-22', 'Pihenőnap'),
	(82, '2026-03-23', 'Munkanap'),
	(83, '2026-03-24', 'Munkanap'),
	(84, '2026-03-25', 'Munkanap'),
	(85, '2026-03-26', 'Munkanap'),
	(86, '2026-03-27', 'Munkanap'),
	(87, '2026-03-28', 'Pihenőnap'),
	(88, '2026-03-29', 'Pihenőnap'),
	(89, '2026-03-30', 'Munkanap'),
	(90, '2026-03-31', 'Munkanap'),
	(91, '2026-04-01', 'Munkanap'),
	(92, '2026-04-02', 'Munkanap'),
	(93, '2026-04-03', 'Ünnepnap'),
	(94, '2026-04-04', 'Pihenőnap'),
	(95, '2026-04-05', 'Ünnepnap'),
	(96, '2026-04-06', 'Ünnepnap'),
	(97, '2026-04-07', 'Munkanap'),
	(98, '2026-04-08', 'Munkanap'),
	(99, '2026-04-09', 'Munkanap'),
	(100, '2026-04-10', 'Munkanap'),
	(101, '2026-04-11', 'Pihenőnap'),
	(102, '2026-04-12', 'Pihenőnap'),
	(103, '2026-04-13', 'Munkanap'),
	(104, '2026-04-14', 'Munkanap'),
	(105, '2026-04-15', 'Munkanap'),
	(106, '2026-04-16', 'Munkanap'),
	(107, '2026-04-17', 'Munkanap'),
	(108, '2026-04-18', 'Pihenőnap'),
	(109, '2026-04-19', 'Pihenőnap'),
	(110, '2026-04-20', 'Munkanap'),
	(111, '2026-04-21', 'Munkanap'),
	(112, '2026-04-22', 'Munkanap'),
	(113, '2026-04-23', 'Munkanap'),
	(114, '2026-04-24', 'Munkanap'),
	(115, '2026-04-25', 'Pihenőnap'),
	(116, '2026-04-26', 'Pihenőnap'),
	(117, '2026-04-27', 'Munkanap'),
	(118, '2026-04-28', 'Munkanap'),
	(119, '2026-04-29', 'Munkanap'),
	(120, '2026-04-30', 'Munkanap'),
	(121, '2026-05-01', 'Ünnepnap'),
	(122, '2026-05-02', 'Pihenőnap'),
	(123, '2026-05-03', 'Pihenőnap'),
	(124, '2026-05-04', 'Munkanap'),
	(125, '2026-05-05', 'Munkanap'),
	(126, '2026-05-06', 'Munkanap'),
	(127, '2026-05-07', 'Munkanap'),
	(128, '2026-05-08', 'Munkanap'),
	(129, '2026-05-09', 'Pihenőnap'),
	(130, '2026-05-10', 'Pihenőnap'),
	(131, '2026-05-11', 'Munkanap'),
	(132, '2026-05-12', 'Munkanap'),
	(133, '2026-05-13', 'Munkanap'),
	(134, '2026-05-14', 'Munkanap'),
	(135, '2026-05-15', 'Munkanap'),
	(136, '2026-05-16', 'Pihenőnap'),
	(137, '2026-05-17', 'Pihenőnap'),
	(138, '2026-05-18', 'Munkanap'),
	(139, '2026-05-19', 'Munkanap'),
	(140, '2026-05-20', 'Munkanap'),
	(141, '2026-05-21', 'Munkanap'),
	(142, '2026-05-22', 'Munkanap'),
	(143, '2026-05-23', 'Pihenőnap'),
	(144, '2026-05-24', 'Ünnepnap'),
	(145, '2026-05-25', 'Ünnepnap'),
	(146, '2026-05-26', 'Munkanap'),
	(147, '2026-05-27', 'Munkanap'),
	(148, '2026-05-28', 'Munkanap'),
	(149, '2026-05-29', 'Munkanap'),
	(150, '2026-05-30', 'Pihenőnap'),
	(151, '2026-05-31', 'Pihenőnap'),
	(152, '2026-06-01', 'Munkanap'),
	(153, '2026-06-02', 'Munkanap'),
	(154, '2026-06-03', 'Munkanap'),
	(155, '2026-06-04', 'Munkanap'),
	(156, '2026-06-05', 'Munkanap'),
	(157, '2026-06-06', 'Pihenőnap'),
	(158, '2026-06-07', 'Pihenőnap'),
	(159, '2026-06-08', 'Munkanap'),
	(160, '2026-06-09', 'Munkanap'),
	(161, '2026-06-10', 'Munkanap'),
	(162, '2026-06-11', 'Munkanap'),
	(163, '2026-06-12', 'Munkanap'),
	(164, '2026-06-13', 'Pihenőnap'),
	(165, '2026-06-14', 'Pihenőnap'),
	(166, '2026-06-15', 'Munkanap'),
	(167, '2026-06-16', 'Munkanap'),
	(168, '2026-06-17', 'Munkanap'),
	(169, '2026-06-18', 'Munkanap'),
	(170, '2026-06-19', 'Munkanap'),
	(171, '2026-06-20', 'Pihenőnap'),
	(172, '2026-06-21', 'Pihenőnap'),
	(173, '2026-06-22', 'Munkanap'),
	(174, '2026-06-23', 'Munkanap'),
	(175, '2026-06-24', 'Munkanap'),
	(176, '2026-06-25', 'Munkanap'),
	(177, '2026-06-26', 'Munkanap'),
	(178, '2026-06-27', 'Pihenőnap'),
	(179, '2026-06-28', 'Pihenőnap'),
	(180, '2026-06-29', 'Munkanap'),
	(181, '2026-06-30', 'Munkanap'),
	(182, '2026-07-01', 'Munkanap'),
	(183, '2026-07-02', 'Munkanap'),
	(184, '2026-07-03', 'Munkanap'),
	(185, '2026-07-04', 'Pihenőnap'),
	(186, '2026-07-05', 'Pihenőnap'),
	(187, '2026-07-06', 'Munkanap'),
	(188, '2026-07-07', 'Munkanap'),
	(189, '2026-07-08', 'Munkanap'),
	(190, '2026-07-09', 'Munkanap'),
	(191, '2026-07-10', 'Munkanap'),
	(192, '2026-07-11', 'Pihenőnap'),
	(193, '2026-07-12', 'Pihenőnap'),
	(194, '2026-07-13', 'Munkanap'),
	(195, '2026-07-14', 'Munkanap'),
	(196, '2026-07-15', 'Munkanap'),
	(197, '2026-07-16', 'Munkanap'),
	(198, '2026-07-17', 'Munkanap'),
	(199, '2026-07-18', 'Pihenőnap'),
	(200, '2026-07-19', 'Pihenőnap'),
	(201, '2026-07-20', 'Munkanap'),
	(202, '2026-07-21', 'Munkanap'),
	(203, '2026-07-22', 'Munkanap'),
	(204, '2026-07-23', 'Munkanap'),
	(205, '2026-07-24', 'Munkanap'),
	(206, '2026-07-25', 'Pihenőnap'),
	(207, '2026-07-26', 'Pihenőnap'),
	(208, '2026-07-27', 'Munkanap'),
	(209, '2026-07-28', 'Munkanap'),
	(210, '2026-07-29', 'Munkanap'),
	(211, '2026-07-30', 'Munkanap'),
	(212, '2026-07-31', 'Munkanap'),
	(213, '2026-08-01', 'Pihenőnap'),
	(214, '2026-08-02', 'Pihenőnap'),
	(215, '2026-08-03', 'Munkanap'),
	(216, '2026-08-04', 'Munkanap'),
	(217, '2026-08-05', 'Munkanap'),
	(218, '2026-08-06', 'Munkanap'),
	(219, '2026-08-07', 'Munkanap'),
	(220, '2026-08-08', 'Munkanap'),
	(221, '2026-08-09', 'Pihenőnap'),
	(222, '2026-08-10', 'Munkanap'),
	(223, '2026-08-11', 'Munkanap'),
	(224, '2026-08-12', 'Munkanap'),
	(225, '2026-08-13', 'Munkanap'),
	(226, '2026-08-14', 'Munkanap'),
	(227, '2026-08-15', 'Pihenőnap'),
	(228, '2026-08-16', 'Pihenőnap'),
	(229, '2026-08-17', 'Munkanap'),
	(230, '2026-08-18', 'Munkanap'),
	(231, '2026-08-19', 'Munkanap'),
	(232, '2026-08-20', 'Ünnepnap'),
	(233, '2026-08-21', 'Pihenőnap'),
	(234, '2026-08-22', 'Pihenőnap'),
	(235, '2026-08-23', 'Pihenőnap'),
	(236, '2026-08-24', 'Munkanap'),
	(237, '2026-08-25', 'Munkanap'),
	(238, '2026-08-26', 'Munkanap'),
	(239, '2026-08-27', 'Munkanap'),
	(240, '2026-08-28', 'Munkanap'),
	(241, '2026-08-29', 'Pihenőnap'),
	(242, '2026-08-30', 'Pihenőnap'),
	(243, '2026-08-31', 'Munkanap'),
	(244, '2026-09-01', 'Munkanap'),
	(245, '2026-09-02', 'Munkanap'),
	(246, '2026-09-03', 'Munkanap'),
	(247, '2026-09-04', 'Munkanap'),
	(248, '2026-09-05', 'Pihenőnap'),
	(249, '2026-09-06', 'Pihenőnap'),
	(250, '2026-09-07', 'Munkanap'),
	(251, '2026-09-08', 'Munkanap'),
	(252, '2026-09-09', 'Munkanap'),
	(253, '2026-09-10', 'Munkanap'),
	(254, '2026-09-11', 'Munkanap'),
	(255, '2026-09-12', 'Pihenőnap'),
	(256, '2026-09-13', 'Pihenőnap'),
	(257, '2026-09-14', 'Munkanap'),
	(258, '2026-09-15', 'Munkanap'),
	(259, '2026-09-16', 'Munkanap'),
	(260, '2026-09-17', 'Munkanap'),
	(261, '2026-09-18', 'Munkanap'),
	(262, '2026-09-19', 'Pihenőnap'),
	(263, '2026-09-20', 'Pihenőnap'),
	(264, '2026-09-21', 'Munkanap'),
	(265, '2026-09-22', 'Munkanap'),
	(266, '2026-09-23', 'Munkanap'),
	(267, '2026-09-24', 'Munkanap'),
	(268, '2026-09-25', 'Munkanap'),
	(269, '2026-09-26', 'Pihenőnap'),
	(270, '2026-09-27', 'Pihenőnap'),
	(271, '2026-09-28', 'Munkanap'),
	(272, '2026-09-29', 'Munkanap'),
	(273, '2026-09-30', 'Munkanap'),
	(274, '2026-10-01', 'Munkanap'),
	(275, '2026-10-02', 'Munkanap'),
	(276, '2026-10-03', 'Pihenőnap'),
	(277, '2026-10-04', 'Pihenőnap'),
	(278, '2026-10-05', 'Munkanap'),
	(279, '2026-10-06', 'Munkanap'),
	(280, '2026-10-07', 'Munkanap'),
	(281, '2026-10-08', 'Munkanap'),
	(282, '2026-10-09', 'Munkanap'),
	(283, '2026-10-10', 'Pihenőnap'),
	(284, '2026-10-11', 'Pihenőnap'),
	(285, '2026-10-12', 'Munkanap'),
	(286, '2026-10-13', 'Munkanap'),
	(287, '2026-10-14', 'Munkanap'),
	(288, '2026-10-15', 'Munkanap'),
	(289, '2026-10-16', 'Munkanap'),
	(290, '2026-10-17', 'Pihenőnap'),
	(291, '2026-10-18', 'Pihenőnap'),
	(292, '2026-10-19', 'Munkanap'),
	(293, '2026-10-20', 'Munkanap'),
	(294, '2026-10-21', 'Munkanap'),
	(295, '2026-10-22', 'Munkanap'),
	(296, '2026-10-23', 'Ünnepnap'),
	(297, '2026-10-24', 'Pihenőnap'),
	(298, '2026-10-25', 'Pihenőnap'),
	(299, '2026-10-26', 'Munkanap'),
	(300, '2026-10-27', 'Munkanap'),
	(301, '2026-10-28', 'Munkanap'),
	(302, '2026-10-29', 'Munkanap'),
	(303, '2026-10-30', 'Munkanap'),
	(304, '2026-10-31', 'Pihenőnap'),
	(305, '2026-11-01', 'Ünnepnap'),
	(306, '2026-11-02', 'Munkanap'),
	(307, '2026-11-03', 'Munkanap'),
	(308, '2026-11-04', 'Munkanap'),
	(309, '2026-11-05', 'Munkanap'),
	(310, '2026-11-06', 'Munkanap'),
	(311, '2026-11-07', 'Pihenőnap'),
	(312, '2026-11-08', 'Pihenőnap'),
	(313, '2026-11-09', 'Munkanap'),
	(314, '2026-11-10', 'Munkanap'),
	(315, '2026-11-11', 'Munkanap'),
	(316, '2026-11-12', 'Munkanap'),
	(317, '2026-11-13', 'Munkanap'),
	(318, '2026-11-14', 'Pihenőnap'),
	(319, '2026-11-15', 'Pihenőnap'),
	(320, '2026-11-16', 'Munkanap'),
	(321, '2026-11-17', 'Munkanap'),
	(322, '2026-11-18', 'Munkanap'),
	(323, '2026-11-19', 'Munkanap'),
	(324, '2026-11-20', 'Munkanap'),
	(325, '2026-11-21', 'Pihenőnap'),
	(326, '2026-11-22', 'Pihenőnap'),
	(327, '2026-11-23', 'Munkanap'),
	(328, '2026-11-24', 'Munkanap'),
	(329, '2026-11-25', 'Munkanap'),
	(330, '2026-11-26', 'Munkanap'),
	(331, '2026-11-27', 'Munkanap'),
	(332, '2026-11-28', 'Pihenőnap'),
	(333, '2026-11-29', 'Pihenőnap'),
	(334, '2026-11-30', 'Munkanap'),
	(335, '2026-12-01', 'Munkanap'),
	(336, '2026-12-02', 'Munkanap'),
	(337, '2026-12-03', 'Munkanap'),
	(338, '2026-12-04', 'Munkanap'),
	(339, '2026-12-05', 'Pihenőnap'),
	(340, '2026-12-06', 'Pihenőnap'),
	(341, '2026-12-07', 'Munkanap'),
	(342, '2026-12-08', 'Munkanap'),
	(343, '2026-12-09', 'Munkanap'),
	(344, '2026-12-10', 'Munkanap'),
	(345, '2026-12-11', 'Munkanap'),
	(346, '2026-12-12', 'Munkanap'),
	(347, '2026-12-13', 'Pihenőnap'),
	(348, '2026-12-14', 'Munkanap'),
	(349, '2026-12-15', 'Munkanap'),
	(350, '2026-12-16', 'Munkanap'),
	(351, '2026-12-17', 'Munkanap'),
	(352, '2026-12-18', 'Munkanap'),
	(353, '2026-12-19', 'Pihenőnap'),
	(354, '2026-12-20', 'Pihenőnap'),
	(355, '2026-12-21', 'Munkanap'),
	(356, '2026-12-22', 'Munkanap'),
	(357, '2026-12-23', 'Munkanap'),
	(358, '2026-12-24', 'Pihenőnap'),
	(359, '2026-12-25', 'Ünnepnap'),
	(360, '2026-12-26', 'Ünnepnap'),
	(361, '2026-12-27', 'Pihenőnap'),
	(362, '2026-12-28', 'Munkanap'),
	(363, '2026-12-29', 'Munkanap'),
	(364, '2026-12-30', 'Munkanap'),
	(365, '2026-12-31', 'Munkanap');

-- Struktúra mentése tábla munkaido. igenyles
DROP TABLE IF EXISTS `igenyles`;
CREATE TABLE IF NOT EXISTS `igenyles` (
  `igenyles_azonosito` int(11) NOT NULL AUTO_INCREMENT,
  `alkalmazott_azonosito` int(11) NOT NULL,
  `eves_munkaido_naptar_azonosito` int(11) NOT NULL DEFAULT 0,
  `tipus` enum('szabadság','home office') COLLATE utf8mb3_hungarian_ci NOT NULL DEFAULT 'szabadság',
  `jovahagyva` enum('I','N','E') COLLATE utf8mb3_hungarian_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`igenyles_azonosito`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- Tábla adatainak mentése munkaido.igenyles: ~26 rows (hozzávetőleg)
REPLACE INTO `igenyles` (`igenyles_azonosito`, `alkalmazott_azonosito`, `eves_munkaido_naptar_azonosito`, `tipus`, `jovahagyva`) VALUES
	(1, 9, 244, 'home office', 'I'),
	(2, 9, 257, 'szabadság', 'N'),
	(3, 9, 258, 'szabadság', 'N'),
	(4, 9, 259, 'szabadság', 'N'),
	(5, 9, 260, 'szabadság', 'I'),
	(6, 9, 261, 'szabadság', 'I'),
	(13, 9, 271, 'home office', 'I'),
	(14, 9, 272, 'home office', 'N'),
	(15, 9, 273, 'home office', 'E'),
	(19, 7, 314, 'szabadság', 'I'),
	(20, 7, 230, 'szabadság', 'N'),
	(21, 22, 257, 'szabadság', 'N'),
	(22, 22, 264, 'szabadság', 'N'),
	(23, 8, 265, 'szabadság', 'I'),
	(24, 22, 265, 'szabadság', 'N'),
	(25, 37, 257, 'szabadság', 'N'),
	(26, 37, 314, 'szabadság', 'N'),
	(27, 7, 239, 'home office', 'N'),
	(28, 8, 250, 'home office', 'E'),
	(29, 8, 257, 'home office', 'E'),
	(30, 8, 314, 'home office', 'E'),
	(31, 22, 314, 'home office', 'E'),
	(32, 37, 239, 'home office', 'N'),
	(33, 37, 250, 'home office', 'N'),
	(34, 9, 281, 'szabadság', 'I'),
	(35, 9, 282, 'szabadság', 'I');

-- Struktúra mentése tábla munkaido. lakcim
DROP TABLE IF EXISTS `lakcim`;
CREATE TABLE IF NOT EXISTS `lakcim` (
  `lakcim_azonosito` int(11) NOT NULL AUTO_INCREMENT,
  `alkalmazott_azonosito` int(11) NOT NULL DEFAULT 0,
  `iranyitoszam` int(4) NOT NULL DEFAULT 0,
  `telepules_neve` varchar(50) COLLATE utf8mb3_hungarian_ci NOT NULL,
  `cim` varchar(100) COLLATE utf8mb3_hungarian_ci NOT NULL,
  PRIMARY KEY (`lakcim_azonosito`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- Tábla adatainak mentése munkaido.lakcim: ~150 rows (hozzávetőleg)
REPLACE INTO `lakcim` (`lakcim_azonosito`, `alkalmazott_azonosito`, `iranyitoszam`, `telepules_neve`, `cim`) VALUES
	(1, 1, 1011, 'Budapest', 'Fő utca 12.'),
	(2, 2, 1012, 'Budapest', 'Hunyadi János út 25.'),
	(3, 3, 1024, 'Budapest', 'Margit körút 48.'),
	(4, 4, 1037, 'Budapest', 'Bécsi út 76.'),
	(5, 5, 1042, 'Budapest', 'Árpád út 19.'),
	(6, 6, 1052, 'Budapest', 'Váci utca 33.'),
	(7, 7, 1061, 'Budapest', 'Andrássy út 54.'),
	(8, 8, 1075, 'Budapest', 'Király utca 21.'),
	(9, 9, 1092, 'Budapest', 'Ráday utca 15.'),
	(10, 10, 1117, 'Budapest', 'Budafoki út 88.'),
	(11, 11, 2040, 'Budaörs', 'Kossuth Lajos utca 10.'),
	(12, 12, 2030, 'Érd', 'Felső utca 34.'),
	(13, 13, 2120, 'Dunakeszi', 'Tavasz utca 8.'),
	(14, 14, 2100, 'Gödöllő', 'Dózsa György út 42.'),
	(15, 15, 2600, 'Vác', 'Kertváros utca 17.'),
	(16, 16, 2000, 'Szentendre', 'Dunakanyar utca 6.'),
	(17, 17, 2310, 'Szigetszentmiklós', 'Petőfi Sándor utca 28.'),
	(18, 18, 2330, 'Dunaharaszti', 'Akácfa utca 13.'),
	(19, 19, 2360, 'Gyál', 'Ady Endre utca 45.'),
	(20, 20, 2200, 'Monor', 'Jókai Mór utca 31.'),
	(21, 21, 6000, 'Kecskemét', 'Rákóczi út 22.'),
	(22, 22, 6720, 'Szeged', 'Tisza Lajos körút 14.'),
	(23, 23, 7621, 'Pécs', 'Király utca 39.'),
	(24, 24, 9021, 'Győr', 'Baross Gábor út 18.'),
	(25, 25, 3525, 'Miskolc', 'Széchenyi utca 27.'),
	(26, 26, 4024, 'Debrecen', 'Piac utca 35.'),
	(27, 27, 8000, 'Székesfehérvár', 'Fő utca 41.'),
	(28, 28, 7400, 'Kaposvár', 'Berzsenyi utca 9.'),
	(29, 29, 8900, 'Zalaegerszeg', 'Kossuth Lajos utca 52.'),
	(30, 30, 9700, 'Szombathely', 'Hunyadi út 16.'),
	(31, 31, 5000, 'Szolnok', 'Baross utca 23.'),
	(32, 32, 3100, 'Salgótarján', 'Rákóczi út 11.'),
	(33, 33, 4400, 'Nyíregyháza', 'Kossuth tér 7.'),
	(34, 34, 8200, 'Veszprém', 'Egyetem utca 29.'),
	(35, 35, 8360, 'Keszthely', 'Balaton utca 15.'),
	(36, 36, 8600, 'Siófok', 'Fő tér 6.'),
	(37, 37, 9600, 'Sárvár', 'Batthyány utca 18.'),
	(38, 38, 9400, 'Sopron', 'Deák tér 20.'),
	(39, 39, 3300, 'Eger', 'Dobó tér 5.'),
	(40, 40, 7100, 'Szekszárd', 'Garay tér 12.'),
	(41, 41, 2500, 'Esztergom', 'Kossuth Lajos utca 30.'),
	(42, 42, 2800, 'Tatabánya', 'Szent Borbála út 25.'),
	(43, 43, 2900, 'Komárom', 'Igmalyi út 14.'),
	(44, 44, 2400, 'Dunaújváros', 'Vasmű út 19.'),
	(45, 45, 3900, 'Sárospatak', 'Rákóczi utca 8.'),
	(46, 46, 3980, 'Sátoraljaújhely', 'Kazinczy utca 22.'),
	(47, 47, 6800, 'Hódmezővásárhely', 'Andrássy út 31.'),
	(48, 48, 6900, 'Makó', 'Széchenyi tér 9.'),
	(49, 49, 6600, 'Szentes', 'Kossuth utca 17.'),
	(50, 50, 5600, 'Békéscsaba', 'Szent István tér 11.'),
	(51, 51, 5700, 'Gyula', 'Városház utca 4.'),
	(52, 52, 5630, 'Békés', 'Petőfi utca 26.'),
	(53, 53, 5540, 'Szarvas', 'Kossuth utca 33.'),
	(54, 54, 5100, 'Jászberény', 'Lehel vezér tér 3.'),
	(55, 55, 5300, 'Karcag', 'Kossuth tér 18.'),
	(56, 56, 5200, 'Törökszentmiklós', 'Alkotmány utca 7.'),
	(57, 57, 5350, 'Tiszafüred', 'Fő út 21.'),
	(58, 58, 4900, 'Fehérgyarmat', 'Kossuth utca 15.'),
	(59, 59, 4600, 'Kisvárda', 'Szent László utca 19.'),
	(60, 60, 4700, 'Mátészalka', 'Hősök tere 10.'),
	(61, 61, 3104, 'Salgótarján', 'Petőfi utca 13.'),
	(62, 62, 3043, 'Bátonyterenye', 'Rákóczi út 20.'),
	(63, 63, 2660, 'Balassagyarmat', 'Ady Endre út 16.'),
	(64, 64, 2643, 'Diósjenő', 'Fő utca 44.'),
	(65, 65, 2615, 'Rétság', 'Kossuth utca 9.'),
	(66, 66, 2170, 'Aszód', 'Pesti út 18.'),
	(67, 67, 2760, 'Nagykáta', 'Dózsa György út 33.'),
	(68, 68, 2750, 'Nagykőrös', 'Szabadság tér 6.'),
	(69, 69, 2700, 'Cegléd', 'Kőrösi út 12.'),
	(70, 70, 2711, 'Tápiószentmárton', 'Petőfi utca 28.'),
	(71, 71, 3200, 'Gyöngyös', 'Fő tér 14.'),
	(72, 72, 3000, 'Hatvan', 'Horváth Mihály út 9.'),
	(73, 73, 3021, 'Lőrinci', 'Rákóczi utca 25.'),
	(74, 74, 3360, 'Heves', 'Deák Ferenc út 7.'),
	(75, 75, 3250, 'Füzesabony', 'Kossuth utca 32.'),
	(76, 76, 3580, 'Tiszaújváros', 'Bethlen Gábor út 15.'),
	(77, 77, 3700, 'Kazincbarcika', 'Egressy út 23.'),
	(78, 78, 3530, 'Miskolc', 'Szentpáli utca 10.'),
	(79, 79, 3780, 'Edelény', 'Hunyadi utca 8.'),
	(80, 80, 3770, 'Sajószentpéter', 'Kossuth út 29.'),
	(81, 81, 7632, 'Pécs', 'Malomvölgyi út 22.'),
	(82, 82, 7700, 'Mohács', 'Széchenyi tér 11.'),
	(83, 83, 7800, 'Siklós', 'Felszabadulás utca 5.'),
	(84, 84, 7300, 'Komló', 'Kossuth Lajos utca 17.'),
	(85, 85, 7960, 'Szigetvár', 'József Attila utca 21.'),
	(86, 86, 7401, 'Kaposvár', 'Honvéd utca 36.'),
	(87, 87, 7561, 'Nagybajom', 'Petőfi utca 14.'),
	(88, 88, 7521, 'Kaposmérő', 'Fő utca 18.'),
	(89, 89, 7500, 'Nagyatád', 'Baross utca 25.'),
	(90, 90, 7800, 'Siklós', 'Köztársaság tér 3.'),
	(91, 91, 9022, 'Győr', 'Szent István út 40.'),
	(92, 92, 9200, 'Mosonmagyaróvár', 'Magyar utca 12.'),
	(93, 93, 9500, 'Celldömölk', 'Kossuth utca 8.'),
	(94, 94, 9730, 'Kőszeg', 'Várkör utca 16.'),
	(95, 95, 8330, 'Sümeg', 'Kossuth utca 20.'),
	(96, 96, 8420, 'Zirc', 'Rákóczi tér 5.'),
	(97, 97, 8230, 'Balatonfüred', 'Tagore sétány 9.'),
	(98, 98, 8220, 'Balatonalmádi', 'Baross Gábor út 18.'),
	(99, 99, 8638, 'Balatonlelle', 'Móló utca 4.'),
	(100, 100, 8640, 'Fonyód', 'Szent István utca 21.'),
	(101, 101, 8630, 'Balatonboglár', 'Petőfi Sándor utca 15.'),
	(102, 102, 8623, 'Balatonföldvár', 'Ady Endre utca 22.'),
	(103, 103, 8753, 'Balatonfenyves', 'Kossuth Lajos utca 18.'),
	(104, 104, 8360, 'Keszthely', 'Csók István utca 11.'),
	(105, 105, 8900, 'Zalaegerszeg', 'Göcseji út 24.'),
	(106, 106, 8800, 'Nagykanizsa', 'Sugár út 35.'),
	(107, 107, 8960, 'Lenti', 'Petőfi utca 16.'),
	(108, 108, 8790, 'Zalakaros', 'Termál utca 8.'),
	(109, 109, 9500, 'Celldömölk', 'Hunyadi János utca 27.'),
	(110, 110, 9970, 'Szentgotthárd', 'Kossuth Lajos utca 13.'),
	(111, 111, 9700, 'Szombathely', 'Rákóczi Ferenc utca 31.'),
	(112, 112, 9730, 'Kőszeg', 'Jurisics tér 6.'),
	(113, 113, 9600, 'Sárvár', 'Batthyány utca 22.'),
	(114, 114, 9545, 'Jánosháza', 'Béke utca 17.'),
	(115, 115, 9501, 'Celldömölk', 'Berzsenyi utca 9.'),
	(116, 116, 9400, 'Sopron', 'Várkerület 38.'),
	(117, 117, 9431, 'Fertőd', 'Fő utca 12.'),
	(118, 118, 9421, 'Fertőrákos', 'Miklóshalmi út 7.'),
	(119, 119, 9330, 'Kapuvár', 'Petőfi Sándor utca 29.'),
	(120, 120, 9300, 'Csorna', 'Szent István tér 4.'),
	(121, 121, 9025, 'Győr', 'Kálóczy tér 15.'),
	(122, 122, 9012, 'Győr', 'Ménfői út 44.'),
	(123, 123, 9200, 'Mosonmagyaróvár', 'Városkapu tér 10.'),
	(124, 124, 9241, 'Jánossomorja', 'Rákóczi utca 19.'),
	(125, 125, 8500, 'Pápa', 'Fő tér 8.'),
	(126, 126, 8400, 'Ajka', 'Szabadság tér 14.'),
	(127, 127, 8100, 'Várpalota', 'Szent István út 21.'),
	(128, 128, 8450, 'Devecser', 'Petőfi utca 33.'),
	(129, 129, 8300, 'Tapolca', 'Kossuth Lajos utca 26.'),
	(130, 130, 8200, 'Veszprém', 'Egyetem utca 18.'),
	(131, 131, 8420, 'Zirc', 'Bakony utca 11.'),
	(132, 132, 8440, 'Herend', 'Kossuth utca 20.'),
	(133, 133, 2800, 'Tatabánya', 'Béke utca 35.'),
	(134, 134, 2840, 'Oroszlány', 'Táncsics Mihály utca 17.'),
	(135, 135, 2851, 'Környe', 'Alkotmány utca 9.'),
	(136, 136, 2900, 'Komárom', 'Klapka György utca 14.'),
	(137, 137, 2536, 'Nyergesújfalu', 'Lombos utca 23.'),
	(138, 138, 2541, 'Lábatlan', 'Rákóczi Ferenc utca 6.'),
	(139, 139, 2500, 'Esztergom', 'Szent Tamás utca 30.'),
	(140, 140, 2510, 'Dorog', 'Bécsi út 18.'),
	(141, 141, 2400, 'Dunaújváros', 'Barátság út 12.'),
	(142, 142, 2451, 'Ercsi', 'Fő utca 28.'),
	(143, 143, 2481, 'Velence', 'Tópart utca 7.'),
	(144, 144, 2484, 'Gárdony', 'Szabadság utca 15.'),
	(145, 145, 8000, 'Székesfehérvár', 'Budai út 45.'),
	(146, 146, 8060, 'Mór', 'Szent István tér 19.'),
	(147, 147, 8083, 'Csákvár', 'Kossuth Lajos utca 24.'),
	(148, 148, 2072, 'Zsámbék', 'Petőfi Sándor utca 13.'),
	(149, 149, 2085, 'Pilisvörösvár', 'Fő út 39.'),
	(150, 150, 2092, 'Budakeszi', 'Dózsa György tér 5.');

-- Struktúra mentése eljárás munkaido. adminisztrator_csere
DROP PROCEDURE IF EXISTS `adminisztrator_csere`;
DELIMITER //
CREATE PROCEDURE `adminisztrator_csere`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_jelenlegi_ertek` ENUM('I','N')
)
BEGIN
  IF p_jelenlegi_ertek = "I" THEN
    UPDATE alkalmazott SET adminisztrator = 'N' WHERE alkalmazott_azonosito = p_alkalmazott_azonosito;
  ELSE
    UPDATE alkalmazott SET adminisztrator = 'I' WHERE alkalmazott_azonosito = p_alkalmazott_azonosito;
  END IF;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazott_adatainak_modositasa
DROP PROCEDURE IF EXISTS `alkalmazott_adatainak_modositasa`;
DELIMITER //
CREATE PROCEDURE `alkalmazott_adatainak_modositasa`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_modositott_nev` VARCHAR(100),
	IN `p_modositott_szuletesi_hely` VARCHAR(50),
	IN `p_modositott_szuletesi_ido` DATE,
	IN `p_modositott_anyja_neve` VARCHAR(100),
	IN `p_modositott_beosztas` VARCHAR(50),
	IN `p_modositott_email` VARCHAR(100),
	IN `p_modositott_adoazonositojel` VARCHAR(10),
	IN `p_modositott_vezeto` ENUM('I','N'),
	IN `p_modositott_homeoffice` ENUM('I','N'),
	IN `p_modositott_engedelyezo` INT
)
BEGIN
  UPDATE alkalmazott SET 
  szuletesi_nev = p_modositott_nev,
  szuletesi_hely = p_modositott_szuletesi_hely,
  szuletesi_ido = p_modositott_szuletesi_ido,
  anyja_szuletesi_neve = p_modositott_anyja_neve,
  beosztas = p_modositott_beosztas,
  email = p_modositott_email,
  adoazonosito_jel = p_modositott_adoazonositojel,
  vezeto = p_modositott_vezeto,
  homeoffice_lehetoseg = p_modositott_homeoffice,
  engedelyezo = p_modositott_engedelyezo
  WHERE alkalmazott_azonosito = p_alkalmazott_azonosito;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazott_jelszo_modositasa
DROP PROCEDURE IF EXISTS `alkalmazott_jelszo_modositasa`;
DELIMITER //
CREATE PROCEDURE `alkalmazott_jelszo_modositasa`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_regi_jelszo` VARCHAR(200),
	IN `p_uj_jelszo` VARCHAR(200)
)
BEGIN
  UPDATE alkalmazott
  SET jelszo = SHA2(p_uj_jelszo,256)
  WHERE alkalmazott_azonosito = p_alkalmazott_azonosito AND jelszo = SHA2(p_regi_jelszo,256);
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazott_jelszo_reset
DROP PROCEDURE IF EXISTS `alkalmazott_jelszo_reset`;
DELIMITER //
CREATE PROCEDURE `alkalmazott_jelszo_reset`(
	IN `p_alkalmazott_azonosito` INT
)
BEGIN
  DECLARE adoazonosito VARCHAR(10);

  SELECT adoazonosito_jel INTO adoazonosito
  FROM alkalmazott
  WHERE alkalmazott_azonosito = p_alkalmazott_azonosito;

  UPDATE alkalmazott
  SET jelszo = SHA2(adoazonosito,256)
  WHERE alkalmazott_azonosito = p_alkalmazott_azonosito;  
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazott_lakcimenek_modositasa
DROP PROCEDURE IF EXISTS `alkalmazott_lakcimenek_modositasa`;
DELIMITER //
CREATE PROCEDURE `alkalmazott_lakcimenek_modositasa`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_modositott_telepules_neve` VARCHAR(50),
	IN `p_modositott_cim` VARCHAR(100),
	IN `p_modositott_iranyitoszam` INT
)
BEGIN
  UPDATE lakcim SET 
  telepules_neve = p_modositott_telepules_neve,
  cim = p_modositott_cim,
  iranyitoszam = p_modositott_iranyitoszam
  WHERE alkalmazott_azonosito = p_alkalmazott_azonosito;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazott_munkaidejenek_felvitele
DROP PROCEDURE IF EXISTS `alkalmazott_munkaidejenek_felvitele`;
DELIMITER //
CREATE PROCEDURE `alkalmazott_munkaidejenek_felvitele`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_munkaido_kezdete` TIME,
	IN `p_munkaido_vege` TIME,
	IN `p_ebedido_kezdete` TIME,
	IN `p_ebedido_vege` TIME
)
BEGIN
  INSERT INTO alkalmazotti_munkarend (alkalmazott_azonosito,munkaido_kezdete,munkaido_vege,ebedido_kezdete,ebedido_vege) VALUES
  (p_alkalmazott_azonosito,p_munkaido_kezdete,p_munkaido_vege,p_ebedido_kezdete,p_ebedido_vege);
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazott_munkaidejenek_modositasa
DROP PROCEDURE IF EXISTS `alkalmazott_munkaidejenek_modositasa`;
DELIMITER //
CREATE PROCEDURE `alkalmazott_munkaidejenek_modositasa`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_modositott_munkaido_kezdete` TIME,
	IN `p_modositott_munkaido_vege` TIME,
	IN `p_modositott_ebedido_kezdete` TIME,
	IN `p_modositott_ebedido_vege` TIME
)
BEGIN
  UPDATE alkalmazotti_munkarend SET 
  munkaido_kezdete = p_modositott_munkaido_kezdete,
  munkaido_vege = p_modositott_munkaido_vege,
  ebedido_kezdete = p_modositott_ebedido_kezdete,
  ebedido_vege = p_modositott_ebedido_vege
  WHERE alkalmazott_azonosito = p_alkalmazott_azonosito;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazott_munkaviszonyanak_modositasa
DROP PROCEDURE IF EXISTS `alkalmazott_munkaviszonyanak_modositasa`;
DELIMITER //
CREATE PROCEDURE `alkalmazott_munkaviszonyanak_modositasa`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_modositott_munkaviszony_kezdete` DATE,
	IN `p_modositott_munkaviszony_vege` DATE
)
BEGIN
  UPDATE alkalmazott SET 
  belepes_datuma = p_modositott_munkaviszony_kezdete,
  kilepes_datuma = p_modositott_munkaviszony_vege
  WHERE alkalmazott_azonosito = p_alkalmazott_azonosito;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazott_szabadsaganak_felvitele
DROP PROCEDURE IF EXISTS `alkalmazott_szabadsaganak_felvitele`;
DELIMITER //
CREATE PROCEDURE `alkalmazott_szabadsaganak_felvitele`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_ev` INT,
	IN `p_szabadnapok_szama` INT
)
BEGIN
  INSERT INTO alkalmazott_eves_szabadsaga (
  		alkalmazott_azonosito,
		ev,
		szabadnapok_szama)
  VALUES (
  		p_alkalmazott_azonosito, 
		p_ev,
		p_szabadnapok_szama);
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazott_szabadsaganak_modositasa
DROP PROCEDURE IF EXISTS `alkalmazott_szabadsaganak_modositasa`;
DELIMITER //
CREATE PROCEDURE `alkalmazott_szabadsaganak_modositasa`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_ev` INT,
	IN `p_szabadnapok_szama` INT
)
BEGIN
  UPDATE alkalmazott_eves_szabadsaga SET
  szabadnapok_szama = p_szabadnapok_szama
  WHERE alkalmazott_azonosito = p_alkalmazott_azonosito AND ev = p_ev;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazotti_munkaido_felvitele
DROP PROCEDURE IF EXISTS `alkalmazotti_munkaido_felvitele`;
DELIMITER //
CREATE PROCEDURE `alkalmazotti_munkaido_felvitele`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_eves_munkaido_naptar_azonosito` INT,
	IN `p_munkaido_kezdete` TIME,
	IN `p_munkaido_vege` TIME,
	IN `p_statusz` ENUM('ledolgozott nap','szabadság','betegszabadság','home office')
)
BEGIN
  IF p_statusz = "ledolgozott nap" THEN
    INSERT INTO alkalmazotti_munkaido_nyilvantartas (alkalmazott_azonosito,eves_munkaido_naptar_azonosito,munkaido_kezdete,munkaido_vege,statusz) VALUES
    (p_alkalmazott_azonosito,p_eves_munkaido_naptar_azonosito,p_munkaido_kezdete,p_munkaido_vege,p_statusz);
  ELSE
    INSERT INTO alkalmazotti_munkaido_nyilvantartas (alkalmazott_azonosito,eves_munkaido_naptar_azonosito,munkaido_kezdete,munkaido_vege,statusz) VALUES
    (p_alkalmazott_azonosito,p_eves_munkaido_naptar_azonosito,null,null,p_statusz);
  END IF;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazotti_munkaido_jovahagyas
DROP PROCEDURE IF EXISTS `alkalmazotti_munkaido_jovahagyas`;
DELIMITER //
CREATE PROCEDURE `alkalmazotti_munkaido_jovahagyas`(
	IN `p_alk_munk_nyilv_az` INT,
	IN `p_dontes` VARCHAR(1)
)
BEGIN
  UPDATE alkalmazotti_munkaido_nyilvantartas
  SET jovahagyva = p_dontes
  WHERE alkalmazotti_munkaido_nyilvantartas_azonosito = p_alk_munk_nyilv_az;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. alkalmazotti_munkaido_modositasa
DROP PROCEDURE IF EXISTS `alkalmazotti_munkaido_modositasa`;
DELIMITER //
CREATE PROCEDURE `alkalmazotti_munkaido_modositasa`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_eves_munkaido_naptar_azonosito` INT,
	IN `p_munkaido_kezdete` TIME,
	IN `p_munkaido_vege` TIME,
	IN `p_statusz` ENUM('ledolgozott nap','szabadság','betegszabadság','home office'),
	IN `p_nyilvantartas_azonosito` INT
)
BEGIN
  IF p_statusz = "ledolgozott nap" THEN
    UPDATE alkalmazotti_munkaido_nyilvantartas SET 
    alkalmazott_azonosito = p_alkalmazott_azonosito,
    eves_munkaido_naptar_azonosito = p_eves_munkaido_naptar_azonosito,
    munkaido_kezdete = p_munkaido_kezdete,
    munkaido_vege = p_munkaido_vege,
    statusz = p_statusz
    WHERE alkalmazotti_munkaido_nyilvantartas_azonosito = p_nyilvantartas_azonosito;
  ELSE 
    UPDATE alkalmazotti_munkaido_nyilvantartas SET 
    alkalmazott_azonosito = p_alkalmazott_azonosito,
    eves_munkaido_naptar_azonosito = p_eves_munkaido_naptar_azonosito,
    munkaido_kezdete = null,
    munkaido_vege = null,
    statusz = p_statusz
    WHERE alkalmazotti_munkaido_nyilvantartas_azonosito = p_nyilvantartas_azonosito;
  END IF;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. havi_jelenleti
DROP PROCEDURE IF EXISTS `havi_jelenleti`;
DELIMITER //
CREATE PROCEDURE `havi_jelenleti`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_datum` DATE
)
BEGIN
  DECLARE elso_nap DATE;
  DECLARE utolso_nap DATE;
  
  DECLARE done INT DEFAULT FALSE;
  DECLARE sor_azonosito INT;
  
  DECLARE c_alk_munk_nyilv_az INT;
  DECLARE c_datum_az INT;
  DECLARE c_datum DATE;
  DECLARE c_nap_tipusa VARCHAR(10);
  DECLARE c_naptar_az INT;
  DECLARE c_munk_kezd TIME;
  DECLARE c_munk_veg TIME;
  DECLARE c_jovahagyva VARCHAR(1);
  DECLARE c_statusz VARCHAR(20);
  
  DECLARE kurzor CURSOR FOR 
    SELECT * FROM eves_munkaido_naptar WHERE datum BETWEEN elso_nap AND utolso_nap ORDER BY datum;
    
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
  SET elso_nap = DATE(CONCAT(YEAR(p_datum),"-",MONTH(p_datum),"-01"));
  SET utolso_nap = DATE(CONCAT(YEAR(p_datum),"-",MONTH(p_datum),"-",DAY(LAST_DAY(p_datum))));

  DROP TEMPORARY TABLE IF EXISTS eredmenyek;
  
  CREATE TEMPORARY TABLE IF NOT EXISTS eredmenyek (
    eves_munkaido_naptar_azonosito INT(11),
    datum DATE,
    nap_tipusa ENUM('Munkanap','Ünnepnap','Pihenőnap'),
	 munkaido_kezdete TIME,
    munkaido_vege TIME,
    jovahagyva VARCHAR(1),
    statusz VARCHAR(20),
    alkalmazotti_munkaido_nyilvantartas_azonosito INT
  );
  
  TRUNCATE TABLE eredmenyek;
  
  OPEN kurzor;
  
  read_loop: LOOP
    FETCH kurzor INTO c_datum_az, c_datum, c_nap_tipusa;
    
    IF done THEN
      LEAVE read_loop;
    END IF;
    
    SET c_naptar_az = NULL;
	 SET c_munk_kezd = NULL;
	 SET c_munk_veg = NULL;
	 SET c_jovahagyva = NULL;
	 SET c_statusz = NULL;
    
    
    IF EXISTS (SELECT eves_munkaido_naptar_azonosito, munkaido_kezdete, munkaido_vege, jovahagyva, statusz, alkalmazotti_munkaido_nyilvantartas_azonosito FROM alkalmazotti_munkaido_nyilvantartas WHERE eves_munkaido_naptar_azonosito = c_datum_az AND alkalmazott_azonosito = p_alkalmazott_azonosito) THEN
      SELECT eves_munkaido_naptar_azonosito, munkaido_kezdete, munkaido_vege, jovahagyva, statusz,alkalmazotti_munkaido_nyilvantartas_azonosito INTO c_naptar_az, c_munk_kezd, c_munk_veg, c_jovahagyva, c_statusz, c_alk_munk_nyilv_az FROM alkalmazotti_munkaido_nyilvantartas WHERE eves_munkaido_naptar_azonosito = c_datum_az AND alkalmazott_azonosito = p_alkalmazott_azonosito;
		INSERT INTO eredmenyek (eves_munkaido_naptar_azonosito,datum,nap_tipusa,munkaido_kezdete,munkaido_vege,jovahagyva,statusz,alkalmazotti_munkaido_nyilvantartas_azonosito) VALUES (c_datum_az, c_datum, c_nap_tipusa,c_munk_kezd,c_munk_veg,c_jovahagyva,c_statusz,c_alk_munk_nyilv_az);
	 ELSE
	   INSERT INTO eredmenyek (eves_munkaido_naptar_azonosito,datum,nap_tipusa,munkaido_kezdete,munkaido_vege,jovahagyva,statusz,alkalmazotti_munkaido_nyilvantartas_azonosito) VALUES (c_datum_az, c_datum, c_nap_tipusa,null,null,null,null,null);
    END IF;
  END LOOP;
  
  
  CLOSE kurzor;
  
  SELECT * FROM eredmenyek;
    
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. igenyles_kezelese
DROP PROCEDURE IF EXISTS `igenyles_kezelese`;
DELIMITER //
CREATE PROCEDURE `igenyles_kezelese`(
	IN `p_igenyles_azonosito` INT,
	IN `p_dontes` VARCHAR(1)
)
BEGIN
  DECLARE c_alk_az INT;
  DECLARE c_eves_munk_naptar_az INT;
  DECLARE c_tipus VARCHAR(20);

  IF p_dontes = "E" THEN
    UPDATE igenyles SET jovahagyva = p_dontes WHERE igenyles_azonosito = p_igenyles_azonosito;
  ELSEIF p_dontes = "I" THEN
    UPDATE igenyles SET jovahagyva = p_dontes WHERE igenyles_azonosito = p_igenyles_azonosito;
    SELECT alkalmazott_azonosito,eves_munkaido_naptar_azonosito,tipus INTO c_alk_az,c_eves_munk_naptar_az,c_tipus FROM igenyles WHERE igenyles_azonosito = p_igenyles_azonosito;
    INSERT INTO alkalmazotti_munkaido_nyilvantartas (alkalmazott_azonosito,eves_munkaido_naptar_azonosito,jovahagyva,statusz) VALUES (c_alk_az,c_eves_munk_naptar_az,p_dontes,c_tipus);
  END IF;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. jovahagyando_igenylesek_listaja
DROP PROCEDURE IF EXISTS `jovahagyando_igenylesek_listaja`;
DELIMITER //
CREATE PROCEDURE `jovahagyando_igenylesek_listaja`(
	IN `p_alkalmazott_azonosito` INT
)
BEGIN

  DECLARE c_alkalmazott_az INT;
  DECLARE c_szuletesi_nev VARCHAR(100);
  DECLARE c_homeoffice_eng VARCHAR(1);
  DECLARE c_engedelyezo INT;

  DECLARE done INT DEFAULT FALSE;
  
  DECLARE kurzor CURSOR FOR
    SELECT alkalmazott_azonosito,szuletesi_nev,homeoffice_lehetoseg,engedelyezo FROM alkalmazott WHERE engedelyezo = p_alkalmazott_azonosito;
    
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  DROP TEMPORARY TABLE IF EXISTS eredmenyek;
  
  CREATE TEMPORARY TABLE IF NOT EXISTS eredmenyek (
    igenyles_azonosito INT,
    alkalmazott_azonosito INT,
	 szuletesi_nev VARCHAR(100),
	 eves_munkaido_naptar_azonosito INT,
	 datum DATE,
	 tipus VARCHAR(20),
	 jovahagyva ENUM('I','N','E')
  );
  
  TRUNCATE TABLE eredmenyek;
  
  OPEN kurzor;
  
  read_loop: LOOP
    FETCH kurzor INTO c_alkalmazott_az, c_szuletesi_nev, c_homeoffice_eng, c_engedelyezo;
      
    IF done THEN
      LEAVE read_loop;
    END IF;

    BEGIN    
      DECLARE t_alkalmazott_az INT; /*csak adminisztrativ okbol van ra szukseg!*/
      DECLARE c_igenyles_az INT;
      DECLARE c_eves_munkaido_naptar_az INT;
      DECLARE c_tipus VARCHAR(20);
      DECLARE c_jovahagyva VARCHAR(1);
      DECLARE c_datum DATE;
      DECLARE done2 INT DEFAULT FALSE;

      DECLARE kurzor2 CURSOR FOR
        SELECT * FROM igenyles WHERE alkalmazott_azonosito = c_alkalmazott_az AND jovahagyva = 'N';
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2 = TRUE;

      OPEN kurzor2;
      read_loop2: LOOP

        FETCH kurzor2 INTO c_igenyles_az, t_alkalmazott_az, c_eves_munkaido_naptar_az, c_tipus, c_jovahagyva;

        IF done2 THEN
          LEAVE read_loop2;
        END IF;

        SELECT datum INTO c_datum FROM eves_munkaido_naptar WHERE eves_munkaido_naptar_azonosito = c_eves_munkaido_naptar_az;  
        IF ((c_tipus = 'home office') AND (c_homeoffice_eng = 'N')) THEN
          UPDATE igenyles SET jovahagyva = 'E' WHERE igenyles_azonosito = c_igenyles_az;
        ELSE  
    	    INSERT INTO eredmenyek (igenyles_azonosito,alkalmazott_azonosito,szuletesi_nev,eves_munkaido_naptar_azonosito,datum,tipus,jovahagyva) 
		      VALUES (c_igenyles_az,c_alkalmazott_az,c_szuletesi_nev,c_eves_munkaido_naptar_az,c_datum,c_tipus,c_jovahagyva);
        END IF;		      

      END LOOP;
      CLOSE kurzor2;
    END;

  END LOOP;
  
  CLOSE kurzor;
  
  SELECT * FROM eredmenyek;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. jovahagyando_munkaido_listaja
DROP PROCEDURE IF EXISTS `jovahagyando_munkaido_listaja`;
DELIMITER //
CREATE PROCEDURE `jovahagyando_munkaido_listaja`(
	IN `p_alkalmazott_azonosito` INT
)
BEGIN

  DECLARE c_alkalmazott_az INT;
  DECLARE c_szuletesi_nev VARCHAR(100);
  DECLARE c_engedelyezo INT;

  DECLARE done INT DEFAULT FALSE;
  
  DECLARE kurzor CURSOR FOR
    SELECT alkalmazott_azonosito,szuletesi_nev,engedelyezo FROM alkalmazott WHERE engedelyezo = p_alkalmazott_azonosito;
    
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  DROP TEMPORARY TABLE IF EXISTS eredmenyek;
  
  CREATE TEMPORARY TABLE IF NOT EXISTS eredmenyek (
    alkalmazott_azonosito INT,
    szuletesi_nev VARCHAR(100),
    alkalmazotti_munkaido_nyilvantartas_azonosito INT,
    eves_munkaido_naptar_azonosito INT,
    datum DATE,
    munkaido_kezdete TIME,
    munkaido_vege TIME,
    jovahagyva VARCHAR(1),
    statusz VARCHAR(20)
  );
  
  TRUNCATE TABLE eredmenyek;
  
  OPEN kurzor;
  
  read_loop: LOOP
    FETCH kurzor INTO c_alkalmazott_az, c_szuletesi_nev, c_engedelyezo;
      
    IF done THEN
      LEAVE read_loop;
    END IF;

    BEGIN    
      DECLARE c_alk_munkaido_nyilvantartas_az INT;
      DECLARE t_alkalmazott_az INT; /*csak adminisztrativ okbol van ra szukseg!*/
      DECLARE c_eves_munkaido_naptar_az INT;
      DECLARE c_munk_kezd TIME;
      DECLARE c_munk_vege TIME;
      DECLARE c_jovahagyva VARCHAR(1);
      DECLARE c_datum DATE;
      DECLARE c_statusz VARCHAR(20);
      DECLARE done2 INT DEFAULT FALSE;

      DECLARE kurzor2 CURSOR FOR
        SELECT * FROM alkalmazotti_munkaido_nyilvantartas WHERE alkalmazott_azonosito = c_alkalmazott_az AND jovahagyva = 'N';
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2 = TRUE;

      OPEN kurzor2;
      read_loop2: LOOP

        FETCH kurzor2 INTO c_alk_munkaido_nyilvantartas_az, t_alkalmazott_az, c_eves_munkaido_naptar_az, c_munk_kezd, c_munk_vege, c_jovahagyva, c_statusz;

        IF done2 THEN
          LEAVE read_loop2;
        END IF;

        SELECT datum INTO c_datum FROM eves_munkaido_naptar WHERE eves_munkaido_naptar_azonosito = c_eves_munkaido_naptar_az;  
        INSERT INTO eredmenyek (alkalmazott_azonosito,szuletesi_nev,alkalmazotti_munkaido_nyilvantartas_azonosito,eves_munkaido_naptar_azonosito,datum,munkaido_kezdete,munkaido_vege,jovahagyva,statusz) 
	       VALUES (c_alkalmazott_az,c_szuletesi_nev,c_alk_munkaido_nyilvantartas_az,c_eves_munkaido_naptar_az,c_datum,c_munk_kezd,c_munk_vege,c_jovahagyva,c_statusz);
    
      END LOOP;
      CLOSE kurzor2;
    END;

  END LOOP;
  
  CLOSE kurzor;
  
  SELECT * FROM eredmenyek ORDER BY datum;

END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. osszes_jovahagyando_igenyles
DROP PROCEDURE IF EXISTS `osszes_jovahagyando_igenyles`;
DELIMITER //
CREATE PROCEDURE `osszes_jovahagyando_igenyles`()
BEGIN
  DECLARE c_alkalmazott_az INT;
  DECLARE c_szuletesi_nev VARCHAR(100);
  DECLARE c_homeoffice_eng VARCHAR(1);  
  
  DECLARE done INT DEFAULT FALSE;
  DECLARE kurzor CURSOR FOR
    SELECT alkalmazott_azonosito,szuletesi_nev,homeoffice_lehetoseg FROM alkalmazott;
    
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  DROP TEMPORARY TABLE IF EXISTS eredmenyek;
  
  CREATE TEMPORARY TABLE IF NOT EXISTS eredmenyek (
    igenyles_azonosito INT,
    alkalmazott_azonosito INT,
	 szuletesi_nev VARCHAR(100),
	 eves_munkaido_naptar_azonosito INT,
	 datum DATE,
	 tipus VARCHAR(20),
	 jovahagyva ENUM('I','N','E')
  );
  
  TRUNCATE TABLE eredmenyek;
  
  OPEN kurzor;
  
  read_loop: LOOP
    FETCH kurzor INTO c_alkalmazott_az, c_szuletesi_nev, c_homeoffice_eng;
      
    IF done THEN
      LEAVE read_loop;
    END IF;

    BEGIN    
      DECLARE t_alkalmazott_az INT; /*csak adminisztrativ okbol van ra szukseg!*/
      DECLARE c_igenyles_az INT;
      DECLARE c_eves_munkaido_naptar_az INT;
      DECLARE c_tipus VARCHAR(20);
      DECLARE c_jovahagyva VARCHAR(1);
      DECLARE c_datum DATE;
      DECLARE done2 INT DEFAULT FALSE;

      DECLARE kurzor2 CURSOR FOR
        SELECT * FROM igenyles WHERE alkalmazott_azonosito = c_alkalmazott_az AND jovahagyva = 'N';
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2 = TRUE;

      OPEN kurzor2;
      read_loop2: LOOP

        FETCH kurzor2 INTO c_igenyles_az, t_alkalmazott_az, c_eves_munkaido_naptar_az, c_tipus, c_jovahagyva;

        IF done2 THEN
          LEAVE read_loop2;
        END IF;

        SELECT datum INTO c_datum FROM eves_munkaido_naptar WHERE eves_munkaido_naptar_azonosito = c_eves_munkaido_naptar_az;  
        IF ((c_tipus = 'home office') AND (c_homeoffice_eng = 'N')) THEN
          UPDATE igenyles SET jovahagyva = 'E' WHERE igenyles_azonosito = c_igenyles_az;
        ELSE  
    	    INSERT INTO eredmenyek (igenyles_azonosito,alkalmazott_azonosito,szuletesi_nev,eves_munkaido_naptar_azonosito,datum,tipus,jovahagyva) 
		      VALUES (c_igenyles_az,c_alkalmazott_az,c_szuletesi_nev,c_eves_munkaido_naptar_az,c_datum,c_tipus,c_jovahagyva);
        END IF;		      

      END LOOP;
      CLOSE kurzor2;
    END;

  END LOOP;
  
  CLOSE kurzor;
  
  SELECT * FROM eredmenyek;

END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. osszes_jovahagyando_munkaido
DROP PROCEDURE IF EXISTS `osszes_jovahagyando_munkaido`;
DELIMITER //
CREATE PROCEDURE `osszes_jovahagyando_munkaido`()
BEGIN
  DECLARE c_alkalmazott_az INT;
  DECLARE c_szuletesi_nev VARCHAR(100);

  DECLARE done INT DEFAULT FALSE;
  
  DECLARE kurzor CURSOR FOR SELECT alkalmazott_azonosito,szuletesi_nev FROM alkalmazott;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
  DROP TEMPORARY TABLE IF EXISTS eredmenyek;
  
  CREATE TEMPORARY TABLE IF NOT EXISTS eredmenyek (
    alkalmazott_azonosito INT,
    szuletesi_nev VARCHAR(100),
    alkalmazotti_munkaido_nyilvantartas_azonosito INT,
    eves_munkaido_naptar_azonosito INT,
    datum DATE,
    munkaido_kezdete TIME,
    munkaido_vege TIME,
    jovahagyva VARCHAR(1),
    statusz VARCHAR(20)
  );

  TRUNCATE TABLE eredmenyek;
  
  OPEN kurzor;
  read_loop: LOOP
    FETCH kurzor INTO c_alkalmazott_az, c_szuletesi_nev;
      
    IF done THEN
      LEAVE read_loop;
    END IF;
    BEGIN    
      DECLARE c_alk_munkaido_nyilvantartas_az INT;
      DECLARE t_alkalmazott_az INT; /*csak adminisztrativ okbol van ra szukseg!*/
      DECLARE c_eves_munkaido_naptar_az INT;
      DECLARE c_munk_kezd TIME;
      DECLARE c_munk_vege TIME;
      DECLARE c_jovahagyva VARCHAR(1);
      DECLARE c_datum DATE;
      DECLARE c_statusz VARCHAR(20);
      DECLARE done2 INT DEFAULT FALSE;

      DECLARE kurzor2 CURSOR FOR
        SELECT * FROM alkalmazotti_munkaido_nyilvantartas WHERE alkalmazott_azonosito = c_alkalmazott_az AND jovahagyva = 'N';
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2 = TRUE;

      OPEN kurzor2;
      read_loop2: LOOP

        FETCH kurzor2 INTO c_alk_munkaido_nyilvantartas_az, t_alkalmazott_az, c_eves_munkaido_naptar_az, c_munk_kezd, c_munk_vege, c_jovahagyva, c_statusz;

        IF done2 THEN
          LEAVE read_loop2;
        END IF;

        SELECT datum INTO c_datum FROM eves_munkaido_naptar WHERE eves_munkaido_naptar_azonosito = c_eves_munkaido_naptar_az;  
        INSERT INTO eredmenyek (alkalmazott_azonosito,szuletesi_nev,alkalmazotti_munkaido_nyilvantartas_azonosito,eves_munkaido_naptar_azonosito,datum,munkaido_kezdete,munkaido_vege,jovahagyva,statusz) 
	       VALUES (c_alkalmazott_az,c_szuletesi_nev,c_alk_munkaido_nyilvantartas_az,c_eves_munkaido_naptar_az,c_datum,c_munk_kezd,c_munk_vege,c_jovahagyva,c_statusz);
    
      END LOOP;
      CLOSE kurzor2;
    END;

  END LOOP;
  
  CLOSE kurzor;
  
  SELECT * FROM eredmenyek ORDER BY datum;
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. uj_igenyles_felvitele
DROP PROCEDURE IF EXISTS `uj_igenyles_felvitele`;
DELIMITER //
CREATE PROCEDURE `uj_igenyles_felvitele`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_datum` DATE,
	IN `p_tipus` ENUM('szabadság','home office')
)
BEGIN
  DECLARE datum_az INT;
  
  SELECT eves_munkaido_naptar_azonosito INTO datum_az FROM eves_munkaido_naptar WHERE datum = p_datum;
  
  INSERT INTO igenyles (alkalmazott_azonosito, eves_munkaido_naptar_azonosito, tipus, jovahagyva) VALUES (p_alkalmazott_azonosito,datum_az, p_tipus, 'N');
END//
DELIMITER ;

-- Struktúra mentése eljárás munkaido. uj_lakcim_felvitele
DROP PROCEDURE IF EXISTS `uj_lakcim_felvitele`;
DELIMITER //
CREATE PROCEDURE `uj_lakcim_felvitele`(
	IN `p_alkalmazott_azonosito` INT,
	IN `p_telepules_neve` VARCHAR(50),
	IN `p_cim` VARCHAR(100),
	IN `p_iranyitoszam` INT
)
BEGIN
  INSERT INTO lakcim (
  		alkalmazott_azonosito,
		telepules_neve,
		cim,
		iranyitoszam)
  VALUES (
  		p_alkalmazott_azonosito, 
		p_telepules_neve,
		p_cim,
		p_iranyitoszam);
END//
DELIMITER ;

-- Struktúra mentése függvény munkaido. felhasznalt_szabadsag_homeoffice
DROP FUNCTION IF EXISTS `felhasznalt_szabadsag_homeoffice`;
DELIMITER //
CREATE FUNCTION `felhasznalt_szabadsag_homeoffice`(`p_alkalmazott_azonosito` INT,
	`p_ev` INT,
	`p_statusz` VARCHAR(100)
) RETURNS int(11)
BEGIN
	DECLARE elso_nap DATE;
	DECLARE utolso_nap DATE;
	DECLARE eredmeny VARCHAR(20);
    
	SET elso_nap = DATE(CONCAT(p_ev,"-01-01"));
	SET utolso_nap = DATE(CONCAT(p_ev,"-12-31"));
	
	SELECT COUNT(*) into eredmeny from alkalmazotti_munkaido_nyilvantartas left join eves_munkaido_naptar 
	ON alkalmazotti_munkaido_nyilvantartas.eves_munkaido_naptar_azonosito = eves_munkaido_naptar.eves_munkaido_naptar_azonosito
	WHERE datum BETWEEN elso_nap AND utolso_nap 
	AND alkalmazott_azonosito = p_alkalmazott_azonosito AND statusz = p_statusz;

  	RETURN eredmeny;
END//
DELIMITER ;

-- Struktúra mentése függvény munkaido. uj_alkalmazott_felvitele
DROP FUNCTION IF EXISTS `uj_alkalmazott_felvitele`;
DELIMITER //
CREATE FUNCTION `uj_alkalmazott_felvitele`(`p_szuletesi_nev` VARCHAR(100),
	`p_szuletesi_hely` VARCHAR(100),
	`p_szuletesi_ido` DATE,
	`p_anyja_neve` VARCHAR(100),
	`p_beosztas` VARCHAR(50),
	`p_email` VARCHAR(100),
	`p_adoazonositojel` VARCHAR(10),
	`p_vezeto` ENUM('I','N'),
	`p_homeoffice` ENUM('I','N'),
	`p_engedelyezo` INT,
	`p_belepes_datuma` DATE,
	`p_kilepes_datuma` DATE,
	`p_adminisztrator` ENUM('I','N')
) RETURNS int(11)
BEGIN
  INSERT INTO alkalmazott (
  		szuletesi_nev,
		email,
		adoazonosito_jel,
		homeoffice_lehetoseg,
		beosztas,
		engedelyezo,
		vezeto,
		anyja_szuletesi_neve,
		belepes_datuma,
		kilepes_datuma,
		szuletesi_hely,
		szuletesi_ido,
		jelszo,
		adminisztrator)
  VALUES (
  		p_szuletesi_nev, 
  		p_email,
  		p_adoazonositojel,
  		p_homeoffice,
  		p_beosztas,
  		p_engedelyezo,
  		p_vezeto,
  		p_anyja_neve,
  		p_belepes_datuma,
  		p_kilepes_datuma,
  		p_szuletesi_hely, 
		p_szuletesi_ido,
		SHA2(p_adoazonositojel,256),
		p_adminisztrator);
	RETURN LAST_INSERT_ID();
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
