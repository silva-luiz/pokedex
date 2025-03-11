import 'package:flutter/material.dart';

class PokemonTeamWidget extends StatelessWidget {
  const PokemonTeamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.all(8.0),
      child:  const ListTile(
        leading: CircleAvatar(
          radius: 30, 
         backgroundColor: Colors.red,
         child: Icon(Icons.group, 
         color: Colors.white,),
         ),
        title: Text('Team name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        subtitle: Text('5 Pokémons', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.red),),
      ),
    );
  }
}
