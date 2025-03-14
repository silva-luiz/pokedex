import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/auth/auth_module.dart';
import 'package:pokedex/src/home/home_module.dart';
import 'package:pokedex/src/teams/teams_module.dart';
import 'package:pokedex/src/pokemon_profile/pokemon_profile_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
        HomeModule(),
        PokemonProfileModule(),
        TeamsModule(),
      ];

  @override
  void routes(r) {
    r.module('/', module: AuthModule());
    r.module('/home', module: HomeModule());
    r.module('/pokemon-profile', module: PokemonProfileModule());
    r.module('/my-teams', module: TeamsModule());
  }
}
