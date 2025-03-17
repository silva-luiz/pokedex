import '../entities/user_entity.dart';

abstract class UserRegisterRepository {
  Future<Map<String, dynamic>> registerUser(UserEntity user);
}
