import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/shared_module.dart';
import 'data/datasource/favorite_pokemon_datasource.dart';
import 'data/repository/favorite_pokemon_repository_impl.dart';
import 'domain/repository/favorite_pokemon_repository.dart';
import 'presenter/pages/favorites_page.dart';
import 'presenter/viewmodels/favorites_viewmodel.dart';

class FavoritesModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  void binds(i) {
    // Datasource
    i.addSingleton<FavoritePokemonDatasource>(
        () => FavoritePokemonDatasource());

    // Repository
    i.addSingleton<FavoritePokemonRepository>(
      () => FavoritePokemonRepositoryImpl(
          datasource: i.get<FavoritePokemonDatasource>()),
    );

    // ViewModel
    i.addSingleton<FavoritePokemonsViewModel>(
      () {
        
        return FavoritePokemonsViewModel(
          repository: i.get<FavoritePokemonRepository>(),
        );
      },
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => FavoritesPage(),
    );
  }
}
