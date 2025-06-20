-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2025 at 05:01 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_nutri`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatbot_nutrisi`
--

CREATE TABLE `chatbot_nutrisi` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chatbot_nutrisi`
--

INSERT INTO `chatbot_nutrisi` (`id`, `user_id`, `question`, `answer`, `date`) VALUES
(24, 1, 'saya mau diet', 'Diet adalah pengaturan pola makan untuk tujuan kesehatan atau penurunan berat badan. Diet sehat mencakup makanan bergizi seimbang, menghindari makanan olahan, dan memperhatikan asupan kalori sesuai kebutuhan tubuh.', '2025-06-13'),
(27, 1, 'olahraga', 'Olahraga rutin seperti jalan kaki, lari, yoga, dan angkat beban meningkatkan kesehatan jantung, metabolisme, dan kebugaran secara keseluruhan.', '2025-06-13'),
(29, 1, 'fungsi vitamin a', 'Vitamin A penting untuk kesehatan mata, kekebalan tubuh, dan pertumbuhan sel.', '2025-06-13'),
(30, 1, 'zat besi', 'Maaf, saya belum mengerti pertanyaan Anda. Konsultasi lanjut hubungi 085707580077', '2025-06-13'),
(31, 1, 'gizi seimbang', 'Gizi seimbang adalah asupan karbohidrat, protein, lemak sehat, vitamin, dan mineral sesuai kebutuhan tubuh.', '2025-06-13'),
(32, 1, 'makanan tinggi protein', 'Telur, ayam, daging tanpa lemak, ikan, tahu, tempe, dan susu adalah sumber protein tinggi.', '2025-06-13'),
(44, 1, 'aku ingin diet', 'Diet adalah pengaturan pola makan untuk tujuan kesehatan atau penurunan berat badan. Diet sehat mencakup makanan bergizi seimbang, menghindari makanan olahan, dan memperhatikan asupan kalori sesuai kebutuhan tubuh.', '2025-06-14'),
(45, 1, 'olahraga yang cocok', 'Olahraga rutin seperti jalan kaki, lari, yoga, dan angkat beban meningkatkan kesehatan jantung, metabolisme, dan kebugaran secara keseluruhan.', '2025-06-14'),
(51, 8, 'operasi amandel', 'Maaf, saya belum mengerti pertanyaan Anda. Konsultasi lanjut hubungi 085707580077', '2025-06-19');

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` int NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`id`, `keyword`, `answer`) VALUES
(1, 'diet sehat', 'Diet sehat yaitu denganpola makan yang seimbang, mengandung nutrisi lengkap seperti karbohidrat kompleks, protein, lemak sehat, vitamin, dan mineral. Tujuannya untuk menjaga kesehatan, bukan sekadar menurunkan berat badan.'),
(2, 'pola makan sehat', 'Pola makan sehat meliputi makan teratur 3 kali sehari, menghindari makanan cepat saji, serta memperbanyak buah dan sayur.'),
(3, 'olahraga ringan', 'Olahraga ringan seperti jalan kaki, bersepeda santai, atau yoga baik untuk kesehatan jantung dan metabolisme.'),
(4, 'rekomendasi makanan diabetes', 'Penderita diabetes sebaiknya mengonsumsi makanan rendah gula seperti oatmeal, brokoli, bayam, dada ayam, dan alpukat. Hindari makanan manis dan tepung putih.'),
(5, 'makanan untuk penderita diabetes', 'Makanan yang cocok untuk penderita diabetes antara lain: sayuran hijau, kacang-kacangan, ikan tinggi omega-3, dan makanan rendah indeks glikemik.'),
(6, 'makanan untuk hipertensi', 'Untuk tekanan darah tinggi, konsumsi makanan rendah garam seperti sayuran, buah pisang, ubi, dan ikan panggang sangat dianjurkan.'),
(7, 'makanan untuk menurunkan kolesterol', 'Kacang-kacangan, oatmeal, ikan salmon, dan buah seperti apel dan pir dapat membantu menurunkan kadar kolesterol.'),
(8, 'menu sarapan sehat', 'Sarapan sehat bisa berupa telur rebus, oatmeal dengan buah segar, smoothie sayur, atau roti gandum dengan alpukat.'),
(9, 'contoh menu diet', 'Contoh menu diet: pagi - telur dan sayur, siang - dada ayam dan brokoli, malam - sup sayur dan buah.'),
(10, 'tips hidup sehat', 'Tidur cukup, makan bergizi, olahraga rutin, cukup air putih, hindari rokok dan alkohol.'),
(11, 'bahaya makanan instan', 'Makanan instan mengandung tinggi garam, lemak jenuh, dan pengawet yang bisa meningkatkan risiko penyakit jantung.'),
(12, 'fungsi serat', 'Serat membantu pencernaan, menurunkan kolesterol, dan menjaga gula darah tetap stabil.'),
(13, 'cara menurunkan berat badan', 'Kurangi kalori, perbanyak aktivitas fisik, dan hindari makanan manis serta gorengan.'),
(14, 'makanan tinggi protein', 'Telur, ayam, daging tanpa lemak, ikan, tahu, tempe, dan susu adalah sumber protein tinggi.'),
(15, 'diet keto', 'Diet keto adalah pola makan tinggi lemak, cukup protein, dan sangat rendah karbohidrat untuk membuat tubuh dalam kondisi ketosis.'),
(16, 'makanan tinggi serat', 'Buah pir, apel, brokoli, wortel, dan biji chia tinggi kandungan serat.'),
(17, 'air putih', 'Minum air putih minimal 8 gelas sehari sangat penting untuk metabolisme dan detoksifikasi.'),
(18, 'manfaat olahraga', 'Olahraga meningkatkan stamina, memperbaiki mood, menjaga berat badan, dan mencegah berbagai penyakit.'),
(19, 'olahraga untuk menurunkan berat badan', 'Lari, skipping, berenang, HIIT, dan bersepeda efektif untuk membakar kalori dan menurunkan berat badan.'),
(20, 'manfaat puasa', 'Puasa membantu detoksifikasi, memperbaiki metabolisme, dan bisa menurunkan berat badan jika dilakukan dengan benar.'),
(21, 'makanan saat puasa', 'Saat puasa, konsumsi makanan kaya protein, karbohidrat kompleks, dan air agar tetap bertenaga seharian.'),
(22, 'makanan buka puasa sehat', 'Kurma, sup sayur, ayam rebus, buah segar, dan air putih sangat baik untuk buka puasa.'),
(23, 'rekomendasi diet remaja', 'Remaja sebaiknya fokus pada makan seimbang: karbohidrat kompleks, protein, sayur, buah, dan cukup minum air.'),
(24, 'makanan penambah darah', 'Bayam, hati ayam, daging merah, dan kacang-kacangan kaya zat besi untuk membantu produksi sel darah merah.'),
(25, 'menu untuk anak balita', 'Nasi tim, sayur lembut, daging cincang, dan buah seperti pisang cocok untuk balita.'),
(26, 'makanan untuk ibu hamil', 'Ibu hamil butuh makanan kaya zat besi, kalsium, folat, seperti susu, ikan, telur, dan sayur hijau.'),
(27, 'gizi seimbang', 'Gizi seimbang adalah asupan karbohidrat, protein, lemak sehat, vitamin, dan mineral sesuai kebutuhan tubuh.'),
(28, 'kebutuhan kalori harian', 'Kebutuhan kalori harian tergantung usia, jenis kelamin, aktivitas. Rata-rata pria dewasa: 2500 kkal, wanita: 2000 kkal.'),
(29, 'fungsi vitamin C', 'Vitamin C membantu sistem imun, mempercepat penyembuhan luka, dan menjaga kulit sehat.'),
(30, 'makanan yang mengandung vitamin D', 'Ikan salmon, kuning telur, hati sapi, dan susu diperkaya adalah sumber vitamin D.'),
(31, 'makanan antioksidan', 'Blueberry, tomat, wortel, teh hijau, dan bayam mengandung antioksidan tinggi yang baik untuk tubuh.'),
(32, 'makanan untuk jantung sehat', 'Ikan berlemak, alpukat, kacang almond, dan buah beri baik untuk menjaga kesehatan jantung.'),
(33, 'makanan untuk asam lambung', 'Oatmeal, pisang, jahe, sayuran hijau rendah asam membantu mengatasi gejala asam lambung.'),
(34, 'makanan untuk maag', 'Pilih makanan lunak seperti bubur, kentang rebus, dan pisang untuk mencegah iritasi lambung.'),
(35, 'camilan sehat', 'Kacang panggang tanpa garam, yogurt rendah lemak, buah potong, atau dark chocolate dalam jumlah wajar.'),
(36, 'diet untuk obesitas', 'Konsumsilah makanan rendah kalori, tinggi serat dan hindari gorengan, gula, serta soft drink.'),
(37, 'bahaya gula berlebih', 'Terlalu banyak gula bisa menyebabkan obesitas, diabetes tipe 2, dan masalah gigi.'),
(38, 'penyebab kolesterol tinggi', 'Konsumsi lemak jenuh, kurang olahraga, dan merokok dapat meningkatkan kolesterol.'),
(39, 'makanan untuk menambah berat badan', 'Nasi, roti gandum, alpukat, susu full cream, dan protein tinggi bisa bantu menaikkan berat badan.'),
(40, 'olahraga untuk lansia', 'Jalan kaki, senam ringan, tai chi, dan yoga sangat cocok untuk menjaga kesehatan lansia.'),
(41, 'menu diet harian', 'Menu diet harian bisa terdiri dari sarapan oatmeal dan buah, makan siang dada ayam dan sayur kukus, malam sup bening dan buah.'),
(42, 'bahaya junk food', 'Junk food tinggi lemak, garam, dan gula yang dapat memicu obesitas, penyakit jantung, dan diabetes.'),
(43, 'cara mengatur pola makan', 'Atur jadwal makan 3 kali sehari dan 2 camilan sehat, hindari makan tengah malam, dan perbanyak minum air.'),
(44, 'makanan rendah kalori', 'Sayuran hijau, sup bening, telur rebus, ikan kukus, dan buah-buahan segar adalah makanan rendah kalori.'),
(45, 'cemilan untuk diet', 'Yogurt rendah lemak, buah, kacang almond, dan dark chocolate dalam jumlah kecil cocok untuk diet.'),
(46, 'bahaya kelebihan garam', 'Kelebihan garam bisa menyebabkan tekanan darah tinggi dan gangguan ginjal.'),
(47, 'manfaat omega 3', 'Omega-3 baik untuk otak, jantung, dan membantu mengurangi peradangan dalam tubuh.'),
(48, 'cara menghitung kalori makanan', 'Kalori makanan bisa dihitung berdasarkan berat dan kandungan makronutrien (karbo, protein, lemak) dari label atau aplikasi.'),
(49, 'diet untuk ibu menyusui', 'Ibu menyusui butuh kalori tambahan dan gizi seimbang: karbohidrat kompleks, protein, serta sayur dan buah.'),
(50, 'manfaat puasa intermittent', 'Intermittent fasting dapat membantu menurunkan berat badan, memperbaiki metabolisme, dan meningkatkan fokus.'),
(51, 'sumber protein nabati', 'Tahu, tempe, kacang-kacangan, dan quinoa adalah sumber protein nabati yang sehat.'),
(52, 'sumber kalsium selain susu', 'Bayam, brokoli, kacang almond, dan ikan teri adalah sumber kalsium non-susu.'),
(53, 'diet vegetarian', 'Diet vegetarian menghindari daging, dan fokus pada konsumsi sayur, buah, biji-bijian, dan protein nabati.'),
(54, 'makanan yang bikin kenyang lama', 'Telur, oatmeal, alpukat, dan makanan tinggi serat membuat kenyang lebih lama.'),
(55, 'makanan untuk kesehatan kulit', 'Buah beri, tomat, alpukat, ikan, dan kacang-kacangan membantu menjaga kulit sehat dan bercahaya.'),
(56, 'fungsi vitamin A', 'Vitamin A penting untuk kesehatan mata, kekebalan tubuh, dan pertumbuhan sel.'),
(57, 'fungsi vitamin B', 'Vitamin B membantu metabolisme energi dan mendukung fungsi otak dan saraf.'),
(58, 'fungsi vitamin E', 'Vitamin E adalah antioksidan yang membantu melindungi sel tubuh dari kerusakan.'),
(59, 'fungsi zat besi', 'Zat besi penting untuk membentuk hemoglobin dan mencegah anemia.'),
(60, 'makanan untuk penderita anemia', 'Hati ayam, daging merah, bayam, dan kacang merah baik untuk penderita anemia.'),
(61, 'makanan untuk penderita asam urat', 'Sayur hijau, buah segar, dan biji-bijian baik untuk penderita asam urat. Hindari jeroan dan makanan laut.'),
(62, 'diet untuk penderita asam urat', 'Kurangi purin dari daging merah, jeroan, dan seafood. Perbanyak air putih dan konsumsi buah-buahan.'),
(63, 'manfaat serat untuk diet', 'Serat membantu merasa kenyang lebih lama, memperlancar pencernaan, dan menurunkan kolesterol.'),
(64, 'menu diet untuk penderita maag', 'Menu rendah asam seperti nasi tim, telur rebus, dan pisang cocok untuk penderita maag.'),
(65, 'minuman sehat', 'Air putih, infused water, teh hijau, dan jus buah tanpa gula adalah minuman sehat.'),
(66, 'bahaya minuman bersoda', 'Minuman bersoda tinggi gula dan asam, berisiko menyebabkan obesitas dan merusak gigi.'),
(67, 'makanan yang perlu dihindari saat diet', 'Hindari gorengan, makanan cepat saji, makanan manis berlebihan, dan minuman manis saat diet.'),
(68, 'karbohidrat kompleks', 'Karbohidrat kompleks seperti nasi merah, oat, dan ubi dicerna lebih lambat dan baik untuk energi jangka panjang.'),
(69, 'lemak sehat', 'Lemak sehat berasal dari alpukat, kacang-kacangan, minyak zaitun, dan ikan berlemak seperti salmon.'),
(70, 'diet rendah karbohidrat', 'Diet ini mengurangi konsumsi nasi, roti, dan gula, dan menggantinya dengan protein dan sayur.'),
(71, 'diet tinggi protein', 'Pola makan ini fokus pada konsumsi makanan tinggi protein untuk menurunkan berat badan dan membangun otot.'),
(72, 'bahaya obesitas', 'Obesitas dapat meningkatkan risiko penyakit jantung, diabetes, stroke, dan kanker.'),
(73, 'penyebab diabetes', 'Diabetes bisa disebabkan oleh pola makan tinggi gula, obesitas, kurang olahraga, dan faktor genetik.'),
(74, 'bahaya merokok bagi kesehatan', 'Merokok meningkatkan risiko penyakit jantung, kanker, paru-paru, dan menurunkan sistem imun.'),
(75, 'pentingnya tidur cukup', 'Tidur 7–9 jam membantu memperbaiki sel tubuh, meningkatkan daya tahan, dan menjaga fungsi otak.'),
(76, 'makanan cepat saji', 'Makanan cepat saji umumnya tinggi lemak jenuh, garam, dan kalori, buruk jika dikonsumsi berlebihan.'),
(77, 'manfaat teh hijau', 'Teh hijau mengandung antioksidan, membantu pembakaran lemak, dan meningkatkan fungsi otak.'),
(78, 'makanan fermentasi', 'Yogurt, tempe, kimchi, dan kefir adalah makanan fermentasi yang baik untuk pencernaan.'),
(79, 'makanan tinggi gula', 'Kue, permen, minuman manis, dan sereal olahan mengandung gula tinggi dan perlu dibatasi.'),
(80, 'penyebab hipertensi', 'Garam berlebihan, stres, obesitas, dan kurang olahraga dapat memicu tekanan darah tinggi.'),
(81, 'tips pola hidup sehat', 'Bangun pagi, olahraga rutin, makan bergizi, hindari stres, cukup tidur, dan rutin cek kesehatan.'),
(82, 'makanan tinggi karbohidrat', 'Nasi, roti putih, pasta, kentang, dan jagung adalah sumber karbohidrat tinggi.'),
(83, 'manfaat buah-buahan', 'Buah mengandung vitamin, serat, dan antioksidan yang penting untuk kekebalan tubuh dan kesehatan.'),
(84, 'manfaat sayuran', 'Sayuran kaya vitamin, mineral, dan serat yang membantu menjaga berat badan dan fungsi tubuh optimal.'),
(85, 'susu rendah lemak', 'Susu rendah lemak menyediakan kalsium dan protein tanpa banyak lemak jenuh, cocok untuk diet.'),
(86, 'makanan penguat imun', 'Jeruk, bawang putih, jahe, yogurt, dan sayur hijau memperkuat sistem imun tubuh.'),
(87, 'menu diet harian', 'Menu diet harian bisa terdiri dari sarapan oatmeal dan buah, makan siang dada ayam dan sayur kukus, malam sup bening dan buah.'),
(88, 'bahaya junk food', 'Junk food tinggi lemak, garam, dan gula yang dapat memicu obesitas, penyakit jantung, dan diabetes.'),
(89, 'cara mengatur pola makan', 'Atur jadwal makan 3 kali sehari dan 2 camilan sehat, hindari makan tengah malam, dan perbanyak minum air.'),
(90, 'makanan rendah kalori', 'Sayuran hijau, sup bening, telur rebus, ikan kukus, dan buah-buahan segar adalah makanan rendah kalori.'),
(91, 'cemilan untuk diet', 'Yogurt rendah lemak, buah, kacang almond, dan dark chocolate dalam jumlah kecil cocok untuk diet.'),
(92, 'bahaya kelebihan garam', 'Kelebihan garam bisa menyebabkan tekanan darah tinggi dan gangguan ginjal.'),
(93, 'manfaat omega 3', 'Omega-3 baik untuk otak, jantung, dan membantu mengurangi peradangan dalam tubuh.'),
(94, 'cara menghitung kalori makanan', 'Kalori makanan bisa dihitung berdasarkan berat dan kandungan makronutrien (karbo, protein, lemak) dari label atau aplikasi.'),
(95, 'diet untuk ibu menyusui', 'Ibu menyusui butuh kalori tambahan dan gizi seimbang: karbohidrat kompleks, protein, serta sayur dan buah.'),
(96, 'manfaat puasa intermittent', 'Intermittent fasting dapat membantu menurunkan berat badan, memperbaiki metabolisme, dan meningkatkan fokus.'),
(97, 'sumber protein nabati', 'Tahu, tempe, kacang-kacangan, dan quinoa adalah sumber protein nabati yang sehat.'),
(98, 'sumber kalsium selain susu', 'Bayam, brokoli, kacang almond, dan ikan teri adalah sumber kalsium non-susu.'),
(99, 'diet vegetarian', 'Diet vegetarian menghindari daging, dan fokus pada konsumsi sayur, buah, biji-bijian, dan protein nabati.'),
(100, 'makanan yang bikin kenyang lama', 'Telur, oatmeal, alpukat, dan makanan tinggi serat membuat kenyang lebih lama.'),
(137, 'diet rendah kalori', 'Diet rendah kalori bertujuan menurunkan berat badan dengan mengurangi asupan energi harian, biasanya di bawah 1500 kalori.'),
(138, 'olahraga', 'Olahraga rutin seperti jalan kaki, lari, yoga, dan angkat beban meningkatkan kesehatan jantung, metabolisme, dan kebugaran secara keseluruhan.'),
(139, 'makanan sehat', 'Makanan sehat mengandung zat gizi penting seperti vitamin, mineral, serat, dan rendah lemak jenuh serta gula tambahan. Contohnya sayuran, buah, ikan, dan kacang-kacangan.'),
(140, 'vitamin', 'Vitamin adalah zat gizi mikro penting untuk metabolisme dan fungsi tubuh. Contohnya vitamin A untuk mata, B untuk energi, C untuk imun, dan D untuk tulang.'),
(141, 'vitamin C', 'Vitamin C membantu meningkatkan daya tahan tubuh, mempercepat penyembuhan luka, dan berperan sebagai antioksidan.'),
(142, 'vitamin D', 'Vitamin D penting untuk penyerapan kalsium dan kesehatan tulang. Sumbernya termasuk sinar matahari dan makanan seperti ikan berlemak.'),
(143, 'kolesterol', 'Kolesterol tinggi dapat menyebabkan penyakit jantung. Hindari makanan berlemak jenuh, perbanyak serat dan olahraga rutin.'),
(144, 'asam urat', 'Asam urat tinggi disebabkan oleh konsumsi makanan tinggi purin seperti jeroan dan seafood. Disarankan banyak minum air dan konsumsi sayuran.'),
(145, 'diabetes', 'Diabetes terjadi karena kadar gula darah tinggi akibat resistensi insulin atau kekurangan insulin. Pola makan sehat dan olahraga sangat penting.'),
(146, 'hipertensi', 'Hipertensi adalah tekanan darah tinggi yang bisa disebabkan oleh kelebihan garam, stres, dan obesitas. Kontrol dengan diet sehat dan olahraga.'),
(147, 'obesitas', 'Obesitas adalah kelebihan lemak tubuh yang dapat meningkatkan risiko penyakit jantung, diabetes, dan gangguan metabolik.'),
(148, 'pola hidup sehat', 'Pola hidup sehat mencakup pola makan bergizi, olahraga teratur, tidur cukup, manajemen stres, dan tidak merokok atau konsumsi alkohol.'),
(149, 'pencernaan sehat', 'Untuk pencernaan sehat, konsumsi makanan tinggi serat seperti buah, sayur, biji-bijian, dan cukup minum air putih.'),
(150, 'cemilan sehat', 'Cemilan sehat termasuk buah segar, yogurt rendah lemak, kacang tanpa garam, dan sayuran potong.'),
(151, 'makanan penambah energi', 'Makanan penambah energi termasuk oatmeal, telur, pisang, dan kacang-kacangan karena kaya karbohidrat kompleks dan protein.'),
(152, 'kalori', 'Kalori adalah satuan energi dari makanan. Kebutuhan kalori harian bergantung pada usia, jenis kelamin, dan aktivitas fisik.'),
(153, 'metabolisme', 'Metabolisme adalah proses tubuh mengubah makanan menjadi energi. Olahraga dan pola makan seimbang membantu mempercepat metabolisme.'),
(154, 'puasa intermittent', 'Intermittent fasting adalah metode makan dengan jeda waktu tertentu, misalnya puasa 16 jam dan makan selama 8 jam. Dapat membantu pembakaran lemak.'),
(155, 'protein', 'Protein penting untuk membangun otot, memperbaiki jaringan, dan mendukung sistem imun. Sumbernya termasuk daging, telur, dan kacang-kacangan.'),
(156, 'karbohidrat', 'Karbohidrat adalah sumber energi utama. Pilih karbohidrat kompleks seperti nasi merah, oat, dan ubi agar kenyang lebih lama.'),
(157, 'lemak sehat', 'Lemak sehat berasal dari alpukat, ikan, kacang-kacangan, dan minyak zaitun. Bermanfaat untuk jantung dan otak.'),
(158, 'susu rendah lemak', 'Susu rendah lemak mengandung kalsium dan protein tanpa lemak jenuh berlebih, baik untuk diet dan tulang.'),
(159, 'detoks', 'Detoks bukan berarti puasa total, tapi fokus pada makanan bersih seperti buah, sayur, air putih, dan menghindari makanan olahan.'),
(160, 'hidrasi', 'Cukup minum air putih penting untuk metabolisme, pencernaan, dan konsentrasi. Idealnya 2–2,5 liter per hari.'),
(161, 'menu diet pemula', 'Menu diet pemula bisa mulai dari sarapan telur dan roti gandum, makan siang dada ayam dan sayur, malam sup dan buah.'),
(162, 'makanan bikin kenyang lama', 'Makanan seperti oatmeal, telur, alpukat, dan makanan tinggi serat membuat kenyang lebih lama dan membantu diet.'),
(163, 'tips turun berat badan', 'Konsisten defisit kalori, olahraga rutin, tidur cukup, minum air, dan hindari makanan manis berlebihan adalah tips efektif menurunkan berat badan.'),
(164, 'bahaya gula berlebih', 'Gula berlebih bisa menyebabkan resistensi insulin, diabetes, penumpukan lemak, dan peradangan kronis dalam tubuh.'),
(165, 'pola hidup sehat', 'Pola hidup sehat mencakup pola makan seimbang, olahraga teratur, tidur cukup, manajemen stres, serta tidak merokok dan menghindari alkohol. Ini penting untuk menjaga kesehatan fisik dan mental secara keseluruhan.'),
(166, 'cara memulai pola hidup sehat', 'Mulailah dengan membiasakan sarapan, minum cukup air, berolahraga 3–5 kali seminggu, tidur 7–8 jam per malam, dan konsumsi makanan segar dan tidak berlebihan.'),
(167, 'manfaat pola hidup sehat', 'Manfaat pola hidup sehat antara lain meningkatkan energi, menurunkan risiko penyakit kronis, menjaga berat badan ideal, memperbaiki suasana hati, dan memperpanjang usia harapan hidup.'),
(168, 'kebiasaan sehat sehari-hari', 'Kebiasaan sehat seperti bangun pagi, minum air putih setelah bangun tidur, makan tepat waktu, rutin bergerak, dan tidur cukup sangat membantu menjaga kesehatan.'),
(169, 'gaya hidup sehat untuk pekerja kantor', 'Untuk pekerja kantor, penting untuk banyak minum air, konsumsi makan siang sehat, istirahat dari layar komputer, dan luangkan waktu untuk olahraga ringan.'),
(170, 'pola tidur sehat', 'Pola tidur sehat adalah tidur cukup 7–9 jam per malam, tidur dan bangun di waktu yang sama setiap hari, serta menghindari layar sebelum tidur.'),
(171, 'olahraga teratur', 'Olahraga teratur seperti jalan cepat, bersepeda, berenang, atau yoga membantu menjaga kebugaran jantung, kekuatan otot, dan kesehatan mental.'),
(172, 'manajemen stres', 'Manajemen stres bisa dilakukan dengan meditasi, olahraga, tidur cukup, menulis jurnal, berbicara dengan orang terpercaya, atau melakukan hobi yang disukai.'),
(173, 'makanan seimbang', 'Makanan seimbang terdiri dari karbohidrat kompleks, protein sehat, lemak baik, serat, vitamin, dan mineral. Porsi makan juga harus disesuaikan dengan kebutuhan energi harian.'),
(174, 'hindari kebiasaan buruk', 'Kebiasaan buruk seperti merokok, konsumsi alkohol berlebihan, makan tidak teratur, dan kurang tidur dapat merusak kesehatan jangka panjang.'),
(175, 'hidrasi tubuh', 'Menjaga hidrasi penting untuk fungsi organ tubuh, metabolisme, dan konsentrasi. Minumlah air putih minimal 2 liter per hari atau sesuai kebutuhan aktivitas.'),
(176, 'rutinitas pagi sehat', 'Rutinitas pagi yang sehat termasuk bangun tepat waktu, minum air putih, olahraga ringan, sarapan sehat, dan merencanakan aktivitas harian.'),
(177, 'detoks digital', 'Detoks digital berarti mengurangi waktu di depan layar untuk kesehatan mental, seperti membatasi media sosial, menjauhkan HP saat tidur, dan mengisi waktu dengan kegiatan fisik.'),
(178, 'istirahat cukup', 'Istirahat cukup membantu regenerasi sel tubuh, memperkuat sistem imun, dan meningkatkan fokus. Tidur malam ideal adalah 7–9 jam.'),
(179, 'jalan kaki', 'Jalan kaki selama 30 menit sehari dapat membantu menurunkan berat badan, memperkuat jantung, dan menurunkan stres.'),
(180, 'makanan bergizi', 'Makanan bergizi mencakup buah, sayuran, protein tanpa lemak, biji-bijian, dan lemak sehat untuk mendukung fungsi tubuh secara optimal.'),
(181, 'hindari makanan instan', 'Makanan instan mengandung banyak garam, pengawet, dan lemak jenuh yang dapat meningkatkan risiko hipertensi dan penyakit jantung.'),
(182, 'cek kesehatan rutin', 'Cek kesehatan rutin membantu deteksi dini penyakit seperti diabetes, hipertensi, dan kolesterol tinggi sehingga penanganannya bisa lebih cepat.'),
(183, 'makan malam sehat', 'Makan malam sehat sebaiknya rendah karbohidrat, tinggi protein dan serat, seperti ikan panggang dengan sayur kukus, agar tidak mengganggu kualitas tidur.'),
(184, 'pentingnya sinar matahari pagi', 'Paparan sinar matahari pagi membantu produksi vitamin D yang penting untuk tulang dan sistem imun. Idealnya berjemur 10–15 menit sebelum jam 9 pagi.'),
(185, 'cara meningkatkan metabolisme', 'Meningkatkan metabolisme bisa dilakukan dengan olahraga rutin, konsumsi makanan berprotein tinggi, tidur cukup, dan minum air putih yang cukup.'),
(186, 'menu makanan sehat untuk kantor', 'Nasi merah, ayam panggang tanpa kulit, sayuran rebus, dan buah segar cocok sebagai bekal sehat untuk ke kantor.'),
(187, 'makanan untuk otak', 'Ikan salmon, telur, kacang kenari, blueberry, dan brokoli mendukung fungsi otak dan daya ingat.'),
(188, 'makanan untuk penderita kolesterol tinggi', 'Konsumsi oatmeal, alpukat, ikan berlemak seperti salmon, dan kacang almond untuk membantu menurunkan kolesterol.'),
(189, 'makanan tinggi magnesium', 'Bayam, biji labu, alpukat, kacang almond, dan pisang kaya akan magnesium yang penting untuk otot dan saraf.'),
(190, 'makanan untuk meningkatkan imun tubuh', 'Jeruk, jahe, bawang putih, yogurt, dan sayur berdaun hijau membantu meningkatkan sistem kekebalan tubuh.'),
(191, 'pentingnya sarapan', 'Sarapan memberi energi untuk memulai hari, meningkatkan konsentrasi, dan membantu menjaga berat badan.'),
(192, 'makanan untuk ibu menyusui agar ASI lancar', 'Daun katuk, oatmeal, air putih, sup ayam, dan kacang-kacangan membantu meningkatkan produksi ASI.'),
(193, 'makanan sumber zinc', 'Daging sapi, tiram, biji labu, dan buncis adalah makanan kaya zinc yang penting untuk sistem imun dan penyembuhan luka.'),
(194, 'penyebab pencernaan lambat', 'Kurangnya serat, dehidrasi, stres, dan kurangnya aktivitas fisik bisa menyebabkan pencernaan lambat.'),
(195, 'Makanan Sehat untuk Lansia', 'Seiring bertambahnya usia, kebutuhan gizi lansia mengalami perubahan. Sistem pencernaan menjadi lebih lambat, metabolisme menurun, dan risiko penyakit degeneratif seperti diabetes, hipertensi, dan osteoporosis meningkat. Oleh karena itu, lansia membutuhkan pola makan yang seimbang dan bernutrisi tinggi untuk menjaga kesehatan tubuh, memperkuat daya tahan, serta mempertahankan kualitas hidup yang baik.'),
(196, 'diet cepat', 'Diet cepat menurunkan berat badan dalam waktu singkat, namun sebaiknya tetap mempertahankan pola makan bergizi dan tidak ekstrem agar tubuh tetap sehat.'),
(197, 'diet keto', 'Diet keto adalah pola makan rendah karbohidrat dan tinggi lemak untuk memicu ketosis, yaitu kondisi di mana tubuh membakar lemak sebagai sumber energi utama.'),
(198, 'diet rendah kalori', 'Diet rendah kalori bertujuan menurunkan berat badan dengan mengurangi asupan energi harian, biasanya di bawah 1500 kalori.'),
(199, 'gizi seimbang', 'Gizi seimbang adalah asupan makanan harian yang mengandung karbohidrat, protein, lemak, vitamin, dan mineral dalam jumlah cukup untuk memenuhi kebutuhan tubuh dan menjaga kesehatan.'),
(200, 'zat besi', 'Zat besi penting untuk pembentukan sel darah merah. Kekurangan zat besi bisa menyebabkan anemia. Sumbernya termasuk daging merah, bayam, dan kacang-kacangan.'),
(201, 'serat', 'Serat membantu melancarkan pencernaan, menjaga kadar gula darah, dan menurunkan kolesterol. Ditemukan pada buah, sayur, biji-bijian, dan kacang.'),
(202, 'kalsium', 'Kalsium dibutuhkan untuk pertumbuhan tulang dan gigi yang kuat serta fungsi saraf dan otot. Sumbernya antara lain susu, keju, dan sayuran hijau.'),
(203, 'omega 3', 'Omega-3 adalah asam lemak esensial yang baik untuk jantung dan otak. Sumber utamanya adalah ikan salmon, tuna, dan chia seed.'),
(204, 'sistem imun', 'Sistem imun adalah pertahanan tubuh terhadap penyakit. Dapat ditingkatkan dengan makanan bergizi, tidur cukup, olahraga, dan manajemen stres.'),
(205, 'stres', 'Stres kronis dapat memengaruhi kesehatan mental dan fisik. Menjaga pola tidur, berolahraga, dan melakukan relaksasi dapat membantu mengelola stres.'),
(206, 'tidur cukup', 'Tidur cukup (7–9 jam per malam) penting untuk regenerasi tubuh, menjaga fungsi otak, dan sistem imun.'),
(207, 'kesehatan jantung', 'Menjaga kesehatan jantung bisa dilakukan dengan pola makan rendah lemak jenuh, konsumsi serat, olahraga rutin, dan menghindari rokok.'),
(208, 'kesehatan mental', 'Kesehatan mental mencakup kesejahteraan emosional dan psikologis. Menjaga koneksi sosial, berbicara dengan ahli, dan istirahat cukup membantu menjaganya.'),
(209, 'makanan tinggi protein', 'Contoh makanan tinggi protein: dada ayam, telur, tempe, tahu, ikan, dan yogurt. Baik untuk pertumbuhan otot dan perbaikan jaringan.'),
(210, 'makanan tinggi serat', 'Makanan tinggi serat meliputi buah-buahan, sayur, oat, dan kacang-kacangan. Bermanfaat untuk pencernaan dan kenyang lebih lama.'),
(211, 'makanan sehat untuk sarapan', 'Rekomendasi sarapan sehat: oatmeal dengan buah, telur rebus, roti gandum, atau smoothie tanpa gula.'),
(212, 'makanan sehat untuk anak', 'Makanan sehat untuk anak sebaiknya mencakup protein, kalsium, sayur, dan buah. Hindari makanan tinggi gula atau garam.'),
(213, 'makanan untuk ibu hamil', 'Ibu hamil perlu asupan asam folat, zat besi, kalsium, dan protein. Contohnya bayam, telur, susu, dan ikan yang dimasak matang.'),
(214, 'manajemen stres', 'Manajemen stres penting untuk kesehatan mental. Bisa dilakukan dengan meditasi, olahraga, menulis jurnal, dan tidur cukup.'),
(215, 'kebiasaan sehat', 'Kebiasaan sehat termasuk bangun pagi, minum air putih cukup, makan bergizi, olahraga rutin, dan mengurangi screen time.'),
(216, 'hidrasi tubuh', 'Menjaga hidrasi dengan minum minimal 2 liter air sehari membantu menjaga energi, fokus, dan kesehatan ginjal.'),
(217, 'aktivitas fisik harian', 'Melakukan aktivitas fisik seperti jalan kaki, naik tangga, atau senam ringan setiap hari sangat bermanfaat bagi metabolisme dan jantung.'),
(218, 'cek kesehatan rutin', 'Cek kesehatan rutin membantu deteksi dini penyakit dan menjaga tubuh tetap dalam kondisi optimal, terutama tekanan darah, gula darah, dan kolesterol.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `reset_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `reset_token`, `created_at`) VALUES
(1, 'haniat', 'haniatul122@gmail.com', '$2b$10$KpbBgq4XKkXL3R3nQUKWHed.3lQONfB1l5lWDd72J0YWzfF27b2b.', 'user', '142a7bb62a2b32b8fe53eebf8abcdb07d82ae7f604b7a69bc4c385f8f66c7096', '2025-06-12 08:46:31'),
(6, 'Admin', 'admin@example.com', '$2b$10$FsQLOnUDLtH2k5qgOrm2yO34MgKRMSz9HurcRjDpfeEqdOM4HnXIe', 'admin', NULL, '2025-06-19 04:45:10'),
(8, 'hani', 'haniiyaat@gmail.com', '$2b$10$WtXRV.DN10XNsT.zBjV0y.xMEUjF.2KySSwWv4tmxKsPEZQWKtzci', 'user', NULL, '2025-06-19 06:42:36'),
(9, 'hani', 'hani1234@gmail.com', '$2b$10$yE6nToXDk57eVwUrkCmoQOLzxuhXbNL.0kVtRIIpy6nCLEtAKcGeO', 'user', NULL, '2025-06-19 14:20:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatbot_nutrisi`
--
ALTER TABLE `chatbot_nutrisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatbot_nutrisi`
--
ALTER TABLE `chatbot_nutrisi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatbot_nutrisi`
--
ALTER TABLE `chatbot_nutrisi`
  ADD CONSTRAINT `chatbot_nutrisi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
