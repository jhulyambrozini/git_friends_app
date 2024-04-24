import 'dart:ffi';

import 'package:git_friend/shared/utils/date_format.dart';

class GitUserReposModel {
  // https://api.github.com/users/$user/repos
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
      'name': name,
      'url': url,
      'description': description,
      'language': language,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory GitUserReposModel.fromMap(Map<String, dynamic> map) {
    return GitUserReposModel(
      id: map['id'],
      name: map['name'] as String,
      url: map['url'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }
}
