import 'package:pokedex/src/pokemon_profile/data/datasource/pokemon_profile_datasource.dart';
import 'package:pokedex/src/pokemon_profile/data/models/pokemon_profile_response_dto.dart';
import 'package:pokedex/src/pokemon_profile/domain/entities/pokemon_profile_entity.dart';
import 'package:pokedex/src/pokemon_profile/domain/repository/pokemon_profile_repository.dart';

class PokemonProfileRepositoryImpl extends PokemonProfileRepository {
  final _pokemonProfileDatasource = PokemonProfileDatasource();

  @override
  Future<PokemonProfileEntity> getPokemon(pokemonName) async {
    try {
      final response = await _pokemonProfileDatasource.getPokemon(pokemonName);


      final result = PokemonProfileResponseDto.fromJson(response);

      return result;
    } catch (e) {
      throw Exception('Error fetching Pokémon profile: $e');
    }
  }
}
