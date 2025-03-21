// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_profile_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonProfileViewModel on _PokemonProfileViewModelBase, Store {
  Computed<Future<PokemonProfileEntity>>? _$pokemonFutureComputed;

  @override
  Future<PokemonProfileEntity> get pokemonFuture => (_$pokemonFutureComputed ??=
          Computed<Future<PokemonProfileEntity>>(() => super.pokemonFuture,
              name: '_PokemonProfileViewModelBase.pokemonFuture'))
      .value;

  late final _$_pokemonFutureAtom = Atom(
      name: '_PokemonProfileViewModelBase._pokemonFuture', context: context);

  @override
  Future<PokemonProfileEntity> get _pokemonFuture {
    _$_pokemonFutureAtom.reportRead();
    return super._pokemonFuture;
  }

  bool __pokemonFutureIsInitialized = false;

  @override
  set _pokemonFuture(Future<PokemonProfileEntity> value) {
    _$_pokemonFutureAtom.reportWrite(
        value, __pokemonFutureIsInitialized ? super._pokemonFuture : null, () {
      super._pokemonFuture = value;
      __pokemonFutureIsInitialized = true;
    });
  }

  late final _$_loadPokemonProfileAsyncAction = AsyncAction(
      '_PokemonProfileViewModelBase._loadPokemonProfile',
      context: context);

  @override
  Future<void> _loadPokemonProfile() {
    return _$_loadPokemonProfileAsyncAction
        .run(() => super._loadPokemonProfile());
  }

  @override
  String toString() {
    return '''
pokemonFuture: ${pokemonFuture}
    ''';
  }
}
