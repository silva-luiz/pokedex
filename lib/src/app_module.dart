import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/auth/auth_module.dart';
import 'package:pokedex/src/home/home_module.dart';
import 'package:pokedex/src/register/register_module.dart';
import 'package:pokedex/src/teams/teams_module.dart';
import 'package:pokedex/src/pokemon_profile/pokemon_profile_module.dart';

import 'favorites/favorites_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
        RegisterModule(),
        HomeModule(),
        PokemonProfileModule(),
        FavoritesModule(),
        TeamsModule(),
      ];

  @override
  void routes(r) {
    r
      ..module('/', module: AuthModule())
      ..module('/register', module: RegisterModule())
      ..module('/home', module: HomeModule())
      ..module('/pokemon-profile', module: PokemonProfileModule())
      ..module('/favorites', module: FavoritesModule())
      ..module('/my-teams', module: TeamsModule());
  }
}
