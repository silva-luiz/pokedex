import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/shared/shared_module.dart';

import 'pokemon_profile_binds.dart';
import 'pokemon_profile_routes.dart';

class PokemonProfileModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  void binds(Injector i) => pokemonProfileBinds(i);

  @override
  void routes(RouteManager r) => pokemonProfileRoutes(r);
}
