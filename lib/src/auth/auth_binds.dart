import 'package:flutter_modular/flutter_modular.dart';

import 'data/repository/auth_repository_impl.dart';
import 'domain/repository/auth_repository.dart';
import 'presenter/viewmodels/auth_viewmodel.dart';

void authBinds(Injector i) {
  i.addLazySingleton<AuthRepository>(AuthRepositoryImpl.new);
  i.addLazySingleton<AuthViewmodel>(AuthViewmodel.new);
}
