import '../../domain/repository/user_register_repository.dart';
import '../datasource/user_register_datasource.dart';
import '../../domain/entities/user_entity.dart'; // Import da entidade

class UserRegisterRepositoryImpl implements UserRegisterRepository {
  final UserRegisterDatasource datasource;

  UserRegisterRepositoryImpl(this.datasource);

  @override
  Future<Map<String, dynamic>> registerUser(UserEntity user) async {
    try {
      // Chamando o datasource com a entidade UserEntity
      final result = await datasource.registerUser(user);

      // Se precisar realizar alguma transformação nos dados recebidos, faça aqui
      return result;
    } catch (e) {
      // Tratamento de erros
      throw Exception('Failed to register user: $e');
    }
  }
}
