

import '../../domain/repository/user_register_repository.dart';
import '../datasource/user_register_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRegisterDatasource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Future<Map<String, dynamic>> registerUser(String userEmail, String userPassword) async {
    try {
      // Aqui você faz a chamada para o datasource
      final result = await datasource.registerUser(userEmail, userPassword);
      
      // Se precisar realizar alguma transformação nos dados recebidos, faça aqui
      return result;
    } catch (e) {
      // Aqui você pode tratar erros específicos ou retornar uma exceção personalizada
      throw Exception('Failed to register user: $e');
    }
  }
}
