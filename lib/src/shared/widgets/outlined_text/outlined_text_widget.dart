import 'package:flutter/material.dart';
import 'package:pokedex/src/shared/colors/colors.dart';

class OutlinedTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final Color outlineColor;
  final double outlineWidth;

  const OutlinedTextWidget({
    super.key,
    required this.text,
    this.fontSize = 60,
    this.textColor = AppColors.secondaryColor,
    this.outlineColor = AppColors.tertiaryColor,
    this.outlineWidth = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Texto com a cor do contorno
        Text(
          text,
          style: TextStyle(
            shadows: [
              Shadow(
                blurRadius: 7.0,
                color: outlineColor,
                offset: const Offset(11, 10),
              ),
            ],
            fontSize: fontSize,
            fontFamily: 'PokemonFont',
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = outlineWidth
              ..color = outlineColor, // Cor do contorno
          ),
        ),
        // Texto com a cor normal
        Text(
          text,
          style: TextStyle(
            fontFamily: 'PokemonFont',
            fontSize: fontSize,
            color: textColor, // Cor do texto
          ),
        ),
      ],
    );
  }
}
