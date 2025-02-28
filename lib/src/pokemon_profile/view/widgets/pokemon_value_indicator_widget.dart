import 'package:flutter/material.dart';

class PokemonValueIndicatorWidget extends StatefulWidget {
  final String label;
  final int value;
  final int totalValue;
  final Color color;

  const PokemonValueIndicatorWidget({
    super.key,
    required this.label,
    required this.value,
    required this.totalValue,
    required this.color,
  });

  @override
  State<PokemonValueIndicatorWidget> createState() =>
      _PokemonValueIndicatorWidgetState();
}

class _PokemonValueIndicatorWidgetState
    extends State<PokemonValueIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(12),
              minHeight: 10,
              value: widget.value.toDouble() / widget.totalValue.toDouble(),
              color: widget.color,
            ),
          ),
        ],
      ),
    );
  }
}
