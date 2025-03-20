import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/home/home_routes.dart';
import 'package:pokedex/src/shared/shared_module.dart';

import 'home_binds.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  void binds(Injector i) => homeBinds(i);

  @override
  void routes(RouteManager r) => homeRoutes(r);
}
