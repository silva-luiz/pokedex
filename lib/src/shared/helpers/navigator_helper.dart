import 'package:flutter_modular/flutter_modular.dart';

abstract class NavigatorHelper {
  const NavigatorHelper._();

  static void pop<T extends Object?>({int times = 1, T? result}) {
    for (var i = 0; i < times; i++) {
      Modular.to.pop<T?>(result);
    }
  }

  static Future<T?> push<T extends Object?>(
    String path, {
    Object? arguments,
  }) async {
    return await Modular.to.pushNamed<T>(path, arguments: arguments);
  }

  static Future<T?> popAndPushNamed<T extends Object>(
    String route, {
    Object? arguments,
  }) async {
    return await Modular.to.popAndPushNamed(route, arguments: arguments);
  }

  static void navigate(String path, [Object? arguments]) {
    Modular.to.navigate(path, arguments: arguments);
  }
}
