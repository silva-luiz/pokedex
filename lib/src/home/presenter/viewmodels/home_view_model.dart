import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pokedex/src/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/home/domain/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  List<PokemonEntity> pokemons = [];
  List<PokemonEntity> filteredPokemons = [];
  String version = '';

  final TextEditingController searchController = TextEditingController();

  HomeViewModel() {
    _loadVersion();
    _fetchPokemons();
    searchController.addListener(_onChangedText);
  }

  Future<void> _loadVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version = '${packageInfo.version} (${packageInfo.buildNumber})';
    notifyListeners();
  }

  Future<void> _fetchPokemons() async {
    final pokemonList = await HomeRepository().getPokemons();
    pokemons = pokemonList;
    filteredPokemons = pokemonList;
    notifyListeners();
  }

  void _onChangedText() {
    final searchText = searchController.text.toLowerCase();
    final newFilteredPokemons = pokemons.where((pokemon) {
      final pokemonName = pokemon.pokemonName.toLowerCase();
      final pokemonId = pokemon.pokemonId.toString();
      return pokemonName.contains(searchText) || pokemonId.contains(searchText);
    }).toList();

    if (filteredPokemons != newFilteredPokemons) {
      filteredPokemons = newFilteredPokemons;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
