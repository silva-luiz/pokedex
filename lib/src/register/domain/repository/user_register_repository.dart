abstract class UserRepository {
  Future<Map<String, dynamic>> registerUser(String userEmail, String userPassword);
}
