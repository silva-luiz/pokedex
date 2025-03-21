import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/widgets/drawer/poke_drawer.dart';
import '../../domain/entities/favorite_pokemon_entity.dart';
import '../viewmodels/favorites_viewmodel.dart';

class FavoritesPage extends StatelessWidget {
  final userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    final viewModel = Modular.get<FavoritePokemonsViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('My favorite Pokémons'),
      ),
      drawer: const PokeDrawer(),
      body: StreamBuilder<List<FavoritePokemonEntity>>(
        stream: viewModel.getFavoritePokemons(userId ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return Center(child: Text('No Pokémon found!'));
          } else if (snapshot.data!.isEmpty) {
            return Center(child: Text('VAZIO MEN!'));
          } else {
            return ListView(
              children: snapshot.data!.map((pokemon) {
                return ListTile(
                  leading: Image.network(pokemon.pokemonImage),
                  title: Text(pokemon.pokemonName),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () =>
                        viewModel.removeFavoritePokemon(pokemon.pokemonId),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
