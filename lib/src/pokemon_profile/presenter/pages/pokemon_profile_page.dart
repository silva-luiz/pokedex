import 'package:flutter/material.dart';
import 'package:pokedex/src/pokemon_profile/domain/entities/pokemon_profile_entity.dart';
import 'package:pokedex/src/pokemon_profile/presenter/viewmodels/pokemon_profile_viewmodel.dart';
import 'package:pokedex/src/pokemon_profile/presenter/widgets/pokemon_value_indicator_widget.dart';
import 'package:pokedex/src/shared/colors/colors.dart';
import 'package:provider/provider.dart';

class PokemonProfilePage extends StatelessWidget {
  final String pokemonName;

  const PokemonProfilePage({
    super.key,
    required this.pokemonName,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PokemonProfileViewModel(pokemonName),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            'Pokémon Information',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          iconTheme: const IconThemeData(
            color: AppColors.white,
          ),
        ),
        body: Consumer<PokemonProfileViewModel>(
          builder: (context, viewModel, child) {
            return FutureBuilder<PokemonProfileEntity>(
              future: viewModel.pokemonFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error,
                            color: AppColors.primaryColor, size: 50),
                        Text('Erro: ${snapshot.error}'),
                      ],
                    ),
                  );
                } else if (snapshot.hasData) {
                  final pokemon = snapshot.data!;
                  final double pokemonHeight = (pokemon.height / 10);
                  final double pokemonWeight = (pokemon.weight / 10);

                  // Pegando a cor do primeiro tipo do Pokémon
                  Color firstTypeColor =
                      viewModel.typeColorMap[pokemon.types[0]] ?? Colors.grey;

                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          viewModel.typeColorMap[pokemon.types.length > 1
                                  ? pokemon.types[1]
                                  : AppColors.white] ??
                              AppColors.white,
                          pokemon.types.isNotEmpty
                              ? viewModel.typeColorMap[pokemon.types[0]] ??
                                  AppColors.white
                              : AppColors.white,
                        ],
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                pokemon.name.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8.0,
                                children: pokemon.types.map((type) {
                                  Color backgroundColor =
                                      viewModel.typeColorMap[type] ??
                                          Colors.grey;
                                  return Chip(
                                    side: BorderSide.none,
                                    label: Text(
                                      viewModel.capitalizeFirstLetter(type),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: backgroundColor == Colors.yellow
                                            ? AppColors.black
                                            : AppColors.white,
                                      ),
                                    ),
                                    backgroundColor: backgroundColor,
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 16),
                              Image.network(
                                viewModel.getPokemonImageUrl(pokemon.id),
                                scale: 0.3,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error,
                                      color: AppColors.primaryColor, size: 50);
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  'Base Status',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      PokemonValueIndicatorWidget(
                                        label: 'Height: $pokemonHeight m',
                                        value: pokemonHeight.toInt(),
                                        totalValue: 5,
                                        color: Colors.lightBlue,
                                      ),
                                      PokemonValueIndicatorWidget(
                                        label:
                                            'Weight: ${pokemon.weight / 10} kg',
                                        value: pokemonWeight.toInt(),
                                        totalValue: 1000,
                                        color: Colors.green,
                                      ),
                                      PokemonValueIndicatorWidget(
                                        label:
                                            '${pokemon.stats[0].statName.toUpperCase()}: ${pokemon.stats[0].baseStat}',
                                        value: pokemon.stats[0].baseStat,
                                        totalValue: 255,
                                        color: firstTypeColor,
                                      ),
                                      PokemonValueIndicatorWidget(
                                        label: viewModel.capitalizeFirstLetter(
                                            '${pokemon.stats[1].statName}: ${pokemon.stats[1].baseStat}'),
                                        value: pokemon.stats[1].baseStat,
                                        totalValue: 180,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      PokemonValueIndicatorWidget(
                                        label: viewModel.capitalizeFirstLetter(
                                            '${pokemon.stats[2].statName}: ${pokemon.stats[2].baseStat}'),
                                        value: pokemon.stats[2].baseStat,
                                        totalValue: 230,
                                        color: Colors.blue,
                                      ),
                                      PokemonValueIndicatorWidget(
                                        label: viewModel.capitalizeFirstLetter(
                                            '${pokemon.stats[3].statName}: ${pokemon.stats[3].baseStat}'),
                                        value: pokemon.stats[3].baseStat,
                                        totalValue: 180,
                                        color: Colors.teal,
                                      ),
                                      PokemonValueIndicatorWidget(
                                        label: viewModel.capitalizeFirstLetter(
                                            '${pokemon.stats[4].statName}: ${pokemon.stats[4].baseStat}'),
                                        value: pokemon.stats[4].baseStat,
                                        totalValue: 230,
                                        color: Colors.lime,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: Text('Nenhum dado disponível.'));
                }
              },
            );
          },
        ),
      ),
    );
  }
}
