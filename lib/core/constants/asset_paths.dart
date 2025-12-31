/// Asset path constants for NUN 2015 Graduation App
class AssetPaths {
  // Prevent instantiation
  AssetPaths._();

  // Base Paths
  static const String _imagesBase = 'assets/images';
  static const String _audioBase = 'assets/audio';

  // Logos
  static const String logoConvocation = '$_imagesBase/logos/convocationlogolari.png';
  static const String logoLauncher = '$_imagesBase/logos/ic_launcher.png';

  // Audio
  static const String graduationAudio = '$_audioBase/gradaudio.mp3';

  // Directory Paths (for dynamic asset loading)
  static const String studentsDir = '$_imagesBase/students/';
  static const String officialsDir = '$_imagesBase/officials/';
  static const String departmentsDir = '$_imagesBase/departments/';
  static const String logosDir = '$_imagesBase/logos/';

  // Department Logos
  static const String logoBusiness = '$departmentsDir/bus.png';
  static const String logoChemistry = '$departmentsDir/chem.png';
  static const String logoComputerScience = '$departmentsDir/csc.png';
  static const String logoEconomics = '$departmentsDir/econ.png';
  static const String logoElectrical = '$departmentsDir/eee.png';
  static const String logoEnglish = '$departmentsDir/eng.png';
  static const String logoPolitical = '$departmentsDir/pol.png';
  static const String logoDepartmentDefault = '$departmentsDir/dept.png';

  // Helper method to get student photo path
  static String studentPhoto(String filename) => '$studentsDir$filename';

  // Helper method to get official photo path
  static String officialPhoto(String filename) => '$officialsDir$filename';

  // Helper method to get department logo path
  static String departmentLogo(String filename) => '$departmentsDir$filename';
}
