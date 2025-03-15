import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import '../../../shared/scaffold/poke_scaffold_widget.dart';
import '../../../shared/widgets/buttons/generic_button.dart';
import '../../../shared/widgets/inputs/generic_input.dart';
import '../../../shared/widgets/outlined_text/outlined_text_widget.dart';
import '../../domain/validators/register_validators.dart';
import '../viewmodels/register_viewmodel.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (context, viewModel, _) {
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
                    controller: viewModel.emailController,
                    hintText: 'Enter your e-mail',
                    suffixIcon: Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  PasswordInput(
                    validator: PasswordValidator.validate,
                    controller: viewModel.passwordController,
                    hintText: 'Enter your password',
                  ),
                  PasswordInput(
                    validator: PasswordValidator.validate,
                    controller: viewModel.rePasswordController,
                    hintText: 'Re-enter your password',
                  ),
                  const SizedBox(height: 20),
                  GenericButton.primary(
                    label: 'Create Pokédex',
                    onPressed: () => viewModel.registerUser(context),
                  ),
                  GenericButton.tertiary(
                    label: 'Go back',
                    onPressed: () {
                      Modular.to.canPop()
                          ? Modular.to.pop()
                          : Modular.to.navigate('/');
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
