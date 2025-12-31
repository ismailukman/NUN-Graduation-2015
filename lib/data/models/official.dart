class Official {
  final String name;
  final String title;
  final String photoAssetPath;

  const Official({
    required this.name,
    required this.title,
    required this.photoAssetPath,
  });

  /// Create a copy of this official with some fields replaced
  Official copyWith({
    String? name,
    String? title,
    String? photoAssetPath,
  }) {
    return Official(
      name: name ?? this.name,
      title: title ?? this.title,
      photoAssetPath: photoAssetPath ?? this.photoAssetPath,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Official &&
        other.name == name &&
        other.title == title &&
        other.photoAssetPath == photoAssetPath;
  }

  @override
  int get hashCode => name.hashCode ^ title.hashCode ^ photoAssetPath.hashCode;

  @override
  String toString() {
    return 'Official{name: $name, title: $title}';
  }
}
