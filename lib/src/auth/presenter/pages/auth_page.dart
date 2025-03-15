import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/shared/colors/colors.dart';
import 'package:pokedex/src/shared/scaffold/poke_scaffold_widget.dart';
import 'package:pokedex/src/shared/widgets/buttons/generic_button.dart';
import 'package:pokedex/src/shared/widgets/inputs/generic_input.dart';
import 'package:pokedex/src/shared/widgets/outlined_text/outlined_text_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PokeScaffoldWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 120.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: OutlinedTextWidget(text: 'Pokédex'),
              ),
              const SizedBox(height: 20),
              GenericInput(
                controller: _emailController,
                hintText: 'Enter your e-mail',
                suffixIcon: Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
              ),
              PasswordInput(
                controller: _passwordController,
                hintText: 'Enter your password',
              ),
              const SizedBox(height: 20),
              GenericButton.primary(label: 'Login', onPressed: () {}),
              GenericButton.tertiary(
                  label: 'Create Pokédex',
                  onPressed: () => Modular.to.navigate('/register')),
              ElevatedButton(
                onPressed: () => Modular.to.navigate('/home'),
                child: const Text('Go to Home'),
              ), //TODO: RETIRAR DEPOIS QUE A TELA ESTIVER PRONTA
            ],
          ),
        ),
      ),
    );
  }
}
