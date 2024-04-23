class ApiRoutes {
  static getUser(String username) {
    return '/users/$username';
  }

  static getRepos(String username) {
    return '/users/$username/repos';
  }
}
