import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/pokemon_profile/data/datasource/pokemon_profile_datasource.dart';
import 'package:pokedex/src/pokemon_profile/view/pages/pokemon_profile_page.dart';
import 'package:pokedex/src/shared/shared_module.dart';

class PokemonProfileModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  void binds(Injector i) {
    i.add(PokemonProfileDatasource.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/:name',
        child: (_) => PokemonProfilePage(
              pokemonName: r.args.data['name'] ?? '',
            ));
  }
}
