import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/auth/data/repository/auth_repository_impl.dart';
import 'package:pokedex/src/auth/domain/repository/auth_repository.dart';
import 'package:pokedex/src/auth/presenter/pages/auth_page.dart';
import 'package:pokedex/src/auth/presenter/viewmodels/auth_viewmodel.dart';
import 'package:pokedex/src/shared/shared_module.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<AuthRepository>(AuthRepositoryImpl.new);
    i.add<AuthViewModel>(AuthViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const AuthPage(),
    );
  }
}
