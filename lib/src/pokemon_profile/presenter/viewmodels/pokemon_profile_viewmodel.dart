import 'package:flutter/material.dart';
import 'package:pokedex/src/pokemon_profile/data/repository/pokemon_profile_repository_impl.dart';
import 'package:pokedex/src/pokemon_profile/domain/entities/pokemon_profile_entity.dart';

class PokemonProfileViewModel extends ChangeNotifier {
  final String pokemonName;
  late Future<PokemonProfileEntity> _pokemonFuture;

  PokemonProfileViewModel(this.pokemonName) {
    _pokemonFuture = PokemonProfileRepositoryImpl().getPokemon(pokemonName);
  }

  Future<PokemonProfileEntity> get pokemonFuture => _pokemonFuture;

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  String getPokemonImageUrl(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  final Map<String, Color> typeColorMap = {
    'fire': Colors.red,
    'water': Colors.blue,
    'grass': Colors.green,
    'electric': Colors.yellow,
    'psychic': Colors.pink,
    'ice': Colors.lightBlue,
    'dragon': Colors.purple,
    'dark': Colors.black,
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
}
