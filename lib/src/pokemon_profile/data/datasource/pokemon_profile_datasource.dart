import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PokemonProfileDatasource {
  final _client = Modular.get<Dio>();

  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<Map<String, dynamic>> getPokemon(String pokemonName) async {
    try {
      final result = await _client.get('$baseUrl$pokemonName');

      return result.data;
    } catch (e) {
      throw Exception('Error fetching the Pokémon: $e');
    }
  }
}
