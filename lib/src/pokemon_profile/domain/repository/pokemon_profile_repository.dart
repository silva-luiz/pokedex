import 'package:pokedex/src/pokemon_profile/domain/entities/pokemon_profile_entity.dart';

abstract class PokemonProfileRepository {
  Future<PokemonProfileEntity> getPokemon(pokemonName);
}
