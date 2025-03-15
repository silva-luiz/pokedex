import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/register/presenter/viewmodels/register_viewmodel.dart';
import 'package:provider/provider.dart'; // Adicionando o Provider
import 'package:pokedex/src/app_module.dart';
import 'package:pokedex/src/app_widget.dart';
import 'package:pokedex/src/home/presenter/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Importe o ViewModel e o Repository necessários
import 'package:pokedex/src/auth/data/repository/auth_repository_impl.dart';
import 'package:pokedex/src/auth/presenter/viewmodels/auth_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    // MultiProvider para adicionar o Provider ao app
    MultiProvider(
      providers: [
        // Adicione o AuthViewModel como um Provider
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(AuthRepositoryImpl()),
        ),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
      ],
      child: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
