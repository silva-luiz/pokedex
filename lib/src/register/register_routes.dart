import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/register_page.dart';

enum RegisterRouteNamed {
  register,
}

extension RegisterRouteNamedExtension on RegisterRouteNamed {
  String get _path {
    switch (this) {
      case RegisterRouteNamed.register:
        return '/';
      default:
        return '/';
    }
  }
}

void registerRoutes(RouteManager r) {
  r.child(RegisterRouteNamed.register._path,
      child: (context) => RegisterPage());
}

@override
void routes(r) => registerRoutes(r);
