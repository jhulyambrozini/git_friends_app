class GitUserModel {
  // https://api.github.com/users/$user
  int userId;
  String login;
  String avatar;
  String url;
  String name;
  String blog;
  String? email;
  String? description;
  String? twitter;
  int reposQuantity;
  int followers;
  int following;

  GitUserModel({
    required this.userId,
    required this.login,
    required this.avatar,
    required this.url,
    required this.name,
    required this.blog,
    required this.reposQuantity,
    required this.followers,
    required this.following,
    this.email,
    this.description,
    this.twitter,
  });

  factory GitUserModel.fromJson(Map<String, dynamic> json) {
    return GitUserModel(
      userId: json['id'],
      login: json['login'],
      avatar: json['avatar_url'],
      url: json['html_url'],
      name: json['name'] ?? '',
      email: json['email'],
      blog: json['blog'],
      description: json['bio'],
      twitter: json['twitter_username'],
      reposQuantity: json['public_repos'],
      followers: json['followers'],
      following: json['following'],
    );
  }

  @override
  String toString() =>
      'GitUserModel(userId: $userId, login: $login, avatar: $avatar, url: $url, name: $name, email: $email, blog: $blog, description: $description, twitter: $twitter, reposQuantity: $reposQuantity, followers: $followers, following: $following,)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'login': login,
      'avatar': avatar,
      'url': url,
      'name': name,
      'blog': blog,
      'email': email,
      'description': description,
      'twitter': twitter,
      'reposQuantity': reposQuantity,
      'followers': followers,
      'following': following,
    };
  }

  factory GitUserModel.fromMap(Map<String, dynamic> map) {
    return GitUserModel(
      userId: map['userId'] as int,
      login: map['login'] as String,
      avatar: map['avatar'] as String,
      url: map['url'] as String,
      name: map['name'] as String,
      blog: map['blog'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      twitter: map['twitter'] != null ? map['twitter'] as String : null,
      reposQuantity: map['reposQuantity'] as int,
      followers: map['followers'] as int,
      following: map['following'] as int,
    );
  }
}
