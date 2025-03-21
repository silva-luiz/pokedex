import 'package:flutter/material.dart';
import 'package:pokedex/src/shared/colors/colors.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const SearchTextFieldWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8),
          hintText: 'Search Pokémon',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.black54,
          ),
          border: InputBorder.none,
        ),
        controller: controller,
      ),
    );
  }
}
