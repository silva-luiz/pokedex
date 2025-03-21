import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../../domain/repository/home_repository.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  List<PokemonEntity> pokemons = [];

  @observable
  List<PokemonEntity> filteredPokemons = [];

  @observable
  String version = '';

  final TextEditingController searchController = TextEditingController();

  _HomeViewModelBase() {
    _loadVersion();
    _fetchPokemons();
    searchController.addListener(_onChangedText);
  }

  @action
  Future<void> _loadVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version = '${packageInfo.version} (${packageInfo.buildNumber})';
  }

  @action
  Future<void> _fetchPokemons() async {
    final pokemonList = await HomeRepository().getPokemons();
    pokemons = pokemonList;
    filteredPokemons = pokemonList;
  }

  @action
  void _onChangedText() {
    final searchText = searchController.text.toLowerCase();
    final newFilteredPokemons = pokemons.where((pokemon) {
      final pokemonName = pokemon.pokemonName.toLowerCase();
      final pokemonId = pokemon.pokemonId.toString();
      return pokemonName.contains(searchText) || pokemonId.contains(searchText);
    }).toList();

    if (filteredPokemons != newFilteredPokemons) {
      filteredPokemons = newFilteredPokemons;
    }
  }
}
