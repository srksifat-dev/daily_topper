

class SourceModel {
  final String? id;
  final String? name;
  final String? publishedAt;

  const SourceModel({
    this.id,
    this.name,
    this.publishedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourceModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          publishedAt == other.publishedAt);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ publishedAt.hashCode;

  @override
  String toString() {
    return 'SourceModel{ id: $id, name: $name, publishedAt: $publishedAt,}';
  }

  SourceModel copyWith({
    String? id,
    String? name,
    String? publishedAt,
  }) {
    return SourceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'publishedAt': publishedAt,
    };
  }

  factory SourceModel.fromMap(Map<String, dynamic> map) {
    return SourceModel(
      id: map['id'] as String,
      name: map['name'] as String,
      publishedAt: map['publishedAt'] as String,
    );
  }
}
