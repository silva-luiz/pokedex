import 'package:flutter/material.dart';
import 'package:pokedex/src/pokemon_profile/data/models/pokemon_profile_response_dto.dart';
import 'package:pokedex/src/pokemon_profile/domain/repository/pokemon_profile_repository.dart';

class PokemonProfileViewmodel extends ChangeNotifier {
  final PokemonProfileRepository _pokemonProfileRepository;

  PokemonProfileViewmodel(this._pokemonProfileRepository);

  Future<void> getPokemon(
      // confirmar se ta certo
      PokemonProfileResponseDto pokemonProfileResponseDto) async {
    await _pokemonProfileRepository.getPokemon(pokemonProfileResponseDto);
  }
}
