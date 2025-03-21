class FavoritePokemonEntity {
  final String userId;
  final String pokemonId;
  final String pokemonName;
  final String pokemonImage;
  final DateTime timestamp;

  FavoritePokemonEntity({
    required this.userId,
    required this.pokemonId,
    required this.pokemonName,
    required this.pokemonImage,
    required this.timestamp,
  });
}
