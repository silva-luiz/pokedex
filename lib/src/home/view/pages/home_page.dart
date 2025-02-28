import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pokedex/src/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/home/domain/repository/home_repository.dart';
import 'package:pokedex/src/home/view/widgets/pokemon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<PokemonEntity> pokemons = [];
  late List<PokemonEntity> filteredPokemons = [];
  String _version = '';

  final TextEditingController searchController = TextEditingController();

  Future<void> _loadVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = '${packageInfo.version} (${packageInfo.buildNumber})';
    });
  }

  @override
  void initState() {
    _loadVersion();
    HomeRepository().getPokemons().then((value) {
      setState(() {
        pokemons = value;
        filteredPokemons = value;
      });
    });

    searchController.addListener(onChangedText);
    super.initState();
  }

  void onChangedText() {
    setState(() {});
    filteredPokemons = pokemons
        .where((pokemon) => pokemon.pokemonName.contains(searchController.text))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Pokedex - v$_version',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: searchController,
                  ),
                ),
              ),
              const Icon(Icons.search)
            ],
          ),
        ),
      ),
      body: filteredPokemons.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'Lista de Pokémons',
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
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3 / 4,
                      ),
                      itemCount: filteredPokemons.length,
                      itemBuilder: (context, index) {
                        final pokemon = filteredPokemons[index];
                        return PokemonWidget(
                          pokemonName: pokemon.pokemonName,
                          pokemonUrl: pokemon.pokemonUrl,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
