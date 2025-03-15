import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/shared/colors/colors.dart';
import 'package:pokedex/src/shared/widgets/outlined_text/outlined_text_widget.dart';

class PokeDrawer extends StatelessWidget {
  const PokeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.tertiaryColor,
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Center(
                child: OutlinedTextWidget(
                  text: 'Pokédex',
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: AppColors.white),
              ),
              onTap: () => Modular.to.navigate('/home'),
            ),
            ListTile(
              title: const Text(
                'My teams',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: AppColors.white),
              ),
              onTap: () => Modular.to.navigate('/my-teams'),
            ),
            const Spacer(),
            ListTile(
              trailing: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.red,
                ),
              ),
              onTap: () => Modular.to.navigate('/'),
            ),
          ],
        ),
      ),
    );
  }
}
