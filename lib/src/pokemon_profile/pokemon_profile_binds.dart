import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasource/pokemon_profile_datasource.dart';

void pokemonProfileBinds(Injector i){
  i.addLazySingleton<PokemonProfileDatasource>(PokemonProfileDatasource.new);
}