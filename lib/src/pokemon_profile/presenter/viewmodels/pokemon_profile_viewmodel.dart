import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/pokemon_profile/data/repository/pokemon_profile_repository_impl.dart';
import 'package:pokedex/src/pokemon_profile/domain/entities/pokemon_profile_entity.dart';
import 'package:pokedex/src/shared/colors/colors.dart';

part 'pokemon_profile_viewmodel.g.dart';

class PokemonProfileViewModel = _PokemonProfileViewModelBase with _$PokemonProfileViewModel;

abstract class _PokemonProfileViewModelBase with Store {
  final String pokemonName;
  
  @observable
  late Future<PokemonProfileEntity> _pokemonFuture;

  _PokemonProfileViewModelBase(this.pokemonName) {
    _loadPokemonProfile();
  }

  @action
  Future<void> _loadPokemonProfile() async {
    _pokemonFuture = PokemonProfileRepositoryImpl().getPokemon(pokemonName);
  }

  @computed
  Future<PokemonProfileEntity> get pokemonFuture => _pokemonFuture;

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  String getPokemonImageUrl(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }

  String getPokemonGifUrl(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/$id.gif';
  }

  final Map<String, Color> typeColorMap = {
    'fire': AppColors.primaryColor,
    'water': Colors.blue,
    'grass': Colors.green,
    'electric': Colors.yellow,
    'psychic': Colors.pink,
    'ice': Colors.lightBlue,
    'dragon': Colors.purple,
    'dark': AppColors.black,
    'fairy': Colors.pinkAccent,
    'normal': Colors.brown,
    'fighting': Colors.orange,
    'flying': Colors.lightBlueAccent,
    'poison': Colors.purpleAccent,
    'ground': Colors.brown.shade600,
    'rock': Colors.grey.shade700,
    'bug': Colors.lightGreen,
    'ghost': Colors.deepPurple,
    'steel': Colors.blueGrey,
    'unknown': Colors.grey,
    'shadow': Colors.black54,
  };

  final Map<String, String> typeIconMap = {
    'fire': 'assets/images/icons/types_icons/fire.png',
    'water': 'assets/images/icons/types_icons/water.png',
    'grass': 'assets/images/icons/types_icons/grass.png',
    'electric': 'assets/images/icons/types_icons/electric.png',
    'ice': 'assets/images/icons/types_icons/ice.png',
    'fighting': 'assets/images/icons/types_icons/fighting.png',
    'poison': 'assets/images/icons/types_icons/poison.png',
    'ground': 'assets/images/icons/types_icons/ground.png',
    'flying': 'assets/images/icons/types_icons/flying.png',
    'psychic': 'assets/images/icons/types_icons/psychic.png',
    'bug': 'assets/images/icons/types_icons/bug.png',
    'rock': 'assets/images/icons/types_icons/rock.png',
    'ghost': 'assets/images/icons/types_icons/ghost.png',
    'dragon': 'assets/images/icons/types_icons/dragon.png',
    'dark': 'assets/images/icons/types_icons/dark.png',
    'steel': 'assets/images/icons/types_icons/steel.png',
    'fairy': 'assets/images/icons/types_icons/fairy.png',
    'normal': 'assets/images/icons/types_icons/normal.png',
  };
}
