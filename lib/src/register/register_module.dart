import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/home/presenter/pages/home_page.dart';
import 'package:pokedex/src/register/presenter/pages/register_page.dart';
import 'package:pokedex/src/shared/shared_module.dart';

class RegisterModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  void binds(Injector i) {
    // i.add(HomeDatasource.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const RegisterPage());
  }
}
