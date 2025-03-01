import 'package:flutter/material.dart';

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8),
          hintText: 'Pesquisar Pokemon',
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
