class PokemonStatResponseDto {
  final int baseStat;
  final int effort;
  final String statName;

  PokemonStatResponseDto({
    required this.baseStat,
    required this.effort,
    required this.statName,
  });

  factory PokemonStatResponseDto.fromJson(Map<String, dynamic> json) {
    return PokemonStatResponseDto(
      baseStat: json['base_stat'] ?? 0,
      effort: json['effort'] ?? 0,
      statName: json['stat']['name'] ?? 'Unknown stat',
    );
  }
}
