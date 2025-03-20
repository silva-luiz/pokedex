import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/register/presenter/pages/register_page.dart';
import 'package:pokedex/src/shared/shared_module.dart';

import 'register_binds.dart';

class RegisterModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  void binds(Injector i) => registerBinds(i);

  @override
  routes(RouteManager r) => RegisterPage();
}
