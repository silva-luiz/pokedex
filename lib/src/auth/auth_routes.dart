import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/auth_page.dart';

enum AuthRouteNamed {
  auth,
}

extension AuthRouteNamedExtension on AuthRouteNamed {
  String get _path {
    switch (this) {
      case AuthRouteNamed.auth:
        return '/';
      default:
        return '/';
    }
  }
}

void authRoutes(RouteManager r) {
  r.child(AuthRouteNamed.auth._path, child: (context) => const AuthPage());
}

@override
void routes(r) => authRoutes(r);
