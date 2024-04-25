abstract class UserDatabaseDAO {
  Future<void> insertUser(Map<String, dynamic> user);

  Future<List<Map<String, dynamic>>> getUsers();

  Future<void> deleteUser(int userId);

  Future<void> insertRepository(List<Map<String, dynamic>> repositories);

  Future<List<Map<String, dynamic>>> getRepositoriesByUserId(int userId);
}
