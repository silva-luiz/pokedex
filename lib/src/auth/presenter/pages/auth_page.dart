import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // MobX
import 'package:package_info_plus/package_info_plus.dart';

import 'package:pokedex/src/shared/colors/colors.dart';
import 'package:pokedex/src/shared/scaffold/poke_scaffold_widget.dart';
import 'package:pokedex/src/shared/widgets/buttons/generic_button.dart';
import 'package:pokedex/src/shared/widgets/inputs/generic_input.dart';
import 'package:pokedex/src/shared/widgets/outlined_text/outlined_text_widget.dart';

import '../viewmodels/auth_viewmodel.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Modular.get<AuthViewmodel>();

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
                suffixIcon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
              ),
              PasswordInput(
                controller: _passwordController,
                hintText: 'Enter your password',
              ),
              const SizedBox(height: 20),
              // Botão de Login com MobX
              Observer(
                builder: (_) {
                  return GenericButton.primary(
                    label: 'Login',
                    onPressed: authViewModel.isLoading
                        ? null
                        : () async {
                            try {
                              await authViewModel.signIn(
                                _emailController.text,
                                _passwordController.text,
                              );
                              Modular.to.navigate('/home');
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login error: $e')),
                              );
                            }
                          },
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return GenericButton.tertiary(
                    label: 'Create Pokédex',
                    onPressed: authViewModel.isLoading
                        ? null
                        : () => Modular.to.navigate('/register'),
                  );
                },
              ),

              Observer(
                builder: (_) {
                  if (authViewModel.isLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(
                        color: AppColors.tertiaryColor,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'App Version: v$_appVersion',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.tertiaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
