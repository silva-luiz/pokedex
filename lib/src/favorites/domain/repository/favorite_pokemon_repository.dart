import '../entities/favorite_pokemon_entity.dart';

abstract class FavoritePokemonRepository {
  Future<void> addFavoritePokemon(FavoritePokemonEntity pokemon);
  Future<void> removeFavoritePokemon(String favoriteId);
  Stream<List<FavoritePokemonEntity>> getFavoritePokemons(String userId);
}
