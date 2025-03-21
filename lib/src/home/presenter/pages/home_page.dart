import 'package:flutter/material.dart';
import 'package:pokedex/src/home/presenter/widgets/pokemon_widget.dart';
import 'package:pokedex/src/home/presenter/widgets/search_text_field_widget.dart';
import 'package:pokedex/src/shared/colors/colors.dart';
import 'package:pokedex/src/shared/widgets/drawer/poke_drawer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/src/home/presenter/viewmodels/home_view_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Modular.get<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Welcome to Pokédex',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Observer(
                    builder: (_) {
                      return SearchTextFieldWidget(
                        controller: homeViewModel.searchController,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const PokeDrawer(),
      body: Observer(
        builder: (_) {
          if (homeViewModel.filteredPokemons.isEmpty) {
            return const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.orange,
                    size: 35,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'No Pokémon found!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Pokémons list',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: homeViewModel.filteredPokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = homeViewModel.filteredPokemons[index];
                      return PokemonWidget(
                        pokemonName: pokemon.pokemonName,
                        pokemonUrl: pokemon.pokemonUrl,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
