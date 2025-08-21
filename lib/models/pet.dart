class Pet {
  final String id;
  final Category category;
  final String name;
  final List<String> photoUrls;
  final List<Tag> tags;
  final String status;
  final String? userId;

  Pet({
    this.userId,

    required this.category,
    required this.name,
    required this.photoUrls,
    required this.tags,
    required this.status,
    required this.id,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      userId: "",
      id:  "",
      category: Category.fromJson(json['category'] ?? {}),
      name: json['name'] ?? '',
      photoUrls: List<String>.from(json['photoUrls'] ?? []),
      tags: (json['tags'] as List<dynamic>? ?? [])
          .map((tag) => Tag.fromJson(tag))
          .toList(),
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      'id': id,
      'category': category.toJson(),
      'name': name,
      'photoUrls': photoUrls,
      'tags': tags.map((tag) => tag.toJson()).toList(),
      'status': status,
    };
  }
}

class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'] ?? 0, name: json['name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

class Tag {
  final int id;
  final String name;

  Tag({required this.id, required this.name});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(id: json['id'] ?? 0, name: json['name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
