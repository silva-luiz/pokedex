import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/home/domain/entities/pokemon_entity.dart';

class HomeDatasource {
  final _client = Modular.get<Dio>();

  Future<List<PokemonEntity>> getPokemons() async {
    final result = await _client
        .get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=1310');

    final pokemons = (result.data['results'] as List).map((e) {
      final id = int.parse(e['url'].split('/')[6]);
      return PokemonEntity(
        pokemonId: id.toString(),
        pokemonName: e['name'],
        pokemonUrl: e['url'],
      );
    }).toList();

    return pokemons;
  }
}
