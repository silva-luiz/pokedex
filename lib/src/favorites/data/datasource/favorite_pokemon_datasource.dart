import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritePokemonDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addFavoritePokemon(Map<String, dynamic> pokemonData) async {
    final userId = pokemonData['userId'];
    final pokemonId = pokemonData['pokemonId'];

    // Verificar se o Pokémon já foi adicionado aos favoritos do usuário
    QuerySnapshot existingFavorite = await _firestore
        .collection('favorites')
        .where('userId', isEqualTo: userId)
        .where('pokemonId', isEqualTo: pokemonId)
        .limit(1)
        .get();

    if (existingFavorite.docs.isNotEmpty) {
      throw Exception('Este Pokémon já está nos seus favoritos.');
    }

    pokemonData['timestamp'] = FieldValue.serverTimestamp();
    await _firestore.collection('favorites').add(pokemonData);
  }

  Future<void> removeFavoritePokemon(String favoriteId) async {
    await _firestore.collection('favorites').doc(favoriteId).delete();
  }

  Stream<QuerySnapshot> getFavoritePokemons(String userId) {
    return _firestore
        .collection('favorites')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
