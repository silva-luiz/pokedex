import 'package:pokedex/src/home/data/home_datasource.dart';
import 'package:pokedex/src/home/domain/entities/pokemon_entity.dart';

class HomeRepository {
  final _homeDatasource = HomeDatasource();

  Future<List<PokemonEntity>> getPokemons() async {
    return _homeDatasource.getPokemons();
  }
}
