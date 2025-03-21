// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$pokemonsAtom =
      Atom(name: '_HomeViewModelBase.pokemons', context: context);

  @override
  List<PokemonEntity> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<PokemonEntity> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$filteredPokemonsAtom =
      Atom(name: '_HomeViewModelBase.filteredPokemons', context: context);

  @override
  List<PokemonEntity> get filteredPokemons {
    _$filteredPokemonsAtom.reportRead();
    return super.filteredPokemons;
  }

  @override
  set filteredPokemons(List<PokemonEntity> value) {
    _$filteredPokemonsAtom.reportWrite(value, super.filteredPokemons, () {
      super.filteredPokemons = value;
    });
  }

  late final _$versionAtom =
      Atom(name: '_HomeViewModelBase.version', context: context);

  @override
  String get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  late final _$_loadVersionAsyncAction =
      AsyncAction('_HomeViewModelBase._loadVersion', context: context);

  @override
  Future<void> _loadVersion() {
    return _$_loadVersionAsyncAction.run(() => super._loadVersion());
  }

  late final _$_fetchPokemonsAsyncAction =
      AsyncAction('_HomeViewModelBase._fetchPokemons', context: context);

  @override
  Future<void> _fetchPokemons() {
    return _$_fetchPokemonsAsyncAction.run(() => super._fetchPokemons());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void _onChangedText() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase._onChangedText');
    try {
      return super._onChangedText();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
filteredPokemons: ${filteredPokemons},
version: ${version}
    ''';
  }
}
