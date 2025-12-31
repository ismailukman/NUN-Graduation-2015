class Student {
  final String id;
  final String fullName;
  final String? email;
  final String? phone;
  final String photoAssetPath;
  final String departmentId;

  const Student({
    required this.id,
    required this.fullName,
    this.email,
    this.phone,
    required this.photoAssetPath,
    required this.departmentId,
  });

  /// Helper method for search functionality
  /// Returns true if student matches the search query
  bool matchesQuery(String query) {
    if (query.isEmpty) return false;

    final lowerQuery = query.toLowerCase();
    return fullName.toLowerCase().contains(lowerQuery) ||
        (email?.toLowerCase().contains(lowerQuery) ?? false) ||
        (phone?.contains(query) ?? false);
  }

  /// Generate text for sharing student contact information
  String toShareText() {
    final buffer = StringBuffer();
    buffer.writeln(fullName);
    if (email != null && email!.isNotEmpty) {
      buffer.writeln(email);
    }
    if (phone != null && phone!.isNotEmpty) {
      buffer.writeln(phone);
    }
    buffer.writeln('NUN 2015 Graduate');
    return buffer.toString();
  }

  /// Create a copy of this student with some fields replaced
  Student copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phone,
    String? photoAssetPath,
    String? departmentId,
  }) {
    return Student(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoAssetPath: photoAssetPath ?? this.photoAssetPath,
      departmentId: departmentId ?? this.departmentId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Student && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Student{id: $id, fullName: $fullName, email: $email, phone: $phone}';
  }
}
