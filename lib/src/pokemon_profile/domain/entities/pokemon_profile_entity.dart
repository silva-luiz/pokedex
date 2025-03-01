import 'package:pokedex/src/pokemon_profile/data/models/pokemon_stat_response_dto.dart';

class PokemonProfileEntity {
  final String name;
  final int id;
  final int height;
  final int weight;
  final List<PokemonStatResponseDto> stats;
  final List<String> types;

  PokemonProfileEntity({
    required this.name,
    required this.id,
    required this.height,
    required this.weight,
    required this.stats,
    required this.types,
  });
}
