import '../models/student.dart';
import '../models/department.dart';
import '../models/official.dart';

/// Data Repository containing all hardcoded student, department, and official data
/// Migrated from the original NTNU 2015 Graduation Android app
/// Total: 108 students across 7 departments
class DataRepository {
  // ==================== UNIVERSITY OFFICIALS ====================

  static final List<Official> universityOfficials = [
    const Official(
      name: 'Prof. Dr. Huseyin Sert',
      title: 'Vice Chancellor',
      photoAssetPath: 'assets/images/officials/vc.png',
    ),
    const Official(
      name: 'Prof. Mehmet Yilmaz',
      title: 'Deputy Vice Chancellor',
      photoAssetPath: 'assets/images/officials/dvc.png',
    ),
    const Official(
      name: 'Assoc. Prof. Dr. Steve A. Adeshina',
      title: 'Deputy Vice Chancellor',
      photoAssetPath: 'assets/images/officials/dvcadmin.png',
    ),
    const Official(
      name: 'Mr. Kamil Kemanci',
      title: 'Registrar',
      photoAssetPath: 'assets/images/officials/reg.png',
    ),
    const Official(
      name: 'Mr. Kasim Ozkulluk',
      title: 'Deputy Registrar',
      photoAssetPath: 'assets/images/officials/deputyregistrar.png',
    ),
    const Official(
      name: 'Dr. Mehmet Fatih Yasar',
      title: 'Dean, Post-Graduate Studies',
      photoAssetPath: 'assets/images/officials/deanpostgrad.png',
    ),
    const Official(
      name: 'Mr. Adem Arslan',
      title: 'Dean, Students Affairs',
      photoAssetPath: 'assets/images/officials/deanstudents.png',
    ),
    const Official(
      name: 'Prof. Dr. Huseyin Kalyoncu',
      title: 'Dean, Faculty of Art, Management & Social Sciences',
      photoAssetPath: 'assets/images/officials/deanart.png',
    ),
    const Official(
      name: 'Assoc. Prof. Dr. Musa Muhammed',
      title: 'Dean, Faculty of Natural & Applied Sciences',
      photoAssetPath: 'assets/images/officials/hodcsc.png',
    ),
    const Official(
      name: 'Dr. Gokhan Koyunlu',
      title: 'Dean, Faculty of Engineering',
      photoAssetPath: 'assets/images/officials/deaneee.png',
    ),
  ];

  // ==================== DEPARTMENT STUDENTS DATA ====================

  // Business Administration Students (14 students)
  static const List<Student> _businessStudents = [
    Student(id: 'buss_001', fullName: 'Zainab S. Abdullahi', email: null, phone: '08060164932', photoAssetPath: 'assets/images/students/zainabs.jpg', departmentId: 'buss'),
    Student(id: 'buss_002', fullName: 'Ndako Usman Dan-Asabe', email: null, phone: null, photoAssetPath: 'assets/images/students/ndakousmandanasabe.jpg', departmentId: 'buss'),
    Student(id: 'buss_003', fullName: 'Modibbo Usman Aliyu', email: null, phone: null, photoAssetPath: 'assets/images/students/modibbousmanaliyu.jpg', departmentId: 'buss'),
    Student(id: 'buss_004', fullName: 'Aminu Zainab Ibrahim', email: 'ibrahimzanab_aminu74@yahoo.com', phone: '09050865718', photoAssetPath: 'assets/images/students/aminuzainabibrahim.jpg', departmentId: 'buss'),
    Student(id: 'buss_005', fullName: 'Tukur Sadiq Hamman', email: null, phone: '07058054094', photoAssetPath: 'assets/images/students/tukursadiqhamman.jpg', departmentId: 'buss'),
    Student(id: 'buss_006', fullName: 'Adamu Aisha Saleh', email: null, phone: null, photoAssetPath: 'assets/images/students/adamuaishasaleh.jpg', departmentId: 'buss'),
    Student(id: 'buss_007', fullName: 'Yarima Sadiq', email: null, phone: null, photoAssetPath: 'assets/images/students/yarimasadiq.jpg', departmentId: 'buss'),
    Student(id: 'buss_008', fullName: 'Muhammad Zara Aji', email: 'ajizara.muhammadaji@yahoo.com', phone: '08031321459', photoAssetPath: 'assets/images/students/muhammadzaraaji.jpg', departmentId: 'buss'),
    Student(id: 'buss_009', fullName: 'Ahmed Hadiza Zubairu', email: 'zubairuhadizaahmed76@yahoo.com', phone: '07033360294', photoAssetPath: 'assets/images/students/ahmedhadizazubairu.jpg', departmentId: 'buss'),
    Student(id: 'buss_010', fullName: 'Fanna Goni', email: null, phone: null, photoAssetPath: 'assets/images/students/fannagoni.jpg', departmentId: 'buss'),
    Student(id: 'buss_011', fullName: 'Ahmad Rabiat Makama', email: 'makamarabiamakam55@gmail.com', phone: '08035599490', photoAssetPath: 'assets/images/students/ahmadrabiatmakama.jpg', departmentId: 'buss'),
    Student(id: 'buss_012', fullName: 'Abdullahi Mahmud Buhari', email: null, phone: null, photoAssetPath: 'assets/images/students/abdullahimahmudbuhari.jpg', departmentId: 'buss'),
    Student(id: 'buss_013', fullName: 'Jamila Tapang Garba', email: null, phone: null, photoAssetPath: 'assets/images/students/jamilatapanggarba.jpg', departmentId: 'buss'),
    Student(id: 'buss_014', fullName: 'Wakil Muhammed', email: null, phone: null, photoAssetPath: 'assets/images/students/wakilmohammed.jpg', departmentId: 'buss'),
  ];

  // Petro-Chemistry Students (22 students)
  static const List<Student> _chemistryStudents = [
    Student(id: 'chem_001', fullName: 'Maimuna Buba', email: 'bubamaimuna224@yahoo.com', phone: '08165454784', photoAssetPath: 'assets/images/students/chemsec.jpg', departmentId: 'chem'),
    Student(id: 'chem_002', fullName: 'Mustapha Lawan Kar', email: 'karmustaphalawankar91@gmail.com', phone: '07061169071', photoAssetPath: 'assets/images/students/karmustafalawan.jpg', departmentId: 'chem'),
    Student(id: 'chem_003', fullName: 'Dawi Hadiza Adamu', email: 'adamukadidydawi1@yahoo.com', phone: '08033910755', photoAssetPath: 'assets/images/students/dawihadizaadamu.jpg', departmentId: 'chem'),
    Student(id: 'chem_004', fullName: 'Tahir Fauziya Garba', email: 'garbaftaheer44@gmail.com', phone: '08033319922', photoAssetPath: 'assets/images/students/tahirfauziyagarba.jpg', departmentId: 'chem'),
    Student(id: 'chem_005', fullName: 'Muhammad Asmau', email: 'asmauadamuasmau_adamu@yahoo.com', phone: '08038394245', photoAssetPath: 'assets/images/students/muhammadasmauadamu.jpg', departmentId: 'chem'),
    Student(id: 'chem_006', fullName: 'Katsina Fadeelah', email: 'fadeelahibrahimpkatsina@gmail.com', phone: '08038018856', photoAssetPath: 'assets/images/students/katsinafadeelahibrahim.jpg', departmentId: 'chem'),
    Student(id: 'chem_007', fullName: 'Garba Aisha Ilah', email: 'ilahaishagilah@gmail.com', phone: '08034316676', photoAssetPath: 'assets/images/students/garbaaishailah.jpg', departmentId: 'chem'),
    Student(id: 'chem_008', fullName: 'Asmau Nasir Zakari', email: 'zakariasmau.nasir@yahoo.com', phone: '08061110589', photoAssetPath: 'assets/images/students/zakariasmaunasir.jpg', departmentId: 'chem'),
    Student(id: 'chem_009', fullName: 'Abubakar Hidaya M.', email: 'm.heedayaah@gmail.com', phone: '07036272070', photoAssetPath: 'assets/images/students/abubakarhidayam.jpg', departmentId: 'chem'),
    Student(id: 'chem_010', fullName: 'Gana Ishaka Hassan', email: 'hassanishyakagana@gmail.com', phone: '08065026281', photoAssetPath: 'assets/images/students/ganaishakahassan.jpg', departmentId: 'chem'),
    Student(id: 'chem_011', fullName: 'Umar Aisha Saleh', email: 'salehnazash79@yahoo.com', phone: '08032066096', photoAssetPath: 'assets/images/students/umaraishasaleh.jpg', departmentId: 'chem'),
    Student(id: 'chem_012', fullName: 'Tela Kamisu Umaru', email: 'umarukhamisuumar15@gmail.com', phone: '08062984067', photoAssetPath: 'assets/images/students/telakamisuumar.jpg', departmentId: 'chem'),
    Student(id: 'chem_013', fullName: 'Bello Bilikisu Abdullahi', email: 'abdullahibillycharanchi01@yahoo.com', phone: '08030855726', photoAssetPath: 'assets/images/students/bellobilkisuabdullahi.jpg', departmentId: 'chem'),
    Student(id: 'chem_014', fullName: 'Shuaibu Adamu Baba', email: 'babaadamutalba@gmail.com', phone: '08038809241', photoAssetPath: 'assets/images/students/shuaibuadamubaba.jpg', departmentId: 'chem'),
    Student(id: 'chem_015', fullName: 'Abubakar Fatimah', email: 'fatimahfabubakar@gmail.com', phone: '07036417406', photoAssetPath: 'assets/images/students/abubakarfatima.jpg', departmentId: 'chem'),
    Student(id: 'chem_016', fullName: 'Ibrahim Maryam Badein', email: 'badeinmbadein@ymail.com', phone: '08030555965', photoAssetPath: 'assets/images/students/ibrahimmaryambadeiri.jpg', departmentId: 'chem'),
    Student(id: 'chem_017', fullName: 'Baba Muhammad Saje', email: 'sajembsajebo@gmail.com', phone: '08034519995', photoAssetPath: 'assets/images/students/babamuhammadsaje.jpg', departmentId: 'chem'),
    Student(id: 'chem_018', fullName: 'Abdulahi Fatima Yahaya', email: 'yahayazeezohra4real@yahoo.com', phone: '08030580963', photoAssetPath: 'assets/images/students/abdullahifatimayahaya.jpg', departmentId: 'chem'),
    Student(id: 'chem_019', fullName: 'Abubakar Hassana Ladio', email: 'ladioabubakarhassana25@gmail.com', phone: '08138487987', photoAssetPath: 'assets/images/students/abbubakarhassanaladio.jpg', departmentId: 'chem'),
    Student(id: 'chem_020', fullName: 'Usman AbdulMalik', email: 'abdulmalikabdulmalikustazusman@gmail.com', phone: '08032773004', photoAssetPath: 'assets/images/students/usmanabdulmalik.jpg', departmentId: 'chem'),
    Student(id: 'chem_021', fullName: 'Yunusa Abdulrazak', email: 'abdulrazakmuhammaddmkukuri@yahoo.com', phone: '08035046260', photoAssetPath: 'assets/images/students/yunusaabdulrazaqmuhammad.jpg', departmentId: 'chem'),
    Student(id: 'chem_022', fullName: 'Anyawu Chibueze', email: 'chibuezekelechichizy.maestao@yahoo.com', phone: '07038883261', photoAssetPath: 'assets/images/students/anyawuchibuezekelechi.jpg', departmentId: 'chem'),
  ];

  // Computer Science Students (14 students)
  static const List<Student> _computerScienceStudents = [
    Student(id: 'csc_001', fullName: 'Ibrahim Aminu Bala', email: 'balaibrahimamin40@gmail.com', phone: '08068861192', photoAssetPath: 'assets/images/students/sudan.png', departmentId: 'csc'),
    Student(id: 'csc_002', fullName: 'Bazam Shehu Musa', email: 'musabazamshehu@yahoo.com', phone: '08112174747', photoAssetPath: 'assets/images/students/bazamshehumusa.jpg', departmentId: 'csc'),
    Student(id: 'csc_003', fullName: 'Garba Nasir Yasir', email: null, phone: '08031323227', photoAssetPath: 'assets/images/students/garbanasiruyasir.jpg', departmentId: 'csc'),
    Student(id: 'csc_004', fullName: 'Isyaku Mamman', email: 'mammankontagoraisyakumammank@gmail.com', phone: '07039048875', photoAssetPath: 'assets/images/students/kontogoraisyakumamman.jpg', departmentId: 'csc'),
    Student(id: 'csc_005', fullName: 'Muhammad Mamman', email: 'mammankontagoramohakontagora14@yahoo.com', phone: '07035832648', photoAssetPath: 'assets/images/students/kontagoramuhammadmamman.jpg', departmentId: 'csc'),
    Student(id: 'csc_006', fullName: 'muhammad Khalid', email: 'khalidsuleimankkmbs39@ymail.com', phone: '08037722155', photoAssetPath: 'assets/images/students/muhammadkhalifsuleiman.jpg', departmentId: 'csc'),
    Student(id: 'csc_007', fullName: 'Fatima Mustapha', email: 'mustaphajahunmustaphafateema@gmail.com', phone: '08034026330', photoAssetPath: 'assets/images/students/mustaphafatimajahun.jpg', departmentId: 'csc'),
    Student(id: 'csc_008', fullName: 'Lot Tong\'ret', email: 'retlottongy@yahoo.com', phone: '08105168911', photoAssetPath: 'assets/images/students/danielle.png', departmentId: 'csc'),
    Student(id: 'csc_009', fullName: 'Koksal Godek', email: 'godekgs_koksal_55@hotmail.com', phone: '08155771090', photoAssetPath: 'assets/images/students/koksal.png', departmentId: 'csc'),
    Student(id: 'csc_010', fullName: 'Abubakar Sani Jato', email: 'jatoabubakarsadiqsani@ymail.com', phone: '07061614828', photoAssetPath: 'assets/images/students/abubakarsanijato.jpg', departmentId: 'csc'),
    Student(id: 'csc_011', fullName: 'Usman Khadija Musa', email: 'musausmankhadija4@gmail.com', phone: '08061397041', photoAssetPath: 'assets/images/students/khadijamusausman.jpg', departmentId: 'csc'),
    Student(id: 'csc_012', fullName: 'Kabir Muktar', email: 'muktartambawelkabmuktar@yahoo.co.uk', phone: '07080285860', photoAssetPath: 'assets/images/students/muktarkabirtambuwal.jpg', departmentId: 'csc'),
    Student(id: 'csc_013', fullName: 'Salaheddine Nenne', email: 'nennehapsatouennehapsatou@live.com', phone: '08103878884', photoAssetPath: 'assets/images/students/saleheddinenennehapsatou.jpg', departmentId: 'csc'),
    Student(id: 'csc_014', fullName: 'Ismaila Lukman Enegi', email: 'enegiismailukman@gmail.com', phone: '08136605722', photoAssetPath: 'assets/images/students/ismailukman.png', departmentId: 'csc'),
  ];

  // Economics Students (13 students)
  static const List<Student> _economicsStudents = [
    Student(id: 'econs_001', fullName: 'Baba Ahmed Khalifa', email: null, phone: null, photoAssetPath: 'assets/images/students/babaahmedkhalifausman.jpg', departmentId: 'econs'),
    Student(id: 'econs_002', fullName: 'Maiga Fatoumata', email: null, phone: null, photoAssetPath: 'assets/images/students/maigafatoumatakoumba.jpg', departmentId: 'econs'),
    Student(id: 'econs_003', fullName: 'Gloriya Kainnee', email: null, phone: null, photoAssetPath: 'assets/images/students/gloriakainneegbappy.jpg', departmentId: 'econs'),
    Student(id: 'econs_004', fullName: 'Muhammad Musa', email: null, phone: '08139180312', photoAssetPath: 'assets/images/students/musamohammed.jpg', departmentId: 'econs'),
    Student(id: 'econs_005', fullName: 'Faji Goni', email: null, phone: '08133222949', photoAssetPath: 'assets/images/students/fajigoni.jpg', departmentId: 'econs'),
    Student(id: 'econs_006', fullName: 'Adamu Garba Baba', email: null, phone: null, photoAssetPath: 'assets/images/students/adamugarbababa.jpg', departmentId: 'econs'),
    Student(id: 'econs_007', fullName: 'Fatima Mai Hamza', email: null, phone: null, photoAssetPath: 'assets/images/students/fatimamaihamza.jpg', departmentId: 'econs'),
    Student(id: 'econs_008', fullName: 'Abubakar Haruna', email: null, phone: null, photoAssetPath: 'assets/images/students/abubakarharuna.jpg', departmentId: 'econs'),
    Student(id: 'econs_009', fullName: 'Jajere Abdulkadir', email: 'abdulkadirumarabdulkhadirumarjajere@gmail.com', phone: '08169859959', photoAssetPath: 'assets/images/students/jajereabdulkadirumar.jpg', departmentId: 'econs'),
    Student(id: 'econs_010', fullName: 'Alor E. Henry', email: null, phone: null, photoAssetPath: 'assets/images/students/alorekenedilichukwuhenry.jpg', departmentId: 'econs'),
    Student(id: 'econs_011', fullName: 'Mukhtar Yusuf', email: null, phone: null, photoAssetPath: 'assets/images/students/mukhtaryusufyusuf.jpg', departmentId: 'econs'),
    Student(id: 'econs_012', fullName: 'Imuetinyan', email: null, phone: null, photoAssetPath: 'assets/images/students/imuetinyanaiguwurhuo.jpg', departmentId: 'econs'),
    Student(id: 'econs_013', fullName: 'Umar Jamila', email: null, phone: null, photoAssetPath: 'assets/images/students/umarjamilaomolara.jpg', departmentId: 'econs'),
  ];

  // Electrical Engineering Students (11 students)
  static const List<Student> _electricalEngineeringStudents = [
    Student(id: 'eee_001', fullName: 'Zayyad Ibrahim Bawa', email: 'bawazayyadibrahim@hotmail.com', phone: '07063346282', photoAssetPath: 'assets/images/students/zayyadibrahimbawa.jpg', departmentId: 'eee'),
    Student(id: 'eee_002', fullName: 'Gbede Terngu', email: 'ternguemmanuelemmyboss12@yahoo.com', phone: '08101682835', photoAssetPath: 'assets/images/students/gbedeternguemmanuel.jpg', departmentId: 'eee'),
    Student(id: 'eee_003', fullName: 'Nazif Sabiu Baba', email: 'babanazbabs01@ymail.com', phone: '08130876875', photoAssetPath: 'assets/images/students/nazifsabiubaba.jpg', departmentId: 'eee'),
    Student(id: 'eee_004', fullName: 'Abubakar Ahmed', email: 'ahmedrufairufaiahmed@rocketmail.com', phone: '08060067700', photoAssetPath: 'assets/images/students/abubakarahmadrufai.jpg', departmentId: 'eee'),
    Student(id: 'eee_005', fullName: 'Abubakar Bomoi', email: 'bomoiyusufspriry92@gmail.com', phone: '08035843887', photoAssetPath: 'assets/images/students/ibrahimbomoiyusuf.jpg', departmentId: 'eee'),
    Student(id: 'eee_006', fullName: 'El-Mustapha Abdullahi', email: 'abdullahirabasaelmar885@gmail.com', phone: '08087840046', photoAssetPath: 'assets/images/students/elmustaphaabdullahirabasa.jpg', departmentId: 'eee'),
    Student(id: 'eee_007', fullName: 'Salihu Umar Jega', email: 'jegausjega14@yahoo.com', phone: '08037676801', photoAssetPath: 'assets/images/students/salihuumarjega.jpg', departmentId: 'eee'),
    Student(id: 'eee_008', fullName: 'Abubakar Gana Tata', email: 'tataabk9595@yahoo.com', phone: '08066171929', photoAssetPath: 'assets/images/students/tata.png', departmentId: 'eee'),
    Student(id: 'eee_009', fullName: 'Muazu Hassan Umar', email: 'umarhssn_muazu@yahoo.com', phone: '08064049619', photoAssetPath: 'assets/images/students/muazuhassanumar.jpg', departmentId: 'eee'),
    Student(id: 'eee_010', fullName: 'Bello Fatima Ahmed', email: 'ahmedfatimaahmed6219@yahoo.com', phone: '08057818766', photoAssetPath: 'assets/images/students/bellofatimaahmed.jpg', departmentId: 'eee'),
    Student(id: 'eee_011', fullName: 'Umar Yahaya Usman', email: 'usmanumaryahaya87@yahoo.com', phone: '08099004625', photoAssetPath: 'assets/images/students/umaryahayausman.jpg', departmentId: 'eee'),
  ];

  // English Students (10 students)
  static const List<Student> _englishStudents = [
    Student(id: 'eng_001', fullName: 'Kontagora Ibrahim', email: null, phone: null, photoAssetPath: 'assets/images/students/kontagoraibrahim.jpg', departmentId: 'eng'),
    Student(id: 'eng_002', fullName: 'Johnson Onome', email: null, phone: null, photoAssetPath: 'assets/images/students/johnsononomeyeditala.jpg', departmentId: 'eng'),
    Student(id: 'eng_003', fullName: 'Shehu Usman', email: null, phone: null, photoAssetPath: 'assets/images/students/shehuusmanmaryam.jpg', departmentId: 'eng'),
    Student(id: 'eng_004', fullName: 'Usman Abduljalal', email: null, phone: null, photoAssetPath: 'assets/images/students/usmanabduljalal.jpg', departmentId: 'eng'),
    Student(id: 'eng_005', fullName: 'Hediye Koyunlu', email: null, phone: null, photoAssetPath: 'assets/images/students/hediyekoyunlu.jpg', departmentId: 'eng'),
    Student(id: 'eng_006', fullName: 'Idris Maimuna', email: null, phone: null, photoAssetPath: 'assets/images/students/idrismaimunalawal.jpg', departmentId: 'eng'),
    Student(id: 'eng_007', fullName: 'Abbas Jega Sumaiyah', email: null, phone: null, photoAssetPath: 'assets/images/students/abbasjegasumaiyah.jpg', departmentId: 'eng'),
    Student(id: 'eng_008', fullName: 'Abdulhamid Halima', email: null, phone: null, photoAssetPath: 'assets/images/students/abdulhamidhamid.jpg', departmentId: 'eng'),
    Student(id: 'eng_009', fullName: 'Kabir Zainab Ajuji', email: null, phone: null, photoAssetPath: 'assets/images/students/kabirzainabajuji.jpg', departmentId: 'eng'),
    Student(id: 'eng_010', fullName: 'Garuba Michael', email: null, phone: null, photoAssetPath: 'assets/images/students/garubamichaelechobu.jpg', departmentId: 'eng'),
  ];

  // Political Science Students (24 students)
  static const List<Student> _politicalScienceStudents = [
    Student(id: 'pol_001', fullName: 'Yerima Maryam', email: null, phone: null, photoAssetPath: 'assets/images/students/yerimamaryamngama.jpg', departmentId: 'pol'),
    Student(id: 'pol_002', fullName: 'Sule Cynthia', email: null, phone: null, photoAssetPath: 'assets/images/students/sulecynthiaojone.jpg', departmentId: 'pol'),
    Student(id: 'pol_003', fullName: 'Jibril Faisal', email: null, phone: null, photoAssetPath: 'assets/images/students/jibrilfaisal.jpg', departmentId: 'pol'),
    Student(id: 'pol_004', fullName: 'Jinjirin Hadiza', email: null, phone: null, photoAssetPath: 'assets/images/students/jinjirinhadizayaro.jpg', departmentId: 'pol'),
    Student(id: 'pol_005', fullName: 'Isyaka Jibrin', email: 'jibrinrukaiyaauwal.ummi@yahoo.com', phone: '08067300046', photoAssetPath: 'assets/images/students/isiakajibrinrukaiya.jpg', departmentId: 'pol'),
    Student(id: 'pol_006', fullName: 'Jedy-Agda Juliet', email: null, phone: null, photoAssetPath: 'assets/images/students/jedyagbajulietokobru.jpg', departmentId: 'pol'),
    Student(id: 'pol_007', fullName: 'Alkali Hadiza Ma\'aji', email: null, phone: null, photoAssetPath: 'assets/images/students/alkalihadizamaaji.jpg', departmentId: 'pol'),
    Student(id: 'pol_008', fullName: 'Odinaka Marvelous', email: 'marvelouschibundumarvelousodinaka@yahoo.com', phone: '08133119335', photoAssetPath: 'assets/images/students/odiakamarvelouschibundu.jpg', departmentId: 'pol'),
    Student(id: 'pol_009', fullName: 'Efediyi Lilly', email: 'lillyosezeimenlillyefediyi@yahoo.com', phone: '07085459935', photoAssetPath: 'assets/images/students/efediyilillyosezeimen.jpg', departmentId: 'pol'),
    Student(id: 'pol_010', fullName: 'Kabir Hauwa', email: null, phone: null, photoAssetPath: 'assets/images/students/kabirhauwaibrahim.jpg', departmentId: 'pol'),
    Student(id: 'pol_011', fullName: 'Fakoyejo Esther', email: 'esthertoluloperabsf45@gmail.com', phone: '08058733806', photoAssetPath: 'assets/images/students/fakoyejoesthertolutope.jpg', departmentId: 'pol'),
    Student(id: 'pol_012', fullName: 'Clark Brayen', email: null, phone: null, photoAssetPath: 'assets/images/students/clarkbrayenudumenbrayen.jpg', departmentId: 'pol'),
    Student(id: 'pol_013', fullName: 'Abdulrahman Garba', email: null, phone: null, photoAssetPath: 'assets/images/students/abdulrahmangarbakirki.jpg', departmentId: 'pol'),
    Student(id: 'pol_014', fullName: 'Guza Ishaku Muhammad', email: 'muhammadishakuguza@yahoo.com', phone: '08035571171', photoAssetPath: 'assets/images/students/guzaishakumuhammad.jpg', departmentId: 'pol'),
    Student(id: 'pol_015', fullName: 'Suleiman Adamu', email: null, phone: null, photoAssetPath: 'assets/images/students/suleimanadamumaina.jpg', departmentId: 'pol'),
    Student(id: 'pol_016', fullName: 'Abdullahi Abdulkarim', email: null, phone: '08099587249', photoAssetPath: 'assets/images/students/abdullahiabdulkarim.jpg', departmentId: 'pol'),
    Student(id: 'pol_017', fullName: 'Ibrahim Zannah', email: null, phone: null, photoAssetPath: 'assets/images/students/ibrahimzannahmustapha.jpg', departmentId: 'pol'),
    Student(id: 'pol_018', fullName: 'Muhammad Sani', email: 'saniabdullahiabdullahims76@gmail.com', phone: '07031338380', photoAssetPath: 'assets/images/students/muhammadsaniabdullahi.jpg', departmentId: 'pol'),
    Student(id: 'pol_019', fullName: 'Jajere Fatima', email: null, phone: null, photoAssetPath: 'assets/images/students/jajerefatimaabba.jpg', departmentId: 'pol'),
    Student(id: 'pol_020', fullName: 'Nasidi Umar', email: 'umarmuhammednasidiu@gmail.com', phone: '08030497619', photoAssetPath: 'assets/images/students/nasidiumarmohammed.jpg', departmentId: 'pol'),
    Student(id: 'pol_021', fullName: 'Ismail Mustapha', email: 'mustaphaabubakarmiabubakar01@gmail.com', phone: '08031561116', photoAssetPath: 'assets/images/students/ismailmustaphaabubakar.jpg', departmentId: 'pol'),
    Student(id: 'pol_022', fullName: 'Muhammad Razan', email: null, phone: null, photoAssetPath: 'assets/images/students/muhammadrazanibrahim.jpg', departmentId: 'pol'),
    Student(id: 'pol_023', fullName: 'Fatimah Immamuddeen', email: null, phone: null, photoAssetPath: 'assets/images/students/fatimaimmamuddeen.jpg', departmentId: 'pol'),
    Student(id: 'pol_024', fullName: 'Maimuna Aminu Usman', email: null, phone: null, photoAssetPath: 'assets/images/students/maimunaaminuusman.jpg', departmentId: 'pol'),
  ];

  // ==================== DEPARTMENTS ====================

  static final Department businessAdministration = Department(
    id: 'buss',
    name: 'Business Administration',
    shortName: 'Business Admin',
    logoAssetPath: 'assets/images/departments/bus.png',
    headOfDepartment: const Official(
      name: 'Dr. Abdulrahman Isik',
      title: 'HOD, Business Administration',
      photoAssetPath: 'assets/images/officials/hodbusadmin.png',
    ),
    students: _businessStudents,
  );

  static final Department petroChemistry = Department(
    id: 'chem',
    name: 'Petro-Chemistry',
    shortName: 'Petro-Chemistry',
    logoAssetPath: 'assets/images/departments/chem.png',
    headOfDepartment: const Official(
      name: 'Dr. Sherali Tursunbandalov',
      title: 'HOD, Petro-Chemistry',
      photoAssetPath: 'assets/images/officials/hodchem.png',
    ),
    students: _chemistryStudents,
  );

  static final Department computerScience = Department(
    id: 'csc',
    name: 'Computer Science',
    shortName: 'Computer Sci.',
    logoAssetPath: 'assets/images/departments/csc.png',
    headOfDepartment: const Official(
      name: 'Assoc. Prof. Dr. Musa Muhammed',
      title: 'HOD, Computer Science',
      photoAssetPath: 'assets/images/officials/hodcsc.png',
    ),
    students: _computerScienceStudents,
  );

  static final Department economics = Department(
    id: 'econs',
    name: 'Economics',
    shortName: 'Economics',
    logoAssetPath: 'assets/images/departments/econ.png',
    headOfDepartment: const Official(
      name: 'Dr. Gylych Jelilov',
      title: 'HOD, Economics',
      photoAssetPath: 'assets/images/officials/hodecons.jpg',
    ),
    students: _economicsStudents,
  );

  static final Department electricalEngineering = Department(
    id: 'eee',
    name: 'Electrical & Electronics Engineering',
    shortName: 'Elect. Elect. Engr.',
    logoAssetPath: 'assets/images/departments/eee.png',
    headOfDepartment: const Official(
      name: 'Mr. Ismail Farouk Labaran',
      title: 'HOD, Electrical & Electronics Engineering',
      photoAssetPath: 'assets/images/officials/hodeee.png',
    ),
    students: _electricalEngineeringStudents,
  );

  static final Department english = Department(
    id: 'eng',
    name: 'English',
    shortName: 'English',
    logoAssetPath: 'assets/images/departments/eng.png',
    headOfDepartment: const Official(
      name: 'Dr. Onyebuchi James Ile',
      title: 'HOD, English',
      photoAssetPath: 'assets/images/officials/hodeng.png',
    ),
    students: _englishStudents,
  );

  static final Department politicalScience = Department(
    id: 'pol',
    name: 'Political Science & International Relations',
    shortName: 'Pol. Sci. & Int\'l Relations',
    logoAssetPath: 'assets/images/departments/pol.png',
    headOfDepartment: const Official(
      name: 'PhD.c Levent Demiroglu',
      title: 'HOD, Political Science & International Relations',
      photoAssetPath: 'assets/images/officials/hodpol.png',
    ),
    students: _politicalScienceStudents,
  );

  // ==================== ALL DEPARTMENTS LIST ====================

  static final List<Department> allDepartments = [
    businessAdministration,
    petroChemistry,
    computerScience,
    economics,
    electricalEngineering,
    english,
    politicalScience,
  ];

  // ==================== UTILITY METHODS ====================

  /// Get a department by its ID
  static Department? getDepartmentById(String departmentId) {
    try {
      return allDepartments.firstWhere((dept) => dept.id == departmentId);
    } catch (e) {
      return null;
    }
  }

  /// Get all students across all departments
  static List<Student> getAllStudents() {
    return allDepartments.expand((dept) => dept.students).toList();
  }

  /// Search for students across all departments
  static List<Student> searchStudents(String query) {
    if (query.isEmpty) return [];
    return getAllStudents().where((student) => student.matchesQuery(query)).toList();
  }

  /// Get total number of students
  static int get totalStudentCount {
    return allDepartments.fold(0, (sum, dept) => sum + dept.studentCount);
  }

  /// Get a student by ID across all departments
  static Student? getStudentById(String studentId) {
    for (final dept in allDepartments) {
      final student = dept.getStudentById(studentId);
      if (student != null) return student;
    }
    return null;
  }

  // ==================== CREDITS DATA ====================

  static const List<Map<String, String>> creditsData = [
    {'section': 'header', 'text': 'Alhamdulillahi rabbil alamin'},
    {'section': 'contributors', 'title': 'Contributors'},
    // Additional credits to be extracted from Credits activity
  ];
}
