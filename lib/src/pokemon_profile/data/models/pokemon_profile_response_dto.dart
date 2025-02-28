import 'package:pokedex/src/pokemon_profile/data/models/pokemon_stat_response_dto.dart';
import 'package:pokedex/src/pokemon_profile/domain/entities/pokemon_profile_entity.dart';

class PokemonProfileResponseDto extends PokemonProfileEntity {
  PokemonProfileResponseDto({
    required super.name,
    required super.id,
    required super.height,
    required super.weight,
    required List<PokemonStatResponseDto> stats,
  }) : super(stats: stats);

  factory PokemonProfileResponseDto.fromJson(Map<String, dynamic> json) {
    print('JSON AQUI $json');
    return PokemonProfileResponseDto(
      name: json['name'] ?? 'Pokemon desconhecido',
      id: json['id'] ?? 00,
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      stats: (json['stats'] as List<dynamic>)
          .map((statJson) => PokemonStatResponseDto.fromJson(statJson))
          .toList(), // Mapeia os stats da lista de JSON
    );
  }
}
