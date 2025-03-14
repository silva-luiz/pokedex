import 'package:flutter/material.dart';
import 'package:pokedex/src/shared/colors/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: AppColors.white.withOpacity(0.2),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const OutlinedTextWidget(text: 'Pokédex'),
                  const SizedBox(height: 20),
                  const GenericInput(
                    hintText: 'Enter your e-mail',
                    suffixIcon: Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const PasswordInput(
                    hintText: 'Enter your password',
                  ),
                  const SizedBox(height: 20),
                  GenericButton.primary(label: 'Entrar', onPressed: () {}),
                  GenericButton.tertiary(
                      label: 'Criar conta', onPressed: () {}),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Go to Home'),
                  ), //TODO: RETIRAR DEPOIS QUE A TELA ESTIVER PRONTA
                ],
              ),
            ),
            // Rodapé com a versão do app
            Positioned(
              bottom: 20, // Distância do rodapé
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  _appVersion.isNotEmpty
                      ? 'Version $_appVersion'
                      : 'Loading version...',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
