import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/widgets/buttons/generic_button.dart';
import '../../data/datasource/user_register_datasource.dart';
import '../../domain/entities/user_entity.dart';
import '../widgets/generic_dialog_widget.dart';

part 'register_viewmodel.g.dart';

class RegisterViewmodel = _RegisterViewmodelBase with _$RegisterViewmodel;

abstract class _RegisterViewmodelBase with Store {
  final UserRegisterDatasource _userRegisterDatasource =
      UserRegisterDatasource();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @observable
  String errorMessage = '';

  @observable
  bool isSuccess = false;

  @action
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
