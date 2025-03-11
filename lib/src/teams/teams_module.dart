import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/teams/presenter/pages/teams_list_page.dart';

class TeamsModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => TeamsListPage());
  }
}
