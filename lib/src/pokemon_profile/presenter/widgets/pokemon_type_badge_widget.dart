import 'package:flutter/material.dart';
import 'package:pokedex/src/shared/colors/colors.dart';

class PokemonTypeBadgeWidget extends StatelessWidget {
  final List<String> types;

  const PokemonTypeBadgeWidget({
    super.key,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: types.map((type) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Chip(
            label: Text(
              type.toUpperCase(),
              style: const TextStyle(color: AppColors.white),
            ),
            backgroundColor: _getTypeColor(type),
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                  20.0), // Defina o valor que quiser para o raio
            ),
          ),
        );
      }).toList(),
    );
  }

  Color _getTypeColor(String type) {
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

    return typeColorMap[type.toLowerCase()] ?? Colors.grey;
  }
}
