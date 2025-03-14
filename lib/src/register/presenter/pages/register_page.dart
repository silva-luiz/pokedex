import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/shared/scaffold/poke_scaffold_widget.dart';
import 'package:pokedex/src/shared/widgets/buttons/generic_button.dart';
import 'package:pokedex/src/shared/widgets/inputs/generic_input.dart';
import 'package:pokedex/src/shared/widgets/outlined_text/outlined_text_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PokeScaffoldWidget(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const OutlinedTextWidget(text: 'Registro'),
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
            const GenericInput(
              hintText: 'Enter your e-mail',
              suffixIcon: Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
            ),
            const PasswordInput(
              hintText: 'Enter your password',
            ),
            const PasswordInput(
              hintText: 'Re-enter your password',
            ),
            const SizedBox(height: 20),
            GenericButton.primary(label: 'Create Pokédex', onPressed: () {}),
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
