import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/register/data/datasource/user_register_datasource.dart';
import 'package:pokedex/src/register/domain/entities/user_entity.dart';

import '../../../shared/scaffold/poke_scaffold_widget.dart';
import '../../../shared/widgets/buttons/generic_button.dart';
import '../../../shared/widgets/inputs/generic_input.dart';
import '../../../shared/widgets/outlined_text/outlined_text_widget.dart';
import '../../domain/validators/register_validators.dart';
import '../widgets/generic_dialog_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  // Fonte de dados para registrar o usuário
  final UserRegisterDatasource _userRegisterDatasource =
      UserRegisterDatasource();

  // Função para registrar o usuário
  Future<void> _registerUser(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final rePassword = _rePasswordController.text.trim();

    // Verificar se as senhas correspondem
    if (password != rePassword) {
      _showErrorDialog(context, 'Passwords do not match');
      return;
    }

    final user = UserEntity(userEmail: email, userPassword: password);

    try {
      // Tenta registrar o usuário usando a fonte de dados
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

  @override
  Widget build(BuildContext context) {
    return PokeScaffoldWidget(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const OutlinedTextWidget(text: 'Register'),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Fill in the following details to create a new Pokédex account',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GenericInput(
              validator: EmailValidator.validate,
              controller: _emailController,
              hintText: 'Enter your e-mail',
              suffixIcon: Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
            ),
            PasswordInput(
              validator: PasswordValidator.validate,
              controller: _passwordController,
              hintText: 'Enter your password',
            ),
            PasswordInput(
              validator: PasswordValidator.validate,
              controller: _rePasswordController,
              hintText: 'Re-enter your password',
            ),
            const SizedBox(height: 20),
            GenericButton.primary(
              label: 'Create Pokédex',
              onPressed: () {
                _registerUser(context);
              },
            ),
            GenericButton.tertiary(
                label: 'Go back',
                onPressed: () {
                  Modular.to.canPop()
                      ? Modular.to.pop()
                      : Modular.to.navigate('/');
                }),
          ],
        ),
      ),
    );
  }
}
