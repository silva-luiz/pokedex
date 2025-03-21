import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/register/data/datasource/user_register_datasource.dart';
import 'package:pokedex/src/register/domain/repository/user_register_repository.dart';

import 'data/repository/user_register_repository_impl.dart';
import 'presenter/viewmodels/register_viewmodel.dart';

void registerBinds(Injector i) {
  i.addLazySingleton<UserRegisterDatasource>(UserRegisterDatasource.new);
  i.addLazySingleton<UserRegisterRepository>(UserRegisterRepositoryImpl.new);
  i.addLazySingleton<RegisterViewmodel>(RegisterViewmodel.new);
}
