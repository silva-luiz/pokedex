import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasource/home_datasource.dart';
import 'presenter/viewmodels/home_view_model.dart';

void homeBinds(Injector i) {
  i.addLazySingleton<HomeDatasource>(HomeDatasource.new);
  i.addLazySingleton<HomeViewModel>(HomeViewModel.new);
}
