import 'package:git_friend/shared/utils/date_format.dart';

class GitUserReposModel {
  // https://api.github.com/users/$user/repos
  num id;
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
}
