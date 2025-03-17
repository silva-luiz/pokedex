import 'package:flutter/material.dart';
import 'package:pokedex/src/shared/colors/colors.dart';
import 'package:pokedex/src/shared/widgets/drawer/poke_drawer.dart';
import 'package:pokedex/src/teams/presenter/widgets/pokemon_team_widget.dart';

class TeamsListPage extends StatefulWidget {
  const TeamsListPage({super.key});

  @override
  State<TeamsListPage> createState() => _TeamsListPageState();
}

List<PokemonTeamWidget> pokemonTeams = [PokemonTeamWidget()];

class _TeamsListPageState extends State<TeamsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'My Teams',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const PokeDrawer(),
      body: pokemonTeams.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'No teams created yet!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para criar um novo time
                      print('Create New Team');
                    },
                    child: const Text('Create New Team'),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) => pokemonTeams[index],
              itemCount: pokemonTeams.length,
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Lógica para adicionar um novo time
          print('Add New Team');
        },
      ),
    );
  }
}
