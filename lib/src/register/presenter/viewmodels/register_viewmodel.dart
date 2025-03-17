import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/register/data/datasource/user_register_datasource.dart';
import 'package:pokedex/src/register/domain/entities/user_entity.dart';
import 'package:pokedex/src/shared/widgets/buttons/generic_button.dart';

import '../widgets/generic_dialog_widget.dart';

class RegisterViewModel extends ChangeNotifier {
  final UserRegisterDatasource _userRegisterDatasource =
      UserRegisterDatasource();

  // Controladores de texto
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  // Função de registro
  Future<void> registerUser(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final rePassword = rePasswordController.text.trim();

    // Verificar se as senhas correspondem
    if (password != rePassword) {
      _showErrorDialog(context, 'Passwords do not match');
      return;
    }

    final user = UserEntity(userEmail: email, userPassword: password);

    try {
      // Tenta registrar o usuário
      await _userRegisterDatasource.registerUser(user);

      _showSuccessDialog(
          context, 'User registered successfully. Now you can go log in.');
    } catch (error) {
      _showErrorDialog(context, 'Failed to register user: $error');
    }
  }

  // Exibe o diálogo de erro
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => GenericDialogWidget(
        title: 'Error',
        content: message,
        actions: [
          GenericButton(
            label: 'OK',
            onPressed: () => Modular.to.pop(),
          ),
        ],
      ),
    );
  }

  // Exibe o diálogo de sucesso
  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => GenericDialogWidget(
        title: 'Success',
        content: message,
        actions: [
          GenericButton(
            label: 'Go to Login',
            onPressed: () => Modular.to.navigate('/'),
          ),
        ],
      ),
    );
  }
}
