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
  bool isFavorite;

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
    this.isFavorite = false,
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
      'GitUserModel(userId: $userId, login: $login, avatar: $avatar, url: $url, name: $name, email: $email, blog: $blog, description: $description, twitter: $twitter, reposQuantity: $reposQuantity, followers: $followers, following: $following)';
}
