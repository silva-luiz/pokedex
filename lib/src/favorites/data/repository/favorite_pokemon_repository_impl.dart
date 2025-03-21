import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/favorite_pokemon_entity.dart';
import '../../domain/repository/favorite_pokemon_repository.dart';
import '../datasource/favorite_pokemon_datasource.dart';
import '../models/favorite_pokemon_dto.dart';

class FavoritePokemonRepositoryImpl implements FavoritePokemonRepository {
  final FavoritePokemonDatasource datasource;

  FavoritePokemonRepositoryImpl({required this.datasource});

  @override
  Future<void> addFavoritePokemon(FavoritePokemonEntity pokemon) async {
    final model = FavoritePokemonDto(
      userId: pokemon.userId,
      pokemonId: pokemon.pokemonId,
      pokemonName: pokemon.pokemonName,
      pokemonImage: pokemon.pokemonImage,
      timestamp: pokemon.timestamp,
    );
    await datasource.addFavoritePokemon(model.toMap());
  }

  @override
  Future<void> removeFavoritePokemon(String favoriteId) async {
    await datasource.removeFavoritePokemon(favoriteId);
  }

  @override
  Stream<List<FavoritePokemonEntity>> getFavoritePokemons(String userId) {
    return datasource.getFavoritePokemons(userId).map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return FavoritePokemonEntity(
          userId: data['userId'],
          pokemonId: data['pokemonId'],
          pokemonName: data['pokemonName'],
          pokemonImage: data['pokemonImage'],
          timestamp: (data['timestamp'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }
}
