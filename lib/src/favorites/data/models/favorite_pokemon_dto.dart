import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritePokemonDto {
  final String userId;
  final String pokemonId;
  final String pokemonName;
  final String pokemonImage;
  final DateTime timestamp;

  FavoritePokemonDto({
    required this.userId,
    required this.pokemonId,
    required this.pokemonName,
    required this.pokemonImage,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'pokemonId': pokemonId,
      'pokemonName': pokemonName,
      'pokemonImage': pokemonImage,
      'timestamp': timestamp,
    };
  }

  factory FavoritePokemonDto.fromMap(Map<String, dynamic> map) {
    return FavoritePokemonDto(
      userId: map['userId'],
      pokemonId: map['pokemonId'],
      pokemonName: map['pokemonName'],
      pokemonImage: map['pokemonImage'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
}
