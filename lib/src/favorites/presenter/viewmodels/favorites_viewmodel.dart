import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/favorite_pokemon_entity.dart';
import '../../domain/repository/favorite_pokemon_repository.dart';

class FavoritePokemonsViewModel with ChangeNotifier {
  final FavoritePokemonRepository repository;

  FavoritePokemonsViewModel({
    required this.repository,
  });

  Stream<List<FavoritePokemonEntity>> getFavoritePokemons(String userId) {
    final result = repository.getFavoritePokemons(userId);
    return result;
  }

  Future<void> addFavoritePokemon(FavoritePokemonEntity pokemon) async {
    await repository.addFavoritePokemon(pokemon);
    notifyListeners();
  }

  Future<void> removeFavoritePokemon(String favoriteId) async {
    await repository.removeFavoritePokemon(favoriteId);
    notifyListeners();
  }
}
