import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/home/home_module.dart';
import 'package:pokedex/src/pokemon_profile/pokemon_profile_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
        PokemonProfileModule(),
      ];

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
    r.module('/pokemon-profile', module: PokemonProfileModule());
  }
}
