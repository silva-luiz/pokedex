import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pokedex/src/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/home/domain/repository/home_repository.dart';
import 'package:pokedex/src/home/presenter/widgets/pokemon_widget.dart';
import 'package:pokedex/src/home/presenter/widgets/search_text_field_widget.dart';

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
    final searchText = searchController.text.toLowerCase();
    final newFilteredPokemons = pokemons.where((pokemon) {
      final pokemonName = pokemon.pokemonName.toLowerCase();
      final pokemonId = pokemon.pokemonId.toString();
      return pokemonName.contains(searchText) || pokemonId.contains(searchText);
    }).toList();

    if (filteredPokemons != newFilteredPokemons) {
      setState(() {
        filteredPokemons = newFilteredPokemons;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Welcome to Pokédex - v$_version',
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
                  padding: const EdgeInsets.all(10.0),
                  child: SearchTextFieldWidget(controller: searchController),
                ),
              ),
            ],
          ),
        ),
      ),
      body: filteredPokemons.isEmpty
          ? const Center(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Padding(
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
