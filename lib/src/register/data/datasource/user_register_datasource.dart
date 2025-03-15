import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';

class UserRegisterDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future registerUser(UserEntity user) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.userEmail,
        password: user.userPassword,
      );
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }
}
