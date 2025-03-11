import 'package:flutter/material.dart';
import 'package:pokedex/src/home/presenter/viewmodels/home_view_model.dart';
import 'package:pokedex/src/home/presenter/widgets/pokemon_widget.dart';
import 'package:pokedex/src/home/presenter/widgets/search_text_field_widget.dart';
import 'package:pokedex/src/shared/widgets/poke_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'Welcome to Pokédex',
            style: TextStyle(
              color: Colors.white,
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
                    child: Consumer<HomeViewModel>(
                      builder: (context, viewModel, _) {
                        return SearchTextFieldWidget(
                          controller: viewModel.searchController,
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
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.filteredPokemons.isEmpty) {
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
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 3 / 4,
                      ),
                      itemCount: viewModel.filteredPokemons.length,
                      itemBuilder: (context, index) {
                        final pokemon = viewModel.filteredPokemons[index];
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
      ),
    );
  }
}
