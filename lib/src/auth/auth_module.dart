import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/auth/auth_binds.dart';
import 'package:pokedex/src/auth/auth_routes.dart';
import 'package:pokedex/src/shared/shared_module.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  void binds(Injector i) => authBinds(i);

  @override
  void routes(RouteManager r) => authRoutes(r);
}
