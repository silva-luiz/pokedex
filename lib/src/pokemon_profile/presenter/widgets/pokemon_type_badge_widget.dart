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
              style: const TextStyle(),
            ),
            backgroundColor: _getTypeColor(type),
          ),
        );
      }).toList(),
    );
  }

  // Função para definir a cor do badge com base no tipo
  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return AppColors.primaryColor;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.yellow;
      case 'bug':
        return Colors.greenAccent;
      case 'normal':
        return Colors.brown;
      case 'psychic':
        return Colors.purple;
      case 'rock':
        return Colors.brown;
      case 'ghost':
        return Colors.deepPurple;
      case 'fighting':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
