import 'package:git_friend/shared/utils/date_format.dart';

class GitUserReposModel {
  // https://api.github.com/users/$user/repos
  int? userId;
  int id;
  String name;
  String url;
  String? description;
  String? language;
  String? createdAt;
  String? updatedAt;

  GitUserReposModel({
    required this.id,
    required this.name,
    required this.description,
    required this.language,
    required this.createdAt,
    required this.url,
    required this.updatedAt,
    int? userId,
  });

  factory GitUserReposModel.fromJson(Map<String, dynamic> json) {
    return GitUserReposModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      language: json['language'],
      createdAt: dateFormat(DateTime.parse(json['created_at'])),
      updatedAt: dateFormat(DateTime.parse(json['updated_at'])),
      url: json['html_url'],
    );
  }

  @override
  String toString() =>
      'GitUserReposModel(id: $id, name: $name, description: $description, language: $language, createdAt: $createdAt, url: $url, updatedAt: $updatedAt)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': userId,
      'id': id,
      'name': name,
      'url': url,
      'description': description,
      'language': language,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory GitUserReposModel.fromMap(Map<String, dynamic> map) {
    return GitUserReposModel(
      id: map['id'] as int,
      userId: map['user_id'] as int,
      name: map['name'] as String,
      url: map['url'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }
}
