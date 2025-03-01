import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/shared/routes/app_routes.dart';

class PokemonWidget extends StatelessWidget {
  final String pokemonName;
  final String pokemonUrl;

  const PokemonWidget({
    super.key,
    required this.pokemonName,
    required this.pokemonUrl,
  });

  String _getPokemonImageUrl() {
    // Extraindo o ID do Pokémon da URL fornecida pela API
    final id = pokemonUrl.split('/')[6]; // Obtém o ID da URL
    // Retornando a URL da imagem baseada no ID
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: GestureDetector(
        onTap: () {
          Modular.to.pushNamed(AppRoutes.pokemonProfile,
              arguments: {'name': pokemonName});
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                scale: 0.5,
                _getPokemonImageUrl(),
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: Colors.red, size: 50);
                },
              ),
              Text(
                pokemonName.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
