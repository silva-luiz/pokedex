import 'package:flutter/material.dart';
import 'package:pokedex/src/pokemon_profile/data/repository/pokemon_profile_repository_impl.dart';
import 'package:pokedex/src/pokemon_profile/domain/entities/pokemon_profile_entity.dart';
import 'package:pokedex/src/pokemon_profile/view/widgets/pokemon_value_indicator_widget.dart';

class PokemonProfilePage extends StatefulWidget {
  final String pokemonName;

  const PokemonProfilePage({
    super.key,
    required this.pokemonName,
  });

  @override
  _PokemonProfilePageState createState() => _PokemonProfilePageState();
}

class _PokemonProfilePageState extends State<PokemonProfilePage> {
  late Future<PokemonProfileEntity> _pokemonFuture;

  @override
  void initState() {
    super.initState();
    // Aqui você usa o pokemonName passado pelo Widget diretamente
    _pokemonFuture =
        PokemonProfileRepositoryImpl().getPokemon(widget.pokemonName);
  }

  String _getPokemonImageUrl(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Informações do Pokémon',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: FutureBuilder<PokemonProfileEntity>(
        future: _pokemonFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 50),
                  Text('Erro: ${snapshot.error}'),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            final pokemon = snapshot.data!;
            final pokemonHeight = (pokemon.height / 10);
            final pokemonWeight = (pokemon.weight / 10);
            return SingleChildScrollView(
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
                      Image.network(
                        _getPokemonImageUrl(pokemon.id),
                        scale: 0.5,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error,
                              color: Colors.red, size: 50);
                        },
                      ),
                      PokemonValueIndicatorWidget(
                        label: 'Altura: $pokemonHeight m',
                        value: pokemonHeight.toInt(),
                        totalValue: 5,
                        color: Colors.lightBlue,
                      ),
                      PokemonValueIndicatorWidget(
                        label: 'Peso: ${pokemon.weight / 10} kg',
                        value: pokemonWeight.toInt(),
                        totalValue: 1000,
                        color: Colors.green,
                      ),
                      PokemonValueIndicatorWidget(
                        label:
                            '${pokemon.stats[0].statName}: ${pokemon.stats[0].baseStat}',
                        value: pokemonWeight.toInt(),
                        totalValue: 255,
                        color: Colors.redAccent,
                      ),
                      PokemonValueIndicatorWidget(
                        label:
                            '${pokemon.stats[1].statName}: ${pokemon.stats[1].baseStat}',
                        value: pokemonWeight.toInt(),
                        totalValue: 180,
                        color: Colors.deepPurpleAccent,
                      ),
                      PokemonValueIndicatorWidget(
                        label:
                            '${pokemon.stats[2].statName}: ${pokemon.stats[2].baseStat}',
                        value: pokemonWeight.toInt(),
                        totalValue: 230,
                        color: Colors.blue,
                      ),
                      PokemonValueIndicatorWidget(
                        label:
                            '${pokemon.stats[3].statName}: ${pokemon.stats[3].baseStat}',
                        value: pokemonWeight.toInt(),
                        totalValue: 180,
                        color: Colors.teal,
                      ),
                      PokemonValueIndicatorWidget(
                        label:
                            '${pokemon.stats[4].statName}: ${pokemon.stats[4].baseStat}',
                        value: pokemonWeight.toInt(),
                        totalValue: 230,
                        color: Colors.lime,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text('Nenhum dado disponível.'));
          }
        },
      ),
    );
  }
}
