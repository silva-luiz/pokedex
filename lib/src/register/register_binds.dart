import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/register/data/datasource/user_register_datasource.dart';

void registerBinds(Injector i) {
  i.addLazySingleton<UserRegisterDatasource>(UserRegisterDatasource.new);
}
