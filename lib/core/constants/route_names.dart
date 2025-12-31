/// Navigation route constants for go_router
class RouteNames {
  // Prevent instantiation
  RouteNames._();

  // Core Routes
  static const String splash = '/';
  static const String officials = '/officials';
  static const String mainMenu = '/menu';
  static const String search = '/search';
  static const String credits = '/credits';

  // Department Route (parameterized)
  static const String department = '/department/:id';

  // Helper method to generate department route
  static String departmentRoute(String departmentId) => '/department/$departmentId';

  // Department IDs (for type safety)
  static const String deptBusiness = 'buss';
  static const String deptChemistry = 'chem';
  static const String deptComputerScience = 'csc';
  static const String deptEconomics = 'econs';
  static const String deptElectrical = 'eee';
  static const String deptEnglish = 'eng';
  static const String deptPolitical = 'pol';
}
