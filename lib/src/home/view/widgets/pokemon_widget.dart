import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.network(
              scale: 0.5,
              _getPokemonImageUrl(),
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error,
                    size: 50); // Ícone em caso de erro
              },
            ),
            Text(
              pokemonName,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
