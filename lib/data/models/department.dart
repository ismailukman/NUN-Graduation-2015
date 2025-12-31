import 'student.dart';
import 'official.dart';

class Department {
  final String id;
  final String name;
  final String shortName;
  final String logoAssetPath;
  final Official headOfDepartment;
  final List<Student> students;

  const Department({
    required this.id,
    required this.name,
    required this.shortName,
    required this.logoAssetPath,
    required this.headOfDepartment,
    required this.students,
  });

  /// Get the number of students in this department
  int get studentCount => students.length;

  /// Get a student by ID
  Student? getStudentById(String studentId) {
    try {
      return students.firstWhere((student) => student.id == studentId);
    } catch (e) {
      return null;
    }
  }

  /// Search students within this department
  List<Student> searchStudents(String query) {
    if (query.isEmpty) return [];

    return students.where((student) => student.matchesQuery(query)).toList();
  }

  /// Create a copy of this department with some fields replaced
  Department copyWith({
    String? id,
    String? name,
    String? shortName,
    String? logoAssetPath,
    Official? headOfDepartment,
    List<Student>? students,
  }) {
    return Department(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      logoAssetPath: logoAssetPath ?? this.logoAssetPath,
      headOfDepartment: headOfDepartment ?? this.headOfDepartment,
      students: students ?? this.students,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Department && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Department{id: $id, name: $name, studentCount: $studentCount}';
  }
}
