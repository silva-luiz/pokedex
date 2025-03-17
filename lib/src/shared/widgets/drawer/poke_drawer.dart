import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/shared/colors/colors.dart';
import 'package:pokedex/src/shared/widgets/outlined_text/outlined_text_widget.dart';
import 'package:pokedex/src/auth/presenter/viewmodels/auth_viewmodel.dart'; // Importe o AuthViewModel

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
                  fontSize: 45,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: AppColors.white,
                ),
              ),
              onTap: () => Modular.to.navigate('/home'),
            ),
            // ListTile(
            //   title: const Text(
            //     'My teams',
            //     style: TextStyle(
            //       fontWeight: FontWeight.w500,
            //       fontSize: 22,
            //       color: AppColors.white,
            //     ),
            //   ),
            //   onTap: () => Modular.to.navigate('/my-teams'),
            // ),
            const Spacer(),
            ListTile(
              trailing: const Icon(Icons.exit_to_app, color: AppColors.secondaryColor),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: AppColors.secondaryColor,
                ),
              ),
              onTap: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );

                try {
                  final authViewModel = Modular.get<AuthViewModel>();
                  await authViewModel.signOut();

                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logout successful!'),
                      backgroundColor: AppColors.success,
                    ),
                  );
                  Modular.to.navigate('/');
                } catch (e) {
                  Navigator.of(context).pop();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Logout error: $e'),
                      backgroundColor: AppColors.primaryColor,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
