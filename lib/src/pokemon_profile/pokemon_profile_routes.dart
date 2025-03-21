import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/pages/pokemon_profile_page.dart'; // Importe a página do perfil do Pokémon

enum PokemonProfileRouteNamed {
  profile,
}

extension PokemonProfileRouteNamedExtension on PokemonProfileRouteNamed {
  String get _path {
    switch (this) {
      case PokemonProfileRouteNamed.profile:
        return '/:name';
      default:
        return '/';
    }
  }
}

void pokemonProfileRoutes(RouteManager r) {
  r.child(
    PokemonProfileRouteNamed.profile._path,
    child: (context) => PokemonProfilePage(
      pokemonName: r.args.data['name'] ?? '',
    ),
  );
}

@override
void routes(RouteManager r) => pokemonProfileRoutes(r);