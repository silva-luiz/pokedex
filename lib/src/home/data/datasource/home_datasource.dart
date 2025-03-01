import 'package:dio/dio.dart';
import 'package:pokedex/src/home/domain/entities/pokemon_entity.dart';

class HomeDatasource {
  final Dio _client = Dio();

  Future<List<PokemonEntity>> getPokemons() async {
    final result = await _client
        .get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=1025');

    final pokemons = (result.data['results'] as List)
        .map((e) => PokemonEntity(
              pokemonId: e['name'],
              pokemonName: e['name'],
              pokemonUrl: e['url'],
            ))
        .toList(); // se não converter isso para lista, 'pokemons' será um 'iterable' e não terá as propriedades de lista necessárias

    return pokemons;
  }
}
