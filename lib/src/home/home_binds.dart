import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasource/home_datasource.dart';

void homeBinds(Injector i) {
  i.addLazySingleton<HomeDatasource>(HomeDatasource.new);
}
