import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(Dio.new);
  }
}
