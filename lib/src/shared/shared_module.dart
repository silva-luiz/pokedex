import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<Dio>(() {
      final dio = Dio();
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        logPrint: (object) {
          log(object.toString());
        },
      ));
      return dio;
    });
  }
}
