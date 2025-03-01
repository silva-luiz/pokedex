class PokemonTypeResponseDto {
  final String name;
  final String url;

  PokemonTypeResponseDto({
    required this.name,
    required this.url,
  });

  factory PokemonTypeResponseDto.fromJson(Map<String, dynamic> json) {
    return PokemonTypeResponseDto(
      name: json['name'] ?? 'Tipo desconhecido',
      url: json['url'] ?? '',
    );
  }
}
