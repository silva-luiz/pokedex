import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/pokemon_profile/presenter/widgets/pokemon_type_badge_widget.dart';
import 'package:pokedex/src/shared/routes/app_routes.dart';

class PokemonWidget extends StatelessWidget {
  final String pokemonName;
  final String pokemonUrl;
  // final List<String> pokemonTypes; // Lista de tipos do Pokémon

  const PokemonWidget({
    super.key,
    required this.pokemonName,
    required this.pokemonUrl,
    // required this.pokemonTypes, // Recebe os tipos como parâmetro
  });

  String _getPokemonImageUrl() {
    final id = pokemonUrl.split('/')[6]; // Obtém o ID da URL
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  String _getPokemonId() {
    final id = pokemonUrl.split('/')[6];
    return id;
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '#${_getPokemonId()}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Image.network(
                scale: 0.7,
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
              const SizedBox(height: 5),
              // Passando a lista de tipos para o PokemonTypeBadgeWidget
              // PokemonTypeBadgeWidget(types: ['fire']),
            ],
          ),
        ),
      ),
    );
  }
}
