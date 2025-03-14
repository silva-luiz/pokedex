import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/shared/colors/colors.dart';

class PokeDrawer extends StatelessWidget {
  const PokeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.white,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Center(
                  child: Text(
                'Welcome to Pokedex',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              )),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              onTap: () => Modular.to.navigate('/'),
            ),
            ListTile(
              title: const Text(
                'My teams',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              onTap: () => Modular.to.navigate('/my-teams'),
            ),
          ],
        ),
      ),
    );
  }
}
