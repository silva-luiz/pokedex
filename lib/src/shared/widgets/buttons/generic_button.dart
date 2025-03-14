import 'package:flutter/material.dart';
import 'package:pokedex/src/shared/colors/colors.dart';

class GenericButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color backgroundColor;

  const GenericButton({
    super.key,
    required this.label,
    this.backgroundColor = AppColors.primaryColor,
    this.onPressed,
  });

  const GenericButton.primary({
    super.key,
    required this.label,
    this.backgroundColor = AppColors.primaryColor,
    this.onPressed,
  });

  const GenericButton.secondary({
    super.key,
    required this.label,
    this.backgroundColor = AppColors.secondaryColor,
    this.onPressed,
  });

  const GenericButton.tertiary({
    super.key,
    required this.label,
    this.backgroundColor = AppColors.tertiaryColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(AppColors.white),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
          ),
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
